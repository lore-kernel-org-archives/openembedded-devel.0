Return-Path: <net147@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 410B76162A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 05:33:29 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id uo5so1333278pbc.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 22:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4iGEhnGHBRwnww3l6HtNVQPm8oVuxP5mgc0jvYmSU8w=;
	b=zRrXsRIxdyDd3Ad/vWbGgmMqptJ2Il3FqxbNDn25HNmAGU33YDmm00dk2aCPhhdTtt
	Jy7kfGYQofmyB/8E6p9MPsZBIPKF80Mt3VcwRNa2K5ygMENjBXstElxdm6vNZtxVS6AO
	XTS7tPmZL1zJsHEQhQUZQ6VSoAIlxYHbb2EeYIn7hLg4RvxWBcZESFyy1e7WKJPVSkFt
	vEvePy+Ud8bnzwsEt8Sa++JuhMvFJ6+y00oq5v3Tdc6sG/RVFzhuUf5ASHMhHgFeekUs
	vbAxJRV+ryem4ipVRSSbBOpBoBBt/Bgr8qTaIA5J4acF3lt0nwURofcG5g5sDxppoF7Z
	WlKg==
X-Received: by 10.66.121.234 with SMTP id ln10mr7221245pab.20.1378359211244;
	Wed, 04 Sep 2013 22:33:31 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	bb1sm33030108pbc.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 22:33:30 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Sep 2013 15:29:55 +1000
Message-Id: <1378358995-5119-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-oe][PATCH] lmbench: specify configuration for systemd-tmpfiles --update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 05:33:30 -0000

Running systemd-tmpfiles --update without specifying a configuration
file results in all tmpfiles.d configuration files being processed.

/usr/lib/tmpfiles.d/systemd.conf creates /run/nologin on boot to
prevent non-root users from logging in while the system is booting.
If systemd-tmpfiles --update is run after the system has started,
it will still create /run/nologin which would prevent non-root users
from logging in with the message "System is booting up.".

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index d42d62c..fb8cf4f 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -64,7 +64,7 @@ do_install () {
 pkg_postinst_${PN} () {
     if [ -z "$D" ]; then
         if command -v systemd-tmpfiles >/dev/null; then
-            systemd-tmpfiles --create
+            systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/lmbench.conf
         elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
             ${sysconfdir}/init.d/populate-volatile.sh update
         fi
-- 
1.8.4



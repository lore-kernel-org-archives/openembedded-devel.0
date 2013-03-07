Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDdOD-00033a-7Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 17:09:57 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb1so558363pad.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=pzynfz0u0Usx6F+hcvUhIiQaDWmllUv+QzuvC568SZY=;
	b=kH37jR3vIib70V8Pfboelas3GqYouhZcHE/UQAmTaIAR7OuIqLeM3AsaquR7m9mZhR
	4af2dEUrJQAa1OD49ZmjSW/NagMYJsDW0ELijqcnVjK7nGgNBUpPbOBRWg+hlNx5f5PE
	waDi2g0R8hkv6tCVcBuOURt+zZfzsfqXCxpU+bH3oI360tf9eaylfh6IN/uXMgqGJ94P
	cULSRsFZurckE8POdpKgpnXTytw2JnDxUeTiFrGcXo6yZ6XOxKBQOJ8B/CxV0Dmb2Kxx
	2ihvUz/ag84ijFv6W8rfR8hV2Z8FHgblVU1TBH3rlo4rO/NN7JxYoj4VFv2CcFvTrXEC
	64xg==
X-Received: by 10.68.186.132 with SMTP id fk4mr36111101pbc.18.1362671600349;
	Thu, 07 Mar 2013 07:53:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vq9sm2085975pbc.36.2013.03.07.07.53.17
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 07:53:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 16:53:12 +0100
Message-Id: <1362671592-30014-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-systemd][PATCH] connman: rename .bbappend to match new version from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2013 16:09:58 -0000

* drop settings already set in connman.inc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../connman/{connman_1.10.bbappend => connman_1.12.bbappend}          | 4 ----
 1 file changed, 4 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.10.bbappend => connman_1.12.bbappend} (57%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.10.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend
similarity index 57%
rename from meta-systemd/oe-core/recipes-connectivity/connman/connman_1.10.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend
index a9d13e6..b94f84b 100644
--- a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.10.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.12.bbappend
@@ -1,8 +1,4 @@
-inherit systemd
-
 PRINC := "${@int(PRINC) + 1}"
 
-EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
-
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "connman.service"
-- 
1.8.1.5




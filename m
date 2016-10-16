Return-Path: <mario.goulart@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E0D6B71A32
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2016 12:16:24 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v138so11842607qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2016 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=w+SADstOW0ckm5iNnegyjABSNG2PylxuNnXKHhGYbFk=;
	b=uoo5RRpVpOvykKSHp7ANiWtuZDJ6+S3VnYP4BvYWuJTRqqw6vRuwm0dbO+bFGFowLH
	gurcNkNiVaM8dNrYNZEz2KBvgY7VuOOy2y1sxRjC7svXVkB/E3QBejGq4T36O7nhx18g
	AF6yqKC80meyvNxmocZULSYxRERyu4ZqqXxnFjcVXmuqo/+6fGje7CzeUleU0KjDp5vL
	J4NuigWx2O0sILlhMJWiALn8Bk29bpZBvfvHZd7f95BytfsrXWiIXHG0jrTs9B69BVoe
	V2qiHc+T9NUNL4gYE1tZuTvib70ddv37JN6Ml9azKjeHqz4h8E6JGaakTRvb09P7ppFH
	Si1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w+SADstOW0ckm5iNnegyjABSNG2PylxuNnXKHhGYbFk=;
	b=cjsS3wj83TjovmmtzPOvGsqwl/EUAC1n8XpKg1RSC9wmlI4SFO+6+7Ooa722h8MBBT
	Sze89aChW2zY6+P6VeDOpLJsNc2z96Cm+aGg30XJPns1RjobM1yRayjkOu4bvxR/QN1P
	wzOF3LodvsUvKpsrT0kdB4z9mUVIA/BwtB57n0q2D3TSnnzrGUpuCPdFrWxqnjavEbNF
	9/yf5qp0uxmAI51mbHmJLTjdE6Ecyxnt6E6Ux7WiIXLPSPlgqFfFaCfHXVrfXyWjQgXf
	ZfT5yL0NZe2QBW1b6OghHgYFpIQfxUTMRE++ruTTzU0zL9m3biRsNDN1lUZcdc4YugPX
	h2WQ==
X-Gm-Message-State: AA6/9Rk3gnri4uV94jZwURG6826hXvfRnMzAO+4sp5cLDDhoqeHty6M4bO2CKc3RTgxzfg==
X-Received: by 10.195.13.107 with SMTP id ex11mr6937467wjd.99.1476620186089;
	Sun, 16 Oct 2016 05:16:26 -0700 (PDT)
Received: from oe.parenteses.org (email.parenteses.org. [5.9.149.108])
	by smtp.gmail.com with ESMTPSA id
	ce6sm42011117wjc.27.2016.10.16.05.16.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Oct 2016 05:16:24 -0700 (PDT)
From: Mario Domenech Goulart <mario.goulart@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Oct 2016 14:15:49 +0200
Message-Id: <1476620149-25938-1-git-send-email-mario.goulart@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] postgresql.inc: Fix do_configure error (could not find Python.h)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Oct 2016 12:16:26 -0000

Fixes:

| checking for Python.h... no
| configure: error: header file <Python.h> is required for Python
| NOTE: The following config.log files may provide further information.
| WARNING: exit code 1 from a shell command.
| NOTE: .../tmp/work/armv5e-poky-linux-gnueabi/postgresql/9.4.8-r0.0/build/config.log
| ERROR: configure failed

Signed-off-by: Mario Domenech Goulart <mario.goulart@gmail.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 9592c79..454624c 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -40,6 +40,8 @@ export LDFLAGS_SL = "${LDFLAGS}"
 
 inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd
 
+CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR}"
+
 SYSTEMD_SERVICE_${PN} = "postgresql.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
@@ -109,12 +111,6 @@ python populate_packages_prepend() {
 }
 
 do_configure() {
-    # do_configure_prepend
-    # make sure configure finds python includdirs with these envs
-    export \
-           STAGING_INCDIR=${STAGING_INCDIR} \
-           STAGING_LIBDIR=${STAGING_LIBDIR}
-
     # do_configure
     autotools_do_configure
 
-- 
2.1.4



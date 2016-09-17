Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 57D32731A5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 10:05:00 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w84so14515wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GE3KKDZ3es8h9TFKVDxd1PYV6Y8ikS4oybChAUauW7Q=;
	b=KMP6Va4/JI786SqBGqneBPf0z82ROqD9CKzQYuOtJjmahACnG0T03I/M1CVgGekw/b
	WQOlV0y5mU/2In7Y9rUgpwg6gkB47vMiXY1qDkClrvA2w8uXmhe/QZQvP2JN47dT9JNH
	nyQbw3xN2I2+mIENofYhmcP01C2nz2w1roZrZh1GApvE1eWmxjihAdpYD0Nd2+3Wc97b
	HLp/spZFyL0VfCKqtPMcmOkfF+rX+jlj5X7ucAHSwq8J/VQJOSxTFT8DgHi5KqyuNT4B
	5kIDOzcGV0BNPSWBiRImOsf4fWlDfcVMdjXACyF6DdabtAWqsFDJx6omcFGIHEAhKji0
	G0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GE3KKDZ3es8h9TFKVDxd1PYV6Y8ikS4oybChAUauW7Q=;
	b=fsbdbwYuLX+LRpqyUwCRZ6aqyiT3UWDpP9ZQVMkBhxPaLdt82TiRIfhIgjpkskbZBA
	qZDwjV07DlHw2ELq409//z75SWDyElh4AQEIE9G5NACzYK1EcARZbAgBIoY/o0f0G/io
	hNCb3WVCIwX+6uuplYe1Nzlo2fmEKaUKPwu6GTsZtSkNLIUlrUnRCgcpbMMzPOt9jR6I
	VoVH2EwCpGlrSBQ22xcFJFNMABGwwzuUzvA+BcGDuHjmHaopp9V2+ilEzzYN/QvivlBl
	RaiAKTaOl3Y6jtaWIbeDZlKXuwIn3ErPh2zaYoPBdEOcHYRvFYgnR29BBjNmiKkvKPfz
	O5nw==
X-Gm-Message-State: AE9vXwNvbjCGnf5RS85dIYSuthDp6fXRiEKJoaom2LkzK3+aI7u6Q86GPkW62jKpZKtCOA==
X-Received: by 10.28.197.76 with SMTP id v73mr1418576wmf.100.1474106701164;
	Sat, 17 Sep 2016 03:05:01 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0635.dip0.t-ipconnect.de.
	[79.223.6.53]) by smtp.googlemail.com with ESMTPSA id
	o2sm12473330wjo.3.2016.09.17.03.05.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Sep 2016 03:05:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Sep 2016 12:04:42 +0200
Message-Id: <1474106682-20512-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] samba: replace pam packageconfig by hard dependency
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
X-List-Received-Date: Sat, 17 Sep 2016 10:05:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

samba links against libpam even if pam is not in packageconfig and libpam was
built before. This patch avoid this floating dependency - other solution could
not be found. For those who want packageconfig back, see discussion iat [1] for
further inspiration.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2016-September/109143.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 53721b1..4b2c6b3 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -28,7 +28,7 @@ inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 libbsd libaio"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 libbsd libaio libpam"
 
 SYSVINITTYPE_linuxstdbase = "lsb"
 SYSVINITTYPE = "sysv"
@@ -36,8 +36,7 @@ SYSVINITTYPE = "sysv"
 INITSCRIPT_NAME = "samba.sh"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SYSVINITTYPE}', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SYSVINITTYPE}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'zeroconf', '', d)} \
                    acl cups ldap \
@@ -48,7 +47,6 @@ RDEPENDS_${PN}-ctdb-tests += "bash"
 
 PACKAGECONFIG[acl] = "--with-acl-support,--without-acl-support,acl"
 PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
-PACKAGECONFIG[pam] = "--with-pam --with-pammodulesdir=${base_libdir}/security,--without-pam,libpam"
 PACKAGECONFIG[lsb] = ",,lsb"
 PACKAGECONFIG[sysv] = ",,sysvinit"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
@@ -85,6 +83,7 @@ EXTRA_OECONF += "--enable-fhs \
                  --with-cluster-support \
                  --with-profiling-data \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix} \
+                 --with-pam --with-pammodulesdir=${base_libdir}/security \
                 "
 DISABLE_STATIC = ""
 
-- 
2.5.5



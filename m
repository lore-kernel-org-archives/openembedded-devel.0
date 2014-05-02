Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D12E6605B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 08:26:29 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so671439wgh.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 May 2014 01:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m8zSZRN0UJfPANVCRGYnREJ6vr13wsRhZq16EPD0Smo=;
	b=Up3lL+z9InkCgXQrE3GDeERDkagVtiksrD7yOLvNGNAS7gVrqIk+sITf8i+R3fjGwO
	QXgCDDUje02vZhDo6Dv6gg6321vsuZrrB55a7rqifVawmshzpR60/qdd6YM2KnThBEgY
	vuMzLZ/dDiWE4jWzpvfsz6OFSrHebgeSKjIjzFiMVUm/MopY/jmt8UrUrT6JOsLL3kL8
	e/1R+AlVDZxTrTLeoTOCGrTRnL63ZEdxkFMv8Tbwc7eQSgEqAc8baJUFLQOyHDNhbnl7
	XH23i5YQJGW16nKFOZ0TUAxmDV8CBjLXXZg1qqUBECN7WSwVY2XLZQCZnVj4DHWIEypE
	EjQA==
X-Gm-Message-State: ALoCoQm4jXRA4IqIgr55e94vvlQ4VaImNyjItuCeIFjEb4lBrSRu6+dfFSllBhbN8TW+oGno4iJj
X-Received: by 10.194.188.68 with SMTP id fy4mr12610142wjc.30.1399019190135;
	Fri, 02 May 2014 01:26:30 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id q2sm3317214wix.5.2014.05.02.01.26.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 May 2014 01:26:29 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 May 2014 10:26:26 +0200
Message-Id: <1399019186-19483-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCHv4] git: fix perl binding installation
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
X-List-Received-Date: Fri, 02 May 2014 08:26:30 -0000

Git.pm wasn't ending up in the package because do_install removed it
with a misleading comment about multilib. Workaround the problem so
that Git.pm ends up in the correct dir *and* doesn't get deleted.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-devtools/git/git.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 73e11eb..178b768 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -28,10 +28,14 @@ do_install () {
 		template_dir=${datadir}/git-core/templates \
 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
 
+	cd ${B}/perl && oe_runmake install DESTDIR="${D}" bindir=${bindir}
+
 	# ${libdir} is not applicable here, perl-native files are always
 	# installed to /usr/lib on both 32/64 bits targets.
+	# Fix up build paths and point to target locations.
+	mv ${D}${exec_prefix}/lib/perl-native/perl ${D}${exec_prefix}/lib/perl
+	sed -i -e s:${D}::g ${D}${exec_prefix}/lib/perl/*/auto/Git/.packlist
 	rm -rf ${D}${exec_prefix}/lib/perl-native
-	rmdir ${D}${exec_prefix}/lib || true
 }
 
 PERLSEDFIXUP = " \
@@ -75,6 +79,7 @@ PERLTOOLS = " \
 PACKAGES =+ "${PN}-perltools"
 FILES_${PN}-perltools += " \
     ${PERLTOOLS} \
+    ${prefix}/lib/perl \
     ${datadir}/perl \
 "
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path liberror-perl findutils"
-- 
1.9.0



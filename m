Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 09FF26EADC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 15:11:29 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id rd3so4477260pab.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YdR2OuZHidEogg3HA5wdYwJIq+qN+qirH80lo9b56tI=;
	b=xmYBaJC1Q+43IhsVYaqrAK4HC8C38kt/cT/bUDo8xtPSPEDtXN7bOsDGyspaG887Zy
	9YHbg5hZD/2xAdPhA0XLuvEqT0uP5OkBDnd9kqzd3dmfqngSGQlfgUlhk5zntu2TlxFs
	m2NRJ76IOJhYlnPFrYyn3icwfZhkNcUbO+xCvl2HfUdgtlodzglL9ywfEl9kNswKBiiJ
	/YWdx3/Q/c+aRVRh4fO26CtakH7JytrR/HIxhrW2/hFVVXDyk8wlb5yJnej48GJCEZ19
	DZ0BhttVBoMJgmh3bEFBXh1Dgr9Uma/t7rN430W2CRSeaLvRpl21v5GKwUiBNqGIWx0w
	FYiQ==
X-Received: by 10.66.197.135 with SMTP id iu7mr21033820pac.149.1391181090332; 
	Fri, 31 Jan 2014 07:11:30 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	zc6sm69486700pab.18.2014.01.31.07.11.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 07:11:29 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jan 2014 07:11:36 -0800
Message-Id: <1391181100-32525-5-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
References: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH 5/9] perl-module-extutils-config: add 0.007
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
X-List-Received-Date: Fri, 31 Jan 2014 15:11:29 -0000

[Description from CPAN]
ExtUtils::Config is an abstraction around the %Config hash.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../extutils/perl-module-extutils-config_0.007.bb  |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-perl/recipes-perl/extutils/perl-module-extutils-config_0.007.bb

diff --git a/meta-perl/recipes-perl/extutils/perl-module-extutils-config_0.007.bb b/meta-perl/recipes-perl/extutils/perl-module-extutils-config_0.007.bb
new file mode 100644
index 0000000..88de263
--- /dev/null
+++ b/meta-perl/recipes-perl/extutils/perl-module-extutils-config_0.007.bb
@@ -0,0 +1,23 @@
+SUMMARY = "ExtUtils::Config - A wrapper for perl's configuration"
+DESCRIPTION = "ExtUtils::Config is an abstraction around the %Config hash."
+
+HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Config/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b1b813683bd988732e7fd6a796bf7f47"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.tar.gz"
+SRC_URI[md5sum] = "2829c0dfa8a7e51b3f582efbee4bb128"
+SRC_URI[sha256sum] = "2c1465078b876fd16a90507092805265528c2532d4937b03547a6dbdb8ac0eef"
+
+S = "${WORKDIR}/ExtUtils-Config-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = " perl-module-extutils-makemaker \
+                   perl-module-data-dumper \
+                   perl-module-test-more \
+                   perl-module-file-temp \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5



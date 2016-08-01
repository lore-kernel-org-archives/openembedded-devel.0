Return-Path: <jpuhlman@mvista.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 302A1607A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 05:18:58 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id h186so51235170pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jul 2016 22:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+fnbgSYlC7cSWuhU3LBGsRMYsb3qDVqNRRV0A2hzpNk=;
	b=OiVrpeoZqaA6uM7lsFsBLjDANGVJYpiSMWMykQyCm4FquS6y0K9RdN9k1MgRdhpqpT
	f87hLdLv1saJO0wq9bCAlegH6gF8VpAbxpqf+KyOY/nVEJbXLWvLSp8qpeJRKhU6ZuNa
	FXPYKRH3GOlZLEvAzK6j0fYGP9BapVee/w8W2v7SUHU2oPITBsAXctNVjAmcXDnpgb9E
	9SlerrACbVz3oylrld8tP76m5nPOikB6NqaLpmlinbpOB852Wu6AB2yiOvWLsNd3Z1eZ
	dRaPP3swQjF/qZz7vIYq0NqSIx5HQpdhmLVS1ThYvM7ETk9dbZgsj9V4uYUTClQ5tnaA
	pEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+fnbgSYlC7cSWuhU3LBGsRMYsb3qDVqNRRV0A2hzpNk=;
	b=VA7a4YMLSjN3lo6EeZWaZ8fL3Mp7QJIw7PhCgVo662HRMbCPoQCDGPIkeGKjeRbfG8
	ItEWyH2yWsqHot0gmcJlJRNO9mSfLqyX1LjVspWJesPmA4U8HbW7AdiJUByit46aHV1e
	AsIypduB6AI3uHYmEUl8/A+MER5mdtyi8C3IDALPwST2L3fibV3FqkiHFIJgWbCywr75
	Gh610/OwbLTkPHPMsB/tnYuk7MTSlOfHYBZvurMS6dpCLz+dw29fMazZh29q6bBMtRIC
	QeVhubBoM+2lp97BF3cPlAxUqELrMco/xVKTvI8+dVSYG7GcbGdljNYTD6JokYxDuCvG
	HsxA==
X-Gm-Message-State: AEkoouvvrq+3wdILfyvlyoSEUSzvWBalurg/uHBfkQXmX5oqM/y73zqX2Ia81ziMgYJP1WMM
X-Received: by 10.98.205.6 with SMTP id o6mr91416284pfg.37.1470028739471;
	Sun, 31 Jul 2016 22:18:59 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-0-9-164.lightspeed.frokca.sbcglobal.net. [99.0.9.164])
	by smtp.gmail.com with ESMTPSA id
	g24sm41660240pfk.56.2016.07.31.22.18.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Jul 2016 22:18:58 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jul 2016 22:18:52 -0700
Message-Id: <1470028732-27001-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] Set READELF for cross compilation
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
X-List-Received-Date: Mon, 01 Aug 2016 05:19:02 -0000

In the case of using an external toolchain that supports multilib
compilation with a single binary, TARGET_PREFIX is the same for both main
and multilib abis. Without READELF exported, python3 assumes it is
either the readelf for ${BUILD_SYS}-readelf. Exporting cross readelf
fixes the build issue.

checking LDLIBRARY... libpython$(LDVERSION).so
checking for i586-montavistamllib32-linux-ranlib...
x86_64-montavista-linux-ranlib
checking for i586-montavistamllib32-linux-ar...
x86_64-montavista-linux-ar
checking for i586-montavistamllib32-linux-readelf... no
checking for readelf... readelf
configure: WARNING: using cross tools not prefixed with host triplet
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index af3b181..9bf9bbb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -471,6 +471,7 @@ export OBJCOPY = "${HOST_PREFIX}objcopy"
 export OBJDUMP = "${HOST_PREFIX}objdump"
 export STRINGS = "${HOST_PREFIX}strings"
 export NM = "${HOST_PREFIX}nm"
+export READELF = "${HOST_PREFIX}readelf"
 PYTHON = "${@sys.executable}"
 
 export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
-- 
2.6.2



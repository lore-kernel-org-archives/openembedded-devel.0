Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id CB3E862134
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 00:26:04 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 127so5540645pfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 16:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/Rg/XByGhwB1KMay7PDa6XrflzrmdmIKoGzBAsFKS5A=;
	b=va28HQeMd9w9CO5DTGx1ZcXup4QonXnf76Nj/9313Rbhhc4vyYjC4pl5hj1/Ru937V
	O0qnrkhFn3Yv4A9zRL8mEiWUXnalIJ/7WUuPfWXwV4ZY78lELEbdg1LznH3uipzcnKs5
	ldqQpcebnu3PLtX70kIF7MgsFjilbq5UE/j6PBJa88dyasLfOsJ6mZ+QruR36wq8X/6J
	8mI+1ISJB2sHDGKk+L2L98dPl2fp2U7XlERupyibBzn6vnXcRdZSthUEu/3vcn2Mqvnl
	fvqFhkpV+wcY40ExDrgdIXTMfuc/UzT8BJLvXnuO4gLWjLlulqXMWAm+B+9f6BTnZ1xp
	eVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/Rg/XByGhwB1KMay7PDa6XrflzrmdmIKoGzBAsFKS5A=;
	b=ZG7Kvy0UkEJFdtrJ84qztSSwg9AuD2Mn3/t9izO0bj4UPsgQASPFxpGJUV/2qrJXNu
	m1KHAoijDL9tc+2r/vpxr9OafeVoENrTJQGE+A9EzB/Tb55E7DrewNSoSJVYCRuG6L6F
	EM/CdvgTiCWa3Jvesf574at/PH2HkIHK6G/lSNXFhPQkUHlwg2PzHJbSPAU5ApKRxoNo
	J7wRTJ914qd0ulDDxIizWSy2uWTVs7h78Uti4cNM9UIVmUVmIrbAlpQ05A6geiOR9SZS
	04IS74I7hypMZCuPHp5obxld4Qbn5LaST81AgMXJZWU0n7K1T3JbAXesYqzoECoQcmW1
	kuaA==
X-Gm-Message-State: AIkVDXJ3WjtQViuCNBEFZL55a3pE3mSSpwaVx47pUiJDS5t7fm8z7hJKuzmtIc3nDNkYVw==
X-Received: by 10.84.133.1 with SMTP id 1mr25433472plf.151.1484267164793;
	Thu, 12 Jan 2017 16:26:04 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	t129sm24343805pgc.32.2017.01.12.16.26.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Jan 2017 16:26:03 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2017 16:25:58 -0800
Message-Id: <1484267158-15077-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] syslog-ng: drop attempts to disable LFS
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
X-List-Received-Date: Fri, 13 Jan 2017 00:26:05 -0000

Forcefully disabling Large File Support in packages which enable it
by default is probably not the right thing to do anymore. Since the
syslog-ng configure.in file has been renamed to configure.ac, the
existing sed command would fail anyway.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 0acdd73..4a66272 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -56,10 +56,6 @@ PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
 PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
 PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
 
-do_configure_prepend() {
-    eval "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
-}
-
 do_install_prepend() {
     sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
     sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/systemd/*.service
-- 
1.9.1



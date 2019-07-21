Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7FB7EEC6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:31 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id f17so12210849pfn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HmqkK8+ZQHs/ynfDXxdFlF/8TSvdvAJM3RfsSrjMV7o=;
	b=ArKs+B6Hbw709pN6BIxKF2LnyWQQXvKBMmvINO90KOmSJ20oUoQmZ6epmF5+4d+7YT
	IVK/yWTtXD5mKay2ECOgmZHw0XMGbXfajYlbB5teNALIaZZTINfdb9M7dpZQcV40eQO/
	EdSIWxc7SlU4cqaKecqVlvOYXdhAPcUdL2vGA7+fkP4qchCTrw5U1GlTSz8Lz1VLEaH2
	wiePRHy1t7PoQPvi13v6E55j2gSJ8eeHTGbnJqlcDACZ35qgTbRlOj+DKgu115t9e9ZC
	ouXyRpvfWLg49v7rsIEitBuTDf6C/uz0ESlmQfiWAVuTaHXtbjcyClqANBF8ar41y7Ig
	WJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HmqkK8+ZQHs/ynfDXxdFlF/8TSvdvAJM3RfsSrjMV7o=;
	b=ARUra6y2QJR+VzIiM5gkxQon5cZDaeofmCmot+W9eKxnfOwRSDqlnzjNPO1Djq1URQ
	NxBuvn5o9Cy2L09tne5VBBbLEAGqq35gDewwZSnVVawe7/NQYssfy1jH64KcMuTt9QhT
	CCbMrZ4fEh3h0CntI/YAwedVtLPv9eIYNrbVRM0+xXVh8jkqJT7LHUnC8HPDqLpBGcq0
	gQp9B5JiOua4f9cAGxmnG/2eNG63FGpgn8TytXTyrvipeN+cOfmYr7q27TYnphI8Sr+/
	QiHZ76wJhyS5MSqBiSSfv4mebM074ZvvUA+9hcf7a2tl62XlLWf6VfhzdPGudBq5DPsU
	tTgQ==
X-Gm-Message-State: APjAAAX8VxFnejfXdQFkILIpHyIXmfSUXEey9NMdmWQFlDaVhOi4mHd7
	KPEYXrYiRxfwohZk3l1UTp4NkuTBd5w=
X-Google-Smtp-Source: APXvYqzZoZZnOEn85a5/6alxCxuUjcvnoFk6FQGlPbQToWqKJWACgybIHlXtimBiH8Ln/bevLkapdg==
X-Received: by 2002:a63:755e:: with SMTP id f30mr67701553pgn.246.1563727171735;
	Sun, 21 Jul 2019 09:39:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:09 -0700
Message-Id: <20190721163919.32659-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 04/14] arno-iptables-firewall: Switch to git fetcher
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:31 -0000
Content-Transfer-Encoding: 8bit

github archives are not reliable
Fixes
arno-iptables-firewall-2.0.3: https://github.com/arno-iptables-firewall/aif/archive/2.0.3.tar.gz: SRC_URI uses unstable GitHub archives [src-uri-bad]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../arno-iptables-firewall/arno-iptables-firewall_2.0.3.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.3.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.3.bb
index 040c53f5c5..60aae2145a 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.3.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.3.bb
@@ -4,11 +4,10 @@ HOMEPAGE = "http://rocky.eld.leidenuniv.nl/joomla/index.php?option=com_content&v
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
 
-SRC_URI = "https://github.com/arno-iptables-firewall/aif/archive/${PV}.tar.gz"
-SRC_URI[md5sum] = "71271c08299aacd45ceb9c9400082d03"
-SRC_URI[sha256sum] = "e2c4fb88a25f0cae8308a3b2bb922b5e2f52f24d8309b24e15a527a6b326e703"
+SRCREV = "ffcb86c30779df58ee057dfe9a3b078adccc1513"
+SRC_URI = "git://github.com/arno-iptables-firewall/aif"
 
-S = "${WORKDIR}/aif-${PV}"
+S = "${WORKDIR}/git"
 
 inherit systemd
 
-- 
2.22.0



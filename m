Return-Path: <leon.anavi@konsulko.com>
Received: from anavi.org (unknown [91.215.217.29])
	by mail.openembedded.org (Postfix) with ESMTP id 74DE66006A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org; 
	s=default;
	h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version
	:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=asMDJT8X47rMpVdQ34e5enc2nGZFsqpJCmCVn1benIU=;
	b=XZIYrKiHGw1zRbbTdO2gVqGRYp
	exvIRyAIGXqtlnDN4zIBAU8XacQbILvgoM9Fw2JxzVTSq9igHUaOYKxud0xRhFn5mteO3ty172aTF
	NlavIqQnPT2Z3uB+1LLs2X3Ek5ZH4Hv7ZupcqunvD7VHdJj+0S1PzK8Xolsms07SOYeI=; 
Received: from [78.130.197.177] (port=38946 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.91)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1fcXr1-0004pZ-Dm; Mon, 09 Jul 2018 18:13:31 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 18:13:19 +0300
Message-Id: <1531149200-31915-1-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH v3] vim: update to 8.1.0172
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
X-List-Received-Date: Mon, 09 Jul 2018 15:13:32 -0000

Update vim to the latest version 8.1.0172.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../vim/{vim-tiny_8.1.0.116.bb => vim-tiny_8.1.0172.bb}                | 3 +--
 meta-oe/recipes-support/vim/{vim_8.1.0.116.bb => vim_8.1.0172.bb}      | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/vim/{vim-tiny_8.1.0.116.bb => vim-tiny_8.1.0172.bb} (67%)
 rename meta-oe/recipes-support/vim/{vim_8.1.0.116.bb => vim_8.1.0172.bb} (98%)

diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0172.bb
similarity index 67%
rename from meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
rename to meta-oe/recipes-support/vim/vim-tiny_8.1.0172.bb
index bb8f2b7..84ad659 100644
--- a/meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
+++ b/meta-oe/recipes-support/vim/vim-tiny_8.1.0172.bb
@@ -5,8 +5,7 @@ SUMMARY += " (with tiny features)"
 PACKAGECONFIG += "tiny"
 
 do_install() {
-    install -d ${D}/${bindir}
-    install -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
+    install -D -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
 }
 
 ALTERNATIVE_PRIORITY = "90"
diff --git a/meta-oe/recipes-support/vim/vim_8.1.0.116.bb b/meta-oe/recipes-support/vim/vim_8.1.0172.bb
similarity index 98%
rename from meta-oe/recipes-support/vim/vim_8.1.0.116.bb
rename to meta-oe/recipes-support/vim/vim_8.1.0172.bb
index f669dfe..8e99919 100644
--- a/meta-oe/recipes-support/vim/vim_8.1.0.116.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0172.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
 "
-SRCREV = "a87b72cc316e065d66dcbcf7ec1cde330adef3a3"
+SRCREV = "c229e54a69468722ca2449e807e90445b7479659"
 
 S = "${WORKDIR}/git/src"
 
-- 
2.7.4



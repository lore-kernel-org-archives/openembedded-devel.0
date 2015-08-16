Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4B639606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:46:35 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so56115258wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 12:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+Ip84eUqic0bXlyyrp+kT0s/LsAuLXiT9nR6B3mKW2A=;
	b=lxdHdMUuFr9Br5XJYG4e3IAbKbrqXBJIj2KWVcgWqM35M4ZQHKEAofBHjvMvxgMq4P
	Ml+rKAdf87RSb/8DQ/3t8jgsZ29D8Qeltdrxf+kLdtCmAkWznP11VeppytUTbp57eCDa
	N04fFibiykxjjsyNrmA/HaxU4PrvSdob2+E8+aPGNQWQ8M+muS4DSn783sqKPPqiwc9R
	imdgix+SvI/BSbUcPJkJNpzT8RyOcsqheBvl+SzrrrnyIGZkmpdeS8YgABo51UOyCuTx
	GRYL053qmz931hNfandfoqGhwZNy+Z2KG+QrjYrKIm/YeZgWZ1uzkNbZdmBM3OYsXmQ8
	BwKw==
X-Received: by 10.180.78.166 with SMTP id c6mr26805128wix.8.1439754396008;
	Sun, 16 Aug 2015 12:46:36 -0700 (PDT)
Received: from Saturn.local.all (212-41-85-106.adsl.solnet.ch. [212.41.85.106])
	by smtp.gmail.com with ESMTPSA id
	p1sm18490730wjq.28.2015.08.16.12.46.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Aug 2015 12:46:35 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Aug 2015 21:40:17 +0200
Message-Id: <1439754023-13290-3-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
References: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
Cc: gary@mlbassoc.com
Subject: [meta-browser][PATCH 2/8] firefox-l10n: Update download server
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
X-List-Received-Date: Sun, 16 Aug 2015 19:46:36 -0000

The ftp mirror currently seems not to work, change to the download server
recommended here:
https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Source_Code/Downloading_Source_Archives

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-mozilla/firefox-l10n/firefox-l10n.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n.inc b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
index 7b252a2..3090ef9 100644
--- a/recipes-mozilla/firefox-l10n/firefox-l10n.inc
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
@@ -16,7 +16,7 @@ PR = "r3"
 # Mangle place where to store the file
 DL_DIR_append = "/${PN}-${PV}"
 
-SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/mozilla.org/firefox/releases/${PV}/linux-i686/xpi/${LANGUAGE}.xpi"
+SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/linux-i686/xpi/${LANGUAGE}.xpi"
 S = "${WORKDIR}"
 
 inherit allarch
-- 
1.8.4.5



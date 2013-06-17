Return-Path: <andrea.adami@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 630AE608A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 20:35:03 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w59so2690671wes.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 13:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=BZKtpZa02HDKwjDp4wZU5nFulsFodXJEFp/RdjASlE4=;
	b=zrSmKfnkgcmDTGyN+nGFEJPuyxWHb+OaGPsuWs2rsRCXmpaRmR6psiqY5U7j0nSC0U
	13eEtdOhMN4hUMHVtCYWdn8pnfJrxT+PYOiNF5z5CySdAUMZ7Wvp0Ty3OgItTZ6P/JRJ
	YaNC0gHl8DcpkXoMcrzTWvjDMs9d+4BxRs713S2p3pgrovVF2fv6lX1JMG+wfXeVVCG7
	A1thesevV94WvmmKjs7ok6CBrywsqOzkBFIygN0VkWIDEDF1vOkXyAqiRDdxa84apPY+
	b3qf2h+CVKA1KlG9qpXPUR2VR5v/uEgGFLyiFGjNiMV6PGlxFonwOaoO0u3wWfl+K593
	ONTg==
X-Received: by 10.180.184.75 with SMTP id es11mr5727888wic.38.1371501304105;
	Mon, 17 Jun 2013 13:35:04 -0700 (PDT)
Received: from mizar.localdomain
	(host253-191-dynamic.56-82-r.retail.telecomitalia.it.
	[82.56.191.253]) by mx.google.com with ESMTPSA id
	dz8sm24600208wib.11.2013.06.17.13.35.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 13:35:03 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 22:34:48 +0200
Message-Id: <f3427972849f687e99786ee0298cc3a9c8a45f4e.1371499248.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 5/9] kexec-tools-klibc: add custom SUMMARY
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
X-List-Received-Date: Mon, 17 Jun 2013 20:35:04 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
index eedcaa5..a54d38e 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -1,5 +1,6 @@
 # the binaries are statically linked against klibc
 require recipes-kernel/kexec/kexec-tools.inc
+SUMMARY = "Kexec tools, statically compiled against klibc"
 SRC_URI[md5sum] = "92eff93b097475b7767f8c98df84408a"
 SRC_URI[sha256sum] = "09e180ff36dee087182cdc939ba6c6917b6adbb5fc12d589f31fd3659b6471f2"
 
-- 
1.8.1.5



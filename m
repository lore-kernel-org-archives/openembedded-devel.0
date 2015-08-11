Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 16D14768A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:19 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so49990819wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=2oXp+L/fg+EePI5rqVqFOgcHSijinX1hAvLRUSk+hiM=;
	b=mM/iZ0+X1mUpjBl/ttHpc8D++9XPKh3L3Fyk6wjb3KSDlWsV58sJOjpR8PFo9qrziA
	RMjEsws5Ws5H4OJW6qGnenpQyTzocDnopDkZvn6psOULMncg4+MJSwQYgFlmgfrDjw6W
	lO/fyqlNiBxCyjl/dau95I6mRhWMW8KZnTIbaJ5QSCR8oHlADmj9tmo8sdgTaIuZotMa
	hv+D6hQreMhumNGoIGBNDJyx2eMC1P60weSIuz49OnIPU+yQ38dv+cbjSH8S1pB/tfuy
	Q6jqoLdZdqNEAnNrpaoBznzcvWJcPqG88B9a4sEyzUgGq/L60u9rlgCx+0DzZWnipqmX
	AbZQ==
X-Received: by 10.194.184.82 with SMTP id es18mr56882363wjc.79.1439279899100; 
	Tue, 11 Aug 2015 00:58:19 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:31 +0200
Message-Id: <1439279859-1815-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 09/17] mm-common: update to 0.9.8
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/mm-common/{mm-common_0.9.7.bb => mm-common_0.9.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/mm-common/{mm-common_0.9.7.bb => mm-common_0.9.8.bb} (51%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.7.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.8.bb
similarity index 51%
rename from meta-oe/recipes-core/mm-common/mm-common_0.9.7.bb
rename to meta-oe/recipes-core/mm-common/mm-common_0.9.8.bb
index 8a75cd2..943343b 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.7.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_0.9.8.bb
@@ -2,8 +2,8 @@ inherit gnomebase
 
 GNOME_COMPRESS_TYPE="xz"
 
-SRC_URI[archive.md5sum] = "a8b7c11db81a72168bf38d88d97df686"
-SRC_URI[archive.sha256sum] = "78f47336f3bdf034a384c59a39cc9f0d566e69e36aa7c9ee3ec0bb6a94bf8b3e"
+SRC_URI[archive.md5sum] = "00fd5c6850cd5fecc2e02b04d0dd1637"
+SRC_URI[archive.sha256sum] = "c9ab5fd3872fbe245fbc35347acf4a95063111f81d54c43df3af662dad0a03d5"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.1.0



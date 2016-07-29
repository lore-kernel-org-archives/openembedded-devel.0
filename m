Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4C43B607A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2016 14:25:27 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id s186so955206qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2016 07:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=46Q1Naqx+E7mf0AaOazcFI5580p6f0NmqPTLAjJcEIY=;
	b=kwdkev7DvYYH2cyhshUS2PBTCqG7DZp17Z+t8Th6xZzORH9pPClqe4MaYhMuowBhor
	4PQrawAiylaM49GcWEvTNFQJEOoipWCrfmOBo4OpHKNFQzs0Zv9D83aDJGI01boyZVOh
	hdhefIEa2CV4dsbpRzBjL2+mHTz9su5p2XVw09sZ7Io7vCSLNTXRBnq9ymX3OGC7hAya
	Ksiwz6hCgpZgPGt8OUZiL8hQgolgaTPwU/seDTwimjoDL9KT4gK1+EQJUNNaEZvJJup2
	1NKFCNPJU9xANpfhlEZ5YvwreNDloQ54LQXkfFRNFAUBf7338iv0x8HDAwTh49ubLmdr
	wDKA==
X-Gm-Message-State: AEkoouunRWWYMd02JqR38VMK2/BJ0FOq2c+4BUpfFq4/X7A2UNfz9ynD7ACB9p6A6ZROfA==
X-Received: by 10.55.150.195 with SMTP id y186mr48184619qkd.7.1469802328669;
	Fri, 29 Jul 2016 07:25:28 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	l89sm10109559qte.41.2016.07.29.07.25.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jul 2016 07:25:28 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jul 2016 10:25:08 -0400
Message-Id: <1469802308-23540-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1469802308-23540-1-git-send-email-derek@asterius.io>
References: <1469802308-23540-1-git-send-email-derek@asterius.io>
Subject: [meta-webserver][PATCH 2/2] nostromo: add dependency for nroff used during compile phase
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
X-List-Received-Date: Fri, 29 Jul 2016 14:25:29 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
index 7d660ce..5493c12 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "541494ecfeafec58c0876ccc90cc23b06e0144f6f42029af44c7cdb1f4
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl groff-native"
 
 inherit update-rc.d
 
-- 
1.9.1



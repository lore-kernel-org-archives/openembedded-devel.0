Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id CE3C86B181
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Apr 2014 12:40:09 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rd18so4524235iec.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Apr 2014 05:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=02s8AHZ0bUkktQmFo8Yt04oTLlXt5KzBUuLI970IjcY=;
	b=KEX3plBSb0oxuavwNHwqQjORoj1PllUDviIFeWBpSx1hVukCZyPE5GSmMGjVDXVWPk
	BFea2Cx8ImNiZl6Zf17VlJ+/Z+YfYwNkW4jeR6z4rVIUxHPa2c9mNa3rg69S+vam8B+V
	aEQhVWMoYCVoQpP/TIJwwBcP99qe4tG2xzCf8RKpSRDmtNcqXV6KI6ULXdCUKCQ/yMpl
	AcZg0w8F4tm8mh+kf4w+qhDQRPPMeybt8cTBbtQuQISnv47pD4+zTXgeHARxa1UAXxrY
	d3DEgLXOgaWjtA/ro24hk3kDaL5cBJPc7ZcvP0cYXtlPNaXRvTDFJpMi/KftbVL+c07C
	f7TQ==
X-Gm-Message-State: ALoCoQk0XtdAoZJOCv6+L4kv66lqoniP0kxzjKWYKBrwZ7AtEFTSX2qjuNqCsM6VklqXmdcTQ5pl
X-Received: by 10.50.109.130 with SMTP id hs2mr9241398igb.29.1396701610726;
	Sat, 05 Apr 2014 05:40:10 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id b8sm13735966igx.3.2014.04.05.05.40.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Apr 2014 05:40:10 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Apr 2014 08:39:42 -0400
Message-Id: <1396701582-15906-4-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1396701582-15906-1-git-send-email-trevor.woerner@linaro.org>
References: <1396701582-15906-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-oe][PATCH 3/3] liblockfile: remove silent rules option
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
X-List-Received-Date: Sat, 05 Apr 2014 12:40:10 -0000

--disable-silent-rules is only available when automake is used. liblockfile
doesn't use automake, therefore remove this option to avoid a configure
warning.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
index f59c783..286eb3b 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
@@ -16,6 +16,7 @@ inherit autotools
 
 EXTRA_OECONF = "--enable-shared"
 CONFIGUREOPT_DEPTRACK = ""
+CONFIGUREOPTS_remove = "--disable-silent-rules"
 
 do_configure_prepend () {
     touch install-sh
-- 
1.9.0



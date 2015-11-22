Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE1C60290
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 18:05:31 +0000 (UTC)
Received: by lbbsy6 with SMTP id sy6so84929253lbb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 10:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+FZ56pahcgV9o9NAiXTZougqZMnD+FT8Hyrkas286Sw=;
	b=c2kIHQgbsXfAEr46pd946H4bf9ZWUVFVvRbIhjhzpR2U1YuAwG0S5hvYMp9B7ataKa
	rSGrxJajuX30195I4WW/elJufiWz5LXdZwGUpUncvLx8sa5S5BmgSnsbCcbtkeZ9E8aN
	BpWPYQNo+K10pyto9Gx4NlAi0OJI3LrRDbAaMvBj7aw6mL+TbjBOUFCdFgCb0xlYjA+u
	z2KA+JKHRQv2x9kFsBNiLKO5dvFDdhup+v7KU5SJumT6J4sjZ7tO0LNlzuVUFxOBtkPL
	fFr/Cbaofnw6jDOlNvsqhaxzB4gDWlYF9wpM7cBHNidpQrDpIufhXMeeWWV0ODOHRCWr
	KMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+FZ56pahcgV9o9NAiXTZougqZMnD+FT8Hyrkas286Sw=;
	b=VK3iuMwvqk9SlsL8hKn4fVb1gQAdcY9yspbfaAgQMQXhIolQlOHZr1aFhRLQkpK+kS
	8NLsM3Rnfmij4//MXQ5Qyl3FIHNDmADwc0iELUT6ztdUPAWwt9DJyB/LszjzrM8q8/4i
	uCYjKCPEyDj6w4BjU0MFhC+EnCOay0aeufgdSdQlArR3XS6g1IHjrp90zSLL0cCdMKJO
	bLjHM6m6bjJk8B4QjRA52UU6YIXiZrR9HvaWB9u8AHKA8GAxvFuaxNJ29I+s/CqkUO8d
	MUdn4N+LckjSGhKVt2tYwbPJzP9cm+Zcd0Y/Glw/WYIIP5x/0+fPbm1ow+Qbdqm+Cwsr
	MNKQ==
X-Gm-Message-State: ALoCoQmRfEq8t9hLfTSjXgszyEGzXjUek6PcPzjWWYC3jrn8L+EbkP+R6JJsmGpfNyo9G2mQjL4I
X-Received: by 10.112.148.198 with SMTP id tu6mr7148005lbb.39.1448215531702;
	Sun, 22 Nov 2015 10:05:31 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id 42sm1324726lfv.29.2015.11.22.10.05.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Nov 2015 10:05:30 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Nov 2015 20:05:16 +0200
Message-Id: <1448215516-13579-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.6.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH v2] libsoc: upgrade from version 0.6 to 0.7
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
X-List-Received-Date: Sun, 22 Nov 2015 18:05:34 -0000

update SRCREV

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 changes from v1:
  * don't ship board configs
  * don't oe-stylize

 meta-oe/recipes-support/libsoc/{libsoc_0.6.bb => libsoc_0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libsoc/{libsoc_0.6.bb => libsoc_0.7.bb} (90%)

diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
similarity index 90%
rename from meta-oe/recipes-support/libsoc/libsoc_0.6.bb
rename to meta-oe/recipes-support/libsoc/libsoc_0.7.bb
index 79c171a..3b7436f 100644
--- a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
 
 inherit autotools
 
-SRCREV = "3643cf161a4b37bfbdfd05437166c4a29ac3ed8d"
+SRCREV = "4d5c5af71e225cc4e792d2166da3f3e432b08735"
 SRC_URI = "git://github.com/jackmitch/libsoc.git"
 
 S = "${WORKDIR}/git"
-- 
2.6.3


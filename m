Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id F1D9F7869E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:14:10 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 143so307989wma.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nJtZZBMi0sVh/TbJ52SykTt37PHOevy/m+lZER8SShQ=;
	b=C9C5i/gk172WA1eXJjZTwn7FoMhGr7hOniQXOiNaEFN2ohZFon+GQrfbOZ8zlVGY/V
	CIp9dhZtyWzbh/WeVgSI+SaT0bGjjm1OKll77IMiaIkgB2uZjR+mL+l77fGlEI+7oz2S
	7bMi61A9dUhfbk0zM78BwfoeJFFqLRc4tjqviNH2VDKEPreFhMTtEjHuaiS4iecGHwA6
	/eWYxV00PEiwqkQev+lmoh4Wu+uIG1ovgehjzPOjViy2f1t+KGwYxHnS8gMy4DrBXvZX
	a8PlowTleOnTIFrUTWn+D7qgsszTJy1MmYFBWYQe4kA1lp/NEkkEVkcrFowqXLdzR4Ss
	nZZg==
X-Gm-Message-State: AKGB3mI8MZfy2hwgvhhXACfBtoJNaRFw6mZHUQFpgA2vVTQDF8nBDp8E
	zslIYbo+YVh/XzvhsiNQ7i/M2Oic
X-Google-Smtp-Source: ACJfBotMAH9Hd5JGJtlLIC5OxEpfn7a2HIUlJQE8BPX60Ha2MQA6oFdI7Hj7u1DZYooOXAR5qCJxAQ==
X-Received: by 10.80.183.184 with SMTP id h53mr47835346ede.249.1516007651857; 
	Mon, 15 Jan 2018 01:14:11 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d3sm17254591edc.15.2018.01.15.01.14.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:14:10 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:14:03 +0000
Message-Id: <20180115091408.1133-3-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115091408.1133-1-git@andred.net>
References: <20180115091408.1133-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/8] python-webencodings: use beginline= in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 15 Jan 2018 09:14:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

'startline' is not a recognised keyword, it's beginline.
Also, 'endline' was wrong.

  python-webencodings: The new md5 checksum is e910b35b0ef4e1f665b9a75d6afb7709
  python-webencodings: Here is the selected license text:
  vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=8 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  License: BSD
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=8 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python-webencodings.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-webencodings.inc b/meta-python/recipes-devtools/python/python-webencodings.inc
index 74b751793..34ca7066b 100644
--- a/meta-python/recipes-devtools/python/python-webencodings.inc
+++ b/meta-python/recipes-devtools/python/python-webencodings.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Character encoding aliases for legacy web content"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=af5c81bfe98855a56d36b6ba5de2906f"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
 
 SRC_URI[md5sum] = "32f6e261d52e57bf7e1c4d41546d15b8"
 SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"
-- 
2.15.1



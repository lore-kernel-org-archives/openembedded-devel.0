Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13221.1794901986122298232
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 23:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fBpR4I6u;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a210470b49so35411335e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 23:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794901984; x=1795506784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRuC4hE47YhLXgTbhr6YY0+VbCJNdQN0ZzpIMNlIm+Y=;
        b=fBpR4I6uxMpbWPo+aesMUDqM6vD5U/HfwzxgQmIgmUwbymGYTCqNE1kZ9qex2I8VRJ
         KMcrk6GOVKFoH6Dgdp0nt2KKVbrPadyEocgzBN+iFbItapjesMui0jyNvke/PoSvtWhs
         byiLiveUB/lDUPu8jWpyZjo06gt7YYwwHaAg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901984; x=1795506784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRuC4hE47YhLXgTbhr6YY0+VbCJNdQN0ZzpIMNlIm+Y=;
        b=p70Aj2OOuq+xXjE1AOaDKN2kWjIpyb2rFpvxV2Oz4iyHaOElIoshSPRMFRV03LrRKI
         d90V/FAUvOsaly0tEmcnWzrw1lGp9lxeI1UcNsXMn8f+e1XYnFZWQAd3hhbKg0pD3DHD
         vxnm9U85gUhNXwTtcV1NHj1flh/CPTZSZq2D5l3ACy6/ffp2N8U/mzUGcDGiiZa84s/y
         RWAP+A83CrxD2tEV09Rn/EgzXh+TDHURWPNXNr80oATaiOgrPi80kRxmI4uoNp7HeK0+
         zO7qmacDlUjJiH8lKSNjf45UdFpoCtBkEGp8kDHZkgVy+DFr2WkOAlUR8pngyZfKW7Wo
         pK4Q==
X-Gm-Message-State: APuU4Z8K+3okx+OvMuck11/mgrs8/I8UAkuLyGc6JC+wv6032Ztu3qlo
	DiAFfjDUmdRHMjaNqbYeVWrtgmeyVg85FKTT9a7DlBjE+vW3u3QNRaVTM3WVdXCXaSbos6i2VSj
	eFf9f
X-Gm-Gg: AYBFou0INbfQas0/ykUOgClfOKg5ReAi0hQjAyjj6QbD+a6Ad5+Q8NjwkMJ0o/dTi20
	eay6Ofbb6mFc04Be98TKucJIV5JkwKtJW/lMF9OQjuMqwpEaoCqY7GXHmAxYNUMnyYYtsVZqZYK
	wgYFxi6Zr5nDPfHBvgmgVZ0TmquaB6OpTglJ/2Nhn9cXTwFkWu85slG+wAbwf51XIidGE2cwN2v
	70XEXJYxJeeaR9/QSfs8N/h3GspRnB0nc3XGXaHHhqw9dwbsR5MrT00/FpfgDOdF0BZcWk1Qq99
	WXUmyuGQKCKr4HXsP87W+ZU23gViXy+yCTVQURna88gZWsdO7qnYP4xzm4GPuEiDYHfcqBSYMDD
	oqxjz82Uw8uLnJ/dP5bwDHhTySpZo22tVPZxrp3g2ZX9FgOIrWsxS9cIyeS3WJ57pu5QRMFSj+a
	DpkahHbOm6oAOqEac9gTKeKNf1KYKkkPD6b47UcLmZf3Al42yp1LPLIoJ2a7kPaE3ICL21nRYDl
	80Soh624F366mXWBwbeUtK+VJjxnQo14mfFao5A9FTswUedL0ad9ihR5aCfC0M8hHK9l4ykX0VO
	BeMs0g34S1y7G0YSes+Vh5kMZS+SdIk1ZI5N81x5rbXeqBpSh8SFm8xoFUp5d3daxDQYV3G8U59
	tR0qkqzZ0gJEwGbQvdE1HA2RK2nUUqcBG/XzooLw6/8LKVOImhMXdxJo=
X-Received: by 2002:a05:600c:8708:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb55a7ece6mr284170255e9.12.1794901984043;
        Mon, 16 Nov 2026 23:53:04 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783c2650sm54072995e9.14.2026.11.16.23.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:53:03 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-imageio: Upgrade 2.38.1 -> 2.38.2
Date: Tue, 17 Nov 2026 09:52:57 +0200
Message-ID: <20261117075259.3922364-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117075259.3922364-1-leon.anavi@konsulko.com>
References: <20261117075259.3922364-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 07:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132573
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.38.2:

Bug fix:

- Read OME metadata in tifffile

Maintenance:

- Write 16-bit PNGs on Pillow 13 and test PyPy 8

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.38.1.bb => python3-imageio_2.38.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.38.1.bb => python3-imageio_2.38.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.38.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.38.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-imageio_2.38.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.38.2.bb
index d0d3166f2f..5d2f8fbdc3 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.38.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.38.2.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6c492278d46e42af592aa26d7cab1e54"
 
-SRC_URI[sha256sum] = "6769f1f01c4dd46448307863a787c9a22fa4dbe11c0c88f525c6e410fdfd7983"
+SRC_URI[sha256sum] = "62e338ea5c19a5547521b3b590a8a9ed1177e5d6c3fd1df076029053eacc73ca"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


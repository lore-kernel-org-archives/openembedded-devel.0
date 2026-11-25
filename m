Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41236.1795611512939931138
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 04:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RKw57UEp;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2627722f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 04:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795611511; x=1796216311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRufYnCt/5jMQniWAcgsUoZRGg8iU1X+S9Xpz3IGKlY=;
        b=RKw57UEpkIelWnp+eBuy68dZ2FLqLKaYlJZESHneFV2oeejLLihnvh2NSjNrtrG12q
         +pHMPrk+OIh5/E36pehQY8wnicHt8/HJ0AT4tj5nkOygAiUaVLUOW469WSjgzH50cx/Z
         W/6pOhlWfvbC0Vsp38mX775/3+pJT9TBus1l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611511; x=1796216311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRufYnCt/5jMQniWAcgsUoZRGg8iU1X+S9Xpz3IGKlY=;
        b=BCkXaIA7ptMljF4oYNqiorw8JLvAdiTYmXFNWvKet/1/lg6JWv6804U6RtqHsOLgYM
         R668hrRhzbiTIAhu/wnMeIgKYw65lSh9TWotIq9anMqdLhrFDiE9AcaPD0WGDBgYPkPY
         30hh7wbARrrCenQoctAlExILxw+ape5QK/fqQkhleKOtsgE9HQyGG1oAigWlQtu1URCQ
         WpGObfUUZ9t+0ixxJ0Wbmn6crZ1zq9QkYINWUIQR71eplgqwDmYUjfzeGuplKUg9voSk
         DfCC5Ovj0DyO4jC9CN9c9kvk2m9O3lYRDpPzjXmL06ZJE62gZWRm/ecrmx6CFOm4HtFV
         C0Mg==
X-Gm-Message-State: APuU4Z8PyPF9Ir0DD2vH8vkXBGSguXjtIn7oAxSz/rOq+W0BzofqfIec
	1THsgwMQefCQEbbMy2UD6Cyr+yfkbnDsHYd/uBsE1o/u4u6MO7QDYlfksRwYiSEMbLxd4DMRyYj
	U++dp
X-Gm-Gg: AZFdTZfjflNJimY1likxSTNWmEoFDLZV9G0EQUtL40rgCuAs/1VJkc54ztAGIYZ5AsQ
	UzCv2EtkqNzsbR+ldqqeYhSD2msFqgiedP/OW03K8+oP9UfqAe9Yp0u96ZzBuwVhPBbXq7EWmsF
	gKWiSVrHsP6gKiu79FatH9EqxewEAeYf4HZYnziXIF9+E3YPdwtlUbwIaGq/IgFCtzMFe9EUmrJ
	98CcNPEZpC7P6h5+krvFdg6WqFnOlFqGVXDjK6J1zXaWtxK5Fuy7nrcB/BSXvkfEy84w9qjN758
	+yfNuRZTL5SWuhUJl1mr8CGNI8ddYc58gCbe2wW/1MFyogH+jEqhK10GxnWIoQIAtnezCgvgVTY
	PO/6x6VAeTX3YUnB+F53EF93v5iOemFD+W3JfAUfEGh4bsbieI++InDHV+4B08IgDnpUBGUILGs
	tPexobNFbs0i/pkqthpLe7BOKa/SPCcxdjG4KcITQ/EUDaXUs3FUglTHr0X+K0zr0jGVYggl0eg
	qIDkVBU5HP+0u4fj2w8ugJ1PLFk/PJnvkwR5O3Dh+KesU6/36QuxzX01tyw7lfxWuIC/S9Cdxoy
	zxOa7nNQOdsL5M2VCgd2dPirq/foQSP4fk65CKJGSCo8izj7PeWXYVzEahruPk2OYS2BpKi8zQb
	BNDe/1SAygZxg5O2POb4282EWw6V7Gnksx6JVDTwp5MEHR6cEU1JbmflP1uQKKNw+7FkU0CldC1
	Y=
X-Received: by 2002:adf:e013:0:10b0:4a6:c3f:9d22 with SMTP id ffacd0b85a97d-4abb32a41fdmr24125904f8f.39.1795611511258;
        Wed, 25 Nov 2026 04:58:31 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm32919300f8f.40.2026.11.25.04.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:58:30 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/8] python3-regex: Upgrade 2026.11.23 -> 2026.11.24
Date: Wed, 25 Nov 2026 14:58:21 +0200
Message-ID: <20261125125824.1799066-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125125824.1799066-1-leon.anavi@konsulko.com>
References: <20261125125824.1799066-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 12:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133078
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.11.24:

- Fix use-after-free of Capture objects kept past expandf/subf
- [^a]|[^b] matches like [^ab], and negated sets miss matches next
  to (?i:...)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-regex_2026.11.23.bb => python3-regex_2026.11.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.11.23.bb => python3-regex_2026.11.24.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.11.23.bb b/meta-python/recipes-devtools/python/python3-regex_2026.11.24.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.11.23.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.11.24.bb
index b6ef7c0da0..8eb431dd32 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.11.23.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.11.24.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f933202c64dca184b783e1c97922170bb167146faa120476a310e90d0701a915"
+SRC_URI[sha256sum] = "07f222de81cdcfd39eef8671e92d14f50f61f1666f756659b0e649cf700b1b10"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.47.3


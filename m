Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10245.1795752984274955111
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Gog4wx7U;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b244fb7fffso8340776c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752984; x=1796357784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8aF+rFkqwYLwuG8mhDz5EUL0aGChA2nC/cMeqf22iw=;
        b=Gog4wx7U1wFXSWOjdnuhteUzeYcHd51wXNxnuqMijoOLRH+hagy+TpcDXWFio7Ut0K
         rwsYH0p/cnTqHU7yYOQISxjyFk3yJYMVw7bCSEoWj5bAhB6iLklOcttjr13aA8+0J4if
         beYNa5BaLNIuXS0+cTVuxuYifGbpds/bsb3F6VvR2AjzaS4p3rs8xiJYgS3CbTAL+LdE
         +HWY8nfwtgmN48MLZoqZ3npIVEHcVilMdUFUQVAhb3aa6+j+hJV4CzQFArm5HYjrSHQe
         GPzwOcu3OVgzi9Nx9M5tihMlfgLC4ZHRHexqeCsocstneDCiH2eyiGIi8dNNoeFGB0aM
         A2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752984; x=1796357784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8aF+rFkqwYLwuG8mhDz5EUL0aGChA2nC/cMeqf22iw=;
        b=sSeNWTUiFYhWw4QDhGsJrJ4l1bESvgJi+NGtGo7coutJ1PTq9RuUsmfl5+dqxQTCCN
         ZF2/HnEBYOTQQmSeMKyWThrxe093juEIIi1hXsLaoL4yBAVulMHe2nKrRTn1cPxMGCmx
         jNd3XWdS7bGD/agr60ug/ka1kM/JEpn4sEkxwOtBnCFSDdlBXATx4pqyh9B9hqHd5pc9
         IOzv1W5vG9mhZArVyaNcELD7y2bQoFgP+vXxODU1L+rLZsEIsd3MNniQTrIhNQh5K8Jn
         Gtpo83eHTLyaIYTAWAIszxIBEexFhkDzFxlhqwnCAgaDadnwLJhRF83iqDk/p1yJhQ9X
         N3VA==
X-Gm-Message-State: APuU4Z/S9czcMOhZTUpdv/b4lt0YJ1E8S2NVK/Nr9nukTkytAHZRu+WZ
	4HHsds7QqrQRt8e6AVsM5cto/cC2OEjP9W3L4JFfvs9ZDZc5KQvEol0Jk9aNhHik
X-Gm-Gg: AZFdTZdb3tyeBwQ7TByOGRp+vfqxkskhlJIewTbXHjbzMLZ7Ia4cwNLhxl7Nl7u2exR
	aDqsuv7FBqGCP1ZqLETnyP4QIcAcqNsBWYk3G5r6otUWWaX8IetH996DZNda0TntS6X6oo3X4GO
	JJkccenruapQndB/OIxck+vbR8NEmp27umLyMhKCe0JXuXGZMPDMiiftDoSIVoj3T5IhnFunjv4
	uM4a539+/y2euRB0ixuI6aJvFnX1+5JRRzBpq/qAZziQCSGAI+b0XAMQwZBCtCjPpvOjOFNOYCN
	IAZ6uvqZ3X8/UKVzbISan9e6tgoeJ8/985bmYKtp+QF+1bjL5Euj1Zx719Ay4OpMLDzTAy+IWds
	vhn+EhYYfuGpv9h6wG7j0BPqO9s+dKnKuYXmUUKL2rS0aJiLpaVSh747cx607eQNIljh9nu6TuN
	t/A0DxpG+sWT23D3apnmpUrPVtcTVuqRJ2nFDRB7wsm2cQLblMHBXU/GvUmqyf0y6XkBQfIJVV3
	xmTZvp+nlW9g+eg2L3dRjPU5wRwK70NUPWSaOZTy5HCgHYaYAJHe3/oud7gla/gH/EQQBUn8j0o
	ELeMZYi5yU6JyDWsFl+xxl5DgdxC2sAsdELW740ha9t8r8s8yZn+u2ebBoWe4M3VfhBK/vzaPmf
	0XO1wWcpo0vfdsQXJQZWKGMuz1G334iWdAogsXOHqVfycj4BTC3t8jXa27yIXpABQtawYqfEa5H
	IPk7BhB15UypxUARwRuVuCE+QbGsiEpqsag9be87RCQ1ykOuDwvHDW5jRo4pD3FWxNr+m5t3n8x
	KrYy7qTkYHdh/PvgliYhYIV3yxyueLf6GSQsZJrKFK+IpNgg+SAbgs5X1DN9hfewOTvySe45zzp
	MTG7
X-Received: by 2002:a05:701b:4553:10b0:169:9f67:a91b with SMTP id a92af1059eb24-1b5568650aamr21592523c88.12.1795752983526;
        Thu, 26 Nov 2026 20:16:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 04/32] python3-pika: Fix upstream version check
Date: Thu, 26 Nov 2026 20:15:46 -0800
Message-ID: <20261127041614.1775064-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133223
Content-Type: text/plain; charset="utf-8"

The default tag regex picked up the en_support_20111115 tag. Match
only plain X.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pika_1.4.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.4.4.bb b/meta-python/recipes-devtools/python/python3-pika_1.4.4.bb
index c4c1bae8fe..096f7c57f8 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.4.4.bb
@@ -16,6 +16,8 @@ SRC_URI = "\
     file://run-ptest \
 "
 
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+
 inherit python_setuptools_build_meta ptest-python-pytest
 
 

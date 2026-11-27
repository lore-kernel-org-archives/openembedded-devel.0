Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10276.1795753052318161305
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=irP7IR5A;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so6588994c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753052; x=1796357852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7dSgKB7DH8SMebazeSqLT0ERFdibbOObqNUpS2HahM=;
        b=irP7IR5Ae6dPmFqa9dYwB5pBwHuE7Genz1QZ5JRrXOS5EB8X6O6iXuaAq6pfqnUW1s
         4QIZ346n2UiWnRRNJkBd5kl5yGFlzI2xfeEwDgw8RkiZ3/LCniMOYUAzCp9elsMfBclZ
         F1DLFz3ROzNnRXhS3uBZ/xnG8AU1i/TMlLbvSoXzKJy1P2nQx046YONk9DIzSXaHDNn4
         UD35Ns/kZxBBGv3CAsElaSmqNdX671cJQDbSMN6CabvhSyzLkqTxS2+4tWDIkN5+AmQy
         FHg5Am/74YS+HOqiWncyf7oSpjoxnlAUGgpZwJVSJtNgnJXATJ1QnrOOPJUOSNex+eG/
         FBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753052; x=1796357852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h7dSgKB7DH8SMebazeSqLT0ERFdibbOObqNUpS2HahM=;
        b=f+24RlcaIPTHOiDgJmI++Q0jIEUTKNk7mIyHA28oYvqKumUfy1nB+TpXU9MTuyqkva
         aFVrmmFnom9S0jE3kJxbOOMC09bnTqdbJtkG9R1nqwhSmzDfntxea/A5FspyD3FN/bMX
         Ax7qjweeB5XtQl7nYWiWRA5depbxZvuyEWNoL9WLDNFhKUWkydxAAeQ6vDQTp7aQMG1X
         MQPeP95EAi09Y4akHxIUCjo2HEi//mLOA7s0FSajrpmMap49T7S+0acZTlgS7my8I/vP
         NYZbJXw8Nt0+aDwwkEHE+M+DKob3Bk6AXe3dkg8aFSoX0FGOL+Rp/83dv2tackiW8E1/
         ZAJg==
X-Gm-Message-State: APuU4Z8uyUZpqM/hgDZr1Lch7ZuAyXcbtzMk2bawYpCyZwdFsFfVewQw
	yBpI73pT9hZs+VmRUdJKsDDcFVZjWJZd9phvmQ94gM05oX+plU1vmDdEkax195Y3
X-Gm-Gg: AZFdTZcTVFoRZSlQT1Xnb9qn0lPy0Ir6aGTODHd+c2oDkNPM6dmDD0/u/kyZsEXevNa
	4EFTnrwqXeCplXQVXhRvrgMISa0zdW3WmVT6k7o4x3JOJBCdxyFOor3nMlplvqY2qmoofawASi/
	C9lj0it9O7AZbQ5KuLmnHj9HfNon9lb3IGAHCxR5ZBDLAv4wABaC5FdJEftS09gHDXIs/vWH/nq
	iSHvuEoUjEpqBPD+OXggHOnKinGk/OXQVk00whstfVUG079D3GdEKKks8b3PljKhkjdNpLAUFwH
	4sUrwV12YgniRF52xpkfG8c9I5ibxHrvZpfHJny14nFC/mc468MvGTDCYbGZCSkflAEByPKPjaF
	W8qiK57UJX1cNfcWOm3e8K/BsMTuV9Ar3pLphd6qZK0F0GM9HxhXU0KjdYxZTb+hyR+OlUySYY8
	T+GBE0xZUqsj4j3tvCMp+Tl4COz8CD4GCO3XgMr9MR3mjVCX2q2/dHW4kiTAqo4+tugshdONy84
	3aV9h8gssb4FQK+t2NtNfxQaB4ceWo3TCuOLoIGMnwPyzWCZJgKuriYV0m50WTVdzjJJmUjhlop
	ie82LIev0/5fhMSgP+lVeQ0LpjlUV7Gd0Wd2pt//74d/4zNP8Ihf/J5wQfO8/E0lVp+NFKfp5KC
	3t/N5bn+5g7jLMD9SYRSRH7vZ3seKcdS9G4u/9n24L++MI3lwy9VKuoPA9smkHV64umbzXcgfdM
	vImUwwEqsSabi3xaVA6xaYdCMzzKV0w1Ln3jvJC375ryv3GDrJ7WkqJlx01v3fl3WPSf4Dqdxk8
	AUaSM6hgZO9PrVXDWfmbQzOdcipm7Bo8XeCMrSwhkdLAosNP/wxRXO/LmN0DDrBpcvAGCV1VzHw
	pHnZ
X-Received: by 2002:a05:701b:4308:b0:1b5:1a6e:1bec with SMTP id a92af1059eb24-1b5568779e3mr22793072c88.10.1795753051653;
        Thu, 26 Nov 2026 20:17:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 12/35] vpnc: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:52 -0800
Message-ID: <20261127041715.1776485-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133264
Content-Type: text/plain; charset="utf-8"

The default tag regex cut 0.5.3 out of the 0.5.3r550-2jnpr1 tag, which
compares lower than PV. Match the whole Juniper tag form instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index 5d9d2634a0..cf1da9d842 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -22,6 +22,8 @@ SRC_URI = "git://github.com/ndpgroup/vpnc;branch=master;protocol=https \
            file://0009-reduce-lifetime-value.patch \
            "
 
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+r\d+-\d+jnpr\d+)$"
+
 PACKAGECONFIG ?= "gnutls"
 
 PACKAGECONFIG[gnutls] = ",,gnutls"

Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20453.1795534515921930086
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 07:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mMF5ASMb;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491846221ffso3984110f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 07:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795534514; x=1796139314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnVpUpIAy/KxzYqFlsSPzaGv2pyrELHyZLLDOtXnNBc=;
        b=mMF5ASMbWIWaQ+x2noDc36/kzOymVrXpbgo9IdwaeacmxoE1qSKNRIK0c/4BuC/FN7
         oa6BpzGeEweFKZwJ9vHzOmukq0NOoaxHrFOp2fMDcvGt1VrcPPPKNDgY0D8A1unXkm+/
         AUZb0rlwziDEMyj0DazMRfZt7s3VgMgW9a/lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534514; x=1796139314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnVpUpIAy/KxzYqFlsSPzaGv2pyrELHyZLLDOtXnNBc=;
        b=EK15FDJdZE01b5Hv6fFjuEPmcJLnTnTT/JMNKZ4EWOkJ1zhDqZqYLefwWW+IgkmHOB
         QCtPDjKXZpMAW5OYo1fPnlM78XkB2iJfmA9Kan9wX/yAJGqhrzKA1R1QnEdNBrEi+ekN
         ee2/Rv9LI5tm7nJ87NR/wEp+nFU5Rhj2eBE4TlhIa9PEdk+52WuTohpRDZCHCpxdtpHw
         2yf8q0evGvi4g74JOhm2pG0JGHKx2n/CNhgJ6aEmTZIg3MM5BAbZz6UrRhurAlXm1Bh9
         M+jceZz8GGZbbBK5HfD+vThrSCeg8lXoGBCJAd7TugTQvHyp++l0kJbbXEGszovsmY82
         Fb0A==
X-Gm-Message-State: APuU4Z9CxuCpsEgJTqSY2edKA9lf8p60N1p0fEqoiaNE1VNW49nxE9+g
	6vmBNUD0dL9MsNF39GvhS+S7JWtFndiJzpMJDO4/QTdATu5T1Dy1HbJRjiR7v9kNul/gtnD2uA1
	urUrB
X-Gm-Gg: AZFdTZcf/HlZHcK8cWO+jAdIZDq/F17c5aK7JAMZicHDBQ60hCzLzUUFRxh5DNUWNw8
	eIY1qrtkel7rC00I+OF8QlxMRFSiOog5ijnBprmk2wcjgWZqaDrSAVRtk7eD0suvQuQAQysQwK1
	RyjVJb1KjabFhwriC4V8STZXajCR1vr3DqEmzDcvo47RLuLKUQ1yQJr0dnKUAxTQMgY2A4OoC+l
	NOzaZ5P0Rfx5QqzhVLDR/gkUkV46ipuBMK6iZJNNuZTs0+MKHg8hCGfrxUwKpL0AJgPi22B3ydN
	qzOBBnhJSrap7ewligvDVhK8YD/POQzuSW58/n6aiCbZ8oRZk6oSb9um53mGQe+ojad66II97Ln
	ZegrWmeIrY8wJ9K2ev8BV8vM4JoC11ZQP4efw9mrW8DKFxGfI2IWysFpgn5kVfPbyO1CxYdYEnJ
	UN1F0HSVYn+NLu8A2BKLTWri1/SHH8O7z/5/7G+paVwFBCgqA9UD0DDkYneVotNGvqMnZvqdm+r
	tV+gNeKEIXGNwFvlhx+pC1Wp6SgdYdk3vyBYRHkkB7SEssxjab48YcpdUFvWophLCWadjs4VVxJ
	3v+OQ1+bC5Tlq/IBjLTDwOPJ+fBbigeei8c3j31o4SPVcI7/+eU1PNhz6HpWSVIoPUyi2Ok5B2h
	06SBfOPuHt6+kJfN1sjoHrI9wo0uihk19ehDFbgF0KEkrZEmf/vC6eg==
X-Received: by 2002:a5d:64e5:0:b0:4a4:f208:6a37 with SMTP id ffacd0b85a97d-4abb4e642fdmr28983013f8f.42.1795534514191;
        Tue, 24 Nov 2026 07:35:14 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm29472884f8f.16.2026.11.24.07.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:35:13 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-filelock: Upgrade 4.3.0 -> 4.3.1
Date: Tue, 24 Nov 2026 17:35:09 +0200
Message-ID: <20261124153510.1696027-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124153510.1696027-1-leon.anavi@konsulko.com>
References: <20261124153510.1696027-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 15:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132948
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.3.1:

- test(strict): isolate Windows claim withdrawal
- test: check async release ordering on slow runners
- test: account for NetBSD lock capabilities

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-filelock_4.3.0.bb => python3-filelock_4.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_4.3.0.bb => python3-filelock_4.3.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_4.3.0.bb b/meta-python/recipes-devtools/python/python3-filelock_4.3.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-filelock_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-filelock_4.3.1.bb
index b251f6af73..f0ee1943d2 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_4.3.1.bb
@@ -9,7 +9,7 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "143407310acf479e82d88068e3b9a6486f45fb410c0ed8729fe7359eaabeb6f1"
+SRC_URI[sha256sum] = "4c5ee627c401f1863ac6a0de9a14a28d3bb5f8c730b45e2fd6e5dbc79cf34b9e"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3


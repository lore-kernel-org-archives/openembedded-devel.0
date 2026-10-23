Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4986.1792755270304399753
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 04:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r4Dis1Cr;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so449826a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 04:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792755269; x=1793360069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bN+kgGdULQcvm/RqNUfhoIpLm3mEmD2+a2LcIs2SQP8=;
        b=r4Dis1Cr1i4rDRdfPlbJd6XjrlMaQKQeULBmykeFb9eZg7qXSKKXQLCetTtcBMAPEN
         CKSoR4uDqApXJh7YgQAreH6Kq7NPiVJklSRJbG4q9Fvc3GY1Prgk7omATtShH11r5ADN
         pdmtzZXh485OxYYQI+O2yL8jKqoFJXLxKx8HT0eH1m/x6eCqwO3E5NLnSUWK2d8lR95l
         HLrgyfNbPk7o2tPp4UZhru/sj3TaQzzTNCnjigQ8XrogdoRt53owPEZsGul9uZlsDU2U
         uAI5B2ZWhQV/ir9W7vkAtJM6tLAfuVYM8EN9FvtmnalmJLkBkwV6mif5fz2Y9RaWMQfr
         AFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792755269; x=1793360069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bN+kgGdULQcvm/RqNUfhoIpLm3mEmD2+a2LcIs2SQP8=;
        b=Z+K5VAJmEYPWPRsgvKkB/6DMwnDGawTggN+ySO7UVFAdKYWYqkKYPfVeu4WKaH52Nc
         RHgDUM9Ax3mGcOvyhTQhDjxaPPaFy+2qCIBqAJ6NoaE4CkM0a5rH+tFSrnQ0IsT3TAr3
         OizBMNmSlJM5h1qBMjc68FptS2phX9ILkBLjqs74uqm1c6LmIBwlcDleTrzTw5iSweJH
         E0xn2P/66rR6qUFKV7u3xHoAX/RGeuP4CkBskaIUg2d3Yywj9U2BNPpexgs9HXiC0PV6
         77MDiV/5TbpBxdt9nm7IctSId+1A5R1cLjZcYGf0yc6POeh1JRgpl8PR8i2sUX2V1NWD
         9cOg==
X-Gm-Message-State: AFq9FYIB/rw6T9zTQG1rzqIUyrYdfRaMpN4r92o+mA7CoH63ITXKti2c
	EewhD4X9Gg3uoAMMJ7HQDqq4cU9bUl68MxjPwIMJSm9sK1+dZutOb2qn/g8hBw==
X-Gm-Gg: AYBFou3d9JGCUvU84APLhuWWsUVYbIDRCXCID49Jo9MkFdUYTsna/KX7osKVeSWszlY
	28Ct7GuVaFDQjWmJoIYl1ZCpTl928fKciT21XoAgwV7lixgN5XpqVfClGxg0UCcq6cH6ADpHl8g
	lQg1tjpEKux2RvOeGrVAwMw26RR9jfX39QBtghaFB434ky96a+warYhdVU7QIVfihNpP5iVhTJt
	7NeTniodIzLdGe/XSif+VpVGM9r20xNegxA+PDxM/DQTqLAQmdfIozWpfLnS+CXpkaqJDnOIz8S
	IazuGJd3rhaiBHF/Qj6sAGcpUGAAHFCv3WIfi6f71ZwkWOxD+RkRfwIC1Cpc+Gp6/7a5Klzi1PO
	g1TMzQmXAtvBGqetpclWqfZYWSs5IyLFPlwaIaA/4arziAR8g1A93KcIkHrpWbDhCeXDpYxYXjW
	8baK+jH34HAfP3MjX2V++uCJ3ZkVncgiUET2KzwvSPzCgIyWTRPF53nmZbrM8/jLE7/RCrbozfg
	SpPSZPYlAgm+jPmFxBQKzE85b6IRb1Hs8PzS7uzPuK9/coRHLonr1kPSgzfBmPHObZu+6mWqsk3
	WvwZ+cbmXLonFbTqooA3ZP7dnGqcWSc=
X-Received: by 2002:a17:90b:440e:b0:3ac:9e76:aa98 with SMTP id 98e67ed59e1d1-3adce136a61mr1612668a91.64.1792755269546;
        Fri, 23 Oct 2026 04:34:29 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1f93fbsm3513520a91.16.2026.10.23.04.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:34:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 2/2] unbound: upgrade 1.26.1 -> 1.26.2
Date: Sat, 24 Oct 2026 00:34:09 +1300
Message-ID: <20261023113409.1218533-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023113409.1218533-1-ankur.tyagi85@gmail.com>
References: <20261023113409.1218533-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 11:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131365
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://github.com/NLnetLabs/unbound/releases/tag/release-1.26.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit fa5ff1a6995788e231fff5e59901d226ab5ff0e8)
---
 .../unbound/{unbound_1.26.1.bb => unbound_1.26.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.26.1.bb => unbound_1.26.2.bb} (98%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.26.1.bb b/meta-networking/recipes-support/unbound/unbound_1.26.2.bb
similarity index 98%
rename from meta-networking/recipes-support/unbound/unbound_1.26.1.bb
rename to meta-networking/recipes-support/unbound/unbound_1.26.2.bb
index f426ce351e..8894a59d07 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.26.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.26.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://run-ptest \
            "
 
-SRCREV = "13b6717f1716810523ffb60f971a6c9c5e8ce127"
+SRCREV = "f0cd7067d950921427c91ade4ecf060e944f88eb"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 

Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C79CA5FB8
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:53 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1469.1790722670692499358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s3Kg7CJq;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3115c4451c8so1125256eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722670; x=1791327470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhK16U5EusfOvd5qFw6sh2DrQPK1hOuEr6Z32clDANU=;
        b=s3Kg7CJqHasorY05G1ZFtAhQLwVaBw2HT/K+nfFEWe74NLeDAA7IeqUaFiH5WOEsvb
         ILX2sdIyjnGjSRMrOw+hofweMNOLQ3erwSjvdYxIHVhXx4qiAlUvJy+dvfc5gIuClMhb
         JJu2H40dbl6O9+Hwb72FhsFXi+bmKltGSOF7MRi9gF+dtZk47JwuRj4jRioGPdSoOice
         yNTdzpnNZK6J1nWKfBjzMRUpJ4aPjW+Ms2BfFLhXcAleZvfYqJM5qhgnks6jHELGx6dT
         LU0UlItqoWhf4IgeGAnkqfGbEGSLG292eN6IvvF6jkjDglgsbbr40AQuNohSv49UYS2k
         BI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722670; x=1791327470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhK16U5EusfOvd5qFw6sh2DrQPK1hOuEr6Z32clDANU=;
        b=SsJy41CiDug0bD3lv37yPZGtsK2BxuZosKcafkbWmLLdR0m/IyB6vkZ6f0UOsFQgN8
         Uglvrs66FEXUGaHCpsX2G6cPtDtractlaBEHpLhkyjXHo6oyZz7TBaO9X0qaddpsule7
         bpqDC4lAOjhXMUaYmjhIgnNrqgOVsZmHDfaLzLwTAJh6TkXWyizw+AAnkGqSeLHeL6+B
         p/njxu1KuEjPDkil3sNb8cZWFC5YHcFgACJ/rWnEnBPz5FirYHU3QSpw23mOVNH5cDZX
         n8O0sikVHrAxX9DX83dC5eP59Ua8mapiHD0JaRik4kLPzRLskzkN2ywwwciV2CpQ/Teu
         k3RA==
X-Gm-Message-State: AFq9FYL7AADb5xHnIDOa4HX+y6GjTgk2IM/Dk1GaLnSn6j8TxsbdmsFP
	iDu7bbotaE1AMtcK1IMGE7685Qyeg+tE9IB/CdYSHs1gn33u51EKYLGuPCJ55B+JOII=
X-Gm-Gg: AYBFou0QdNQ/tdNqbMpEgjl5gg+GQywzeKcc+tRkzyR1/+2v7D1sVSAfhO6Of6Cw/6s
	inxwYd7pFjO+0kJ3x2dU3/qmRQULXjcK0U3k5BNOoC3CK9TmvZVSv65Szem25ulX1VMQamTvRDO
	8utEWjFtcU5ekTr5gH5Pr7XupU3Wm24NL5MAraUQOclCJNfJg85CRyNPW6JRN9MY+A3zT0QL5sl
	qoD3OW54/Kr+J4nL5WaZbHpf7GY3uxjM6NrvEW1pbY+sFHm4r/1YSbFkdTY6T8NIk44g8gbyMUd
	r+iNTQXMFC345qbirHF9nENep2qt8rg3wJRpaQisG13W1r+PAVzhp5QVIGBoHivceYZAM0u+MNx
	IQpvA1OAiv8uIoKh1wH+C0UEx/Ou39rbYqMCw/CnKa7xvXfrvp4iWFpOBGfqh8WrcMgVR7kzaak
	O2z/VVrmpDjjDY4AGFsUCF0aPZudL3paqS4oUudN5W3mQOLfuwmbjaHc1NuRDc3tj4gMMjuRwYI
	u6hHH4vgVZRyq5ajc3oHW96/7G/vuGBZpMk2AH5eH39d6XZpbXJytWQyqr73vgzVB6b+C2IqyUM
	vmXXt1xODlYsoKAH8Xe8WIPhshTwYPX2QMIlga14uT4387jf3ERJp4B8uhRW3RMoHA7+VZZrFeG
	IPt3N9t4NrDjmoFxuKCIoRafAfBIwPVZGApxAAJjz0MkS6MExqEAxAB8V2kX33XrxDRqPCbzy/O
	PSRJxQ8WNVP6CyySvCKAVOK9Z059477FUe5cfKUn4=
X-Received: by 2002:a05:7300:cd08:b0:34c:9b33:f384 with SMTP id 5a478bee46e88-34c9b33f40fmr293948eec.11.1790722669874;
        Tue, 29 Sep 2026 15:57:49 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 15/26] tcpreplay: fix struct ethhdr redefinition on musl
Date: Tue, 29 Sep 2026 15:57:12 -0700
Message-ID: <20260929225723.1046705-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130502

Same struct ethhdr / __UAPI_DEF_ETHHDR ordering issue as xdp-tools:
common.h/txring.c pull in musl's <netinet/if_ether.h> after the raw
<linux/if_ether.h> uapi header has already defined struct ethhdr.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ix-struct-ethhdr-redefinition-on-mus.patch | 43 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.6.1.bb              |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0002-common-txring-fix-struct-ethhdr-redefinition-on-mus.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-common-txring-fix-struct-ethhdr-redefinition-on-mus.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-common-txring-fix-struct-ethhdr-redefinition-on-mus.patch
new file mode 100644
index 0000000000..827b083712
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-common-txring-fix-struct-ethhdr-redefinition-on-mus.patch
@@ -0,0 +1,43 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:14:39 +0000
+Subject: [PATCH] common/txring: fix struct ethhdr redefinition on musl
+
+This #if was gated on "__GLIBC__ >= 2 && __GLIBC_MINOR__ >= 1", which is
+false (and always has been) for any non-glibc libc, so musl always took
+the #else branch and included the raw kernel <linux/if_ether.h> uapi
+header. sendpacket.h already brings in musl's own <netinet/if_ether.h>
+earlier in the translation unit; musl's header defines struct ethhdr
+itself and only then defines __UAPI_DEF_ETHHDR as 0, so the *following*
+<linux/if_ether.h> checks that guard and skips its own definition. With
+the #else branch taken, <linux/if_ether.h> is included via this file
+without musl's guard ever being set, so struct ethhdr is defined twice
+and the build fails with a hard redefinition error.
+
+Widen the condition so any libc other than a pre-2.1 glibc uses the
+portable <net/ethernet.h> path (which both glibc and musl have always
+provided) instead of falling through to the raw uapi header.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/src/common/txring.h
++++ b/src/common/txring.h
+@@ -38,7 +38,17 @@
+
+ #ifdef HAVE_TX_RING
+
+-#if __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 1
++/* This block used to be conditioned on plain "__GLIBC__ >= 2 &&
++ * __GLIBC_MINOR__ >= 1" i.e. it always took the #else branch on non-glibc
++ * libcs such as musl. That branch's <linux/if_ether.h> then races with
++ * sendpacket.h's earlier <netinet/if_ether.h>: whichever of the two struct
++ * ethhdr definitions is seen first "wins" and the second is a hard error
++ * (musl's <netinet/if_ether.h> defines struct ethhdr unconditionally and
++ * only afterwards sets __UAPI_DEF_ETHHDR=0, so <linux/if_ether.h> must be
++ * included after it, not before). <net/ethernet.h> is the safe, universal
++ * choice here (glibc has always had it too) and avoids the raw uapi header
++ * entirely. */
++#if !defined(__GLIBC__) || (__GLIBC__ >= 2 && __GLIBC_MINOR__ >= 1)
+ #include <net/ethernet.h> /* the L2 protocols */
+ #include <linux/if_packet.h>
+ #else
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.1.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.1.bb
index 8259c4ef1f..5234da282a 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.1.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.1.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"

 SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
+    file://0002-common-txring-fix-struct-ethhdr-redefinition-on-mus.patch \
 "

 SRC_URI[sha256sum] = "cc3642816073fb1d96b3af36df4fb66c11f523da427f95b7b0c4c99deaa53afb"


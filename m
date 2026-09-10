Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D76FC88E46
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:09:57 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27828.1789081793563475251
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ijTduu+a;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso2017015ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081793; x=1789686593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xE6JmkrrMF7AeZfCgYkHbZnvODA63fw2yWFLRjKZ0I0=;
        b=ijTduu+aDlSLEbJBH5NAmVhBGtiYh8nnVnv8eUtrkaEfb/WD/kmZUYEX8AZeLCgxOa
         mUZChfummAtIGIVK0aNDFGijeI8onH23F9Q6DuVivywhPGa/uH3RDAAyz2ciyAmFwuPE
         OAXpb6W8fG5fX7JmUmydoC76T9qGOcZ6Jqf1CPtyiJ5Gsy3KIs3P+dESN0fxTMPk346U
         8KZEsuqyUDGAFnfAQMAw9v0fSr1XFfE/AVQ/ZUR5aqmeG9/j0igWELyqRhn1ylyNQ017
         lSWe3fJ5HCUabJ+esIJsi49SmtNBsuLjUtIBuqWIAWPDZdaZ/DhA066u84ME47JwfVLb
         W6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081793; x=1789686593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xE6JmkrrMF7AeZfCgYkHbZnvODA63fw2yWFLRjKZ0I0=;
        b=rLOMTrW9MaZcl3OLdikUqPGRLszIrkxii8nk/bNnmCe+QsnV23gH+Vu44QRzXcOBxk
         T0hKRyPQpHXpRE8r0X5GMjSaMxSt9WXZsNRjny5t2j/CPheEdGNfZG0aRhCR81gZNCv3
         UVD5jIKLiNzhA9IynB1q7rmlHc3wFN2JKpyk40vFSQro0ckovI1By/FBxLsyagawUp6E
         SuOf2Bez2zZ9j+8vnJw1cqRpoS+BK8R7zqUjuh7rbgS82H45l60D/+nQS1yIXnU0+xHT
         7s1gZ53VSEaqpXZlV8YG9Uy/AxJAsfieTyvP0h8YrkFKQRO9g2DyQkhOivIaFrBVmHBf
         qGlQ==
X-Gm-Message-State: AFuF++kKniH01pv1UOOz6wBEkDe0sjySFkmFCPk/MBoWiNj1YnW/Tsrb
	jGQElHN6U+YXKHnRzXW5jF1TPnsi0zaFGxBkBmdtul/Wa0v9RjfDmETde07VSg==
X-Gm-Gg: AYBFou2YpS2rp3JC2PRdd7DnOwLaCysW8EVAdWE57kLP030wBv7oNK+U3YUHT7jG010
	V83VDC0QPxXXXw5T3ktaE8mgNUQ9gZE7CpVydvWkaShVcByFon5I2N0mH8bFqpiQVe2SIB95wYH
	hwRlf5oC5cNjsjahFLmJCeiTpkqQY6hEV5sPpwcvzCQ5OLPw4wYzIigLdGJJuuZhHygpnBSvB6w
	EIg4YHBTus4/Nuyct6Qk2AGVWDwPegdeT9Ii8ux2muLQ+DQ6Bh9z1YSt/wIbOlWpFa2u1Ndb8no
	N12PObqiULmRMGOu1w1xtEPWfQ8j26uPl25jwNePYVZagsTeJoBHkcaCrRPn2w5R7m9E87ox8Oe
	lWhGULMjCao3CEaH2VBQHaAeugBvyi2PhK/D7nIcdOPRVFInk8Lir84O01PXZrNXOrlMIvCV8vc
	2nld2yr2W+k1k9k481bmOO5/ymEKO4c8uwq/X7oNScjgQy3b8+MbAOablyUeKlTRtH9UZidRL9q
	P8JCYZwSimAG1GTgMyDeFE=
X-Received: by 2002:a17:90b:3dc6:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39d9c3aeedfmr1797985a91.21.1789081792704;
        Thu, 10 Sep 2026 16:09:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:09:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 4/32] unbound: patch CVE-2026-42959
Date: Fri, 11 Sep 2026 11:09:03 +1200
Message-ID: <20260910230932.173913-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129922

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-42959

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-42959.patch      | 36 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42959.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-42959.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42959.patch
new file mode 100644
index 0000000000..b8df4f66c4
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42959.patch
@@ -0,0 +1,36 @@
+From 42e04de6baba41208c80f8003f2dca58ebf66468 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 20 May 2026 10:14:32 +0200
+Subject: [PATCH] - Fix CVE-2026-42959, Crash during DNSSEC validation of
+ malicious   content. Thanks to Qifan Zhang, Palo Alto Networks, for the
+ report.
+
+(cherry picked from commit 94d5babaee22a016e376bdcfee2b9bb40360367c)
+
+CVE: CVE-2026-42959
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/94d5babaee22a016e376bdcfee2b9bb40360367c]
+
+Dropped changes to the Changelog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ validator/val_utils.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/validator/val_utils.c b/validator/val_utils.c
+index 549264d76..4495695ac 100644
+--- a/validator/val_utils.c
++++ b/validator/val_utils.c
+@@ -1066,10 +1066,10 @@ val_fill_reply(struct reply_info* chase, struct reply_info* orig,
+ 			if(query_dname_compare(name, 
+ 				orig->rrsets[i]->rk.dname) == 0)
+ 			    chase->rrsets[chase->an_numrrsets
+-				+orig->ns_numrrsets+chase->ar_numrrsets++] 
++				+chase->ns_numrrsets+chase->ar_numrrsets++]
+ 				= orig->rrsets[i];
+ 		} else if(rrset_has_signer(orig->rrsets[i], name, len)) {
+-			chase->rrsets[chase->an_numrrsets+orig->ns_numrrsets+
++			chase->rrsets[chase->an_numrrsets+chase->ns_numrrsets+
+ 				chase->ar_numrrsets++] = orig->rrsets[i];
+ 		}
+ 	}
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index b8853c9d63..3adc98621e 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-33278.patch \
            file://CVE-2026-42944-1.patch \
            file://CVE-2026-42944-2.patch \
+           file://CVE-2026-42959.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"


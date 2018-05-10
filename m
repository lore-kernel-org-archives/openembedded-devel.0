Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5E58C75097
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 03:17:36 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id z4-v6so1409977iof.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 20:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LznTdYSr5w5ezS3hjJF2TnQgKHrXPUXptAfJXS1NoLs=;
	b=TIWG/mqyB++OK/p8r1+FoMXrdHKX4orPpd+VsT9p1uz7OpWOZR42Ov9o3fyi4FGnpu
	McZwOfcFV535pKthKHtPtUAQZIhKMmJw0TfLpmsZJVV7wzdpe3A2dXVRF9m8UeI3HXzK
	drq9uoQ/NC719Cj/Uudgk6cdPF+AayC8PMyMbZAJWThSpgw7jZiVZtRsZ5l+1I5dxN1x
	erht4tRtx/7qkfXwC3jSoFke+B5xyMkqw8XIO6jDvje9Ky2gE1rq2fkJY4UWjv4vGBN6
	KkyspNkgltPfpzrI1XDqJrVfdbiEBuWzCdsdQPNh1ily6Jt6+Xf55CLSB6I0wHnnT1u/
	3eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LznTdYSr5w5ezS3hjJF2TnQgKHrXPUXptAfJXS1NoLs=;
	b=p/rNm5K/4FNzQILw688BR2o6jtN4TjcId5zbc50H0Z8ksXDEnjk00q24rEc+uvxve9
	9rvzd+MN5PEfhZ+a73dZWjsm6n1T+Xzlsc9ejKfytcg6xjadTG+R/58IrGvRPHHpB39c
	9JtqRyUX2NmdyXkJcIWhAarNchTxEOrgg16qU/15tjNPo8cvX17Yz07Od6Mwp4NKZ7Ik
	OHKFaTRTia8If7XOgTnMxLoW9UFoPZxvP+BtNr30e5bQS57wcJmIsQ6NK400sGaPE43i
	ghVTdKTV0Bhp8tGnKKgUaQkapc2AD1aYyH/N/toh0QWfb+EQ/ag77Kztya13OeQil8Ek
	v01A==
X-Gm-Message-State: ALQs6tA2Y7GgY7ZCqiXywQvtlmqEPy/w+N8RBpDa/rookxAKiqkCZb92
	BfVgGClxwHx9eqUcZ3+vt3yzuy4X
X-Google-Smtp-Source: AB8JxZoqigUNEvfryss+GsCSsJtL1BJ4tJB60fJbhf8yJR/q1od38mMELZW+GIfWDDK10MP1c/Aieg==
X-Received: by 2002:a6b:ab01:: with SMTP id
	u1-v6mr39479096ioe.214.1525922257138; 
	Wed, 09 May 2018 20:17:37 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	v20-v6sm13468071iog.59.2018.05.09.20.17.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 20:17:36 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 23:17:27 -0400
Message-Id: <20180510031727.21476-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
In-Reply-To: <20180510031727.21476-1-twoerner@gmail.com>
References: <20180510031727.21476-1-twoerner@gmail.com>
Subject: [meta-networking][PATCH 2/2] wolfssl: update 3.12.0 -> 3.14.4
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
X-List-Received-Date: Thu, 10 May 2018 03:17:36 -0000

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../wolfssl/{wolfssl_3.12.0.bb => wolfssl_3.14.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.12.0.bb => wolfssl_3.14.4.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.12.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.14.4.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.12.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.14.4.bb
index 9290651d05..dc9094d8bf 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.12.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.14.4.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES_${PN} = "cyassl"
 
 S = "${WORKDIR}/git"
-SRCREV = "d195009dcb62d8712195661bd1d50f8dd6831044"
+SRCREV = "1196a3b64d9fabffc8273b87f6f69ac0e75d2eb7"
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https; \
            file://0001-fix-no-rule-to-make-cyassl-options.h.patch \
           "
-- 
2.17.0.rc2.3.gc2a499e6c



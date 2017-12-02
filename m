Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 46C0777811
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:12:10 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id k15so5358910pgr.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5OpqhCdkrvmQcPnici+b66W0D9vJeCQspVpqSD/wa9U=;
	b=bpcurY4jc0KLui3sz+BhsUPPPsKPUCoT7J3kj3IPgvVbxWK7dHLrSBDCGrRdFJA+1P
	EE4S8S2NIx+BqagbSt3WGPymjX2GogjLB624T+p1hfOZZz2Jg9tuVwPjcNXYoVJM+E3D
	7aXpSebjhvfS1A9XO70UzYUsadhG0q///ZeI7UtO51Y78feCTgnk4c1QHxgdL+9W0/xu
	YV+q8QW0p1aBIflFvNpNMJqb3GH1KOZShCcEWSQ8cjX1RzqeVHIsxp+DGthcrw8EkObm
	5x0r3VVPBYLQAvApBAVDV7GUP3/aAui/NwP4qVfp2Vg3qP32H1QCegjZL9rtK1mmFifW
	Oc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5OpqhCdkrvmQcPnici+b66W0D9vJeCQspVpqSD/wa9U=;
	b=GXedPnFPymid3MDC5TDzsXDrx/ZN0MPv1DZln1q9ZH8oFK3LWM6SfQygunxojfxlAI
	pAXWbQLlg/szLJJ+lq/RpggZmwm/kzxlSO6inu1gw7v5vlkop+c3R2WJuvTMs41ec7gQ
	Lm/12yXcFRX6VV4lBWhakwO8mpWAQmTwpqJMXyW1/YqPkj4KcMHgzVUCQwE/vT7XjNOH
	uvdNRYC3sDxOTjrr8mLT+jvubL/ygK/jyJEPeMIXIlK6h8WUAB4LhuFH9DTMZN9WQWzr
	5iMXdS1Yaq5e+pPD5uYiK2vpKvZ8FSryTMyarc5WqwCwTBRYHGoPj+QitSiKxRW0a1Nw
	g54A==
X-Gm-Message-State: AJaThX7s2tHJr++Llqeu74IUBpsiXVB4VbiMfLwbgiJSXPcQ99FqT5FZ
	30bU7dXu99G1Rn2XpqywSZnjdQ==
X-Google-Smtp-Source: AGs4zMYFGt6goGf7REaVGrLZbfJ62NWCyXzu+N7/U8TT8VJmtp3NR0VDxltpo/EqPI9hcg+eOwfzpw==
X-Received: by 10.98.120.13 with SMTP id t13mr12786904pfc.4.1512191532182;
	Fri, 01 Dec 2017 21:12:12 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm15070855pfe.99.2017.12.01.21.12.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:12:11 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:11:54 -0800
Message-Id: <1512191514-1791-2-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191514-1791-1-git-send-email-bill.randle@gmail.com>
References: <1512191514-1791-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 2/2] python3-blinker: new recipe
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
X-List-Received-Date: Sat, 02 Dec 2017 05:12:11 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python3-blinker_1.4.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-blinker_1.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
new file mode 100644
index 0000000..924b3cf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-blinker.inc
-- 
2.7.4



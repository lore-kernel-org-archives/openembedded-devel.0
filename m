Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id F0EEA745F5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:29:28 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id b10-v6so3934906eds.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 06:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9GcIt22YsXy+STxRfCkaOuS8HVBDdcHS6aeBvnGbmoM=;
	b=P98o7QRy5bDrZVByBCZEoTS1taNbg/WVAKHGF5DB4xby2ZL5uusxAud5caThI57dKI
	bZobszVbZy0alhojUm31cfH/LiwqOTjEurxpR0I4Xrceoeh+Y6OOiE5piGG3NC71TP68
	stH2++vdcqkd2OU/qVrwZQ1XJJLxEQAtcXd6LdychGFm3BgFxLfLogROQmSas7BajXNI
	fHFidqHVAVWoAfZR5GlnESZ0Jbc9uiG10TfvYdMNmC+9izPRnNpOH0JLs9DGVCfbgvof
	ZR4oDHF3fcPQ6RK2yUX7JKwcIx2HIhcGX9orNHY7+lnYzA+jo3tb6O/wfRQiRWVh1y2G
	Xygg==
X-Gm-Message-State: AOUpUlH52/6YBjFjRqrqdoFljA/P/0dQrcsLy40Gixct9hhkVt1/NNPv
	b/rWWl0B6BSml+M+NT2CQzTosfCQ
X-Google-Smtp-Source: AAOMgpdgcHPytPsOF2BlIx0U2/OM14Nmas9bP/7P4MgIwl1kRXO5VNbqk1d3hURRmSJqFDcIzNrv/w==
X-Received: by 2002:a50:f297:: with SMTP id
	f23-v6mr7676645edm.40.1532698169586; 
	Fri, 27 Jul 2018 06:29:29 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	s41-v6sm5045259edd.61.2018.07.27.06.29.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 06:29:28 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:29:21 +0100
Message-Id: <20180727132923.15149-5-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727132923.15149-1-git@andred.net>
References: <20180727132923.15149-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][RFC][PATCH 5/7] layer.conf: set defaults for Java JRE (R)PROVIDERS
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
X-List-Received-Date: Fri, 27 Jul 2018 13:29:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

OpenJRE-8 seems like a good choice.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 conf/layer.conf | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 8b2978a..e965170 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -17,3 +17,12 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += "\
 
 MULTI_PROVIDER_WHITELIST_append = " ${@' '.join('virtual/java'+str(x)+'-sdk-native virtual/java'+str(x)+'-runtime-native' for x in range(5,9))}"
 MULTI_PROVIDER_WHITELIST_append = " ${@' '.join('virtual/java'+str(x)+'-runtime' for x in range(5,9))}"
+
+PREFERRED_PROVIDER_virtual/java5-runtime ?= "openjre-8"
+PREFERRED_PROVIDER_virtual/java6-runtime ?= "openjre-8"
+PREFERRED_PROVIDER_virtual/java7-runtime ?= "openjre-8"
+PREFERRED_PROVIDER_virtual/java8-runtime ?= "openjre-8"
+PREFERRED_RPROVIDER_virtual-java5-runtime ?= "openjre-8"
+PREFERRED_RPROVIDER_virtual-java6-runtime ?= "openjre-8"
+PREFERRED_RPROVIDER_virtual-java7-runtime ?= "openjre-8"
+PREFERRED_RPROVIDER_virtual-java8-runtime ?= "openjre-8"
-- 
2.18.0



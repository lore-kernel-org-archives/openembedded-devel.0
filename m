Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2472274EE5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 12:03:29 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id p12-v6so11145990wrn.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 05:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xxM1kgK7IeYJJKnEo2lMI9Ju5WAiiDbqh2gaYlNXOXg=;
	b=MQHyqduWIj8UwegZSSBDBrxFkLCvJMqriujDG9Yiq7ogNlv79mIWQj/eZRV/4LFycY
	Z/qwV+zsnDdZS7/OMp91HMgPLtCA/A3MJt550s0NQytJ2+54KN94pqgXJrCs0TFaMm3B
	SrWK/ZSntgXq8nM+qnbaKlODe063+nWPaHnWEedXIgRD3fWBJaAWEywskVR8RKyVUbHF
	YcQpIw8C21H3RNxrnN/0Vm5DRv2UG0Vz4PAqNTi5T73UsmzeBLtWcxQDO2pirSvnjfOI
	s5XvBbO5WwHa/9Vtar12rZh0/kdUe926kUgL6Axq8luIn2WRBR7occ9LDuzWwl3m8wOq
	R4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xxM1kgK7IeYJJKnEo2lMI9Ju5WAiiDbqh2gaYlNXOXg=;
	b=R6sbZT+0OW6iddcRHc/Gl08Zkb23RkIAsn9BxLvvWU/eag+UvLqwc+F+xQ+pRFlYgb
	uqDfR4i0qZ4FjjhnVIGkCqEicr8XLn1PVIDes8dtnbPO2uZM5ApkEBMlbLZ+vQxcazoP
	dsoVt5I6+7GodL7azLnJ/9w3HjX0kM02RuhAfzoRumUpD2hNg369gtvF2TWjNeutBopr
	hPTgu6q9Jjsgm81bgamjfj/szEYpXaA+Dw1GfT+o1lL0bWvr0QWrfe1RRgQRGInbJE8N
	N+GRQyvPAfMaGG4ExM5nvvZ3lLgM3XRHRHelkCIz5fjbyLKItrP9YIw95vpLp1tQv1t6
	PMKg==
X-Gm-Message-State: APt69E0guC8uIaSqlsXGsbxyjRV6tabcLEcUiwh4PbQs+67GkEq+cCU2
	CqEtqbzY53Wx+hcTu+9i9b7Xbw==
X-Google-Smtp-Source: AAOMgpcCLptCLP6pbdSIzpjlwOQ1ERL4DSM/hHyJYBRdVuGsXmSWXLUZ60FaPZG/0IAH/tMXLylRag==
X-Received: by 2002:adf:cd81:: with SMTP id
	q1-v6mr14259499wrj.275.1530360209716; 
	Sat, 30 Jun 2018 05:03:29 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BD2A250E47512CF7CAE17AC.dip0.t-ipconnect.de.
	[2003:f0:7bd2:a250:e475:12cf:7cae:17ac])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm2096602wrn.31.2018.06.30.05.03.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 05:03:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jun 2018 14:03:07 +0200
Message-Id: <20180630120315.29414-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180630120315.29414-1-schnitzeltony@gmail.com>
References: <20180630120315.29414-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/11] libxfce4util: upgrade 4.13.1 -> 4.13.1
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
X-List-Received-Date: Sat, 30 Jun 2018 12:03:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libxfce4util/{libxfce4util_4.13.1.bb => libxfce4util_4.13.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.13.1.bb => libxfce4util_4.13.2.bb} (64%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.1.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.2.bb
similarity index 64%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.1.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.2.bb
index d18e83823..21cc1dbfc 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.2.bb
@@ -6,5 +6,5 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 inherit xfce gtk-doc gobject-introspection
 
-SRC_URI[md5sum] = "d1d81519accfd09b5bbdc6ec0f531366"
-SRC_URI[sha256sum] = "278013dca14bfd50c9efd3898a28e3f3c5053b506de257267947fbb852d2ed2c"
+SRC_URI[md5sum] = "e3e8b9dd7e12028d3e642345b85d6ef1"
+SRC_URI[sha256sum] = "c58275ff650080369e742695862c811cb78402c85f243ea0b5aec186027be361"
-- 
2.14.4



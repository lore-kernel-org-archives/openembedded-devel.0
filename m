Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 81B3979702
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:30 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 2-v6so5573046pgo.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3Q2jCSl9nxbxIm2uOBSzuA9w6TPUFlBjWUvXwAJCekI=;
	b=bZbvJq1jDzEgBnJc7FGGFHcnFiHUBbTIGHdB+eKJOofQJ4m31xKvYC7t6mH9MthWeV
	T4fukkQYVeTiu/nKadPRjWJydXwkPJr1UOYKR9bVS8Nx6gK6oHa1VjuvVq/G1e6GTxZU
	OC+sJB15NwgHYqWW42EW3XZugUKPPZqLSX0bMg9/m69xsF/nJTPD7G+h68qiCynYfdye
	F+d7b3LaRIzceI44YbkR4VUtEy09ullP9cHIqjP3I6L1RgeI7byQXTWcCUUOpm2Oe4aH
	fuvvReDhvw8kNHXYDrtcIQJ3E5rsHk4Iu94YfRPJmg23oA+CQldBCS4Ce3XMaWMZXx5n
	omrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3Q2jCSl9nxbxIm2uOBSzuA9w6TPUFlBjWUvXwAJCekI=;
	b=Z2wqEbQUTLV991kFpfW8N0zXuTFIFR3OXYdrRXVoEDj89V95NSpzewlqXAUR1j3GsN
	XYgkze4VwzpXSAqJiRC/GOmuQLwx+Ycxnn/iKBJCUVFti+4XFCThcksYkGYHyJfoPhas
	Pdl3pNJB1NFZnboUm2kFRE5wuOWN62n+9AhjmAeO/YgOUZQfGxcnF9rIyRUZ4pJ5fjF5
	siV/NiKhK3KpRxfvc8cpxY+HD18HbA0UPQOQVZbjFc1nPwzCf/obE40IYe1yS+vKA1IB
	9UJvOHT3l6Et5xBK6hVLEB5K3Bp/WUiws+MyMb8o8jWI7/pJRlduH/j3Hxdm3H6XemN+
	FSkA==
X-Gm-Message-State: APzg51BgOtfDTUrAe8jL6OWN/cqGR0HfPhUcKa553pszyZXlZFWJJH4D
	ZVDO7RSTCRscSCO4hAlJMkWk7zEN
X-Google-Smtp-Source: ANB0VdaL7EzxfIZ6Jd4wluXfUjXRXFGkAwayi/Qlngt9hwNzUa3jZHGNSqS0FxXoGc5c12tGRmYcOw==
X-Received: by 2002:a62:1544:: with SMTP id
	65-v6mr3981564pfv.178.1536254551324; 
	Thu, 06 Sep 2018 10:22:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:22:03 -0700
Message-Id: <20180906172210.42551-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 10/17] mosquitto: Make enabling systemd also enable build dep on systemd
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:30 -0000

systemd support in mqtt needs system developement headers and libs installed in recipe sysroot

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/mosquitto/mosquitto_1.5.1.bb       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
index fa51f4e76e..ae493e7b12 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
@@ -20,11 +20,14 @@ SRC_URI[sha256sum] = "8557bc7ae34dfaf32a0fb56d2491b7a7f731269c88337227233013502d
 
 inherit systemd update-rc.d useradd
 
-PACKAGECONFIG ??= "ssl uuid"
+PACKAGECONFIG ??= "ssl uuid \
+                  ${@bb.utils.filter('DISTRO_FEATURES','systemd', d)} \
+                  "
 
 PACKAGECONFIG[dns-srv] = ",,c-ares"
 PACKAGECONFIG[ssl] = ",,openssl"
 PACKAGECONFIG[uuid] = ",,util-linux"
+PACKAGECONFIG[systemd] = "WITH_SYSTEMD=yes,WITH_SYSTEMD=no,systemd"
 
 EXTRA_OEMAKE = " \
     prefix=${prefix} \
@@ -33,7 +36,6 @@ EXTRA_OEMAKE = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'dns-srv', 'WITH_SRV=yes', 'WITH_SRV=no', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'ssl', 'WITH_TLS=yes WITH_TLS_PSK=yes', 'WITH_TLS=no WITH_TLS_PSK=no', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'uuid', 'WITH_UUID=yes', 'WITH_UUID=no', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'WITH_SYSTEMD=yes', 'WITH_SYSTEMD=no', d)} \
     STRIP=/bin/true \
     WITH_DOCS=no \
 "
-- 
2.18.0



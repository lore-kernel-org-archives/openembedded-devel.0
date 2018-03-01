Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 33ED8788D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:02:07 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i3so13771124wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XitJh5hrDYE+RniOy03VVAxMaod5mNUjhcXoH2+bYts=;
	b=RnwM47ePsSlmJCiXawdyStqRfC751Vw84pOo60R9MQZyQePfEHdOXdeDa//X7Tqc95
	t+DFu4aeOnMO2QueOPUBsyx2hKmzJDa1JpDQ5a264kqkF3OY/F3pX9msu01C2G/i/9TO
	0LgZyhYv9N7uySGkOW05nDfksC5xn3nQ6eyYWL84H1x5sXzakYZJxLFk/Rmiag2DECTm
	Fal6HV8kZEK0Wln5oSRX4KT8ujDol6VYag4SBvuu1/oGWvleaoeyk39t0itqrcj+Iqon
	rnkiMXwulYyKUKoPdzSn7OSsAXLmL4wty7vxdmP3vVAULh3ZhL1VoQ+Uh9uugCgkhOP4
	48aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XitJh5hrDYE+RniOy03VVAxMaod5mNUjhcXoH2+bYts=;
	b=drsuLYIso2oeTeZT/3aU4a0nFsf46rKk5V6vW3g8eC/CafgBWqjXyu2yEAlJQw2WVU
	sfKm6fhwtQrExnUFBgv86QK5eC0somFgpxgJT0+AQjF+42ZwGC7l0FRUZtP81ZErqElQ
	rrQ3VpcaumN6TRDBLxWw3u0cgbp4cC/AKXqtuus8zsUrRRhfRZzEjQU91KtL/zXIKver
	y75LGdr6Dk7ge4zgPUD5hR+oKC7UUxry5wZs2lwnKpZtqd+rpiLmyiy30tZr7eW9nA2B
	YzxKMwA6gHevtdDqr7xLFXZycscfGlbaJgrJlhn806et8MaVjozqnVh8d9W54fuaoVbd
	Hbzw==
X-Gm-Message-State: AElRT7F3V+XC/sivWP7qPbhhWVrS4RZFjDLzpMO0aWwJ8Jf+aGBDte8n
	p/NWdWuOF/f2R8Neh5bgOcpUBg==
X-Google-Smtp-Source: AG47ELuxfje6jnYnlcM1T43VexdODkm/489Dp10wAD/BR9K/r5iYXNLoCcSDo4GC4qjbataI/dJ+Rg==
X-Received: by 10.28.194.2 with SMTP id s2mr2951702wmf.55.1519945328025;
	Thu, 01 Mar 2018 15:02:08 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:42 +0100
Message-Id: <20180301230148.2284-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/12] thunar: update 1.6.13 -> 1.6.14
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
X-List-Received-Date: Thu, 01 Mar 2018 23:02:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.13.bb => thunar_1.6.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.13.bb => thunar_1.6.14.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.13.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.14.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.6.13.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.6.14.bb
index df7c46cec..585a46d82 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.13.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.14.bb
@@ -9,8 +9,8 @@ inherit xfce distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "3e51987757d718ee7f27d0a0447b07fa"
-SRC_URI[sha256sum] = "a2900acfa92f965aff86cd7728d88a3836b3d21fb85d3355a8c5119c9975f93f"
+SRC_URI[md5sum] = "22ba809c5b146738a3531c9abca78522"
+SRC_URI[sha256sum] = "d6112133a1c43494e3b1cb75e775e1d05988805a06fd1e11253e9a29b8ebe59a"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
2.14.3



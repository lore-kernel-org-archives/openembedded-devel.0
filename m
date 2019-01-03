Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id AFC3A6C104
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 01:12:53 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id c14so32232367wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2019 17:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nEq0MpjTPyODyp8tawwtF7BROJIbzhYhAKaTvba7Hs0=;
	b=cXLmT1hzLG2wZjie8qMsjaSCF+1w1M6nKljj3I5rpUx0bDGH2zbvO5DVshaMBdBfP8
	pglt7FB2Ma+cUhJhjRKNhts4Cmu/duJQOZbkGQnBtMsLYk6lwb0wnTJ0LDN9bW1riKEb
	e2K+lyjFhtdv06IV1NwJLDSZCH4FDJv4ysfdPqgC+xlf3sdCJB9ZnntyT3zLdz8jj20K
	gxsFtsshsn8wEnX7m2iM06j1HMdVQJ5ZWaQ3jdE2XErBkHK75jRbnVUwwaKRU4EIvrER
	ORa5Y3Icx8obyNUpBBdqBCTZncLvG1PguyqapJwc8sNMWJHFVhvpg5yiI2ud7IpOUvri
	0/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nEq0MpjTPyODyp8tawwtF7BROJIbzhYhAKaTvba7Hs0=;
	b=T8o+zxIqZ6OnzoI4tyu4GCggSHtDY9C80sY3kmIVH5YJCAVBYE0WdjEapXpQzqTLc5
	IJrhy5MErOmxgUxws1MNYlK9dyoajkNnhtWphLx5D61VoEB7t6nWRVSAyv8J6BAb8oPU
	g8Q++niI8l7YNm2xmRK57SX70PZ6KIDgEo1zDZTtoeESJGIjnaiyoleubrHEpHgUG38b
	ZoRa59IN//8wcgGX9WCl3EfDCZDGCERaTstvZyo/VmeoshCevc/z9IzzWk4pOVq0/EAt
	VEWFUUOADkFmtTHRrHxKMFrbwAUu+BZXv02o8BpcOVbZv9TtVQG/6qn4Ni9a6jdbHOMo
	ta/Q==
X-Gm-Message-State: AJcUukdramf0C/tia9KaAARER7fFOpM5GIoPK7h1GLFVTHXPmRA9dQIa
	QjO/N73v1DCQJ+FyWeP2AxLRVv3l
X-Google-Smtp-Source: ALg8bN6wAsEqXxYs2nFQh1v970TEdEi3KL0PMzWjMmjrwHw1uuBePub6vuecNW3/ZL+MCPo7c4+hEw==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr40585260wrc.191.1546477974014;
	Wed, 02 Jan 2019 17:12:54 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC022001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:2200:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	c12sm42400512wrs.82.2019.01.02.17.12.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 17:12:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2019 02:12:21 +0100
Message-Id: <20190103011222.7686-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190103011222.7686-1-schnitzeltony@gmail.com>
References: <20190103011222.7686-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] xfce4-mpc-plugin: upgrade 0.5.0 -> 0.5.1
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
X-List-Received-Date: Thu, 03 Jan 2019 01:12:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-mpc-plugin_0.5.0.bb => xfce4-mpc-plugin_0.5.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-multimedia/xfce4-mpc-plugin/{xfce4-mpc-plugin_0.5.0.bb => xfce4-mpc-plugin_0.5.1.bb} (76%)

diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.1.bb
similarity index 76%
rename from meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
rename to meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.1.bb
index 9f501f796..85235490c 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.1.bb
@@ -14,5 +14,5 @@ LICENSE_FLAGS = "commercial"
 # for now we recommend our own mpd-server
 RRECOMMENDS_${PN} = "mpd"
 
-SRC_URI[md5sum] = "13d5d95ef0c305bac45fde6231258e5d"
-SRC_URI[sha256sum] = "f1320916ae3112e6825699652a502cebfa78bb006c649b42d3d331dfe57b6cb0"
+SRC_URI[md5sum] = "305dfdacb2b2198e1f1673d61f86e4f5"
+SRC_URI[sha256sum] = "635e678c9729663e9eaadfcf58426f7cea37e6d3fda5e818955fbc8ade00de01"
-- 
2.20.1



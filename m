Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB1D78A70
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:37 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id y8-v6so1846267pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YNYNOWnKQXXtCgwtLV8cw5YWas+23xNf7lcb8bbSmDM=;
	b=rFXytIN/gPTraXQ7CyqRe7UnY6aLeLQMXuQyllgF6b6WPTLJZRPR4OskDJCnv8fmU8
	SUPb+Ci4zPKGP7YCZnGdYwM3ffus4h11Ftg73B1UBMRTFOXF74geE+5ezz1CdIsBQNoJ
	Po8wMiGKUu7qggp54oVuW5btHEr6FrLVnofUwtG/HRcv1ZFRtEGQcD5tdVNQ5WxSSOma
	QWY7ftyu9EdszC1eda6QfMoTBCJNbFxJ6mvW2LUfw4+1mQ5YFzy51grLQDwJTh0DpMBI
	E29qMcnJu8UHPjDcGSjiBYPmRIqZCSJlk6sHcgrhEbJXEzoC1UggyPxZBCxSytgpk7JM
	6KRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YNYNOWnKQXXtCgwtLV8cw5YWas+23xNf7lcb8bbSmDM=;
	b=ai6JZXtIo9tqm2smtsUkDJNZh8+OdOPzycwLesCQqgZKoXxXZEG4PD+uPRaihbif8O
	0k0sXlk+JSNcr1+UHszQeTqVysB3sLmHuNcJs/7sJWIjMtD3ebUcgFZSw7/86mu8rWMe
	B3tlYpo0W8JYm9gOGnJyqMZ2Z/369bZtUcigqVGOhpcc3reZP0n3JzB/jrgZsWV2a294
	6xmlvjUqHHseCEYuoNqzMJMv4v18BLb+8mRnt17OiC509iiE/ko+jnDcyLSK1WKFUvFv
	gWz8sfYcfb4Ze/zGghWCKT9Odk+nWa+SNnUl+6nlE2Ig22yXW6bhTAWMNR774vJWkc2C
	8CYA==
X-Gm-Message-State: APf1xPBwf1RzeWS7Sg8arFS/NtvrZCh2LsneJuqiAlvjJxYTBIpBvqbY
	HOimsj+3iuZ/DNbHtdWPRqM=
X-Google-Smtp-Source: AG47ELsajwkPibCCXQqOKfHAAbC1/84mM4keYEhfhu4vUk4tTY97dfUiaeut8WsNb2ia20dEYtuLVg==
X-Received: by 2002:a17:902:5401:: with SMTP id
	d1-v6mr21659861pli.176.1520449298898; 
	Wed, 07 Mar 2018 11:01:38 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:09 -0800
Message-Id: <1520449275-29492-17-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 17/23] libgtkstylus: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:37 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
index 3cd7910..a7c8a6f 100644
--- a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
+++ b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
@@ -5,7 +5,9 @@ LICENSE = "LGPL-2.0+"
 LIC_FILES_CHKSUM = "file://tap.c;beginline=1;endline=20;md5=71756eeb144e9eeb177c69aa672b1635"
 PR = "r4"
 
-inherit autotools pkgconfig
+inherit distro_features_check autotools pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://burtonini.com/temp/${BP}.tar.gz \
     file://gtkstylus.sh"
-- 
2.7.4



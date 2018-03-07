Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 83A8678A45
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:36 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id v9-v6so1847495plp.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iK+qPLZH9dGeCZ5tLaOYIvELmdR4npgNrP67q2hZFdE=;
	b=uEj4+S4yjNZBsbLqnGFj9vhMV76kd9EU+Wup/QGpOvh6P0R4d+QJkD8O+TfrZ/tUkT
	Zjw3f9o1p0nHkf63PPV9/O92/rXCFP0Oej/KaQNWmth/dEiSmA9/8qeawAttDlYGBxLP
	knJAjb3RKDeNUKYd4gaH3ORgW0dZ748di0/ybCrZnwS+K6bCGtpQsnmXCxmRo1Ivimkb
	78p48YdumC6s5LqLgbRaYOe/p9K7BUc2lbC4poDbXXfZNRTmBhyWdu18/rAzdI8biFyz
	rRWbePlTYHOrkIxFj1DJ5Dr0+OYXm1bJD72KzhcKYRNCIlJLYtIklX0W5aFQN0pYnIeO
	wtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iK+qPLZH9dGeCZ5tLaOYIvELmdR4npgNrP67q2hZFdE=;
	b=hiUGu3jkB+BhJC8U+KCigzzJyIIVeLnBj2MTQC7e290ozs9wXhBri+Ro7xbQLSHQyO
	D76TmqmF0CnkvOmbHo5MqcbiN2LW6t9hHD8nrHs93LAa76gHl6A7HtnatsVIj9RsaoFi
	x+8RCpjwm0qr8HswprO7o+mXGfq5XbaERHr4XnjDAraLGq9srgT6yQA91anwBnSr48Xs
	9SteQln8s0d3T2vFcmn+fVH6ZzBC/j9d8ytrsUJhIBCg+pngiP8rRL+yfX4VV3OHNqj3
	P89c/a6vjj3rgPScg2kfr8XSASKWOcCUIc3NHMP4nwHUNhQDaaHo7N5spocFboBwbozL
	a95A==
X-Gm-Message-State: APf1xPDZbv+opOhgPLJxs+Y+rn1bWIoHRshAUs5qnaAw7Post/iPP7ID
	mQMuCRyg6YCsucSaO+Uo9hOh7A==
X-Google-Smtp-Source: AG47ELswW8qASCwfqu6EoBwkHwanBOm4pSszbQdJHW5bidvnK0I5UqgocRiBGZKr0yCPjYYZ/UrzIg==
X-Received: by 2002:a17:902:5984:: with SMTP id
	p4-v6mr21839597pli.38.1520449297918; 
	Wed, 07 Mar 2018 11:01:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:08 -0800
Message-Id: <1520449275-29492-16-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 16/23] gnome-keyring: only include when x11 in DISTRO_FEATURES
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
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index fd6ca73..9d85c65 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -13,7 +13,9 @@ SECTION = "x11/gnome"
 
 PR = "r12"
 
-inherit autotools gnome gtk-doc pkgconfig gsettings
+inherit distro_features_check autotools gnome gtk-doc pkgconfig gsettings
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://egg-asn1x.patch \
             file://musl.patch \
-- 
2.7.4



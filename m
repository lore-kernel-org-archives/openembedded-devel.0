Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id D613F7DA0D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:39:08 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id z6so2276157wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 05:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HDu6jBzOhzahhVH0MmQu9DKN22EVNYDmApdJKbUPyPk=;
	b=aDUy5cLDyt4J8kOo45KuA3NVfwvaDeDyW6z7b1KzPy3gB0LEPHMYlCZ8MCuyBojPu7
	khfBDRD1klgBfMmuhEv3nRqwpyhXkz20QNVlhFEJB4Y+30+aLgIVTymNxMptjm4ZK7zB
	Vb7POl5ucjbVSqhf+1mqFb8IaEoee1//cZB3bZhq77KmNBu2LXrInL5wX0+DuM8t7uZi
	pGDOyI05b0IzIWvWOvHKfj3NvUXicA67PNyD1G2GlEHfL/ODiB4O7D/SEK+c7aRK+PyX
	DmggV0ggCM6csEPM9xBMw/HTZXKjD3bhOLHjI8Ce7O0/da9yf6WMW4sWVxjqcjvvnH8k
	M8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HDu6jBzOhzahhVH0MmQu9DKN22EVNYDmApdJKbUPyPk=;
	b=oH/hTJ/8TxLjEnliG+0TnoK3lQtOvbb1Lwy5HDYMzQHRbFWMNhuTq7Ayj7okk7iGaM
	JDy82OA1JeKMZtExPQp/YXXdA76BXsNMTmXs5fRpNJvvKx0/w1xDVw2xdfAZrn5H8ogV
	7Dfr03npJr4jjFjLnP+rlVtj2Uee9LsU3UatO2P60pav2XPHa8NXNJLR5dnDQiyFAAda
	Yp9sXGBx3sZVVx3kFazQrTyiEVfgG/KHoa2KmVyS9svBLFT+qi+jb6PsAEelziDElWpL
	QGgJSw0KCeIkcBiWfvN0MHSfUoBCtKxSWB+Wi4Z4lvmYJuJZ9Vi01mrpLYTqfRP1AEOl
	SkyQ==
X-Gm-Message-State: APjAAAVzfkzcKDIgIrSNGmYCuWttkk5gQYW9JLhoSpk+q7V310/Tw7sU
	ivvs/etutI5o03IrguhdhgmZdkEA
X-Google-Smtp-Source: APXvYqyxc6FbYLdQpdV7rf9uvgUfGyDDlWHT0f7uR6x63+Z5SrdJCUhsA0A8lLOF+YUaFbxKrMmghg==
X-Received: by 2002:a7b:c309:: with SMTP id k9mr3229803wmj.45.1556627949222;
	Tue, 30 Apr 2019 05:39:09 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	d11sm2172288wmb.39.2019.04.30.05.39.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 05:39:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2019 12:39:15 +0000
Message-Id: <20190430123915.1615-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] miniupnpd: fix SRC_URI for multilib
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
X-List-Received-Date: Tue, 30 Apr 2019 12:39:09 -0000

---
 .../recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb
index 302f5072d9..d4093e5119 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb
@@ -11,7 +11,7 @@ inherit autotools gettext pkgconfig systemd
 
 DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack"
 
-SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${P}.tar.gz;downloadfilename=${P}.tar.gz \
+SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${BP}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://miniupnpd.service \
            file://0001-Add-OpenEmbedded-cross-compile-case.patch \
            "
-- 
2.17.1



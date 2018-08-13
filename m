Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id ABAA474C68
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:17:56 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id g6-v6so6602939plq.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Yv8FQWjX7C5dRCl122yhyeElefu6vwBUHrjt8xi0gLE=;
	b=Gg/mM06g6UoxbEII4EuuAs35j01wk9qcVoCEoBB6fl1CV2m/O62VXksWwFkUKQJ7yJ
	FtFT7y+WKmw7FNuDX3WGRi5dBT4J0V7IAQHuIJQ2SUtpWooxeArLIMZf9tI9tLcGMJj3
	soPx2H/f2YQWPaKwlkkCTxxsWMdbVPmdf7DDGtBCyBMhOOPq6uQZbe4p3LDjyk8EEQN6
	pM1J0socuYCHTvFdx6Nke6GbsQhw8fiPBDSOxBCB25wO3c4eQ0cWGWIf+hb8qEoxsXRb
	uxW02dgJO4dxwSyVXmgP/Pu0O7PXMbNit1purHz4Tp/nkpe4p45FiM9evB3DVtM6LkmG
	cDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Yv8FQWjX7C5dRCl122yhyeElefu6vwBUHrjt8xi0gLE=;
	b=tXp+6f0O/+pacP05vsJ4i6qYYOy38EZ2j5/QKVodrCazY5vKZRlMiYyYAzPt7RS2je
	Plo8fngD0mcXK7AFFJJs5TMcDihKNwugODVkF/FSUsj7POl5YG3oE5Hgr2P2rGuEkdeE
	HtIVNcQI+gseFgWmXPwBRaitwliqnUZAOMtDvJGPGRVN9agyQY+iJ6K+nNL9WI8Cf85T
	Kx7vdam/BFt0B2FBkFtzXub9yFgINlHC8anVvcG46HXFXj9E7O8+4OD43A0P5cP8v+yE
	l08CP2srDnUpwiqU3/u7HXLknD1ElJfLeHSU+5EfOKyXL66ywXsKYTKaSnFjKHfpiocE
	Oumw==
X-Gm-Message-State: AOUpUlETooB4nkjD70/aFVOCPtZ4ojmV072HqRJC5OdmvsGqQMdncoSZ
	WtmaxLb5Tm2NRmgvexqT3sTmqFDx
X-Google-Smtp-Source: AA+uWPzopMTyD8D+iel1hiaOxg7MkV2BiznvnHFCc/rqZFU6j/uCPVRzBL7KhpT3KNUIauE//pcnxQ==
X-Received: by 2002:a17:902:4503:: with SMTP id
	m3-v6mr15768051pld.168.1534148277603; 
	Mon, 13 Aug 2018 01:17:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.17.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:17:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:27 -0700
Message-Id: <20180813081742.6961-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 06/21] yp-tools: Add dep on virtual/crypt
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
X-List-Received-Date: Mon, 13 Aug 2018 08:17:56 -0000

needed with glibc 2.28+ where crypt has moved into
independent recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/nis/yp-tools_4.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb b/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
index 4e27e32d48..bb401666c6 100644
--- a/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
+++ b/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/thkukuk/yp-tools \
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libtirpc libnsl2"
+DEPENDS = "libtirpc libnsl2 virtual/crypt"
 
 inherit autotools systemd
 SYSTEMD_SERVICE_${PN} = "domainname.service"
-- 
2.18.0



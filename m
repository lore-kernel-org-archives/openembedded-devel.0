Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id DBEB47CECE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 07:54:11 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id u23so3048434pgo.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 00:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gjdgYGVIFUM8URMKsFLGgOZWH+iEvRbdy/qGe3zGxqU=;
	b=CGD9kNac/ALg30iF5gmeWesikdhG6SwIxwD6kq3D2TU2joc6Ww7bX1eLJxE1ML+ei7
	G9pcWbN3Giem7zi+5tWLcIJL0RbEkLeJUiFbgwZA/mJLwAJCitcMPnC77drhbUkGmW65
	kYpk4UWyoSPmx1z5bJeJ8j1cxchEDuuVITc28xfgcQtl5Y3wjBnT9Qtwm9Y+AKzGKUq8
	we6CHz+CnEEvR/O/N4JREvogKyI7510N1h6NEKTEUaWKokRqheRE+2R34XEtqxhrrxNN
	w3aehy6ZTXC2RfqVUVmet7e+pAtmK3QPzlWjI7ALjrDn9H1k4eUEEllt9vPwaM4Sk25n
	XaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gjdgYGVIFUM8URMKsFLGgOZWH+iEvRbdy/qGe3zGxqU=;
	b=TYgkqVt7vf6RZ6EopPluVcF8lMIpPIH259fUslwCXypGZnkaE07Dp72FsV1W7dMjw0
	yLz+1MCtJ8Wu5QL6U6ZnBQX1tTI/l27RLdY2afKwXiENDdWHBLiJIFJkq14AoTA/uCrZ
	59M1mNZicZJv7AsRDaID/f88929WoY5WG3yX+lr8Jsu9zDBTzK14kBEdP7T0V7Og5YSF
	P28UCl/Qe7UjDyMsSTcJ0Al/AxGudeA2SR0AJuceP70Amd329P8znLP2OsVp+H2g+1aE
	3WhiQTZDWs/KyR/E0uu83CeZQwXu8/JzCJsqcpKbpvkKENQxlIJYrE0M/guqsX1IEQdx
	Hybw==
X-Gm-Message-State: APjAAAUvFV35U2KA+ZtDKJL68UD6pUwu3DxXBVY6vtIzu7HdUbTOxFeS
	3KNTnffx8zDvI0bYkVL2AhoAvR4waxTIVA==
X-Google-Smtp-Source: APXvYqwRPvLiDve2lf2TPt0B7aphV605a1iPcO6TI7RoWYPOj8uHCpZFr/YXCN4iW/tebahpLBDv8w==
X-Received: by 2002:a62:3441:: with SMTP id b62mr16285850pfa.233.1571903652616;
	Thu, 24 Oct 2019 00:54:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a6a5])
	by smtp.gmail.com with ESMTPSA id k93sm3402431pjh.3.2019.10.24.00.54.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 00:54:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Oct 2019 00:53:53 -0700
Message-Id: <20191024075355.2136934-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024075355.2136934-1-raj.khem@gmail.com>
References: <20191024075355.2136934-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/6] libiio: Inherit distutils-base for packaging python files
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
X-List-Received-Date: Thu, 24 Oct 2019 07:54:13 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index 4e57d5b77b..489cb1a9e0 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-inherit cmake python3native systemd
+inherit cmake python3native systemd distutils-base
 
 DEPENDS = " \
     flex-native bison-native libaio \
-- 
2.23.0



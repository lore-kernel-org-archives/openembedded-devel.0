Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id E15D17FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:59:47 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 6so2499439pgk.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9h0S+t1jr+Xi/GQzPpeJn/aWbu1L0TkWKDrK4qVckAg=;
	b=l97TW10SjOvjldAc+NIbLTK6kZ6ff6zragzIzJXoHiO/iLGINtCP3nOcg/VhS9EPKI
	7bOBD4YsxpssUOS9v+S4wskgoDGTMObi0zszGY5TaMbCDfm439lneXgclxbkFHQ+1jyl
	l7JHUx9zcFqEGRQzVWKRSb6HPem0uaa+qdmvDj5jgXo+xSUwKMQSBrEVus6diiKI62lg
	wTd5PGQuHfEYLZanJIFZyOHim4vn44NslpUUmmomP361XXypqg49FxL5IG8a7NoJPICA
	zs4A9gtXqTB0XIlw+90mvWV7mJrs0YcxcAvxGQJHFS1waJ7rUwtyiPlbcU//Afg0QqRw
	VaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9h0S+t1jr+Xi/GQzPpeJn/aWbu1L0TkWKDrK4qVckAg=;
	b=GFahCKttYgS0b0xjYHlzmaX9uQKrhtrEoqswhSyaKJqSuY7o1k9X6sqiqrnOFW+miz
	KKBZAvV/drAUQmJwpRibeSylnZZM56cjuzy2rs5yHX15C6rU7mQqHmL3JH9LKMtQn0SU
	2U6QFyr/FJQtG4bzHspior0b5FUOd5XN4QH0g9MxxWPIvIZBaco785P6Xb4Rtt5sI2Mc
	9OufMuXSBFInEBpS5VxTiZL9W89blJVSNFZZcYYoTwIe6aE7ZMwn48doZNhRS/q/ruT2
	BH3cXLUHSNtrqeQAZEF9awJjK5KFICJx2mMZhv8RWD3rfKN+V+ajjT0SCi9RLQO/8cCg
	Qb1Q==
X-Gm-Message-State: APjAAAXzkDhcBjemppKvetS4SrdxUaa5oPhkLe7drDy78QUD5nK7ecvj
	a34yN/colnVMzqmMf4bkWZ50Sv720Bw=
X-Google-Smtp-Source: APXvYqz/Wh0Ili7ip+WwMkkbkPqwUPsmpkKRzam4m+i6XdnP76XygZygfUaMhbE73R8jtuh90jB28w==
X-Received: by 2002:aa7:8f3d:: with SMTP id y29mr230051pfr.183.1579654788648; 
	Tue, 21 Jan 2020 16:59:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z26sm46107269pfa.90.2020.01.21.16.59.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 16:59:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 16:59:41 -0800
Message-Id: <20200122005941.3706171-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122005941.3706171-1-raj.khem@gmail.com>
References: <20200122005941.3706171-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 7/7] python3-ldap: Fix build dependencies to use python3
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
X-List-Received-Date: Wed, 22 Jan 2020 00:59:48 -0000
Content-Transfer-Encoding: 8bit

Address files via ${S}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-ldap_3.2.0.bb           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-devtools/python/python3-ldap_3.2.0.bb b/meta-networking/recipes-devtools/python/python3-ldap_3.2.0.bb
index 2ad70ace4a..f46ddbf449 100644
--- a/meta-networking/recipes-devtools/python/python3-ldap_3.2.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-ldap_3.2.0.bb
@@ -9,7 +9,7 @@ OpenLDAP 2.x libraries. Errors will appear as exceptions."
 
 LICENSE = "PSF"
 HOMEPAGE = "http://www.python-ldap.org/"
-DEPENDS = "python openldap cyrus-sasl"
+DEPENDS = "python3 openldap cyrus-sasl"
 
 PYPI_PACKAGE = "python-ldap"
 inherit pypi setuptools3
@@ -19,8 +19,8 @@ SRC_URI[md5sum] = "fe22522208dc9b06d16eb70f8553eaab"
 SRC_URI[sha256sum] = "7d1c4b15375a533564aad3d3deade789221e450052b21ebb9720fb822eccdb8e"
 
 do_configure_prepend() {
-    sed -i -e 's:^library_dirs =.*::' setup.cfg
-    sed -i -e 's:^include_dirs =.*:include_dirs = =/usr/include/sasl/:' setup.cfg
+    sed -i -e 's:^library_dirs =.*::' ${S}/setup.cfg
+    sed -i -e 's:^include_dirs =.*:include_dirs = =/usr/include/sasl/:' ${S}/setup.cfg
 }
 
 RDEPENDS_${PN} = " \
-- 
2.25.0



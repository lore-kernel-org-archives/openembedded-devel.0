Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5E97FA0E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 23:45:40 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n13so5293186pff.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 15:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uyctna1koZGR+UBOorZ6U7lZqByEhz7Zuq6vls9Eapo=;
	b=CJqVn8EcX0mwOWB2fq3zABvxWbKaDriOxRCbeaMJtKdRkiGxOX7q6ulEJTNOhcY0A/
	bPddiBAVbtr/3GuaxDvhlCsDklx5feybvzk162CqIS3qFStJr1sB5byR3DAEJXqKlAqS
	7+nbdgjn1U58nQFXaUDJ/Yh2K3gyDDXKxhRliQRRkdRuZkNLdK9sm2gBhtwDb/MVYs92
	v+l/DynctKES4Ok9RP501Z/Z5w4+IiOz7lK5Tqla4R5v+FNh1oG6Ubmw9JQruJhikHNM
	saZBeXJrFxM5epSYFTyAbNIUfqocKgYHZsN2uDQWbCm4tfuDkfKpB22HazQWakAyG8Ja
	1Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uyctna1koZGR+UBOorZ6U7lZqByEhz7Zuq6vls9Eapo=;
	b=aCpD5+nwJLYGiDNPDnmyQDZYOPMhV4rGy3c6eQZIJIOmuMZ3Mkx7Fh5+7vTFUGz7YV
	KUgEpGeb/bG/61BOJpliQZanuaD+fN5iP+6pPPBs3agfOlrU8Yt4POXUyegr4CESew0f
	GYNxVVTCe1K+szkIg/wQiMOgr4jOY5dLbUwmZN3SLO3U4+LPu9XAYShNMQLW+cwIegOb
	XoXI+If0fjU3U4e45gZ8WCEQfXfeFeJOf5GGJyEHlEFw9+ciR45Rhz+VuVHZLE4LnBT1
	VDk+wSa8C/nVaMXaPr3Brw7FvzP/FZkp679YC2BlFUDyLP8aBzldjzYUnjjNAJ2eb5tw
	PSLg==
X-Gm-Message-State: APjAAAXv3seuoIIs55BMqXvSec8jeFS+WcXhFjlHJ4eSHn2Rk79larvO
	S9yJdfL1/VxsSaJynblJGBP+L4gvB2Q=
X-Google-Smtp-Source: APXvYqxCZ10LeZkhKMDiUnJ5/7lkDFfn9DX0pTYqYQoktBt5VvLUoKCqbMcKBOB2DT1dqk8VAO8s8Q==
X-Received: by 2002:aa7:9aa5:: with SMTP id x5mr22453659pfi.131.1575762340704; 
	Sat, 07 Dec 2019 15:45:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id
	h6sm19601553pgq.61.2019.12.07.15.45.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 15:45:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Dec 2019 15:45:28 -0800
Message-Id: <20191207234529.1222139-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207234529.1222139-1-raj.khem@gmail.com>
References: <20191207234529.1222139-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/4] python-pywbem: Update to 0.15.0
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
X-List-Received-Date: Sat, 07 Dec 2019 23:45:40 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-extended/pywbem/python-pywbem.inc         | 4 ++--
 .../{python-pywbem_0.11.0.bb => python-pywbem_0.15.0.bb}      | 0
 .../{python3-pywbem_0.11.0.bb => python3-pywbem_0.15.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python-pywbem_0.11.0.bb => python-pywbem_0.15.0.bb} (100%)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.11.0.bb => python3-pywbem_0.15.0.bb} (100%)

diff --git a/meta-python/recipes-extended/pywbem/python-pywbem.inc b/meta-python/recipes-extended/pywbem/python-pywbem.inc
index 5151c33ea9..6b3da80d27 100644
--- a/meta-python/recipes-extended/pywbem/python-pywbem.inc
+++ b/meta-python/recipes-extended/pywbem/python-pywbem.inc
@@ -15,8 +15,8 @@ way to write providers on the planet."
 HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
-SRC_URI[md5sum] = "1465dfa92e4cbe558c773838b9b00711"
-SRC_URI[sha256sum] = "2a05f2c1a6ab4b08560a6da55fdaabd0f52f4d1e6df6e288b9ed927bf5c289ed"
+SRC_URI[md5sum] = "b704cf4e79435bea0226c211f347ea87"
+SRC_URI[sha256sum] = "6f4304518b2ba89a97bd4f5f0decc8ad382b38a9303032ae17a1a601d95d24b8"
 
 inherit pypi 
 
diff --git a/meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb b/meta-python/recipes-extended/pywbem/python-pywbem_0.15.0.bb
similarity index 100%
rename from meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb
rename to meta-python/recipes-extended/pywbem/python-pywbem_0.15.0.bb
diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
similarity index 100%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
-- 
2.24.0



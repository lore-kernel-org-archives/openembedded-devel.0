Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 99B3A7FA0E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Dec 2019 06:30:29 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id s10so4458002plp.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 22:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jRHEpO+79kWrHjSwrTEftOL8CKPQNOoDGtsMfZzOgE8=;
	b=Kmsq7lpacl2mn8xc8udWzZgIrFAmGxoobjNbh5g8DxcgzcDXaBGIOqGATkk9AJ9L1v
	dJD54/+mFruYDyt43l1iZdK7G/RL3ydffo4FF2daApOvhncMh6I1xGTq5aUtguEYwNEB
	R2bXs0r54bn3R4VanSsxgfnJoNBe5Uwv9SbXwLiR6UVXXxWOcamObKczdIqz/MmGm8Ka
	bbyPdIfiMtCihJbTXXSlTO0u3guKpKruiMlmCyyNz1FLNEP/BCDEVbCX+CgsdKoUBP7A
	4jpfGnA4BCB202rmjb2GKPXpyeBhE78LPLkutP57RabsscXJoaFFG5/2BcM1Oj7EPJ5d
	IYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jRHEpO+79kWrHjSwrTEftOL8CKPQNOoDGtsMfZzOgE8=;
	b=Oi+s1nFyEL8ShObcKEx9MtUOvgS+HCgHNXOsOmIc+j4QPdhRmCxYGiSyezTa409KXm
	hc11dFhf2i6s/B7uol8SZJeBLarebgw+JTVYnFPZ5Y9WyQc31eClIU+lId3PQs0TupI7
	b/gCGNVNc+fDEhT2dlFHKLOjNUm8m0fCiird75QzrcrB7HJWVSHNR++5+cZynb/bArBQ
	aYtt1lslV4AQ9TXydE/a+Nmv89wRhrIxbsF/FjcTcXq7JbS9CVuMC4O0s7AbybaZoVYs
	+5NSlZdYylqeFoX6ldF0dlqRE92I0WFRhOaf6hqGQ6YVX7Oq0Uu8XNWP9hd2dlKHv61b
	sAmA==
X-Gm-Message-State: APjAAAXMueE41hLZWL1bQ/yPsX2/8rSJIpymmxk7DD+/X9hakGbwg+m4
	UJ6SB2MBZx6BBubHh879JA1M5AqKKEc=
X-Google-Smtp-Source: APXvYqx+NsR/JxvbKhFISzr5IlJIEmh/2LqbJPWK8mS+frBcBB7a0DEjpon5m+G1lzcjlNFBdZZZbA==
X-Received: by 2002:a17:902:8c90:: with SMTP id
	t16mr5595554plo.186.1575786630213; 
	Sat, 07 Dec 2019 22:30:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id v16sm8408309pje.1.2019.12.07.22.30.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 22:30:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Dec 2019 22:30:19 -0800
Message-Id: <20191208063020.3592797-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208063020.3592797-1-raj.khem@gmail.com>
References: <20191208063020.3592797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 2/3] python-pywbem: Update to 0.15.0
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
X-List-Received-Date: Sun, 08 Dec 2019 06:30:29 -0000
Content-Transfer-Encoding: 8bit

* LICENSE.txt move to toplevel
* Use github for SRC_UTI, pypi source does not build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Change SRC_URI to github and license pointer

 meta-python/recipes-extended/pywbem/python-pywbem.inc    | 9 ++++++---
 .../{python-pywbem_0.11.0.bb => python-pywbem_0.15.0.bb} | 0
 ...python3-pywbem_0.11.0.bb => python3-pywbem_0.15.0.bb} | 0
 3 files changed, 6 insertions(+), 3 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python-pywbem_0.11.0.bb => python-pywbem_0.15.0.bb} (100%)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.11.0.bb => python3-pywbem_0.15.0.bb} (100%)

diff --git a/meta-python/recipes-extended/pywbem/python-pywbem.inc b/meta-python/recipes-extended/pywbem/python-pywbem.inc
index 5151c33ea9..98508b0c30 100644
--- a/meta-python/recipes-extended/pywbem/python-pywbem.inc
+++ b/meta-python/recipes-extended/pywbem/python-pywbem.inc
@@ -14,12 +14,15 @@ It also provides a Python provider interface, and is the fastest and easiest \
 way to write providers on the planet."
 HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
-SRC_URI[md5sum] = "1465dfa92e4cbe558c773838b9b00711"
-SRC_URI[sha256sum] = "2a05f2c1a6ab4b08560a6da55fdaabd0f52f4d1e6df6e288b9ed927bf5c289ed"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
 inherit pypi 
 
+SRCREV = "b3386b3bee8876d15f0745147c0b08937d8ab18e"
+PYPI_SRC_URI = "git://github.com/pywbem/pywbem;protocol=https;branch=stable_0.15"
+
+S = "${WORKDIR}/git"
+
 DEPENDS += " \
     ${PYTHON_PN}-ply-native \
     ${PYTHON_PN}-pyyaml-native \
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



Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DF5007E33C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 12:38:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45DVcJ3763z5l
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 14:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559133488;
	bh=ObE0T96T4olXJkq8rcsr/c9ZGHKNmRtwqohy0757Mww=;
	h=From:To:Subject:Date:From;
	b=C15qS9SQ0GAZHSHF/d2bk7InDlVKZA9JJCGWd6bSeqRIrBRb76FLzJSv5+osJJvMy
	Mt5uAIPV6UlB4r6M1pRAcsoF2ijVWyB6mcrZOuILYPSnCM8P5Ff3PW0oLaBdMcZ5Ia
	5Bm7zpfstAriKfNtKgO6+xk5TWVxLjpH262JLBpOh7Lj/Vv9khBuED106zUtkrEZuW
	hOcMBt50tML1eWJQZmn95W6jpUOnkpA1V9o69Wy0OH1ZxGZkood+DmOLadN6Njb44z
	ckJ1XUs9UOEEt0QcBs+wEkwl86l5jsPWkpOAKJEM+nlRcg/4kW7ExKEttMIJ1F1leP
	vI/CN3BZH3YDj+77agyIUfxt0yQ81gdKXpoQb0Oj9L14ppkhletBoffGZ+KitrX5bl
	RQqMXBEGm3CDZvNddRtB1Y2nvNoMPmC7+b9gYqaJEiIfFBnyH4qtj96G92glPBVR2/
	sN9LcwcGkh45xDaZi0FKEjTMAZNRhfy7CRiOdySPROGlr2oN+LqyHUq3ylduQ404TC
	1Lv3LN4OxyIMvdTH1OM+dZi3ksTZ4kAST3nLomZDNIrb13rgkS9ntkyDatfysJFbkn
	zuU7Q54zYt+jqhGU/Uv8WYAv4OIwpZGNy1K1J9KqqaIfO/TB4vghINqGDBNXo/BBy3
	sRzKfjhgWZUrHnfW69NlguDs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 May 2019 15:38:07 +0300
Message-Id: <20190529123807.23246-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] samba: Upgrade 4.8.11 -> 4.8.12
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
X-List-Received-Date: Wed, 29 May 2019 12:38:08 -0000

The only change is the fix for CVE-2018-16860.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../samba/{samba_4.8.11.bb => samba_4.8.12.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.8.11.bb => samba_4.8.12.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.8.11.bb b/meta-networking/recipes-connectivity/samba/samba_4.8.12.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.8.11.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.8.12.bb
index 8c08d1ed3..a6d3d0a2e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.8.11.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.8.12.bb
@@ -30,8 +30,8 @@ SRC_URI_append_libc-musl = " \
            file://cmocka-uintptr_t.patch \
           "
 
-SRC_URI[md5sum] = "de61611075e97ea98140a42d9189d9a5"
-SRC_URI[sha256sum] = "d294a8d7455d7d252d7bafc9c474855ea6e0ebe559c3babcd303a5c24e58710a"
+SRC_URI[md5sum] = "25de700c8f1148fd13973a49a51c059e"
+SRC_URI[sha256sum] = "c162d519101e15d1a1d76df063bfefe8d1656f57fb74e1ef19fe05d341a65d8f"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.8(\.\d+)+).tar.gz"
 
-- 
2.17.1



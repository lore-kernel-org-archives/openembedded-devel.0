Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id BF1CA7F2EA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:18 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c3so3512980wrd.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XrukXEHnz6J9h56GFCnoylhExF16jpFaRZrOCZlq/Uo=;
	b=lnnc/q/TqzQ/VYd0YWrCdA1uW/XiLG20xhj/nT2j5VcgpaHNFhYA8RBJL3b/rsLmfv
	/zTHGnVlVOxa/BHzrlzkxa5BtfQtQ11jgRF7u6jiP/BsjqEkq8WyrzmJZsolHfpMDTMU
	6fV0CHmG10pqyE1XPCNAVSx8Jcew5/0GHPhZjcwGaPtVc9iZhtJ0VEbAiY2Su77CyiI5
	rbMPxVjoamRBOGOo8qPL4G9D81ghjkU6+XYbyZSkn7Aii1aq5qovz1UqGF1QGimKL6XN
	In+8qNs0VxuGZmiz9+69mOb29cUc0G3lm/34EyjEv3YWPkDmxQW2dfsyQ8feMHRGPE14
	F7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XrukXEHnz6J9h56GFCnoylhExF16jpFaRZrOCZlq/Uo=;
	b=j3n2Uj43pXEyRCcQBQ/6vzIyzP/j9EXEz1SZQ91WHlIn1RxUjunYqlBxPgvCH9OS1K
	sAXAYgFExfK2QPZyrRM+PhzuqIwaxiqdfdVJaAD9ALEbsuqUe2lxRGx/hzXkP7UWi3RD
	FChSR/Yg+mRWkuylNDeAY58DItLvQqP4hRg1T9u+ldEiBpZfuG1sbvaTk9T6t/akm6rY
	EvkjZch/qxOOoVjJbKPVWISRabvFPFO3VnqWK5vtKlvzOnYeJXIVmFPBsiaHaX7TTZSf
	M1D5P2G+lj7o5oEZphGTT79B+SJHTGCMAwyBpfLMvTx2mOWRy73PXjJegx7lsNzwS1jl
	YH6w==
X-Gm-Message-State: APjAAAXwsikONw5mMI1fGRo/GGgEaP/39rJLDdvvd68LWlS9iRZ4i3O1
	sXzff32zICMeEorgRs7Cqn0GOsgm
X-Google-Smtp-Source: APXvYqwCGYYsl1YFOJtyX1+sf32m3AG3JuX2gHZMefRcxq3w/ptaO4nEcK4psg8GJBjrkG8r1m7MWg==
X-Received: by 2002:adf:a55d:: with SMTP id j29mr6906445wrb.275.1565906179204; 
	Thu, 15 Aug 2019 14:56:19 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:55:57 +0200
Message-Id: <20190815215605.19600-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/13] gtksourceview3: upgrade 3.24.10 -> 3.24.11
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* this an improvement and bugfix release [1]
* add upstream-version-is-even

[1] http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-3.24.11.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{gtksourceview3_3.24.10.bb => gtksourceview3_3.24.11.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview3_3.24.10.bb => gtksourceview3_3.24.11.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.10.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.10.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
index d91e479d8..f7884930c 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.10.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
@@ -10,12 +10,12 @@ PNAME = "gtksourceview"
 
 S = "${WORKDIR}/${PNAME}-${PV}"
 
-inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-introspection
+inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-introspection upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/${PNAME}-${PV}.tar.xz"
-SRC_URI[md5sum] = "e43337d17c40eae440a76630db76c54e"
-SRC_URI[sha256sum] = "ab5406cdd0bdcf66afcd52b1e048a2f43c0f3ab391644ee30d9ac419b93cd59b"
+SRC_URI[md5sum] = "b748da426a7d64e1304f0c532b0f2a67"
+SRC_URI[sha256sum] = "691b074a37b2a307f7f48edc5b8c7afa7301709be56378ccf9cc9735909077fd"
 
 FILES_${PN} += " ${datadir}/gtksourceview-3.0"
-- 
2.21.0



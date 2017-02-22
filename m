Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 66EEC71D90
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:03:10 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u63so2950784wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tng2X1PNzSMIiNV75SIkqBtxFFVXZpeZk+MkRk4IZsE=;
	b=dzxtexmFjA5TA9STTj1Wodb+WFEzFiTn5rYK+lpdQ2zDgIN3S0Y2BYAYRjkJp2Lkeh
	rePuEX2NXOC5QK8PmyqzTYMmYTaiDE9SPz0Wcc12tbfqm9zV7DE+C7hgosgZoeW0I/BM
	tPMXSy5oY7P88HD5K2AxuAw1fhyRaRzin/tvgJ8yshmRpIYLJM3O1wTzwLh5O9pCuEEh
	JUkz5U17YSiFW3rc5k8oWB2MeTytwwTuQwRN9RE3TciMmWAV0hHUaNu5zy+Guz3e9Yfo
	31IL8/EJjXx8T2XnxDuDCHH9tjUVcZKNJbBQYasDvkNKJAq72KHGJ+VYRXgwRRglwXlD
	5t5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tng2X1PNzSMIiNV75SIkqBtxFFVXZpeZk+MkRk4IZsE=;
	b=RvGOzKcEAdivMbPXpxutz+j+1MCnGF+rcdS61X9+0B9vmdDqJJkjS3S058oeFtNQvx
	t2htYgtmfV/7nJXk35yVgm5LFALC3BsCMTiLipQHOVl3Gw2S2eieVn7q3tvVnlo5OIVu
	/DPqm7hzy71DplHaZAHKSYEjJJ7gG87glLmf+3dagcNp+etm2jZrgY/kFQF5e9KhSilm
	b/nx2vTa7mlSyWZWvfdv3h/nnj4NPd7rto8DQead6Wpvv0J1SlX4yNWS35MR5PclKI/j
	+zBMYB145tm7uNutsxzwt7bWZpDgzKrYPkHAzcxpwUqmhHHDBZnV2oEs02VI4ofPDfDm
	EWAA==
X-Gm-Message-State: AMke39mB2OiFIx7XfOghroS2qSTwnU5vEQZ0+PLWzUDSW3Bvw+f7P1sd9/CAqHDggZ2WPA==
X-Received: by 10.28.69.202 with SMTP id l71mr749004wmi.68.1487804592021;
	Wed, 22 Feb 2017 15:03:12 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a104:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	q4sm3479696wrc.35.2017.02.22.15.03.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:03:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 00:02:49 +0100
Message-Id: <20170222230250.30288-11-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170222230250.30288-1-schnitzeltony@googlemail.com>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/11] libsdl2-ttf: add pkgconfig to inherit and unblacklist
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
X-List-Received-Date: Wed, 22 Feb 2017 23:03:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
index da74fba..f2441f9 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "34db5e20bcf64e7071fe9ae25acaa7d72bdc4f11ab3ce59acc768ab62f
 
 S = "${WORKDIR}/SDL2_ttf-${PV}"
 
-inherit autotools
+inherit autotools pkgconfig
 
 do_configure_prepend() {
     touch ${S}/NEWS ${S}/README ${S}/AUTHORS ${S}/ChangeLog
@@ -25,5 +25,3 @@ do_configure_prepend() {
         rm -f ${S}/acinclude/$i
     done
 }
-
-PNBLACKLIST[libsdl2-ttf] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130656/"
-- 
2.9.3



Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29CAEF06ED
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 14:51:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26625.1770562314388419431
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Feb 2026 06:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eP9uEi6X;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so18786345e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 06:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562313; x=1771167113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Nx2gm6wGZ0DXr1yLT5gtjyumQjjtnIUwd2nDV+EuCk=;
        b=eP9uEi6Xb9oC5CpMCiu3HHqgRa0iody49MK8kgNaSKcON8OixIIcIQkpHnnSFqmqwi
         NPi4UFtyJ+BB6RW/PzQ/i4+sdfurZCeQst4jftVJCkaK2rTFSn5vDdMEG38y0byfoUGj
         R298omUHlTJHLQWNruP17wtN/14udcB2ElF2sGYRCIVn2MNYMWFTHIIFeqZqirjrRkAq
         CywI5HtKpvllZU/7C+dpbswD0RdrvDQuP+d7D3Xmf8z3nM6jE6gmg1uMrtmaJ01jQcBW
         OuqoSLWGR5bBFj7TlNfwcWhl3sTTYhplI4zrziBfcuIamElCE0rrBPm5hQ9+27rvhiqF
         BZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562313; x=1771167113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Nx2gm6wGZ0DXr1yLT5gtjyumQjjtnIUwd2nDV+EuCk=;
        b=IggN5Qqdja6MbihRZdB/fqDYJNKqcdzBJWdRz0Tv9jOuJhJhL/IfGLo0rNnFxY4H91
         qqUX3nf+YCW5lBGZqL1FPL07SrKcF3DvJTv4v6n7faFJX1P40OcanlMrzSzHJ3ph4sEM
         vsfO6BUYUofq7B19jc+8n9MVAG8PvnWy4nzzP90q49HRyZSmp2vnVakQ9AVd9XC9bxH6
         /6hrI1dwJ3aZtgOHJSElSeklbgitNnsitV7LJssWWh0HFIer8hMFjwcoUpLEElihVZee
         L7v8xU28+Z7E0nUGvFLyXvjy4xUWOM6VbM5oY9aTzPkz8v8SbIY8bRkHH/uW7Qnef0/Y
         XdaQ==
X-Gm-Message-State: AOJu0YwojXLiVknuoCUW0EV/+rRte89pPRjwyOv+4K+usH4GubQ3BgMU
	a9PrnzzUyV1CccowJmSHaomt3lBHJdpeEppXi0HouEWkqGGmQFfDb3CW64E+3w==
X-Gm-Gg: AZuq6aJ2X/JUWyfvQK/hV4F2Hm7+JnaBy/tLCuBsxFGACmQGtHQghG5EZFXSa3paz4x
	esdEhM77AySi9Wn076L6wcTU1Q6QoMzRm+uD0hgjhhe90BZJQAXAsQQv9JoxJspW0aw0M/OEQva
	dez4ba9bTGVWUd0rCnPRUCrNuDmljHJpkeCQ2U+oymxCTNv9EqGHn51HlYTZNwsnMG9WitczAls
	tSiMAaRUNGsri9NJOT6LLxyNilh7S7R7OsfvVAH8UlY+u9wdnx34ieIAVGJnf8o3dQ+h6Dy5mIy
	YmVw96fi6c8vDL6OH0U85L8TlrQ/VbnOo9DuO8EVHI3/8OXgqMKYCNlKfasPvqEfp1/i+jBLQ3I
	WMKG8uou1CTNXbzSuBLqdKjqpTdfg66uAZPIdi7VjoxVfXYzLZ9whtIZ02EtQfAEIkL3zfEqrzH
	EUnmiWUH+P
X-Received: by 2002:a05:600c:3553:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-483201da2d6mr110349425e9.3.1770562312597;
        Sun, 08 Feb 2026 06:51:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2ba61sm402354155e9.1.2026.02.08.06.51.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:51:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 08/10] gnome-disk-utility: update 46.0 -> 46.1
Date: Sun,  8 Feb 2026 15:51:41 +0100
Message-ID: <20260208145143.20464-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260208145143.20464-1-skandigraun@gmail.com>
References: <20260208145143.20464-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Feb 2026 14:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124281

From: Markus Volk <f_l_k@t-online.de>

46.1 - September 03, 2024
=========================

Alexandre Franke:
 * metainfo: fix URLs
 * metainfo: replace screenshots

Athmane MOKRAOUI:
 * Add Kabyle translation

Updated translations:
 * Alexandre Franke (fr), Anders Jonsson (sv), Andi Chandler (en_GB),
   Andika Triwidada (id), Artur S0 (ru), Asier Sarasua Garmendia (eu),
   Athmane MOKRAOUI (kab), Aurimas Černius (lt), Balázs Úr (hu), Boyuan
   Yang (zh_CN), Danial Behzadi (fa), Daniel Rusek (cs), Daniel Șerbănescu
   (ro), Efstathios Iosifidis (el), Ekaterine Papava (ka), Guntupalli
   Karunakar (hi), Hugo Carvalho (pt), Jordi Mas i Hernandez (ca), Juliano de
   Souza Camargo (pt_BR), Jürgen Benvenuti (de), Martin (sl), Matej Mrenica
   (sk), Piotr Drąg (pl), Rachida SACI (kab), Sabri Ünal (tr), Seong-ho Cho
   (ko), Vasil Pupkin (be), Vincent Chatelain (fr), Yaron Shahrabani (he),
   Yuri Chornoivan (uk)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8233ca7595d2ce05a8ace6ffdc3dfb2ba031681e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-disk-utility_46.0.bb => gnome-disk-utility_46.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-disk-utility/{gnome-disk-utility_46.0.bb => gnome-disk-utility_46.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
index e4998f6276..6f910c4c13 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG[systemd] = "-Dlogind=libsystemd,-Dlogind=none,systemd"
 PACKAGECONFIG[x11] = ",,libcanberra"
 
 SRC_URI:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'file://0001-gnome-disk-utility-remove-libcanberra-dependency.patch', '', d)}"
-SRC_URI[archive.sha256sum] = "464649148c6d6771f1ac2ebfe43a4e519205b11c2d914a09f2a001821d06957d"
+SRC_URI[archive.sha256sum] = "c24e9439a04d70bcfae349ca134c7005435fe2b6f452114df878bff0b89bbffe"
 
 EXTRA_OEMESON = "-Dman=false"
 


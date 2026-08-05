Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F428C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:56:30 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37817.1785927383264861584
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Bn0paFVu;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1642729a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785927383; x=1786532183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVRgqV6SzA4u1Rz1DyWpkK5iaecA3t1nHrp22e0n5U4=;
        b=Bn0paFVuoM7QVW57w2dwOMwTx+XtX0gO10P8vzWMGXakKrXbizzbZXGv9PLPqMLmQi
         XBpy9PZcOnTeWbjy/heKbVHCgHsDqnOLz5eXcLcsB8sKoUX+7QQHqxilluiWd8vlxY4/
         uSzXq2UOapQd2A734odjjlvQzL8eg4R1SJ1yIG2+zCw5mu+cu0sCU4vlOxkdGYseyfoU
         OPpRILLjCGOh3YY5cEKS+gNE8lX+WBvfAp0DxGnKM+jQ81AvnLTkYT1lUL6/v78fvp8N
         zjYtoeNQ0A/XCl/Fk91lY+OfRZhhkr5Hr3S9q0DVGjUkmdEVRfoXpw3cg4HThLV6bl0L
         c4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927383; x=1786532183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVRgqV6SzA4u1Rz1DyWpkK5iaecA3t1nHrp22e0n5U4=;
        b=m+zHU2niU8tvFpObmxjOeMA7d2ho3QIeT7kEAPx/twuH6L3P7N6yhVzd4fR8Dh3vy0
         OqGwDU/WVUxKpQrh17by9Hu6/SnPE2qEX0xx3bgRgAcRk7wLdKYpuBaUfNmC0zXF/VMO
         VtB5MPwmyKy6nSaHDIqlo7WOVqvoJUSJRnRy0rYntMIEiAbutTcUORLWQdWfvou4gWtY
         Bbfogo8HE4glPj7TMSDtefha3P59R9FO+9BFnVDzG1uu33lFxfEtjMaoueE5c35Wae4d
         dmdTyWAKU1GwgCqFmfik82rYPbJ4DSPRWxg7d8VAStQaBzInN4oYmWBOSIh+DI9HvqZA
         Z1XA==
X-Gm-Message-State: AOJu0YxNJQSyNS8Bo7ZUvwnz9N9sbN2LyXMYzUx5TJwANWWLW0I59mwP
	gyXQOxODU8DrpycLGVM/2alaAcWhhNaZu6Nm/K+BWAFqykYASq3PfKZeo+A6Qg==
X-Gm-Gg: AR+sD11D/OlSjpsiMm5hRViq0KdY9zdjFb5C5wwLy6lgxREeLVIUmPTBGkhKKsl0mEK
	Wb8iEbu7ivGRaSlRX794k6aj716hcNaqVrejfrPPRBa+8ohpd2gzzWgQ8EXODv5uV7e4VOEOgxc
	56oN0S63Vebq4bBx+7F76C/NRuhcMjVLk+JqYEENfy/AQznGgO5NQHrjdMW3GGGIBPKkz48saxV
	t7UmYjIQ3UB6RnOpY4dSZFJQYyaiuUdITFhe/1YXanJTvTT0Rwb2tdqy5DjFOObCHydp/0HSN9b
	Dinfgl51JSmFwnNfTD35CTrRQ5m+sXTM1sqsunKnFF2XjvmT4CXnRgiEMWS0/lMzPtDRLLU6ztd
	iH8RkHRjdR8LSu0kSkrDayM3MJqJFHoqn/fVfJVwKQj178ZImn9xfK6Og2QGpXZjhuo+woxfr4X
	I+VxvJ4upSu2I4DsQ+ptTg9ro0s0w7ELPWFRsNs5J57c7b9ZU+8wsAsd80Qp5xw4rydqw4IX0i0
	Q==
X-Received: by 2002:a05:6a20:6f01:b0:3a2:c9a1:2c26 with SMTP id adf61e73a8af0-3cb6c752d7amr11206458637.7.1785927382636;
        Wed, 05 Aug 2026 03:56:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm16407166eec.24.2026.08.05.03.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:56:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 2/8] gvfs: upgrade 1.60.1 -> 1.60.2
Date: Wed,  5 Aug 2026 22:56:05 +1200
Message-ID: <20260805105612.1648951-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
References: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 10:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128811

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/gvfs/-/blob/1.60.2/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.60.1.bb => gvfs_1.60.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.60.1.bb => gvfs_1.60.2.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.2.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.60.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.60.2.bb
index 7dca3cd3b9..bdcc331712 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.2.bb
@@ -18,7 +18,7 @@ DEPENDS += "\
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.sha256sum] = "90eaba333ab7d31a7fdeade45954a513c3661ccebbd9a138aab3fb481dfb9e40"
+SRC_URI[archive.sha256sum] = "a8d7744615a488a559302fe0cc8f418d5b44aba3c2ba2163e5a9e6f607c1be9a"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 


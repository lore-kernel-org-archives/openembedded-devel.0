Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD09CCAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:07:02 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.14640.1758013620882386871
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NMbUL1ga;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so45353455e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758013619; x=1758618419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztmQygv0amGhc78tsZquPGCwKKqSFAzSEBa8qbmSd5c=;
        b=NMbUL1ga9T7MP0SFHoYW65Rqlg8ucbHaEucRjJ06Gensa6ygkth27YsEOsBpLc2H0H
         cGiCZQJ5yVA/LW9ZCP42vSCc8FelsFqbzqRRSlZ4Mc/pZu0/uUWp8U+YcIMDkB/y3vkT
         pGqonL+Ph19I+HZLryLTyLOSA9mZir9ZPveBPVAPeV3EfKg/OxI5HvBzDXvvpufhH2Vv
         Et7C/Eijok17o7te+OZmHyAhP0ku1ba0ZbWiwEQzOu670iMukB2ETWPF79qsodnyu+hK
         e2tTZZKmRAhR+IW9bJmCJFjr0t6GDW1RpigyJTRedSyrIfYXSV5TobXdYx9/pIRmUTdj
         oTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758013619; x=1758618419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztmQygv0amGhc78tsZquPGCwKKqSFAzSEBa8qbmSd5c=;
        b=Oobd1d3laFiNkYXa8/eDkwiKl5xin+USn6lL343BlTb/6TNij0grYmofAFMr+VZ45B
         fh/P+IqpdBRPN0uyCoUfV2A6ugiucMT9ngRleUWno/s75F5v01FYpkQRMilR6G7VTc/S
         twqJWSV0rx4T8PixOA6R+rpjo0IJhrxNMNPaRQycuq3br4YfT6qC9acx6a70rYLXLQ36
         sa49StO9YE7f/KivrmFLzEd7GrM60KZSBgW9we8rjzCQuR3Xd+d9GV33nt4gZl/3d20D
         zhvYIPBDOPZvLOMSoKXUhfJtKDvBczjM5g07aE8KLgnQNv0/ohA6BssyXUh+d1rt6uu/
         E1bg==
X-Gm-Message-State: AOJu0YyiI1OFnyP2oqUvXsD//drGLi/D1JnhwdR40eLFb2MUG+6rxKeC
	MQn++0lJhZGrcR4ZtXo0Z9/EvVD1uOhm9OGNdQAvczHykKjN6SJkVnQxbxNU5g==
X-Gm-Gg: ASbGncsz+vCKBWLblnr79ViDVfJ33J81WB7UR273uE877AmSGa4z/C2nKoR1Es7PD4v
	YjKYfcz0DvRnjuQizLdKrNxR0nFv+gVJy+AR9FMZiNrsty+uNGwFDOnoQ1btZQSv+MiGfFkYyl1
	ws+6/2w/A6aNIBngTOoxHlA0UzRlY6keQR2kcRCbyWXN9V+0tsGiYz77O8T6rRcySUCgMKBbhRL
	ut5dHg5EEuAIGRHzhI2Efks9ENOhXDGnGfbwEsk/NMtCAM2uX47JbuYWSsB3W7/RwWhwuAwOKae
	4TjNUdfba9YRq1A3uYkp7VIbqvMYDmUkFnol7rQQifVVxiiqh8qnz4kVyhIcmawbeVXl0aNO5Gb
	HcScFhOmGQujg4yh5ei/9Rb5L
X-Google-Smtp-Source: AGHT+IE+aOqKimsZru1G5m5Vd+H1bfhHteqqWscsSlQHkAHhyBhL3CYf1N7xwLjKxLSphNK8L/hDdQ==
X-Received: by 2002:a05:600c:a402:b0:45d:e531:99df with SMTP id 5b1f17b1804b1-45f32d00488mr10848465e9.3.1758013618199;
        Tue, 16 Sep 2025 02:06:58 -0700 (PDT)
Received: from Unimatrix04-Noble.. ([78.213.72.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d638dsm204961845e9.22.2025.09.16.02.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 02:06:57 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vboxguestdrivers: Upgrade to 7.2.2
Date: Tue, 16 Sep 2025 11:06:54 +0200
Message-ID: <20250916090654.736586-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119421

From: Gianfranco Costamagna <locutusofborg@debian.org>

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../{vboxguestdrivers_7.2.0.bb => vboxguestdrivers_7.2.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.0.bb => vboxguestdrivers_7.2.2.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.0.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.0.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb
index 31f7b01aae..9b01964334 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.0.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb
@@ -14,7 +14,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[sha256sum] = "4f2804ff27848ea772aee6b637bb1e10ee74ec2da117c257413e2d2c4f670ba0"
+SRC_URI[sha256sum] = "b0e63bfb855327aecf1122cda33390c33734e5ffed72f123f5edf786a8ce1393"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-- 
2.43.0



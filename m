Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440BCC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 14:43:27 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.88438.1749566599723753092
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jun 2025 07:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hoJtpVgi;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e1d8c2dc2so51783777b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 07:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749566599; x=1750171399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGuskqmspOxOMagUwSRbX0HFH65k7qeoWDxEP/z7i60=;
        b=hoJtpVgiaQmBWXtAKiyusTQtDiQxzD4Gx2a0gBbJpMmmcmdPj0F3WZdCjPQ7APuEsJ
         8plJlSW+nTDtnfQnAkjZXcR1d4U72d72nxfZb/v4LqqPWuzjXld0IM/qam1JIBhq9n/k
         GpQ0h95VdpcfRmKrU3rYEKw7eB9RnNQ/G4q11TtSBmLiBQjS0kyasz2oyHRMUSUR5Map
         p0QubEVQ/5I3Cv0b2pv+Hm/DFYR1eBlLogkUOll/iPQfRc5AWry2SJ52+4shwVYIre8e
         liHHV3eOtDtrodOn0jreN1ZRxelZ53zmuJFlMCtr04QM0dbVaNCRTxi9i4FW3flg8WL+
         CjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566599; x=1750171399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGuskqmspOxOMagUwSRbX0HFH65k7qeoWDxEP/z7i60=;
        b=eGym1VdBfHoVQV+KngEH1zCzX2+eo3gZXGouv5qC1AfVyAJZE00mA6UjH4XlxYKwDa
         dRBtYz4N0ucFglHbRuznQwGkL+1pQM+kZxdPqp9TSrdvJgbAYLrR/lec1ShIzy8NyZs9
         VcvWPy1kB8VDCp4Qg31hNzfqC7pluPrDCFBSeevEs5dQxyRvlLYJdauAF+9H6jrw30P7
         ImKeRYrh5t+w83vonkeH960JVZ8vIw9MyijSRRyEbghcUby0OKQrDZ4Q5lKzfd23KNUv
         Sxktmj8GwM6ZnZsFgR/Oo62/z1IJURCIUxUP2qe1uC3sc3wEHPnguBwQCXW4kumVgtQB
         43Cw==
X-Gm-Message-State: AOJu0YzAXhFVeAuAygrBETCf23dsztVJ+SWkIHk/UopZGk9owdHFw3O6
	15tXBgJHGCIjVXinex2UFdzIqicywBA1VvBpSP1opR3aZ0lVLsoQpuYAd89QZT5V
X-Gm-Gg: ASbGncvewlVCW1D58pOZQyWTayd88wy6l18t/NBiMjET2bn/Mtcz9yRBJ5lzuxB24OQ
	y13V1eVWgTPnsLHIFXdgS6hkM+6qqOxsUqiQ9v4hUUX0ohwILZM6WkCWT19SWyADn34BpCWXIcJ
	d0A5n6x4TZx4pgqvFXxwmzXiz0o6100Se2pGgwxrS/22tv4njRYQMW7dsQs1hqhQfGIsUb6QlCw
	5xInxflvtOOBri0m4oUurjOewcFLvSFN6xIKJUti5OEWSD7qW/TkqeX9xHHre5FeY7xmWV/LH/k
	hzVEzFJXK7WXKZ4f99rPFZcrEvMnD0njU7YBre1eYMisjUt6apYwU0zHYT5lutMs+qt9iJuPFQu
	k8B7xLfIyNtgPfJlYbSvk
X-Google-Smtp-Source: AGHT+IFEuTS/lBZsvB89kBVwJS5p9puWUOOxBB8uq/E5KsFPzyIC7ULghKrmGfcigyQrZ4uDX40jng==
X-Received: by 2002:a05:690c:6505:b0:70c:b882:2e9 with SMTP id 00721157ae682-710f7636111mr244046507b3.3.1749566598292;
        Tue, 10 Jun 2025 07:43:18 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f9a0fc34sm16379947b3.97.2025.06.10.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:43:18 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 5/6] ristretto: upgrade 0.13.1 -> 0.13.3
Date: Tue, 10 Jun 2025 10:42:53 -0400
Message-ID: <20250610144254.884143-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610144254.884143-1-schonm@gmail.com>
References: <20250610144254.884143-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 14:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117869

Changelog: https://gitlab.xfce.org/apps/ristretto/-/tags/ristretto-0.13.3

Changelog: https://gitlab.xfce.org/apps/ristretto/-/tags/ristretto-0.13.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../ristretto/{ristretto_0.13.1.bb => ristretto_0.13.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.13.1.bb => ristretto_0.13.3.bb} (83%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.13.1.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.13.3.bb
similarity index 83%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.13.1.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.13.3.bb
index dcae982cee..7175690694 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.13.1.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.13.3.bb
@@ -10,6 +10,6 @@ inherit xfce-app mime-xdg python3native
 
 RRECOMMENDS:${PN} += "tumbler"
 
-SRC_URI[sha256sum] = "d71affbf15245067124725b153c908a53208c4ca1ba2d4df1ec5a1308d53791e"
+SRC_URI[sha256sum] = "5b9172ef704ae192a5338df6bee4e91a59edc65618c375bb4433ffb38e2126cb"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.43.0



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1707DC43638
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:38 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14750.1782634354610855873
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O9ZvHHX4;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30ec1ddd510so322713eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634354; x=1783239154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VlcwhJZ8qRZUaQjn2WDPQwpv029yor28YuLv5FhvCs=;
        b=O9ZvHHX4z0wvDVttDaRmL5QJy8pCDxIIFYRpSpeauEudUdXqESYQxmrEZGx0YWNnIX
         qja9dIvvGCo/H8II28JIlBB44XMb/RDwqP2ZM8kNbaCOYzj+4HaRnsYrEn41C1I9AFIg
         iEJ+ilOvO50iG1CBLMQj/rAGm+6TBoKK+GkN/ok8kbkquUW+a+VOnXD1CqD0ywckhpS1
         MF05yocgUwC1FI5GFzNgPAB8hoybouQB6PL1Hqr/+MN0yXGs2yNKSMbaFu3YA4IAKjVi
         mhwAqK3T9X+zD+1N/HMUbKCRZy+Vp4Ji8A/J3gC0DwAh0nLEsFxV7I5t/B/7BZS2GZG+
         5aYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634354; x=1783239154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+VlcwhJZ8qRZUaQjn2WDPQwpv029yor28YuLv5FhvCs=;
        b=CvmvaViPR16I6D9ZUmz89cnxPdKxPg1nwl50/bY2NaQZb/ugVZvoBlYnojZdkQqURK
         9ePC4piIdF6RcPYAjeecPcJR0MNtsURXNaTF7trR6zg0LqH6X9gIWOE+EBmHhgEqlKmL
         0z3zBSsL5aSLzXDF/5lcQyU7JICOZQ8gmJ+acXvw8hIiObw1a/xo7TYGkAPKVOV69fDx
         QrJ5+Z+WE1ovKvlVF8aZi+o2MVmZK3PLl0atwoIS/pitqo9LV0fRr3onwc9KligFFXdy
         Y07lo5Esd/2O0Sn8IMWeqqjhPdIlCaXwc/nm13V98Ckn53zvjUAa98y3tDn5Ovd0Wwp8
         F0Pw==
X-Gm-Message-State: AOJu0YxzE3VdGeTSKmzTvR+58JFXQGvM1JNuh6cId4EoWT65du666Sj8
	sm02aj9riZI8FwOIOeI//6AfcQICkT61Ek520i6knIn86M+LoW/couvbNvw6/4SXQVTOAA==
X-Gm-Gg: AfdE7ck0u9xAI0nOE5GjGPqTVTuETsDZilxyXlNrxrj2VHr547plfS4qpPJqeAlfh/a
	d+NhgFxGyXPydA25QpS3XRDhpauvXbShKpMddZyg9Uh2WZVfcJ3t3GGzG3pliuCRb8401dHQ5Pw
	g6mKPF7FX+TLeQCPiwAGM+CUZGRVSug0YAsaxOekBuW3M81xQIq6IbEUNNYIUf1ahP9oppBKOX0
	BLbAxr2xS78W/W+4cv9JEkPkQprZC/X0PeZq+FPWnlIlTjpRsjxloP5PWECnay4B5GLj5iZLnHe
	ShvBKX9xQ2cuS8CSLfWkx1108iArYcq0LRl35xvcNdjxCeAyPiAnhrCsp5N7G2jg/zY4lZ4cgej
	JsOoZ7MhRNT5sl2Hm3buPXr/a46Znv0alDynAMT+65BIjF3EQ6QuDQS9Mi5fqjp7DmVTtoNMni+
	4p92yhMw7FPWKRqhZOke6lWIMMorrRT6eWsv6UTyvZzXPdtocq1Y9y2sADVQ6MRxNt7G6MGc+l+
	HDmWaTl5kCI79W068rEDhv5fDB1MwqLrfJ0S0UQdQ48sR0C4uPYzgA8yDj4ZwpZ06KzYKaDhjjW
	MgW2dM7eFRoKy1OEYxaVVhgD5OxwNw==
X-Received: by 2002:a05:7300:8c2b:b0:304:9b48:53da with SMTP id 5a478bee46e88-30c84d9f920mr14185682eec.26.1782634353898;
        Sun, 28 Jun 2026 01:12:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 075/128] libsdl2-image: upgrade 2.8.10 -> 2.8.12
Date: Sun, 28 Jun 2026 01:10:26 -0700
Message-ID: <20260628081122.178348-75-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127885

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libsdl/{libsdl2-image_2.8.10.bb => libsdl2-image_2.8.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-image_2.8.10.bb => libsdl2-image_2.8.12.bb} (82%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.10.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.12.bb
similarity index 82%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.10.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.12.bb
index 27ddc35381..7bc2cc60cd 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.10.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.12.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455"
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl2 libwebp"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL2_image-${PV}.tar.gz"
-SRC_URI[sha256sum] = "ebc059d01c007a62f4b04f10cf858527c875062532296943174df9a80264fd65"
+SRC_URI[sha256sum] = "393f5efb50536ec13ca4f4affb69cc9966d3c3f969e6c5e701faddf9f9785381"
 
 S = "${UNPACKDIR}/SDL2_image-${PV}"
 


Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8068.1795739695858944746
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lFYNIC2L;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so3651898eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739695; x=1796344495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgoT3nNL1APYd262IK4aqXvBg+zKnGgolI0VlSXLkH4=;
        b=lFYNIC2LIBAbP1gP032R/Y3ZgiHoRWjYo6+t3mwPs0ayFwFFsb7Wegf0Vjz8pLPF5Y
         gEHyIL4sa7ySwEDo5rn7q25ERqcy7isglq6jeFRsV7HfPvXaGRC0VI1kMOL4XrDxrKlx
         UPKbKZLcO19rliWFjaKY8AC5fkJ/03ZsF2Mgel3YEJMA44ba92MJBOIza2Ex/5DNVV/v
         P3fhzQtq5TLK0Bqh9pVV+GZTGe/CIbr2hlQkAhumsebNMVLTWZTFxA2y+0hVXMrqFwT/
         6Dqs3QC0r9+oWo41456xma3RqrFWsEVMncAGsn3lHnq0rcU71maxZ7KsNmUj+cVlUU4o
         foig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739695; x=1796344495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgoT3nNL1APYd262IK4aqXvBg+zKnGgolI0VlSXLkH4=;
        b=HxbGO6GzXcrlkalT0dfI9zpShV6wFe3pLNdwGJIL5Set48WhOrlPXdzVTPtY1WF+NT
         WyEYkYHhBBLFJdMXE/3sFP/axiuFVLxpG/oi5IfpiEXwkRJBfwjEtt3Op0XIOaAXHUDi
         KwwPikrX2O6l2EctwTVGKN15LNO7OUnLaDnw4AjW8uU/HgYrflW9qbe+/RZ58+G68RhI
         l9lTZyjQnwnwyhenBKHEijda/qmH2Jm23KxjxOXyej4zIONTIti3/rsRpL9barYyeJpj
         eoc2DGNseNxzuzoLUh6RpNvrGgcxYZiovMEMNYOp1CU1F2UNN4CfDgJutjpvi1qAjTg0
         xXDQ==
X-Gm-Message-State: APuU4Z/xKdBQTbiTNTfX2Z96amOQ0qJ/EkxfnjzvBU+3m2p4khcEF3dG
	vA5gIsMyOvMVSQULyK/YcsSmFoVIlCKHIGVEUc/U7qqCMP2nkIAVQUCDVCFbfg0P
X-Gm-Gg: AZFdTZeYvF1GQBV3O5NYanOgwiJ241cS5/9WBNsXpbHBHMHXhjoc7ypxaLfJI16kaAE
	W4weFLU+Iukt5+gPdR/gZIQLMsMyF9vYZ9HszIwe4IELRT4BS86qEsp6OFRT89zLqp4L1p6PcPn
	CdTChU/ri08wUqRpTfbh1FihgfLydcb10MLoJ/vPc7o2/GWpm5gXfGG1/g4IROPyOZ4UCiKQGP/
	kiv7bSKt4MqO9rDh3FUjsAyrcdLt2yFp2F7htm2rudIRHxIWqm2FqCtz5iHZiXDU7GRVOk+7eyj
	47sQrBeVxf6xtV/BS5ulGfIYEuFQKNiJYwnbQXHfhNk9la4SFlzmqxUpOk8VqC8tR6+8HxRf3qY
	Dsie+9MaVBtOfDk7s9B/9U2BRbNKHqoGKtGlGnzi196LzvdTUcaX98wGk0pS+rDaCv9rhaRH/FT
	OMuP14O0h8iZrVR7Tsf5hTL0LGWLuyAUV5zyfOlA41l4wMSc4fQHaZ59cfytN0H8EgX8qnv+QPB
	Qi+ROcXtFTenfzCB4IzLhLVAe7TwXL5OXSz0aR03ghKap7FNxnO7BUqKSRVFIutxL56LnyAQ4MO
	PX0egQQaWjctd2AxRQf64wGKeAJigVQjPqgQhYJNJW/Y+I5D+dXmL5hCljT9UOD02rbpMBQA6Mh
	MUM7Pg9FBoI46l++m/WyEPhTkOWiAh13wDc2mI7jyYCOWlridxDv4vzqRFDF1O+mrx1DX+Jd3Lv
	bzmvMSMi4k+hbIAT7O8QBq+GsQrkEkzH1Og/4NPVnyKhEVNikUaYL3yUPalAeZNte3WDkBuyiM/
	+VW5Ugy+h/FVTayTeAZ373z5JL7mS8z69UuRnhpVVtZkQ/RRBjZAD/LwdQ0BkRcIkpO/o6jnDjB
	u8Db
X-Received: by 2002:a05:693c:414f:10b0:386:cf0c:8482 with SMTP id 5a478bee46e88-386cf0c8763mr8462636eec.24.1795739695141;
        Thu, 26 Nov 2026 16:34:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 24/69] telepathy-glib: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:40 -0800
Message-ID: <20261127003425.2166632-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133124
Content-Type: text/plain; charset="utf-8"

The check reported 0.99.11 from the 0.99.x development series (the
never-finished 1.0). telepathy uses odd minor versions for development
releases, so inherit upstream-version-is-even.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb
index 6bfffd40c1..7c56b6a716 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "b0a374d771cdd081125f38c3abd079657642301c71a543d555e2bf2191
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-inherit autotools pkgconfig gettext gobject-introspection vala gtk-doc
+inherit autotools pkgconfig gettext gobject-introspection vala gtk-doc upstream-version-is-even
 
 # GCC 14+ promotes -Wincompatible-pointer-types to an error. This 0.24.2
 # release predates the stricter C rules (e.g. g_ptr_array_new_full callback

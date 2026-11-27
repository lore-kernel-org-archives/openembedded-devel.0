Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11774.1795762880229511087
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=niFu/iGO;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b546061d58so18008018c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762880; x=1796367680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMhI0VDRXyTrF+4C2bWSDnWdXMiXZ48cDUntbV5tmEk=;
        b=niFu/iGOARkJu4+xUmFSd51z2xy+D/DueJlGE0hKteg4hrWW4CjHdgUCtfXGc0KPxv
         dUSZZ6y9+x+SmN7Q4PMPf220tq1kY8e9uz1/dCNU7NcI9++Cam3J44cIIva7reOnJqCH
         M5eMlj9PzdPy0j1qDfo36aXAmfG2cxy+eXPNLjO09wZ4pdE5R8Ej24BwWUrcS4E0vNw9
         obidatpCMniD22S88432ySpeRsbYFYxn/wfQQumFbOtMysW4ubrt4nZSXxc5LlkQ66YU
         A6fDTna2I0gi2liqhU8b7E5qCf3JUY6RgzEbC9SCw2YV/EqvOn9tHDgoGY3Zeb/pGeAz
         yYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762880; x=1796367680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMhI0VDRXyTrF+4C2bWSDnWdXMiXZ48cDUntbV5tmEk=;
        b=qzSZdJSk05MYbXTDr2Vnska7OlQdxK55Iq2AmQv95XpgdPphQCn9yWHywahSW9Rtef
         BVACvF08E+yvfaHf4wX985/HVoA4OvlygEmIuLmPSwuAipzTLskpyVwl8OQsE0ORGHml
         0Mo6nlXAqt3k+Y2tWM8rTlYc2wJDAGDjwhxUEv6iOl6wObXIj674ogcGms8gmfWcUQkg
         4/T+h+P4RuL3gsU6K0PmXb5+sZFlUefjfoNgEWlKP3iOXTfu0Lpv7YqEenQWm3U6PvI5
         zWUml+4YZO47V68/baHQV3fEi+lruAAafLNUZ+T7G/quhjvED/E4+XEq7iu1oAsX297U
         i01w==
X-Gm-Message-State: APuU4Z/YAVrX9rxhY0rrY5HtHgiCjlE9kjcFV5TqUW2so5kzmBcSre7e
	GNnCMoQHOkno32o9S7ncA7Ht5/GHf7zNozHeZtBKwIWN2teGoyy4o9xa89cvqqLI
X-Gm-Gg: AZFdTZcolzfpqbR0XPP99bdyMsaZ+bw38ypKN60SaV7mmzsk5YdcNNPKXrgJIw0x/Me
	EQSHmH/038d/RvEd1ctKO5Dk868M45D85cXZ3HPBxSDOskJ1/oh2FeyPE4PLelmI80mI5vTncRN
	WcSS11hBzZJrARqT8qzUFpgS2azfsS85c65OaIp/QtQ3nX1lbnLS0TMgm0I8MKq1dViOBwgpS20
	DshbEhIWFdMlYdXe/qrHE2QfWhWZkPrU+vStAeDNccvzcyeDnV00th5QUrZecQRjNRbL7FtV5jb
	Qf/PHV8bQxFwceE/Ve30WxlRjB1kTg9foay4enzcyH9Dyvb8rOUhP9OXFhoko552JAw2OzD5RzS
	WooaaNiL9QzDJib3PmUmEb7scLTtI7ggyykpWETRgssTN/54hrYhmv2snKIPIKlLVl4X5zgLVm1
	PfqJ/daXCyQ75YkEgnP5nj8v0U+OenIpyRRMJD0cUd28+DlgIJcIDthgmRy+M2SGR53LkcLr2gG
	yGHbMHFDwj9emMb2eMTg2pgOlc7Pv+9lEUr7jXI0M3qbrEXZ9spRvGidXNjClP4MJS97rVFQb5n
	/K3oYQZsr303obVQdKLySHra1eYagz2D6V5tAHyBrYoQSiq5JUTTMAUavwHez1aGJO/gXqzuSht
	x3OkEKRzlBg9eyYzDbaPwnW5dYUga7++U/2fsh0J0cxDK159oqyf/DBdUmzQ+NN2cL6w+OL4sHt
	jC1k4mwsLpckuR6+saG99nrglo/oPFIghRvMOS1u17DZAeRe/aT3OFledt039UT/uo+G4lWGJ5l
	NEcCXt/MOiwiyDc48V0c6D/97vK91zAo/O+sqqM8UOn8bNmDAXk6QdQHNtgwoS1zAjCp5Eqz3qe
	r1cQJGSBxGQcIBH5Xl+gu7TbQg==
X-Received: by 2002:a05:7022:5f08:b0:1b5:23eb:530b with SMTP id a92af1059eb24-1b5568de6e7mr26121192c88.23.1795762879154;
        Thu, 26 Nov 2026 23:01:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 03/14] opencore-amr: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:01 -0800
Message-ID: <20261127070112.2273685-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133308
Content-Type: text/plain; charset="utf-8"

The SourceForge mirror URL gave no usable listing, so the check found
nothing. Check the opencore-amr folder of the opencore-amr SourceForge
file listing.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/opencore-amr/opencore-amr_0.1.6.bb      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.6.bb b/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.6.bb
index be7977308b..00cdad5175 100644
--- a/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.6.bb
+++ b/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.6.bb
@@ -10,4 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/opencore-amr/${BP}.tar.gz"
 SRC_URI[md5sum] = "03de025060a4f16c4c44218f65e13e95"
 SRC_URI[sha256sum] = "483eb4061088e2b34b358e47540b5d495a96cd468e361050fae615b1809dc4a1"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/opencore-amr/files/opencore-amr/"
+UPSTREAM_CHECK_REGEX = "opencore-amr-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 inherit autotools

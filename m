Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11764.1795762877501975646
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0tVvpLSo;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso10549578c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762877; x=1796367677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZ5ZQHIO1Rkb/7SuiiDJMj7lRUNKgBXo5LjG145QVyU=;
        b=0tVvpLSoLhRBGq+KKU8RLeyiFZSMhsfh18tQQCkYY6fU70zswDL0zGRqBfyInaPlwM
         bQOrCJuiTD5oYzxw76MSZkzMp1Eh2cyuWX4saa1QbHWeHkkbPECjMvkW5zjzV5U1h/gP
         cFIxo9MyyvZkLjzregxmYyDa8JwnwhjxZSlmItib5mGzikqk5AvPdp3dI3hklAWSmG3F
         Frr7eaaw5GQwxtqoquLcqQ0jOLlQrXhqELEz9ZEDAAbJzTUMqn91u/yHRCFMMIz++/MA
         +HkHF5htD+hc/8CEgt7sWFORdl2JTvh6AItRYDivjxC3yqkBt7JVyAuM8DK6IrCE4Olq
         pW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762877; x=1796367677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZ5ZQHIO1Rkb/7SuiiDJMj7lRUNKgBXo5LjG145QVyU=;
        b=Dx+phRWPSR6Exjx7W+qFpyrXxct7pXuSpA/fMeU6yEKH0FkmlbjBI+j7ZHZWLuxhrM
         OCKBUBn3LFnuzDLVdB5yUVx8vcAQd9iMOihlruyZGJhUZ0OsFqmO11xBdmURswaEA4jr
         8MB0d+CHjK9dvA/1o0IuILi3gHOBLXJxdTovTPTIAK9p94f/3NclhGJQj6sBA7HV3U7c
         eoi7nOU1sd8sWlaNoXbNqeZKKzSSRtLS4Dvv5cHv9Oev9dnXGpEwUiQItTaNH8ggN9Sm
         i8OzBzIAALymHH+A8nO8sTsQj0ESiN9371t0hHUM7RQUJpJpHAXAMixKpWRz/hDpR9kA
         QXUw==
X-Gm-Message-State: APuU4Z8d++PRVt9yeZ/h6zCj+pVRhiLw9WPIiCtrVizNUQ9Q+kj7vLRI
	rlDbab/VQQzrUU0XYEr+Zp6u0l0/8x/rWh8R7Wa+4D/uepyfDsJHiWjJEKR83h5S
X-Gm-Gg: AZFdTZdoLhZeh3t4T7myRIMY5U7IKMa92BdZKE9DbVj5fcPK1nT90M8WYQVQm1NuqCs
	Ur5M8DVkKlglyhkmYaBe51btiiLdX1Bm/Xs4/vQdhv8dTvJzcyccabnoLFps6ABIBk4HZGCwF3j
	x07t/+ycL874+/EdmuiEznliTzIp67/Kjw4oYSOHyDmLRYL8HmkYADnDxIx0Zb4+bA2MGun2yc2
	7qjQoIs2sO6WZ47jU76WiB8sa9BGupwa8I/m6+qt42bwuQf1/a2+3sFmcKqkQDy4USBC9UlMXIy
	0yeWPVCzNwceyVYiyH6bppXG7NCjKGLlHFD8SYe4mW3z9j4ugiMyMwNTqcEX0bsr04BZWsITTmR
	Dyt3aeZbtvlWAuKLvC2RsTt+Qe+0kxYeuOSKh47qb2a8f+vWmmEF1u3opdSwvFjLvb+fqreeZtS
	OZ6b3neE0to28dPqNHdpFJIfm+O5ECPZS7Gf2hs8SyGUM/tMZRl66+o+emXeOeOdv7iYr7jpkKK
	gCxiRMCsq/2rLbcBng+wZV44Sqi1TgL1b9SZ594atxvRwqTIqP6v/A1mbPHCh94FxeH6gkrNu97
	7sbXwkB6J4TC+Y+4XdSok3kH3YcdhImMDS9xNvvsH6koMOCz/FsduAzUclqqaoA29XOWcVj2aWf
	2TnHR+uzXEAAAY2QK6Hj14MvElDFEAASMIqLbnAV8JUOR0un+XXES9hle7rg6MF6jFZRmyse81F
	Eg5bqSRDCZipyGttvMyulKFG4+wUu5GWBRxFD0MBZXV65YRVLwGobOg0oKB3DWbeY92EicKgcKa
	KfUByduYA1F+ySvf42C84zFdaCO5pPp1786K0d8BZ+w8dpevfTLDuRtvxOVxaaVGD0Owgu9VIqY
	tNUA
X-Received: by 2002:a05:701b:42c6:10b0:1b5:49da:b969 with SMTP id a92af1059eb24-1b5568fbf25mr23819407c88.36.1795762876791;
        Thu, 26 Nov 2026 23:01:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 01/14] libavc1394: Fix upstream version check
Date: Thu, 26 Nov 2026 23:00:59 -0800
Message-ID: <20261127070112.2273685-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133306
Content-Type: text/plain; charset="utf-8"

The SourceForge mirror URL gave no usable listing, so the check found
nothing. Check the libavc1394 folder of the project's SourceForge
file listing.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/libavc1394/libavc1394_0.5.4.bb          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb b/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb
index 02a90c547d..442bac370a 100644
--- a/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb
+++ b/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb
@@ -13,6 +13,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "caf0db059d8b8d35d6f08e6c0e1c7dfe"
 SRC_URI[sha256sum] = "7cb1ff09506ae911ca9860bef4af08c2403f3e131f6c913a2cbd6ddca4215b53"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libavc1394/files/libavc1394/"
+UPSTREAM_CHECK_REGEX = "libavc1394-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 inherit autotools pkgconfig
 
 LDFLAGS:append:libc-musl = " -largp"

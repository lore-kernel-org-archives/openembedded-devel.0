Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3C44171D9A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v77so15738453wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=UnPw5Xl1FlHor4Tni37weOz3ZglODOIBkUm5TYolpeY=;
	b=RPY8Qv6CqPqsnOvLpityOQ2mY1eEozemt1bb/I8IjZxjmHEtojFnVG61TX2NEJsJIV
	EYVKsKyv2I9xlL2UxU7hw1XCfbh2cki6WV0/Izu76lSc3yPS7yVivkGATeKnxaGQd1fJ
	TtOzIv6ApnP514QkaCTm/T6ucti54G27XfaPj3YqoYZjcAGuBIRqBbhcbj/s1jrdoXB+
	DsqGLi0lDRqZzLFy5IUDc84fFZqVHLHQJi2DZbim5QxCwLF8+icxfNtYNGVBwdeHQgA7
	dFz7BxWGwwOD8vW1zPcaI7I776Fn8tqtciaQBUBN+znXltVQozuTtxfkSVxtGQbiPofm
	QVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UnPw5Xl1FlHor4Tni37weOz3ZglODOIBkUm5TYolpeY=;
	b=ng5CDYid2A6x4QWUdTwSZlGhx32WK0A1t0gj0yjCXoJ8TPPvUSFN8AIxjOLQpKTDec
	1GL9autRAgEZoOXpPcS//fnsklmP8joDjxhYqCA8seggBxAcIGt8HycspSXycq+l18CQ
	6EiUm+TXhmud5k18pPeuL+ulM2yBkXef6cyazdi45CW9/XJgeehagSEIp6Ip2jVB7B7S
	3x14DS30qBGZ7eYeHYVm61F3CoR3Z3PkDFrCCsNw9h5qLDDRzrfuCWaU06i6HFFntQBs
	CH/HcdmxVkOxaiNSM71F/BUd8PajyvhhtkhFe1nu4dkh7rqX3IRvDdECQQRsfmoEl3JC
	6Fcg==
X-Gm-Message-State: AMke39l75OSDEHvVPUx3tjbGi8x972Z0+Y/7YBqmIzUaVvl9nLGo7LsPAuhcmeZmA8hXLA==
X-Received: by 10.28.109.200 with SMTP id b69mr20811248wmi.94.1487614040869;
	Mon, 20 Feb 2017 10:07:20 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:21 +0100
Message-Id: <20170220180700.29836-6-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 05/44] libbonobo: unblacklist orbit2 is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
index a9014e2..8e00eb4 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
@@ -7,5 +7,3 @@ SRC_URI += "file://0001-Remove-use-of-G_DISABLE_DEPRECATED.patch \
 SRC_URI[archive.md5sum] = "27fa902d4fdf6762ee010e7053aaf77b"
 SRC_URI[archive.sha256sum] = "9160d4f277646400d3bb6b4fa73636cc6d1a865a32b9d0760e1e9e6ee624976b"
 GNOME_COMPRESS_TYPE="bz2"
-
-PNBLACKLIST[libbonobo] ?= "Depends on blacklisted orbit2"
-- 
2.9.3



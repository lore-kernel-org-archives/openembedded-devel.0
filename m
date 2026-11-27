Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8070.1795739698675754262
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nUHKwfGA;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386ab9ab619so10130823eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739698; x=1796344498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef245jQnwlvfUtxA7kUM/DhdabnwGjcQVVdmZsCTWdI=;
        b=nUHKwfGAhD92W80KWpgqndPQ/gtoqlXRBHnhpe7rtDEbT8KwUssXPlL07L8radOJab
         44O3FCymA2mACTns5GDFpjHwCOOYzPUkmG//Q9hJILFwiLXYtg0qpwuYRGUh/rZcUFGh
         3QtuqOeNRtu7+t4h/VjiWzgcG9HvvpjPhdFOWUfq3P3zn3y61IV2VxmNYexwRBwVrZge
         U5UN8zQXNoGgVNuqe5BjZkAgxvK//QUeywxNWWSr4Fkn8pvwg6z35hYYdQO1E0JewsTb
         3GAHAvoZj6PEAK730Ivi3ZRSOE+Q50YlGfeqkN9UFO94V9NMtWIGY3okmR0A4X39+SS7
         0rwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739698; x=1796344498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ef245jQnwlvfUtxA7kUM/DhdabnwGjcQVVdmZsCTWdI=;
        b=1zlTtfHbWoSvKwL27a5NesfwrYKQMk6fTaaLnUvHFK+2qmYJZQj8K8CSrkxYmuErso
         JRlRpbocNxKrVOpEnXXsxYsJNHHSk0WnRixdnJAlSdbDv0aDuo1lUbiUepZj5rlDG9Ux
         LrdRDeXf3661153Cba/+SeIqszgAbSmFkhsECXLy6QjivGdLnactR1wrWGYekSTJi7iU
         uvKTyy+3TyHpB36kkPTl9eIbAumOl2FKo+kWalxVHdSd5qTiSEPhY7GUFKG7CLxiOJKb
         Y3IOiDLwOIJaEkmR2Ieb+3BqBNjLGyXYfstMMFZf1Jh2eBOAhcKnSwBekusUbbG4R6ia
         /XhQ==
X-Gm-Message-State: APuU4Z9tZs8XgFYpLuVQ1DDzrC4RkkQqSlCkdzZ+U82q3S+ZdVikeUFs
	tDrYoCRZTI/lWksn6W9hKfInbPEkTmO7ms81BVTZmwhw0kLW9axt/x+Nv/lzp7ps
X-Gm-Gg: AZFdTZfts9iHpOQNfgA9JWGMx+GefgmS1bnHCB9NPRzvMvasXO313eblEV1t1Tu0DGZ
	r15YO4ETB+Z3XkJQh+afQa8D+iOzNR8d2c2331doHCTbEwTxQi6ZNes453K9bacJoXLX6JTq/Zl
	4ftS/q9RsVJrlS3JO5T4QK3JjFQKqmJjuRPHUi/jvOqO360B8D1+2cQZIazvNCxJeE4t7Y56v82
	SS3T4Yu6WCIlMDqqGOTKBc4kLg6RrNqibWpLPGYHTu3jncQdi6yzrbL4rUTTg3Q9B910OoH3gAB
	uv3BCE6GmloZKlNV9ZTZ9ikg5B/m0ETWyzEqn5ZtpvBp0zsp0KrTmgWdXWi3zGR1ApBInkL8hiH
	BmASSeUK8BQjs67+vJHax2VEpEocaBU2Oo3l1/+KoV418XGmbSS5heaAHFdPpo5b9GsSjbFFcFK
	XHuMEC90xeDEfYiGDMLgdY2TVP2RiDgM8h4xrQ/K7JUmBptkliJU1KFWXCDNLIaqAl8gq7xLOAD
	p2sE7YzZY9fegXKGT7TFiXnsqZlxJEY2slv8WY5ETMua52XvUBhhr6zjE2moqDdVY9y7iKwZp2E
	NVhHpcfMazpyMGNCpXFk90plb1IIAbFh4Nl3I+6irXoA+BXu3OJhGP06Vb0n3hro8Ye+yV5AlT+
	KJtT9sVJ88fApjp2f7Ybf6BIPTeC29BAsJ+wr2VHQK/0eJuwDdZYiUURxdH1xkeclF7i5gnAeUs
	tthPxR16e8md+g7vAxE5bNXFIZgCuf/KLOWhtHF6HS8CE9INerjrk/B63z2lBITLylB2IuJ2TBz
	PDVonmmXKfK7rgAAO3I6VUD334901iEH0KI+0P3Zjz5YFW3yMP0Qv9vJRf4zPYgb92wjkHvcvE5
	1ao8
X-Received: by 2002:a05:693c:6010:b0:385:849b:7899 with SMTP id 5a478bee46e88-385849b7adamr26650298eec.4.1795739697979;
        Thu, 26 Nov 2026 16:34:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 27/69] gtkmm3: Restrict upstream check to the 3.24 series
Date: Thu, 26 Nov 2026 16:33:43 -0800
Message-ID: <20261127003425.2166632-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133127
Content-Type: text/plain; charset="utf-8"

The directory scan reported 4.25.0 from the gtkmm 4 series, which is
packaged separately as gtkmm4. Check only the release directory of
the current series.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.11.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.11.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.11.bb
index 7710ac9a8a..e57bbe07ec 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.11.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.11.bb
@@ -16,6 +16,9 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI[archive.sha256sum] = "19e383c82d5dd89db275e00b82864e90414d4c3fb3d100b2f996bcc2338a4cc7"
 
+# 4.x is packaged as gtkmm4
+UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/"
+
 EXTRA_OEMESON = "-Dbuild-demos=false"
 
 FILES:${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"

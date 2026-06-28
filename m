Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB607C44502
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:59 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69161.1782634372416727216
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=El6NR97W;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-13809223fd4so2845647c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634372; x=1783239172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CQcphENH7DEhxlhpY49o8jigjxXKzKU2rUn+nnBack=;
        b=El6NR97W08DgmnqMSs5BD+c3JV5pa96pWNu0QfvFVkZtW6Fhr2NeetR3ugRmMnPnE0
         dhc2SSHus+CEqtptpTCiNNwdQwvpXWzxQiHJyhctif/USa0mJCFwQeXk71eVSY/W8Ugl
         fhk6IVUzGN4dPkPQqgwOpSFboHCL1lvQtb7OR+5B82KKn6Fkxx7w6rQVrmmtPA8iSe++
         PduVrZyuUCkgCM8yXRTC8SZtkgfkChjuQFzOAOcRFzcNQIlVeMy9hwjfmBu+unlMNfsg
         zgqS2l+EXZ4/DozO+eCySFafgxIPU1J2MACrJJtvJ23gbYc0Eb/N/wQuCN8kw7ANvcIb
         iKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634372; x=1783239172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1CQcphENH7DEhxlhpY49o8jigjxXKzKU2rUn+nnBack=;
        b=NQ9i9VxEsueAWp26wa4yrMUw4EwPlf9pXwYfAKQGelTvBm//mgC9raoYYr1DVIbvAu
         4RsT5QUvM8D4Cs3JlWz8E7enGuY5hwpJB+hAqsGeEVDwr4ECN5G52eTHGzxhch9QwtCa
         6rkqztygHZFTAsbfaqkvKUjjCcDVv7FoiKdj5hTpy1hXDaI6brD71w10NIg+NOWEZvMJ
         54nqaqdjFEKzkLkeQJB6Kds6glvtR6f2y7BlvMRUh4YJQfUSIESSV1PFVjTQfImE5qSl
         NUCM+zQfkj2PsT4uZDv1hA+ct/KpJHEXWnExonmyg8lEOei5gq0xP6dxba7d89wmCy+Y
         Nw2A==
X-Gm-Message-State: AOJu0YzTBhOfkFC0pSojyWRnfmaUMZMQK19Xot3C3BbOAkzgXJDavL4w
	j9dHavMmvn3wrIZcAa9XHKosN2qtfsVGHRrI60hRO7kYkPD5+4Un7lLCqt9dJ+UbMoIpjA==
X-Gm-Gg: AfdE7ckA7mfPruUH5rAOajsiYybsOnLno7ml0w/CQ0HnAWnGHilWNrmAqyC9JJq1RDo
	b5EmtZDUIjZnJNH3D6aFpbjeV4pWAb8hXdA9o7qkx+sawOzSQM8Bq4kz3BTo5nSB5k3CP6tFRYo
	YPw63Qde3t7qffJzL+AwJDNI2NBHwAwR5bOITwKPPqnaeeMOO+zVe0PF8D7DqsWbeoHxtThFUE0
	cNMEQPTvvriXZdTMOUSaSuX4N98poBU1tzZmv3dScsSrA6jMuFf0apy+ttToJLH/XzFXdD03u6c
	jusNRcc3mXOSFNyP6afYWl3Kb9XbSvPSuIbu7zt68hPiIsoOKXuruJ6fapI5ZAmQjLHgeoqpsRO
	aRfAjkU+MCVzthYbljQ8MdhG1CosSB6uJS45NZoHLJNGzst5daEO6k+XoTtVid+Me4szddz9iGD
	g+iYbmS0Ocw5NtK70dEoA2XxmOlx0CnczFqGR3g7MNehIeMGt/gZwqWeZ3jQ66U5Y1cbejbDyom
	WhAI7e+xoLtdY7iUpZgEJlNtBAQKEvhNRcD0lBMGkgCROZAE2NB8MifKBWmkpN91DIh6Esat61W
	vPbbE23ohHbNjYP1wogboVvajw2pHg==
X-Received: by 2002:a05:7301:4e8a:b0:30b:d865:4bd6 with SMTP id 5a478bee46e88-30c84eba981mr12623371eec.22.1782634371702;
        Sun, 28 Jun 2026 01:12:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 094/128] libdata-hexdump-perl: upgrade 0.02 -> 0.04
Date: Sun, 28 Jun 2026 01:10:45 -0700
Message-ID: <20260628081122.178348-94-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127904

License-Update: license POD section relocated to lines 277-279; license text unchanged

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ta-hexdump-perl_0.02.bb => libdata-hexdump-perl_0.04.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libdata/{libdata-hexdump-perl_0.02.bb => libdata-hexdump-perl_0.04.bb} (78%)

diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.04.bb
similarity index 78%
rename from meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
rename to meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.04.bb
index 961478c15e..7f9b426f3d 100644
--- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
+++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.04.bb
@@ -11,14 +11,14 @@ HOMEPAGE = "https://metacpan.org/pod/Data::HexDump"
 SECTION = "libs"
 
 LICENSE = "Artistic-1.0"
-LIC_FILES_CHKSUM = "file://lib/Data/HexDump.pm;beginline=215;endline=217;md5=bf1cd9373f8d1f85fe091ee069a480e9"
+LIC_FILES_CHKSUM = "file://lib/Data/HexDump.pm;beginline=277;endline=279;md5=bf1cd9373f8d1f85fe091ee069a480e9"
 
 DEPENDS = "perl"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/F/FT/FTASSIN/Data-HexDump-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEILB/Data-HexDump-${PV}.tar.gz \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "1a9d843e7f667c1c6f77c67af5d77e7462ff23b41937cb17454d03535cd9be70"
+SRC_URI[sha256sum] = "bc36f404438ac36ad2b9295539227d36f99cd1623f1e347af77c594c40ccbcf8"
 
 S = "${UNPACKDIR}/Data-HexDump-${PV}"
 


Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 69DD57F304
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 06:46:16 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id z11so16110205wrt.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 23:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=g3HviAOrAzcb8hPkqbiyngxH3melOsNW7d74gCtKn9g=;
	b=llOaUDThhHhOAfhCGxfpft6bYUVAMbH8l6bwhu/EVwJt2Z5l4ia6mymJK8dYXE0PnC
	SwpKoOu6qzsZwz+lxSK5pA1PlKWJpxNXAChLevfZR05mMSbnOqTYT1aO8LjBUK9poMSJ
	gUw3kPW9N97Mdv/BzQzyGuuCoYMkJU+w/hiI2lM6QgEEWVlR9z0xSgyd8KwKMMeV28nB
	SNXzZtZKZQtw5T6Hr5xJ8bIt9ISGooEVq+O8KFwU/2xxIFWS2guS+CLdQOZlFbOM6rp2
	aDh7sCYyejWqOl07a8Mr7LzWfCoyRDxTVC1lYfdQKVcY8NLAEXl4gMdRCMiBjABrVutA
	cZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=g3HviAOrAzcb8hPkqbiyngxH3melOsNW7d74gCtKn9g=;
	b=GJnjkYUY1vjeI2iN+A8g+22VrLo81VAcy2vTfp7JzLs9WQlCsfDzBrm1Y/ZqbZk/tR
	E2f+wyVoq1zI616e6mmXzcFVliy51bUe92gOpIJpNDh8ksdM+nHG0NKpsFbSR2vwl3P8
	6nfMAuKT6/bZfzdmchiEHdw6UHwtrCOhIr665i0LaKWHufyLKI3ydWgo3ME3MCgucNUs
	cMoCJNFjkuRtKpGE6YVnc/up9RlHjeE1t7uDNio+Zzj81eeMA+z20aRmoBZqZEzyACg5
	yBnp9biNPutvYGqFji1557KsrEgl/Z8QgeyHQ/V4JhG2KEr/FmbbtWEAkhklVo0wL9zU
	JbxA==
X-Gm-Message-State: APjAAAUUL5yiwpdEfqJLy5iblcPHLIUxhfEHsdUHgpkrSqfudLTwALZY
	OcrbxdK9hDXqPwoN9PnVODx4Ly5s
X-Google-Smtp-Source: APXvYqwu/h/UkxbPA3izfOR7VEauF4QYBM9shIOB2KI28plEkLSAidGRKYPGkI35E6Faz9pu9PVV4A==
X-Received: by 2002:adf:cd8e:: with SMTP id q14mr39963576wrj.187.1567493176783;
	Mon, 02 Sep 2019 23:46:16 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F02A21973D945F5DCDB0D0E.dip0.t-ipconnect.de.
	[2003:f0:7f02:a219:73d9:45f5:dcdb:d0e])
	by smtp.gmail.com with ESMTPSA id
	f143sm9121245wme.40.2019.09.02.23.46.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 23:46:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2019 08:46:03 +0200
Message-Id: <20190903064603.17637-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903064603.17637-1-schnitzeltony@gmail.com>
References: <20190903064603.17637-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH V2 3/3] xfce4-screenshooter: upgrade 1.9.5 -> 1.9.6
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
X-List-Received-Date: Tue, 03 Sep 2019 06:46:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a bugfix & translation-update release

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-screenshooter_1.9.5.bb => xfce4-screenshooter_1.9.6.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.5.bb => xfce4-screenshooter_1.9.6.bb} (76%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.5.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.6.bb
similarity index 76%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.5.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.6.bb
index 9f8f61a4a..7f6756fc9 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.5.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.6.bb
@@ -7,8 +7,8 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "0354811cd2622d3de92e342c7eaa184d"
-SRC_URI[sha256sum] = "bf35b5432cb920987c6d7ff193600e5dd4d73422b6aa02b4ec5288744053b38c"
+SRC_URI[md5sum] = "9e4026d9ae7850b290992c9d2aea80dd"
+SRC_URI[sha256sum] = "88c174ce687d1f7ba5470d6ab5784d33dc215f8f220211e892e268189dbea658"
 
 do_compile_prepend() {
     mkdir -p lib
@@ -16,7 +16,7 @@ do_compile_prepend() {
 }
 
 FILES_${PN} += " \
-    ${datadir}/appdata \
+    ${datadir}/metainfo \
     ${datadir}/xfce4/panel/plugins \
     ${libdir}/xfce4/panel/plugins \
 "
-- 
2.21.0



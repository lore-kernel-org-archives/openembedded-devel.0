Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id BB3C97608A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:44 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id p126-v6so10525535wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9QH/67mmNVEjHX58pVPcb3fnz7DqlP09hA+Au+3b2CI=;
	b=Hz6QP41oeiuz/IPy38MUegUUvlrjPmb0uOXDRd5+gQ8bdkwW6mT8CoS/nU+27CBTxA
	z0H7P0VLvlhp/Ee8kzD9YxzP0z+n93xeJuY2T8KnpNcLFVtURnfGVnfyHXZEuDmvmHQo
	nFbZ+5E4v1uzsr2W1b183hfVzi7/nmOMhRUOJhODP4qMMNCImyHiUYLXXQmMuUWnVADR
	KvoMtMl9zztTvIYWAp3OCFxc7L4oH+bmYt7WHmQu1y4WKsaDd9HFtM9pJnl6QDgy7CFU
	hIb4isjUuaE8+TJ+rTR8QkhYvrGuWonJAsVBLxCqJoSnPkYNYRKub1apFwGg9jWnNJ8d
	jLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9QH/67mmNVEjHX58pVPcb3fnz7DqlP09hA+Au+3b2CI=;
	b=mDPTGdIto188pe6Pe+1gCgPqplEkl2fG5ZhU4U7OjCWLazfIpJ5QBY8gkeAwlxUlft
	QzDl0ho36/Wjis4CLxw+90RJxD8GnlE3yqRE3rzOzvLTxKRfA8LoSn7QMaxnxxO1tXSZ
	yASZSaORDy61kfjfakKaF4ctBrgs1VtsTgPv0kZrzCcBz7ankUFGwfjHzxC7VG0W/c4A
	c0bakEwA4Vu8seI/K74OfaWoVHPt0XzGb583ppFckO6sxfHuIyp/gxdwV3EveGCYinae
	ePjTEmrm7u/WGvKc3LsOTfbAncCOSaTr2Pb4F2n5WTM/MKLUQbCnwdapuDCNZMpl0LtV
	ZA0A==
X-Gm-Message-State: APt69E3Gkl0LgtwIv23BmqotQNWzzsdr7IaJ8lNDxkhgpu2vUsxC0+zy
	HkDu5pMq46kFMU2gLqOU/kAJug==
X-Google-Smtp-Source: ADUXVKLMiPfvhJKIZRazBfThmerK7ba6iCyswveJk8q3118JeHgJqDKehmOsZxkyfaqN9jYQzeckTQ==
X-Received: by 2002:a1c:e055:: with SMTP id
	x82-v6mr5566823wmg.155.1528643325125; 
	Sun, 10 Jun 2018 08:08:45 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:05 +0200
Message-Id: <20180610150821.9536-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 03/19] xfconf: upgrade 4.12.1 -> 4.13.4
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a development release but stoppers could not be found.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/xfconf/{xfconf_4.12.1.bb => xfconf_4.13.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.12.1.bb => xfconf_4.13.4.bb} (75%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.12.1.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.4.bb
similarity index 75%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.12.1.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.13.4.bb
index a42426fa1..b69215064 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.12.1.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.4.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[md5sum] = "20dc8d2bfd80ba136bf4964021b32757"
-SRC_URI[sha256sum] = "35f48564e5694faa54fdc180cd3268e16fc2352946a89a3c2fc12cbe400ada36"
+SRC_URI[md5sum] = "200d46c4e5a6019bb2b1cc3948b90c9c"
+SRC_URI[sha256sum] = "4808997894ad9b6bcd39b0e8c609129e60d204c038d4edc4e9b8c55ea2d094c9"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
-- 
2.14.3



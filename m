Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 19CF678A77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:40 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id w12-v6so1866514plp.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jFRVbs+X14yvGWMWGFMeut4khW7ZHdPHopexKFCJJE4=;
	b=Pr/Ic6bG98Ch9/q87V12xquldRa3Vft54H+B41QG28j6xkh18y67XutiwrTb7LEmVY
	euI0QHRAvcmVLKgHqd3mKFZtZECl+ySnF+scQxVb7+dA2sOO4ItherBTIiQ4rl9Gievt
	VqA05tx5oxccha7SCZdvHtVeL2SvRVxUttwMRCZGN6wmzgfwO3P/ldWW9lJifx9uS3li
	cFxgDqmFCYP6gIkRz8WUmYhIx1Z8CscoWpFQkW/Zq/7TkgehbPA87eQfxeq4TxeA1/IL
	OzAMijZfC+8CNKu2QliTCB6vbgXWb+/o5ilxt2DMnLYt2UE29pyxAK3z9zXgjWj5Dsej
	k7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jFRVbs+X14yvGWMWGFMeut4khW7ZHdPHopexKFCJJE4=;
	b=gZxlHBh1U8X3fj8Ky7Mkw3PtD3Q6L56QgPvHyr5k/Ull357nXKAS2JLomGbM95IgN4
	WX9JGRlPMxYyB0JfgcTSJn4SZ8xWDDPqrc51IBoTdTw88SCJ3ipw6I1a3xT2SLAKodqz
	fwnHuOZW68Zudjl0aeA0CQQtkC5gPVDM8V5gEskBxt1lqw6Hx7pTQjosB5bFnnD2a/O6
	G7qxLi/uDZiorqiYnQKmkXtMCEB5J4sJCF4DyTzo168drDkvuEN/3vnIoi2ruf0J3D2G
	yhBt4pwYpxGs4hWEkzB1mKFy3gGTCsesqAcl7u1b18cvl0l44OSHiZgBS+/KgP2ztL4n
	vOjw==
X-Gm-Message-State: APf1xPArVpkk5hzT3TczMTswSZ6yxiLhZe/FZl1Iw6JRdKXo/wHfqesw
	T1yhEWYmU7Di0dPcmOpOVv3tgA==
X-Google-Smtp-Source: AG47ELtwajEZUiMCONS70uL7gZ+OjYwlYargUvZzXIQDgD5T/TD+e/aOlEhRnvaquget7N7+m+K2kA==
X-Received: by 2002:a17:902:684a:: with SMTP id
	f10-v6mr21900694pln.129.1520449301788; 
	Wed, 07 Mar 2018 11:01:41 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:12 -0800
Message-Id: <1520449275-29492-20-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 20/23] libgnomeui: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:40 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
index b78ffc5..ff8a680 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 SECTION = "x11/gnome/libs"
 DEPENDS = "libgnome libgnomecanvas libbonoboui libgnome-keyring intltool-native gnome-common-native"
 
-inherit gnome
+inherit distro_features_check gnome
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 FILES_${PN} += "${libdir}/gtk-2.0/*/filesystems/lib*.so \
                 ${libdir}/libglade/*/lib*.so \
-- 
2.7.4



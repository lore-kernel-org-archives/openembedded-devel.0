Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9017B6057B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 13:15:09 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so24984759wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 05:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=ZLzY/0PUv6iq2we/Udffpx253pvzEYuzo81KYti5C7U=;
	b=ylZYTXEigloCR8t34OIRmGOJxQdlaRxMO5zD6iEeAL9k2XWq5lA8lbo6VmInK1cTUR
	/DBFB0fX2IdLpzEsJJu97QKuSVwNr+53TE3ka5lt/+p/fSpUiS1yrzRjuXvgU1E5NtZe
	MxLUx7AEUMQMC2Darqu7uisJ8EFQTJlIx0kGoiax9qgvULj9/Ep+AOYW09HWWS/Tr021
	DcFZsCDPNrp0KfrnevfJonUOnNG0fuNAMr/8WRlxq+qnWuEZQC24ctUWi0BFAZhAAVg7
	0MZXWef4NID2KVxslXduPVpND0uaaUhLeZ0rTija/VLEdUv6D/nCFg6CPUEFiREBp2fL
	vHdQ==
X-Received: by 10.28.132.9 with SMTP id g9mr11289039wmd.0.1447938908549;
	Thu, 19 Nov 2015 05:15:08 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	m135sm3169617wmb.0.2015.11.19.05.15.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 05:15:07 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Nov 2015 14:14:55 +0100
Message-Id: <1447938897-26171-4-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1447938897-26171-1-git-send-email-funman@videolan.org>
References: <564DC01B.4000103@videolan.org>
	<1447938897-26171-1-git-send-email-funman@videolan.org>
Subject: [meta-multimedia][PATCH 4/6] VLC: explicit PACKAGECONFIG for freetype
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
X-List-Received-Date: Thu, 19 Nov 2015 13:15:12 -0000

Enable it by default
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index f93daf0..af39ae6 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -43,7 +43,7 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
-PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig"
+PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
@@ -72,6 +72,7 @@ PACKAGECONFIG[svg] = "--enable-svg,--disable-svg,librsvg"
 PACKAGECONFIG[svgdec] = "--enable-svgdec,--disable-svgdec,librsvg cairo"
 PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
 PACKAGECONFIG[fontconfig] = "--enable-fontconfig,--disable-fontconfig, fontconfig"
+PACKAGECONFIG[freetype] = "--enable-freetype,--disable-freetype, freetype"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.5.0



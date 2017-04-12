Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F83C77CF9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:56:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x75so8663733wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LILZohsaqi+6qol+Qz4NTZcDpeGaiy76tSVVBUaAkNw=;
	b=Qn5icOd1hKXfQkZgN/m2pLdxlxPx3//YgX1sT7bIq83DGufWDnjR9X01EGsdd0HGXp
	EevFAIU9O4eGNW31qpd6sjEcPOPu89zCaYsWHXX0eZi609oBdQ8nPr6eASvzqo6l5rJ+
	ti4ytAdVlRP1HIYnzyTJeZUzyIy0WqXjSiLBSbF/bTpWrn8V+9/+2j6qz1Gisw7Z3Q26
	+vWHL0MrdAUMFja614ocqnCWCDyR7KjdEMSyRsGoH9QMsoNGvz3CTh/uLjPtpQqv/04J
	i0Qq/ferqE2VR5re9g+2u1TSBARrdGlKEfjMsMHshAw56/R5FbbU+Gyv59y+v/I/p99r
	tSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LILZohsaqi+6qol+Qz4NTZcDpeGaiy76tSVVBUaAkNw=;
	b=A+gSfAc8tw5sEvPAjKqMezzeykxr84yRDM8Y7+PQ848hUsMzwwnA4K8HdBVaGoMBoH
	SThuWVGbWgDS4+T8v0olBQ65mpiaTMKx3iIOYzxrEATX3wdY9y+mT+9tj5zLfPeSPsyD
	gFo1TU7N2ru+ANSug/ajz0a6GBr5NFbvgjQUK5NtRkbHRbIhNFevYV3q1n8xLdcW+oPY
	JtY24lySys0q9ISIspaNmVEK6dvnnDkRkwgq+WwoqGo+RFlRxf2nHag49maEHiJiMlYt
	vnIq+DQe3G4oYkC3v5a2jg5aqVyeCsq7Hr15EVtEkS5e1DL6DN1k7eJWNhRS9M5dtNjv
	zGNg==
X-Gm-Message-State: AN3rC/5O9kqHYidbKV/+uhij1GI3TAKQ2tOpBbPrTQN/5QkEL+NqePQr
	K6UzzuQOJmJVDjWU
X-Received: by 10.28.134.66 with SMTP id i63mr22880897wmd.84.1492027017614;
	Wed, 12 Apr 2017 12:56:57 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.56.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:56:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:15 +0200
Message-Id: <20170412195638.3243-7-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/29] xfce4-notifyd: update 0.3.4 -> 0.3.6
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
X-List-Received-Date: Wed, 12 Apr 2017 19:56:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-notifyd/{xfce4-notifyd_0.3.4.bb => xfce4-notifyd_0.3.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.3.4.bb => xfce4-notifyd_0.3.6.bb} (79%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.6.bb
similarity index 79%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.6.bb
index 9602ac8..ac2360a 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.6.bb
@@ -8,8 +8,8 @@ DEPENDS = "libxfce4util libxfce4ui xfconf gtk+ dbus dbus-glib libnotify \
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "793490b488c3c4a3f97d644431f048d8"
-SRC_URI[sha256sum] = "038535de79b7056058e8d6dceb457959949831853c2594a686ec68b037ae31bf"
+SRC_URI[md5sum] = "19e602fa5e33afaf7563f069261ae1db"
+SRC_URI[sha256sum] = "f4ca7c0dadd3d4cdf8cd3c8ae60ccea77b8cf409f8517161796364eb1d766cf9"
 
 do_compile_prepend() {
     mkdir -p xfce4-notifyd
-- 
2.9.3



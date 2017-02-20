Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CA37C71DEE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:30 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r18so15743975wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=m/m0IKELFtAiFcpKqKmSNJjrzzHiOKhWcebqou6KuEQ=;
	b=paldOXoH2MTYfqqIgpa29P8AF0dwIMJ18QSxAFCrXZ/mfBh8StgttvTS33yfpoFGGa
	r3JauOfPNiLfex45BnqvhhJYQnTQwFWHOSwclqLilMWIfQ+BR8pQ9i3+ttLBpj6KgD0v
	9TcylK1zjTiQ653h6QtcTtBCFW3iODaNDcWDQmcIzhVzFgItdM0WNGUVWei88RIb6DGD
	LIfVBdp5yY/rvwO1sc7tQDJoiCkktlHxCRh4fXib7jLZJwXk/bbwmoo/0Eoeb5X8ebG/
	RaqCXcrixtsjsD+QJ3RQCvX1VwBHEQk8sf3UURUWxWZ5Q/wSV+IAHsps3a/oJMpcROVu
	EUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m/m0IKELFtAiFcpKqKmSNJjrzzHiOKhWcebqou6KuEQ=;
	b=MPqsVIN+obwLY+0TEx1gF40SW2XXS6v+NW/zs9mm3hiD+LOFqexeUUOHdTCJKw0EB2
	81AwgYxS9QlgkgSBLNQtY31XkSosHW7Ejb9qeuJLy4crSHd7P5G7GZUwTTc3xashLp1r
	51ZlZRpeXLrdeuhWimAVKZKq+JnSO7tfnw9CBnXzveVHfLC5GpagKgTG85qDWEY0YrSp
	7JaGU5GE2Vto6j63TN3SyNbpjEE4fhEYVCOWhUT5YwGtc6nM521L+4YsySRl1Vr3iQmi
	y5eTdKpfWwBDcN8gcCZFFkpCu0Ee/pthxT3pzpEe19YBl+fEDxyuk6PMEmy5m8syTxud
	dVcw==
X-Gm-Message-State: AMke39ktRGiZRR6A96k5exPdhNugbc7LDY3o9NgqvhHQBvqHEzLB7I85aPJmLgfxNJWrhw==
X-Received: by 10.28.45.213 with SMTP id t204mr20864377wmt.113.1487614050457; 
	Mon, 20 Feb 2017 10:07:30 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:30 +0100
Message-Id: <20170220180700.29836-15-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 14/44] libgxim: add glib-2.0 to DEPENDS and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
index 26da755..44b7531 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -20,8 +20,6 @@ LIC_FILES_CHKSUM = "\
 file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 EXTRA_OECONF = " --disable-static --disable-rebuilds --enable-compile-warnings=minimum"
-DEPENDS += "gtk+ glib-2.0 ruby-native intltool-native gnome-common-native"
+DEPENDS += "gtk+ glib-2.0 glib-2.0-native ruby-native intltool-native gnome-common-native"
 
 inherit autotools pkgconfig gettext
-
-PNBLACKLIST[libgxim] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130604/"
-- 
2.9.3



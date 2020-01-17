Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4D6A57FC39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:26:35 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w15so24105040wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IOddD+/XiMlKZt64BBDT06yUSgxmB6Dss1y+C6mGbIU=;
	b=mw0sLOzko2odEmax9ESpil4UrRi2HyHWvKGoLT//Ny69c6VLvfnd0FbaopK4whikIB
	SWOv6R8LoZp95cgxsNeHpT54Z/lS9VAOwMQCdI3TGHjbUIirlbph1f4FWXL0d9V/wWUW
	SsmI/pjfDfcCqf/k2XJWeGVvZCLhF6GXAwPe0lzzO19yItMEnMzOFKypa7ED7pntQmJI
	tsWd4o8mFXkQAJJmw5vuOF8VE3RNbFdpGWFWAB1orPPLMV+LX1u1Hq0nXjg15otNsSPT
	JZLrHujnuBu5ghwNua8KxrJuwLL5zoLdckk0p1uceXSCAgrnVt4IAWNxVShvAd3iHss/
	ufXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IOddD+/XiMlKZt64BBDT06yUSgxmB6Dss1y+C6mGbIU=;
	b=WBP+SfJCY2/xC+2obRNl5Hz1tdTjCYx5eWpaUJd+xqPZF4nRHFo7G8KVRXEdw+55SB
	9N7X0rd44JalzlhQTxoaUwUY0/4higSmP/uxO5RazPJnLsmhszfW5ni+8xDug0AC05Mh
	Qe67MN6Qc66NxgF5cy+7nwfbfhhjJBNewpFQGpWDZRqLRdLPWDxT5rACDpvTaF8/1W6p
	sjPNAXlrwmRQhcb3wqZXzkT683BQM8IY5y/vHcHS+rbyUjytbANARo6Vk4MjrvrSX735
	IDET3pSVJHXrmtWV/Djeb13zLlbmpgn8F+Cqm3S4bn+hxUSn/wkRbH3oAo2u8X2oGeAB
	oFlA==
X-Gm-Message-State: APjAAAWH8lEg7vtMgOJ4X66aofff7KeEFKencXIng2qS0lZEMRzDinhN
	Y1eZ7iAKKOThRn7bCVdr07BwDJut3tE=
X-Google-Smtp-Source: APXvYqyPddOiE4N6GjZEdmHXHdrQUs4FZ7Dv/kEdQNK5jZ+wzyRmAvUZl4YbqiO+BiRC+6/VlWNM3Q==
X-Received: by 2002:adf:f501:: with SMTP id q1mr5206894wro.263.1579296396046; 
	Fri, 17 Jan 2020 13:26:36 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id f127sm701415wma.4.2020.01.17.13.26.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:26:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: kai.kang@windriver.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:26:11 +0100
Message-Id: <20200117212615.32526-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212615.32526-1-schnitzeltony@gmail.com>
References: <20200117212615.32526-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] xfce4-panel-profiles: upgrade 1.0.9 -> 1.0.10
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
X-List-Received-Date: Fri, 17 Jan 2020 21:26:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.0.10
========================
New Features:
- Add openSUSE profile
- Add new error for invalid configuration files (Xfce #15983)
- 'Current Configuration' now pulls the current panel state instead of
the state cached when the program starts (Xfce #16114)
- A cancellable warning is now displayed when applying configurations
(Xfce #14559)

Updated Translations:
English (United Kingdom), Galician, Hindi, Slovenian, Thai

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...panel-profiles_1.0.9.bb => xfce4-panel-profiles_1.0.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-panel-profiles/{xfce4-panel-profiles_1.0.9.bb => xfce4-panel-profiles_1.0.10.bb} (82%)

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.9.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
similarity index 82%
rename from meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.9.bb
rename to meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
index 9c9ae94fc..5b5a286a4 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.9.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
@@ -10,8 +10,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 DEPENDS += "intltool-native"
 
 SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2"
-SRC_URI[md5sum] = "bee3e251e45ade0ea349366461d6e200"
-SRC_URI[sha256sum] = "a8c00af838e85d00600dbf442c8741aa21a332fbceba849e0820560630a6e0ce"
+SRC_URI[md5sum] = "6190678bc701c197babcb2389ba46182"
+SRC_URI[sha256sum] = "a84d5e748d53bc5da269954cc3ad7f5ac0c4f5813acfd3892ea6f9064f17fb68"
 
 do_configure() {
     # special configure - no autotools...
-- 
2.21.0



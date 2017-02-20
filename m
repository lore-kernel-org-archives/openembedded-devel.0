Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id B7CDF71D87
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:18 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id s27so3689153wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IjxyJ3sUpfcF/NPFwXeA0lvQp4PbuHyc45xcFD4IGIE=;
	b=YXY55ruF/Sh1AHn/eAfOGiPCX0kOygMdQkt/MRMGcDehxA8W3loYO18EN7BnH2jdBe
	Dke1VhDcOTurShUU6BB2r1NpWhdOEH2D6KTO77C8LzLlcmS3aRFpBQeknAqKx8EoqPv3
	5zjY/0UEC6X5b3rP3GK7DSJv80s3CgPwY9cnIUFveT5k0haSJiDxPs2yxRNvLH+bgu+s
	O3H2nTdS2hp0knNOElSu1X5zysAuvriUyldaL/iw7SLM7L3dX3degcXqaFBIO3YyPQ4k
	+OXraohTsbUOTRj0nGGrbYf1FrONCzowm9LP94d/Py0MiYiYEmcWjGhkX9QrdfzehAON
	cc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IjxyJ3sUpfcF/NPFwXeA0lvQp4PbuHyc45xcFD4IGIE=;
	b=MNNjk1rO2AV7EOnJbJhqp5MoBUuXnmsxhESV9jSahrhIE8ItGdqv07JBauLuwy/eUD
	0EgSnWvnZuJDO9Su157NiIrVWT3qfSyJfKx4dBm+a4f2wfuhtKNOLO1C14TpfnqOuIOw
	pepMdTKrsg0KxbjLkCxFkouqackoksoD2T5BqbMgHrIiEEoPaMtPdYHyE1U+N6LNrTOz
	LzcWxrej2TQBrff3Onf2Bsj58wjjmmpaI5eq19N69R0IAXbBuNamReWr3+oQAXhC6gOP
	N/SUAG7NFbnD6gNO8NPESsm669tR5bx6ek5abIre32d6lUBSoH65k9Ziro6a5MzV/u5i
	7Txw==
X-Gm-Message-State: AMke39lhmUcvY5v64cBrngK+6wWg4MU0rO3WaBOq80yXvxBR4eWzmLGiLkVbY5WSHVmXuQ==
X-Received: by 10.223.172.136 with SMTP id o8mr14783466wrc.87.1487614038112;
	Mon, 20 Feb 2017 10:07:18 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:18 +0100
Message-Id: <20170220180700.29836-3-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 02/44] libidl-native: add flex-native to DEPENDS
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* could not reproduce the error mentioned - flex is installed on my build
  machine
* For tests Trevor Woerner's 'Revert "flex: upgrade to 2.6.2"' was in my
  oe-core

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb b/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
index dc126cd..2252c44 100644
--- a/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
+++ b/meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
@@ -4,9 +4,7 @@ inherit native
 
 PR = "r1"
 
-DEPENDS = "bison-native glib-2.0-native"
+DEPENDS = "bison-native glib-2.0-native flex-native"
 
 SRC_URI[md5sum] = "bb8e10a218fac793a52d404d14adedcb"
 SRC_URI[sha256sum] = "c5d24d8c096546353fbc7cedf208392d5a02afe9d56ebcc1cccb258d7c4d2220"
-
-PNBLACKLIST[libidl-native] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130582/"
-- 
2.9.3



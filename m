Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9A00B7F8BC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:13:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f3so16548929wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 13:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MetOBLLTXxLCNXWiujcvfUBFiVCh49Xi75l8cPxGA98=;
	b=cAWoSxsnlyFts9X4NIC4e016aBmzz0vQ4+8ImjfeWKiPP0g4h9hW7V+d3no8X83pNB
	YrDDlmrDJpJYhSkqcvQgVS9XovbKn9OtU5lTvIXZFU4+hA77AVrVesOCLUiK+xnCNJtC
	+acwU2l/uQU2tyqyC/CdUzYXQfTaVyziEkZK3vvmDVJsYri99Fkhc6v5/Q7+eetxTeAJ
	0yziuCyiTq9GkleTw08BDjn0mzq7wbyOZeTtn4hiHEibKfc3/GPRE66GW5FxBBmlRbY1
	N0VyOttT8jKSkBrK+8I5Ipx55ZkWvr1Aah4KnP2V/14a7auTU2rW3wLpIezaHWwCj8Ss
	fY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MetOBLLTXxLCNXWiujcvfUBFiVCh49Xi75l8cPxGA98=;
	b=YV2+Yo1ttNrbJyuaTmYs3F9nyVCr4vA9qH9bLdWslP4/+Q91FNyZQm2JILXv0pfdYJ
	GSfGk6ZdmhPM8b497G77R1R9l/CwYrCEW3HwMJbWDrP1gd6TIGIIeCdduZ/gklhjcIjP
	GiAUzENbBp3BdSko7dMeq+zrCM6WWUOMhA8pY/tidnPX4DdJ6B4EbjDZJIPOY7Ik34po
	OdZX8ji9gLX9THiGJq4VCIPBajAd9npVjbpY94UmRRfOEPkJi+FBHFA89M4J11c0YPYi
	vMFpJi72i+6B9CYY6fFm7nNz9qpEg9nQA6P7hgE15Dp8wEV2m4h5rlgVOEGJ4+/Ft+5K
	5vbg==
X-Gm-Message-State: APjAAAXO5jeVD6cM192XZtNoy2SDwm5MROKJUviM4wbfcwFgPYUBHwlb
	PCvXIeu46ML2Kso+U+7VnkgS/7uJ
X-Google-Smtp-Source: APXvYqzdUnNZ4Upjet7xBok+6/OWKsLW6GhU7iQWWchFWZ47DcAHPcCi78roeQA3GavfmpO2Iqh7+g==
X-Received: by 2002:a1c:1fca:: with SMTP id
	f193mr24141041wmf.173.1574025198194; 
	Sun, 17 Nov 2019 13:13:18 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F081983E6CF71012ACD6C9A.dip0.t-ipconnect.de.
	[2003:f0:7f08:1983:e6cf:7101:2acd:6c9a])
	by smtp.gmail.com with ESMTPSA id
	g5sm18564687wma.43.2019.11.17.13.13.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 17 Nov 2019 13:13:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2019 22:13:04 +0100
Message-Id: <20191117211306.27233-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117211306.27233-1-schnitzeltony@gmail.com>
References: <20191117211306.27233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] gmime: move to meta-oe/recipes-gnome
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
X-List-Received-Date: Sun, 17 Nov 2019 21:13:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We cannot (yet) move it to meta-gnome because pidgin-sipe depends on it

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../pidgin => recipes-gnome/gmime}/gmime/iconv-detect.h           | 0
 .../pidgin => recipes-gnome/gmime}/gmime/nodolt.patch             | 0
 .../pidgin => recipes-gnome/gmime}/gmime_3.2.4.bb                 | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support/pidgin => recipes-gnome/gmime}/gmime/iconv-detect.h (100%)
 rename meta-oe/{recipes-support/pidgin => recipes-gnome/gmime}/gmime/nodolt.patch (100%)
 rename meta-oe/{recipes-support/pidgin => recipes-gnome/gmime}/gmime_3.2.4.bb (100%)

diff --git a/meta-oe/recipes-support/pidgin/gmime/iconv-detect.h b/meta-oe/recipes-gnome/gmime/gmime/iconv-detect.h
similarity index 100%
rename from meta-oe/recipes-support/pidgin/gmime/iconv-detect.h
rename to meta-oe/recipes-gnome/gmime/gmime/iconv-detect.h
diff --git a/meta-oe/recipes-support/pidgin/gmime/nodolt.patch b/meta-oe/recipes-gnome/gmime/gmime/nodolt.patch
similarity index 100%
rename from meta-oe/recipes-support/pidgin/gmime/nodolt.patch
rename to meta-oe/recipes-gnome/gmime/gmime/nodolt.patch
diff --git a/meta-oe/recipes-support/pidgin/gmime_3.2.4.bb b/meta-oe/recipes-gnome/gmime/gmime_3.2.4.bb
similarity index 100%
rename from meta-oe/recipes-support/pidgin/gmime_3.2.4.bb
rename to meta-oe/recipes-gnome/gmime/gmime_3.2.4.bb
-- 
2.21.0



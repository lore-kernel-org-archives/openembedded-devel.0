Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE567FC3F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:05 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id y11so25041498wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UnGu5x/9t2YA/jhxST4wux1zGWmfaF0W/zhMLW8BIM0=;
	b=uxAPjS1rY7gd8En/ZVCcP+fQA3S/ffg+J12A4LMvxh7PS7V5D8TMZGC3NuVaomCvjR
	jf8RncAnNjPDUYO6lFv5bUglhS4ncWRjC3fJ9nrMOBjefWBjj/vy4b4VnhwDSEt57IZr
	9edIR1PgM5va9wdpId9iE9DHkiNrZ1DEgQzsWhH0dO56MCewSWpsGRCUX7YZv0Hl7tdx
	kfwInYD5bEzOWh324U8tksK63uqwcMzeU/z8i1uE5ecPRRsjX4omPQuVR3jX6i6m9W5K
	f3wP1jMlLzxX3tbeT7McvmP1Rk1RPRQBxo4aNtFRqES82z3ZvOOT3l7LIPkfqqEJ+gjC
	/S9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UnGu5x/9t2YA/jhxST4wux1zGWmfaF0W/zhMLW8BIM0=;
	b=GxmHUOWg+iZxISB3+CsaJ3T3PqxQwIdPOyalO4T1j28FZAILQdudtOZIglyGjyhy5d
	An0/Wxw7GFMAz2tl6a0gRZJJmYYkpoafBxkHlRmiUb40++DUwz8XVwKsb/8rBpXzVcYv
	2YML7CuvmW7dU18K15CvgTsuAPVvXokD3Z5Ke83RkKIMzU1Qqxz/wvGadQtKnZzH/SiL
	i125KXXxmRDOsMoXeics7SAYMI3OwflevKCzcvOgj8pTrCbydrCvlMLS8Wb4Tdd+nrqW
	RgAJ+kPh5VcxXjLQeX5og+yoh86ku3PyGYkkhVVLT/diIrs4ZUlE6Cm2KGNLngEhO/PH
	ctkg==
X-Gm-Message-State: APjAAAV1OKIMEMsUKIujqmEC/VNCL4Dtz1FsMkxNO1CBxf4qsrGfUQNl
	N8zAxluzpUEXFSWrpAFpsI6XQjYBAKc=
X-Google-Smtp-Source: APXvYqwRdgM6ytp8wJ8o9OvL3Yz5GjWLgD+IbREpn1HFy2BhSxl2OBbWCStDNV4+3SbkoEwHVJ5BUw==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr8019802wrm.293.1579346886089; 
	Sat, 18 Jan 2020 03:28:06 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:34 +0100
Message-Id: <20200118112757.5287-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 00/23] Fix warings for missing mime-xdg
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* This series requires [1] which is in oe-core master-next
* It applies on master-next
* There might be other warning for missing mime(-xdg). These are those
  which popped up in my builds which are not world
  
[1] http://lists.openembedded.org/pipermail/openembedded-core/2020-January/291619.html

Andreas Müller (23):
  gnome-font-viewer: add mime-xdg to inherit
  itstool: remove it lives in oe-core now
  evince: add mime-xdg to inherit
  yelp: add mime-xdg to inherit
  geany: add mime-xdg to inherit
  glade: add mime-xdg to inherit
  catfish: add mime-xdg to inherit
  mousepad: add mime-xdg to inherit
  ristretto: add mime-xdg to inherit
  xarchiver: add mime-xdg to inherit
  parole: add mime-xdg to inherit
  exo: add mime-xdg to inherit
  xfce4-panel: add mime-xdg to inherit
  gedit: add mime-xdg to inherit
  thunar: add mime-xdg to inherit
  file-roller: add mime-xdg to inherit
  nautilus: add mime-xdg to inherit
  orage: add mime-xdg to inherit
  vlc: add mime-xdg to inherit
  fltk: add mime-xdg to inherit
  onboard: add mime-xdg to inherit
  gimp: add mime-xdg to inherit
  fontforge: add mime-xdg to inherit

 .../recipes-gnome/evince/evince_3.34.2.bb     |  2 +-
 .../file-roller/file-roller_3.32.3.bb         |  2 +-
 .../recipes-gnome/gedit/gedit_3.34.1.bb       |  2 +-
 .../gnome-font-viewer_3.34.0.bb               |  2 +-
 .../recipes-gnome/nautilus/nautilus_3.34.2.bb |  2 +-
 meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb  |  2 +-
 .../recipes-support/onboard/onboard_1.4.1.bb  |  2 +-
 .../recipes-multimedia/vlc/vlc_3.0.8.bb       |  2 +-
 meta-oe/recipes-devtools/geany/geany_1.36.bb  |  2 +-
 .../recipes-devtools/glade/glade_3.22.1.bb    |  2 +-
 .../fontforge/fontforge_20190801.bb           |  2 +-
 meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb  |  2 +-
 meta-oe/recipes-support/fltk/fltk.bb          |  2 +-
 ...-build-time-hardcoded-python-binary-.patch | 35 -------------------
 ...ld-time-hardcoded-python-binary-path.patch | 29 ---------------
 .../recipes-support/itstool/itstool_2.0.6.bb  | 20 -----------
 .../recipes-apps/catfish/catfish_1.4.11.bb    |  2 +-
 .../recipes-apps/mousepad/mousepad_0.4.2.bb   |  2 +-
 meta-xfce/recipes-apps/orage/orage_4.12.1.bb  |  2 +-
 .../ristretto/ristretto_0.10.0.bb             |  2 +-
 .../recipes-apps/xarchiver/xarchiver_git.bb   |  2 +-
 .../recipes-multimedia/parole/parole_1.0.5.bb |  2 +-
 meta-xfce/recipes-xfce/exo/exo_0.12.11.bb     |  2 +-
 .../recipes-xfce/thunar/thunar_1.8.10.bb      |  2 +-
 .../xfce4-panel/xfce4-panel_4.14.3.bb         |  2 +-
 25 files changed, 22 insertions(+), 106 deletions(-)
 delete mode 100644 meta-oe/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
 delete mode 100644 meta-oe/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch
 delete mode 100644 meta-oe/recipes-support/itstool/itstool_2.0.6.bb

-- 
2.21.0



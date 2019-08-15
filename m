Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id D18577F29D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:13 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 10so2471792wmp.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lKS/ECw7Bjk+/vpIhIquOASH9UXgc4iLlrNEVlf733E=;
	b=KGUREzS/MY7REaLIuo3aTRvUhfR0PjbJaCRZozkGq0s3pH9HwNr/2jUewoFIws3dnX
	atH7yFyrQL33VTUel0+GzFmvmM8I6kfN6kD/0JAXn/OkrlmABsEQ1W77du5MIPLL47RE
	BDRNubb1soVFoRYtt2vIyKtmltgTQy0SvOD3Ei3wbqzQom/UYimS6l1b2ouzxHZcTA5D
	Ow4tBEAEzeRiZlgcl2XTZebZn4w5l8FIaY4ngCWhVGRUXY0Vj7yhEGGvBoaiJsugrDbk
	2+jQy/FOBXyw02m1z8b1Z8pQlOf9TfnvLTdXAz139BFG4e+YPpjQyAUhtQYma+6B3bO9
	nspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lKS/ECw7Bjk+/vpIhIquOASH9UXgc4iLlrNEVlf733E=;
	b=EC5zj7xiD8SPM6lC1WikH2qEcpqiTaJ+xIVaBt4/LmIX+TS8zmR9+0XHG/Gxbj7CUA
	XczMgfhY1LL9lLloOs9pIlq+/doTGOHzCYdsm5H1Zb7KH1NiRX/FGz6DeLkBivBxXaES
	rL5r36JyzUkbe4GUxlqI2FD95B6Wwm1/bN5SCHLziHPo/mDudEiaJOckKlES+0SF2Fp8
	ph8lYziYsjSjJYu5rPL0IqcRYZ1NgakoyrlQGkkZ+msiIOgasnPaWVYrZGnaup1b168E
	EyUdpM6euJ0e6H/HQozPMr5sVemtVjQcAMC60wr5PDMYRz4eElrHuhZxyuhl+ZFhKwsJ
	jZuQ==
X-Gm-Message-State: APjAAAWbsNlL2S4b5uymrdKiq5PPlVQUTDbGKYhmKPXhB0oUS4vlbXNj
	8oCH1oSBtSQg3mPIylRiy4DsHdVq
X-Google-Smtp-Source: APXvYqyQxYQ62ie1DjEZmY3mQuJC0b6skzLp6rk1Mzd+xKh9LyeQxxOCApHLRc5gNIjkRsCEj8YPCA==
X-Received: by 2002:a1c:45:: with SMTP id 66mr4329059wma.40.1565906174175;
	Thu, 15 Aug 2019 14:56:14 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:55:52 +0200
Message-Id: <20190815215605.19600-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 00/13] meta-xfce: non-core updates
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a first batch - further to come

Andreas Müller (13):
  xfce4-whiskermenu-plugin: upgrade 2.3.2 -> 2.3.3
  xfmpc: upgrade 0.2.3 -> 0.3.0
  xfce4-cpugraph-plugin: upgrade 1.0.5 -> 1.1.0
  xfce4-terminal: upgrase 0.8.7.4 -> 0.8.8
  gtksourceview3: upgrade 3.24.10 -> 3.24.11
  mousepad: move to gtk3
  mousepad: upgrade 0.4.1 -> 0.4.2
  ristretto: upgrade 0.8.4 -> 0.10.0
  catfish: upgrade 1.4.7 -> 1.4.8
  parole: upgrade 1.0.2 -> 1.0.4
  xfce4-datetime-plugin: upgrade 0.7.1 -> 0.8.0
  xfce4-places-plugin: 1.8.0 -> 1.8.1
  xfce4-pulseaudio-plugin: upgrade 0.4.1 -> 0.4.2

 ...3_3.24.10.bb => gtksourceview3_3.24.11.bb} |  6 +--
 .../{catfish_1.4.7.bb => catfish_1.4.9.bb}    |  4 +-
 .../{mousepad_0.4.1.bb => mousepad_0.4.2.bb}  | 17 ++++----
 ...001-Fix-build-after-update-of-xfconf.patch | 40 -------------------
 ...ristretto_0.8.4.bb => ristretto_0.10.0.bb} | 12 +++---
 ...nal_0.8.7.4.bb => xfce4-terminal_0.8.8.bb} |  4 +-
 .../{parole_1.0.2.bb => parole_1.0.4.bb}      | 11 ++---
 .../xfmpc/{xfmpc_0.2.3.bb => xfmpc_0.3.0.bb}  |  8 ++--
 ....0.5.bb => xfce4-cpugraph-plugin_1.1.0.bb} |  6 +--
 ....7.1.bb => xfce4-datetime-plugin_0.8.0.bb} |  6 +--
 ..._1.8.0.bb => xfce4-places-plugin_1.8.1.bb} |  6 +--
 ....1.bb => xfce4-pulseaudio-plugin_0.4.2.bb} |  4 +-
 ...2.bb => xfce4-whiskermenu-plugin_2.3.3.bb} |  4 +-
 13 files changed, 41 insertions(+), 87 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview3_3.24.10.bb => gtksourceview3_3.24.11.bb} (75%)
 rename meta-xfce/recipes-apps/catfish/{catfish_1.4.7.bb => catfish_1.4.9.bb} (72%)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.4.1.bb => mousepad_0.4.2.bb} (24%)
 delete mode 100644 meta-xfce/recipes-apps/ristretto/files/0001-Fix-build-after-update-of-xfconf.patch
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.8.4.bb => ristretto_0.10.0.bb} (33%)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.4.bb => xfce4-terminal_0.8.8.bb} (70%)
 rename meta-xfce/recipes-multimedia/parole/{parole_1.0.2.bb => parole_1.0.4.bb} (72%)
 rename meta-xfce/recipes-multimedia/xfmpc/{xfmpc_0.2.3.bb => xfmpc_0.3.0.bb} (55%)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.0.5.bb => xfce4-cpugraph-plugin_1.1.0.bb} (46%)
 rename meta-xfce/recipes-panel-plugins/datetime/{xfce4-datetime-plugin_0.7.1.bb => xfce4-datetime-plugin_0.8.0.bb} (47%)
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.8.0.bb => xfce4-places-plugin_1.8.1.bb} (64%)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.4.1.bb => xfce4-pulseaudio-plugin_0.4.2.bb} (74%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.3.2.bb => xfce4-whiskermenu-plugin_2.3.3.bb} (66%)

-- 
2.21.0



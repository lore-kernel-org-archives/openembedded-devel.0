Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UDXhk-0003FJ-Ta
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 11:05:46 +0100
Received: by mail-ee0-f43.google.com with SMTP id c50so150581eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 01:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=qNdQk5Zo2yVlJXVlMQzgwSupJjNXEd/xjooQkl7mtro=;
	b=oaWBw2BpeIbuIK4Yigb7rsbeDWR7ZOQLpYu3meUx6jhCw5xiIbJE8m4esCF7AYAK5f
	ZKXa30tQswNmadpoURwueaQ47QkMyYccwIE3EPxswLGuVYyDmIO3feoCwoOjNYXuKcnq
	27eDMU85OxuES/KSYfXVZy3l0BEqk5qWRFO4Vp4HhZtHszipzvb1dZjBCt8UZHl1fwxU
	zxNzBLPoV4nDmQj/63mdt6YZqKsJEokF/u/cAUSbxKDPgP0W+iLoyNXFGzkPxQoGSywW
	YhUAVFYx9GHBaFq4vGlBIJNRBC6CGxwBZyP7Cn2KfABdRdl39R0baP8Di6PtZaSrSZE2
	dHdQ==
X-Received: by 10.15.100.202 with SMTP id bn50mr91185326eeb.36.1362649748849; 
	Thu, 07 Mar 2013 01:49:08 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id d47sm1292460eem.9.2013.03.07.01.49.07
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 01:49:07 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 10:48:54 +0100
Message-Id: <1362649734-1730-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQmiXpHkf8olce0odYMdoSsX2JHNpMw3/twzJbImzjb4ZG7DgLuHUSOjYGWDdR7wUgBp9FRY
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-opie][PATCH] various: fix pkg_postinst/rm to be package specfic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2013 10:05:48 -0000

ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-qtopia/tasklistapplet/tasklistapplet_1.0.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                                   | ETA:  00:04:52
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-qtopia/tasklistapplet/tasklistapplet_1.0.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-qtopia/portabase/portabase_1.9.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-qtopia/qpe-games/crossword_0.0.3.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-jumpx/opie-jumpx_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                                             | ETA:  00:04:27
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-jumpx/opie-jumpx_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-jumpx/opie-jumpx_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-jumpx/opie-jumpx_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-ttf-support/opie-ttf-support_1.1.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-cardapplet/opie-cardapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                                   | ETA:  00:04:59
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-cardapplet/opie-cardapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-cardapplet/opie-cardapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-cardapplet/opie-cardapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-keyboard/opie-keyboard_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                                       | ETA:  00:04:59
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-keyboard/opie-keyboard_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-keyboard/opie-keyboard_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-keyboard/opie-keyboard_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-kpacman/opie-kpacman_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                                         | ETA:  00:04:57
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-kpacman/opie-kpacman_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                                           | ETA:  00:04:53
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-vmemo/opie-vmemo_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-vmemo/opie-vmemo_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-vmemo/opie-vmemo_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-vmemo/opie-vmemo_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-unikeyboard/opie-unikeyboard_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-unikeyboard/opie-unikeyboard_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-unikeyboard/opie-unikeyboard_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-unikeyboard/opie-unikeyboard_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-autorotateapplet/opie-autorotateapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                       | ETA:  00:04:49
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-autorotateapplet/opie-autorotateapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-autorotateapplet/opie-autorotateapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-autorotateapplet/opie-autorotateapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-help-en/opie-help-en_1.2.5.bb: Variable ALLOW_EMPTY is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-help-en/opie-help-en_git.bb: Variable ALLOW_EMPTY is set as not being package specific, please fix this.                                                            | ETA:  00:04:45
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-clipboardapplet/opie-clipboardapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                           | ETA:  00:04:41
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-clipboardapplet/opie-clipboardapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-clipboardapplet/opie-clipboardapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-clipboardapplet/opie-clipboardapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-multikeyapplet/opie-multikeyapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-multikeyapplet/opie-multikeyapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-multikeyapplet/opie-multikeyapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-multikeyapplet/opie-multikeyapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-networkapplet/opie-networkapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-networkapplet/opie-networkapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-networkapplet/opie-networkapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-networkapplet/opie-networkapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-kjumpx/opie-kjumpx_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                                           | ETA:  00:04:39
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-kjumpx/opie-kjumpx_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-kjumpx/opie-kjumpx_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-kjumpx/opie-kjumpx_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-dvorak/opie-dvorak_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-dvorak/opie-dvorak_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-dvorak/opie-dvorak_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-dvorak/opie-dvorak_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-notesapplet/opie-notesapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                                 | ETA:  00:04:37
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-notesapplet/opie-notesapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-notesapplet/opie-notesapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                                   | ETA:  00:04:34
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-notesapplet/opie-notesapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-multikey/opie-multikey_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-multikey/opie-multikey_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-multikey/opie-multikey_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-multikey/opie-multikey_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-mediaplayer1/opie-mediaplayer1_1.2.5.bb: Variable ALLOW_EMPTY is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-mediaplayer1/opie-mediaplayer1_git.bb: Variable ALLOW_EMPTY is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-handwriting/opie-handwriting_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-handwriting/opie-handwriting_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-handwriting/opie-handwriting_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-handwriting/opie-handwriting_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-screenshotapplet/opie-screenshotapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                       | ETA:  00:04:30
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-screenshotapplet/opie-screenshotapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-screenshotapplet/opie-screenshotapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-screenshotapplet/opie-screenshotapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-memoryapplet/opie-memoryapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                               | ETA:  00:04:24
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-memoryapplet/opie-memoryapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-memoryapplet/opie-memoryapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-memoryapplet/opie-memoryapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-lockapplet/opie-lockapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-lockapplet/opie-lockapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-lockapplet/opie-lockapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-lockapplet/opie-lockapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-pickboard/opie-pickboard_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-pickboard/opie-pickboard_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-pickboard/opie-pickboard_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-pickboard/opie-pickboard_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-brightnessapplet/opie-brightnessapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-brightnessapplet/opie-brightnessapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-brightnessapplet/opie-brightnessapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                         | ETA:  00:04:22
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-brightnessapplet/opie-brightnessapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-clockapplet/opie-clockapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-clockapplet/opie-clockapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-clockapplet/opie-clockapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-clockapplet/opie-clockapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/packagegroups/packagegroup-opie-toolchain-target.bb: Variable ALLOW_EMPTY is set as not being package specific, please fix this.                                         | ETA:  00:04:19
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/packagegroups/nativesdk-packagegroup-opie-toolchain-host.bb: Variable ALLOW_EMPTY is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-wirelessapplet/opie-wirelessapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-wirelessapplet/opie-wirelessapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-wirelessapplet/opie-wirelessapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-wirelessapplet/opie-wirelessapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-volumeapplet/opie-volumeapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-volumeapplet/opie-volumeapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-volumeapplet/opie-volumeapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                                 | ETA:  00:04:15
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-volumeapplet/opie-volumeapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-batteryapplet/opie-batteryapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-batteryapplet/opie-batteryapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-batteryapplet/opie-batteryapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-batteryapplet/opie-batteryapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-keyview/opie-keyview_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-keyview/opie-keyview_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-keyview/opie-keyview_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-keyview/opie-keyview_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-irdaapplet/opie-irdaapplet_1.2.5.bb: Variable pkg_postinst is set as not being package specific, please fix this.                                                   | ETA:  00:04:12
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-irdaapplet/opie-irdaapplet_1.2.5.bb: Variable pkg_postrm is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-irdaapplet/opie-irdaapplet_git.bb: Variable pkg_postinst is set as not being package specific, please fix this.
ERROR: QA Issue: /build/setup-scripts/sources/meta-opie/recipes-opie/opie-irdaapplet/opie-irdaapplet_git.bb: Variable pkg_postrm is set as not being package specific, please fix this.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-opie/nonworking/opie-dasher/opie-dasher.inc                | 4 ++--
 recipes-opie/opie-autorotateapplet/opie-autorotateapplet.inc       | 4 ++--
 recipes-opie/opie-batteryapplet/opie-batteryapplet.inc             | 4 ++--
 recipes-opie/opie-brightnessapplet/opie-brightnessapplet.inc       | 4 ++--
 recipes-opie/opie-cardapplet/opie-cardapplet.inc                   | 4 ++--
 recipes-opie/opie-clipboardapplet/opie-clipboardapplet.inc         | 4 ++--
 recipes-opie/opie-clockapplet/opie-clockapplet.inc                 | 4 ++--
 recipes-opie/opie-dvorak/opie-dvorak.inc                           | 4 ++--
 recipes-opie/opie-handwriting/opie-handwriting.inc                 | 4 ++--
 recipes-opie/opie-irdaapplet/opie-irdaapplet.inc                   | 4 ++--
 recipes-opie/opie-jumpx/opie-jumpx.inc                             | 4 ++--
 recipes-opie/opie-keyboard/opie-keyboard.inc                       | 4 ++--
 recipes-opie/opie-keyview/opie-keyview.inc                         | 4 ++--
 recipes-opie/opie-kjumpx/opie-kjumpx.inc                           | 4 ++--
 recipes-opie/opie-kpacman/opie-kpacman.inc                         | 2 +-
 recipes-opie/opie-lockapplet/opie-lockapplet.inc                   | 4 ++--
 recipes-opie/opie-memoryapplet/opie-memoryapplet.inc               | 4 ++--
 recipes-opie/opie-multikey/opie-multikey.inc                       | 4 ++--
 recipes-opie/opie-multikeyapplet/opie-multikeyapplet.inc           | 4 ++--
 recipes-opie/opie-networkapplet/opie-networkapplet.inc             | 4 ++--
 recipes-opie/opie-notesapplet/opie-notesapplet.inc                 | 4 ++--
 recipes-opie/opie-pickboard/opie-pickboard.inc                     | 4 ++--
 recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet.inc | 4 ++--
 recipes-opie/opie-screenshotapplet/opie-screenshotapplet.inc       | 4 ++--
 recipes-opie/opie-ttf-support/opie-ttf-support_1.1.bb              | 2 +-
 recipes-opie/opie-unikeyboard/opie-unikeyboard.inc                 | 4 ++--
 recipes-opie/opie-vmemo/opie-vmemo.inc                             | 4 ++--
 recipes-opie/opie-volumeapplet/opie-volumeapplet.inc               | 4 ++--
 recipes-opie/opie-wirelessapplet/opie-wirelessapplet.inc           | 4 ++--
 recipes-qtopia/portabase/portabase_1.9.bb                          | 2 +-
 recipes-qtopia/qpe-games/crossword_0.0.3.bb                        | 2 +-
 recipes-qtopia/qpealarmclock/qpealarmclockapplet_1.0.9.bb          | 4 ++--
 recipes-qtopia/shopper/shopper_1.2.1.bb                            | 2 +-
 recipes-qtopia/subapplet/subapplet_1.0.8.bb                        | 4 ++--
 recipes-qtopia/tasklistapplet/tasklistapplet_1.0.5.bb              | 4 ++--
 35 files changed, 65 insertions(+), 65 deletions(-)

diff --git a/recipes-opie/nonworking/opie-dasher/opie-dasher.inc b/recipes-opie/nonworking/opie-dasher/opie-dasher.inc
index 9ae4147..0ee6326 100644
--- a/recipes-opie/nonworking/opie-dasher/opie-dasher.inc
+++ b/recipes-opie/nonworking/opie-dasher/opie-dasher.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/dasher"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -21,7 +21,7 @@ fi
 
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 /opt/QtPalmtop/bin/qcop QPE/TaskBar "reloadInputMethods()"
diff --git a/recipes-opie/opie-autorotateapplet/opie-autorotateapplet.inc b/recipes-opie/opie-autorotateapplet/opie-autorotateapplet.inc
index 3ba3291..6d65d21 100644
--- a/recipes-opie/opie-autorotateapplet/opie-autorotateapplet.inc
+++ b/recipes-opie/opie-autorotateapplet/opie-autorotateapplet.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -20,7 +20,7 @@ else
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 ${bindir}/qcop QPE/TaskBar "reloadApplets()"
diff --git a/recipes-opie/opie-batteryapplet/opie-batteryapplet.inc b/recipes-opie/opie-batteryapplet/opie-batteryapplet.inc
index 7de8aa0..d79dacd 100644
--- a/recipes-opie/opie-batteryapplet/opie-batteryapplet.inc
+++ b/recipes-opie/opie-batteryapplet/opie-batteryapplet.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -20,7 +20,7 @@ else
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 ${bindir}/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
diff --git a/recipes-opie/opie-brightnessapplet/opie-brightnessapplet.inc b/recipes-opie/opie-brightnessapplet/opie-brightnessapplet.inc
index e9cd66d..1f611c9 100644
--- a/recipes-opie/opie-brightnessapplet/opie-brightnessapplet.inc
+++ b/recipes-opie/opie-brightnessapplet/opie-brightnessapplet.inc
@@ -14,7 +14,7 @@ do_install() {
 	install -m 0655 ${WORKDIR}/pics/${APPNAME}/*.png ${D}${palmtopdir}/pics/${APPNAME}/
 }
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -24,7 +24,7 @@ else
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 ${bindir}/qcop QPE/TaskBar "reloadApplets()"
diff --git a/recipes-opie/opie-cardapplet/opie-cardapplet.inc b/recipes-opie/opie-cardapplet/opie-cardapplet.inc
index 9462f7d..f94bc9b 100644
--- a/recipes-opie/opie-cardapplet/opie-cardapplet.inc
+++ b/recipes-opie/opie-cardapplet/opie-cardapplet.inc
@@ -11,7 +11,7 @@ S = "${WORKDIR}/cardapplet"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if pidof -s qpe >/dev/null; then
   /usr/bin/qcop QPE/TaskBar "reloadApplets()"
@@ -19,7 +19,7 @@ fi
  if [ -n "$D" ]; then false; fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 /usr/bin/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
diff --git a/recipes-opie/opie-clipboardapplet/opie-clipboardapplet.inc b/recipes-opie/opie-clipboardapplet/opie-clipboardapplet.inc
index 8c67089..e60f2b1 100644
--- a/recipes-opie/opie-clipboardapplet/opie-clipboardapplet.inc
+++ b/recipes-opie/opie-clipboardapplet/opie-clipboardapplet.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -18,7 +18,7 @@ if pidof -s qpe >/dev/null; then
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 ${bindir}/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
diff --git a/recipes-opie/opie-clockapplet/opie-clockapplet.inc b/recipes-opie/opie-clockapplet/opie-clockapplet.inc
index e2b607f..1ace247 100644
--- a/recipes-opie/opie-clockapplet/opie-clockapplet.inc
+++ b/recipes-opie/opie-clockapplet/opie-clockapplet.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -18,7 +18,7 @@ if pidof -s qpe >/dev/null; then
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 ${bindir}/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
diff --git a/recipes-opie/opie-dvorak/opie-dvorak.inc b/recipes-opie/opie-dvorak/opie-dvorak.inc
index fa884c5..6d3d9e5 100644
--- a/recipes-opie/opie-dvorak/opie-dvorak.inc
+++ b/recipes-opie/opie-dvorak/opie-dvorak.inc
@@ -11,7 +11,7 @@ S = "${WORKDIR}/dvorak"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -22,7 +22,7 @@ fi
 
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 ${bindir}/qcop QPE/TaskBar "reloadInputMethods()"
diff --git a/recipes-opie/opie-handwriting/opie-handwriting.inc b/recipes-opie/opie-handwriting/opie-handwriting.inc
index 67c7d51..296d48f 100644
--- a/recipes-opie/opie-handwriting/opie-handwriting.inc
+++ b/recipes-opie/opie-handwriting/opie-handwriting.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/handwriting"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -21,7 +21,7 @@ fi
 
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 ${bindir}/qcop QPE/TaskBar "reloadInputMethods()"
diff --git a/recipes-opie/opie-irdaapplet/opie-irdaapplet.inc b/recipes-opie/opie-irdaapplet/opie-irdaapplet.inc
index 8813ad8..d3bf4ce 100644
--- a/recipes-opie/opie-irdaapplet/opie-irdaapplet.inc
+++ b/recipes-opie/opie-irdaapplet/opie-irdaapplet.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -18,7 +18,7 @@ if pidof -s qpe >/dev/null; then
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 ${bindir}/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
diff --git a/recipes-opie/opie-jumpx/opie-jumpx.inc b/recipes-opie/opie-jumpx/opie-jumpx.inc
index a26fd41..df5184e 100644
--- a/recipes-opie/opie-jumpx/opie-jumpx.inc
+++ b/recipes-opie/opie-jumpx/opie-jumpx.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/jumpx"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -21,7 +21,7 @@ fi
 
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 /usr/bin/qcop QPE/TaskBar "reloadInputMethods()"
diff --git a/recipes-opie/opie-keyboard/opie-keyboard.inc b/recipes-opie/opie-keyboard/opie-keyboard.inc
index 5e27c33..1f7dbb5 100644
--- a/recipes-opie/opie-keyboard/opie-keyboard.inc
+++ b/recipes-opie/opie-keyboard/opie-keyboard.inc
@@ -11,7 +11,7 @@ S = "${WORKDIR}/keyboard"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -22,7 +22,7 @@ fi
 
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 ${bindir}/qcop QPE/TaskBar "reloadInputMethods()"
diff --git a/recipes-opie/opie-keyview/opie-keyview.inc b/recipes-opie/opie-keyview/opie-keyview.inc
index b21d243..27d4c88 100644
--- a/recipes-opie/opie-keyview/opie-keyview.inc
+++ b/recipes-opie/opie-keyview/opie-keyview.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -20,7 +20,7 @@ else
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 ${bindir}/qcop QPE/TaskBar "reloadInputMethods()"
 }
diff --git a/recipes-opie/opie-kjumpx/opie-kjumpx.inc b/recipes-opie/opie-kjumpx/opie-kjumpx.inc
index 252371c..f7906b1 100644
--- a/recipes-opie/opie-kjumpx/opie-kjumpx.inc
+++ b/recipes-opie/opie-kjumpx/opie-kjumpx.inc
@@ -11,7 +11,7 @@ S = "${WORKDIR}/kjumpx"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -22,7 +22,7 @@ fi
 
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 /usr/bin/qcop QPE/TaskBar "reloadInputMethods()"
diff --git a/recipes-opie/opie-kpacman/opie-kpacman.inc b/recipes-opie/opie-kpacman/opie-kpacman.inc
index 41cc192..8403348 100644
--- a/recipes-opie/opie-kpacman/opie-kpacman.inc
+++ b/recipes-opie/opie-kpacman/opie-kpacman.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 
diff --git a/recipes-opie/opie-lockapplet/opie-lockapplet.inc b/recipes-opie/opie-lockapplet/opie-lockapplet.inc
index 837a417..890c39f 100644
--- a/recipes-opie/opie-lockapplet/opie-lockapplet.inc
+++ b/recipes-opie/opie-lockapplet/opie-lockapplet.inc
@@ -12,7 +12,7 @@ S = "${WORKDIR}/lockapplet"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -20,7 +20,7 @@ if pidof -s qpe >/dev/null; then
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 ${bindir}/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
diff --git a/recipes-opie/opie-memoryapplet/opie-memoryapplet.inc b/recipes-opie/opie-memoryapplet/opie-memoryapplet.inc
index d3f8125..21ea82b 100644
--- a/recipes-opie/opie-memoryapplet/opie-memoryapplet.inc
+++ b/recipes-opie/opie-memoryapplet/opie-memoryapplet.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/memoryapplet"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -18,7 +18,7 @@ if pidof -s qpe >/dev/null; then
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 ${bindir}/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
diff --git a/recipes-opie/opie-multikey/opie-multikey.inc b/recipes-opie/opie-multikey/opie-multikey.inc
index 9b3e10d..37bd298 100644
--- a/recipes-opie/opie-multikey/opie-multikey.inc
+++ b/recipes-opie/opie-multikey/opie-multikey.inc
@@ -12,7 +12,7 @@ S = "${WORKDIR}/multikey"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -22,7 +22,7 @@ else
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 ${bindir}/qcop QPE/TaskBar "reloadInputMethods()"
diff --git a/recipes-opie/opie-multikeyapplet/opie-multikeyapplet.inc b/recipes-opie/opie-multikeyapplet/opie-multikeyapplet.inc
index 381204f..06a9587 100644
--- a/recipes-opie/opie-multikeyapplet/opie-multikeyapplet.inc
+++ b/recipes-opie/opie-multikeyapplet/opie-multikeyapplet.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -18,7 +18,7 @@ if pidof -s qpe >/dev/null; then
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 ${bindir}/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
diff --git a/recipes-opie/opie-networkapplet/opie-networkapplet.inc b/recipes-opie/opie-networkapplet/opie-networkapplet.inc
index 48e7486..43eff5f 100644
--- a/recipes-opie/opie-networkapplet/opie-networkapplet.inc
+++ b/recipes-opie/opie-networkapplet/opie-networkapplet.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -20,7 +20,7 @@ else
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 /usr/bin/qcop QPE/TaskBar "reloadApplets()"
diff --git a/recipes-opie/opie-notesapplet/opie-notesapplet.inc b/recipes-opie/opie-notesapplet/opie-notesapplet.inc
index 8494d6c..85229fd 100644
--- a/recipes-opie/opie-notesapplet/opie-notesapplet.inc
+++ b/recipes-opie/opie-notesapplet/opie-notesapplet.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -20,7 +20,7 @@ else
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 /usr/bin/qcop QPE/TaskBar "reloadApplets()"
diff --git a/recipes-opie/opie-pickboard/opie-pickboard.inc b/recipes-opie/opie-pickboard/opie-pickboard.inc
index e8dee76..0fee56a 100644
--- a/recipes-opie/opie-pickboard/opie-pickboard.inc
+++ b/recipes-opie/opie-pickboard/opie-pickboard.inc
@@ -9,7 +9,7 @@ S = "${WORKDIR}/pickboard"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -19,7 +19,7 @@ else
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 ${bindir}/qcop QPE/TaskBar "reloadInputMethods()"
diff --git a/recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet.inc b/recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet.inc
index 7ce7cce..40c7476 100644
--- a/recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet.inc
+++ b/recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet.inc
@@ -9,7 +9,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -17,7 +17,7 @@ if pidof -s qpe >/dev/null; then
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 /usr/bin/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
diff --git a/recipes-opie/opie-screenshotapplet/opie-screenshotapplet.inc b/recipes-opie/opie-screenshotapplet/opie-screenshotapplet.inc
index 396c0e9..da4090d 100644
--- a/recipes-opie/opie-screenshotapplet/opie-screenshotapplet.inc
+++ b/recipes-opie/opie-screenshotapplet/opie-screenshotapplet.inc
@@ -11,7 +11,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -19,7 +19,7 @@ if pidof -s qpe >/dev/null; then
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then false; fi
 ${bindir}/qcop QPE/TaskBar "reloadApplets()"
diff --git a/recipes-opie/opie-ttf-support/opie-ttf-support_1.1.bb b/recipes-opie/opie-ttf-support/opie-ttf-support_1.1.bb
index 524057a..acb8b4b 100644
--- a/recipes-opie/opie-ttf-support/opie-ttf-support_1.1.bb
+++ b/recipes-opie/opie-ttf-support/opie-ttf-support_1.1.bb
@@ -29,6 +29,6 @@ do_install() {
         sed -i 's!@@DATADIR@@!${datadir}!g' ${D}${sysconfdir}/update-fonts-common.d/02qtttffont-update
 }
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
         ${sysconfdir}/update-fonts-common.d/02qtttffont-update
 }
diff --git a/recipes-opie/opie-unikeyboard/opie-unikeyboard.inc b/recipes-opie/opie-unikeyboard/opie-unikeyboard.inc
index 3c9268e..0fe31e9 100644
--- a/recipes-opie/opie-unikeyboard/opie-unikeyboard.inc
+++ b/recipes-opie/opie-unikeyboard/opie-unikeyboard.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/unikeyboard"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -20,7 +20,7 @@ else
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 ${bindir}/qcop QPE/TaskBar "reloadInputMethods()"
diff --git a/recipes-opie/opie-vmemo/opie-vmemo.inc b/recipes-opie/opie-vmemo/opie-vmemo.inc
index 758846c..e21167a 100644
--- a/recipes-opie/opie-vmemo/opie-vmemo.inc
+++ b/recipes-opie/opie-vmemo/opie-vmemo.inc
@@ -12,7 +12,7 @@ S = "${WORKDIR}/vmemo"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if pidof -s qpe >/dev/null; then
   /usr/bin/qcop QPE/TaskBar "reloadApplets()"
@@ -20,7 +20,7 @@ fi
  if [ -n "$D" ]; then exit 1; fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 /usr/bin/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then exit 1; fi
diff --git a/recipes-opie/opie-volumeapplet/opie-volumeapplet.inc b/recipes-opie/opie-volumeapplet/opie-volumeapplet.inc
index c18a979..f7c364f 100644
--- a/recipes-opie/opie-volumeapplet/opie-volumeapplet.inc
+++ b/recipes-opie/opie-volumeapplet/opie-volumeapplet.inc
@@ -10,7 +10,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -18,7 +18,7 @@ if pidof -s qpe >/dev/null; then
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 ${bindir}/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
diff --git a/recipes-opie/opie-wirelessapplet/opie-wirelessapplet.inc b/recipes-opie/opie-wirelessapplet/opie-wirelessapplet.inc
index e57a6be..2ce7d14 100644
--- a/recipes-opie/opie-wirelessapplet/opie-wirelessapplet.inc
+++ b/recipes-opie/opie-wirelessapplet/opie-wirelessapplet.inc
@@ -11,7 +11,7 @@ S = "${WORKDIR}/${APPNAME}"
 
 inherit opie
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -21,7 +21,7 @@ else
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 /usr/bin/qcop QPE/TaskBar "reloadApplets()"
diff --git a/recipes-qtopia/portabase/portabase_1.9.bb b/recipes-qtopia/portabase/portabase_1.9.bb
index 2cdce76..3857bf4 100644
--- a/recipes-qtopia/portabase/portabase_1.9.bb
+++ b/recipes-qtopia/portabase/portabase_1.9.bb
@@ -48,7 +48,7 @@ do_install() {
 }
 
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 
 NEWTYPE=application/portabase
diff --git a/recipes-qtopia/qpe-games/crossword_0.0.3.bb b/recipes-qtopia/qpe-games/crossword_0.0.3.bb
index 3e5ddd8..50f7456 100644
--- a/recipes-qtopia/qpe-games/crossword_0.0.3.bb
+++ b/recipes-qtopia/qpe-games/crossword_0.0.3.bb
@@ -24,7 +24,7 @@ do_install () {
 
 }
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 
 MIMEFILE=/opt/QtPalmtop/etc/mime.types
diff --git a/recipes-qtopia/qpealarmclock/qpealarmclockapplet_1.0.9.bb b/recipes-qtopia/qpealarmclock/qpealarmclockapplet_1.0.9.bb
index f2b4cc4..7527e3a 100644
--- a/recipes-qtopia/qpealarmclock/qpealarmclockapplet_1.0.9.bb
+++ b/recipes-qtopia/qpealarmclock/qpealarmclockapplet_1.0.9.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://clockappletimpl.cpp;beginline=6;endline=14;md5=f2ed65
 
 inherit palmtop
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if [ -n "$D" ]; then exit 1; fi
 if pidof -s qpe >/dev/null; then
@@ -30,7 +30,7 @@ if pidof -s qpe >/dev/null; then
 fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 /usr/bin/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
diff --git a/recipes-qtopia/shopper/shopper_1.2.1.bb b/recipes-qtopia/shopper/shopper_1.2.1.bb
index 1777f8a..6e102e5 100644
--- a/recipes-qtopia/shopper/shopper_1.2.1.bb
+++ b/recipes-qtopia/shopper/shopper_1.2.1.bb
@@ -18,7 +18,7 @@ CXXFLAGS_append += " -DSHOPPER_DATADIR='"${SHOPPER_DATADIR}"' "
 
 QMAKE_PROFILES = "Shopper.pro"
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 	/opt/QtPalmtop/bin/qcop QPE/System "linkChanged(QString)" 2>/dev/null
 	if [ -n "$D" ]; then false; fi
 }
diff --git a/recipes-qtopia/subapplet/subapplet_1.0.8.bb b/recipes-qtopia/subapplet/subapplet_1.0.8.bb
index e11ca9c..9adb816 100644
--- a/recipes-qtopia/subapplet/subapplet_1.0.8.bb
+++ b/recipes-qtopia/subapplet/subapplet_1.0.8.bb
@@ -23,7 +23,7 @@ do_install() {
     oe_libinstall -so -C rel/opt/QtPalmtop/plugins/applets libsubapplet ${D}${palmtopdir}/plugins/applets/
 }
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if pidof -s qpe >/dev/null; then
   /usr/bin/qcop QPE/TaskBar "reloadApplets()"
@@ -33,7 +33,7 @@ fi
  if [ -n "$D" ]; then false; fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 /usr/bin/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
diff --git a/recipes-qtopia/tasklistapplet/tasklistapplet_1.0.5.bb b/recipes-qtopia/tasklistapplet/tasklistapplet_1.0.5.bb
index 75d5f65..f2f60ae 100644
--- a/recipes-qtopia/tasklistapplet/tasklistapplet_1.0.5.bb
+++ b/recipes-qtopia/tasklistapplet/tasklistapplet_1.0.5.bb
@@ -22,7 +22,7 @@ do_install() {
     oe_libinstall -so -C rel/opt/Qtopia/plugins/applets libtasklistapplet ${D}${palmtopdir}/plugins/applets/
 }
 
-pkg_postinst() {
+pkg_postinst_${PN}() {
 #!/bin/sh
 if pidof -s qpe >/dev/null; then
   /usr/bin/qcop QPE/TaskBar "reloadApplets()"
@@ -32,7 +32,7 @@ fi
  if [ -n "$D" ]; then false; fi
 }
 
-pkg_postrm() {
+pkg_postrm_${PN}() {
 #!/bin/sh
 /usr/bin/qcop QPE/TaskBar "reloadApplets()"
  if [ -n "$D" ]; then false; fi
-- 
1.8.1.4




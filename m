Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol1eB-00069W-Mn
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 17:30:47 +0200
Received: by fxm6 with SMTP id 6so3101151fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 08:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=GI+iuYBoGqPjNQAek0aNPUy6UgF0fmeMTL16BBr2Jkw=;
	b=s7+sGZ937fep+1/2eX3yTUBOo/yl4Xon+v2O135A2qLVa9xQPfHtxcj117hpkx8g2W
	V/nKUVIhxRo69uqG1my1mcjJ+z68xuXeUE/R0rsQLwOoui1T0Q7/Gfcp/0pVENZLX+HD
	i4zG5lNkXRiV0/Pd+K0oylir7oeAi5+57hBsM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=u43D4GaFdBbyGkjg4R0Dhtv/aujB5xpNfebwGYNaDJmKO1Yvg85fg4Qf2RXUVRuCbC
	jDzjwNi6vJpsrw8hHCOp1qzZ+kJHQHtaaBStsU/2G3U7VsUR9Tzy6sxvp3GL8D2MzUif
	/E9yzx5WFFGG8Mj5VsENy1HtY3aFNUWQwdgnE=
Received: by 10.223.110.67 with SMTP id m3mr5346745fap.24.1281972630154;
	Mon, 16 Aug 2010 08:30:30 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r5sm2501592faq.8.2010.08.16.08.30.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 08:30:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 17:30:16 +0200
Message-Id: <1281972620-7317-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
References: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Scanned: No (on linuxtogo.org);
	Message bigger than SAmaxbody (256000)
Subject: [PATCH 5/9] xorg-driver: move older not pinned versions to obsolete dir
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
X-List-Received-Date: Mon, 16 Aug 2010 15:30:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg/xorg-driver/xf86-input-acecad_1.1.0.bb    |    6 +
 .../xorg/xorg-driver/xf86-input-acecad_1.2.1.bb    |    7 +
 .../xorg/xorg-driver/xf86-input-acecad_1.2.2.bb    |    7 +
 .../xorg/xorg-driver/xf86-input-aiptek_1.0.1.bb    |    6 +
 .../xorg/xorg-driver/xf86-input-aiptek_1.1.1.bb    |    6 +
 .../xorg/xorg-driver/xf86-input-calcomp_1.1.0.bb   |    6 +
 .../xorg/xorg-driver/xf86-input-calcomp_1.1.1.bb   |    7 +
 .../xorg/xorg-driver/xf86-input-citron_2.2.0.bb    |    6 +
 .../xorg/xorg-driver/xf86-input-citron_2.2.1.bb    |    7 +
 .../xorg-driver/xf86-input-digitaledge_1.1.0.bb    |    6 +
 .../xorg/xorg-driver/xf86-input-dmc_1.1.0.bb       |    6 +
 .../xorg/xorg-driver/xf86-input-dmc_1.1.1.bb       |    7 +
 .../xorg/xorg-driver/xf86-input-dynapro_1.1.0.bb   |    6 +
 .../xorg/xorg-driver/xf86-input-dynapro_1.1.1.bb   |    7 +
 .../xorg/xorg-driver/xf86-input-elo2300_1.1.0.bb   |    6 +
 .../xorg/xorg-driver/xf86-input-elo2300_1.1.1.bb   |    7 +
 .../xorg-driver/xf86-input-elographics_1.1.0.bb    |    7 +
 .../xorg-driver/xf86-input-elographics_1.2.2.bb    |    7 +
 .../xf86-input-elographics_X11R7.0-1.0.0.5.bb      |    6 +
 .../xorg/xorg-driver/xf86-input-evdev_1.1.5.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-evdev_1.2.0.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-evdev_1.99.4.bb    |    7 +
 .../xorg/xorg-driver/xf86-input-evdev_2.0.4.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-evdev_2.1.0.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-evdev_2.2.5.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-evdev_2.2.6.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-evdev_2.3.1.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-evdev_2.3.2.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-fpit_1.1.0.bb      |    6 +
 .../xorg/xorg-driver/xf86-input-fpit_1.2.0.bb      |    6 +
 .../xorg/xorg-driver/xf86-input-hyperpen_1.1.0.bb  |    6 +
 .../xorg/xorg-driver/xf86-input-hyperpen_1.2.0.bb  |    6 +
 .../xorg/xorg-driver/xf86-input-jamstudio_1.1.0.bb |    6 +
 .../xorg/xorg-driver/xf86-input-joystick_1.1.0.bb  |    6 +
 .../xorg/xorg-driver/xf86-input-joystick_1.3.1.bb  |    7 +
 .../xorg/xorg-driver/xf86-input-joystick_1.3.2.bb  |    7 +
 .../xorg/xorg-driver/xf86-input-keyboard_1.1.1.bb  |    7 +
 .../xorg/xorg-driver/xf86-input-keyboard_1.2.0.bb  |    7 +
 .../xorg/xorg-driver/xf86-input-keyboard_1.2.2.bb  |    7 +
 .../xorg/xorg-driver/xf86-input-keyboard_1.3.1.bb  |    8 +
 .../xorg/xorg-driver/xf86-input-keyboard_1.3.2.bb  |    8 +
 .../xorg/xorg-driver/xf86-input-magellan_1.1.0.bb  |    6 +
 .../xorg/xorg-driver/xf86-input-magellan_1.1.1.bb  |    7 +
 .../xorg-driver/xf86-input-microtouch_1.1.0.bb     |    6 +
 .../xorg-driver/xf86-input-microtouch_1.1.1.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-mouse_1.1.2.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-mouse_1.2.1.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-mouse_1.2.2.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-mouse_1.2.3.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-mouse_1.3.0.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-mouse_1.4.0.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-mutouch_1.1.0.bb   |    6 +
 .../xorg/xorg-driver/xf86-input-mutouch_1.2.0.bb   |    7 +
 .../xorg/xorg-driver/xf86-input-palmax_1.1.0.bb    |    6 +
 .../xorg/xorg-driver/xf86-input-penmount_1.2.0.bb  |    6 +
 .../xorg/xorg-driver/xf86-input-penmount_1.2.1.bb  |    7 +
 .../xorg/xorg-driver/xf86-input-penmount_1.3.0.bb  |    7 +
 .../xorg/xorg-driver/xf86-input-spaceorb_1.1.0.bb  |    6 +
 .../xorg/xorg-driver/xf86-input-summa_1.1.0.bb     |    6 +
 .../xorg-driver/xf86-input-synaptics_0.15.0.bb     |    7 +
 .../xorg/xorg-driver/xf86-input-synaptics_1.2.1.bb |    7 +
 .../xorg/xorg-driver/xf86-input-tek4957_1.1.0.bb   |    6 +
 .../xorg/xorg-driver/xf86-input-vmmouse_12.4.0.bb  |    9 +
 .../xorg/xorg-driver/xf86-input-vmmouse_12.4.3.bb  |    7 +
 .../xorg/xorg-driver/xf86-input-vmmouse_12.5.1.bb  |    9 +
 .../xorg/xorg-driver/xf86-input-vmmouse_12.6.6.bb  |    9 +
 .../xorg/xorg-driver/xf86-input-vmmouse_12.6.9.bb  |    9 +
 .../xorg/xorg-driver/xf86-input-void_1.1.0.bb      |    6 +
 .../xorg/xorg-driver/xf86-input-void_1.1.1.bb      |    7 +
 .../xorg/xorg-driver/xf86-video-apm_1.1.1.bb       |    8 +
 .../xorg/xorg-driver/xf86-video-apm_1.2.0.bb       |    9 +
 .../xorg/xorg-driver/xf86-video-ark_0.6.0.bb       |    6 +
 .../xorg/xorg-driver/xf86-video-ark_0.7.0.bb       |    8 +
 .../xorg/xorg-driver/xf86-video-ast_0.81.0.bb      |    6 +
 .../xorg/xorg-driver/xf86-video-ast_0.85.0.bb      |    6 +
 .../xorg/xorg-driver/xf86-video-ati_6.13.0.bb      |    8 +
 .../xorg/xorg-driver/xf86-video-ati_6.6.193.bb     |    7 +
 .../xorg/xorg-driver/xf86-video-ati_6.6.3.bb       |    7 +
 .../xorg/xorg-driver/xf86-video-ati_6.7.196.bb     |    7 +
 .../xorg/xorg-driver/xf86-video-ati_6.7.197.bb     |    8 +
 .../xorg/xorg-driver/xf86-video-ati_6.8.0.bb       |    8 +
 .../xorg/xorg-driver/xf86-video-chips_1.1.1.bb     |    6 +
 .../xorg/xorg-driver/xf86-video-chips_1.2.0.bb     |    7 +
 .../xorg/xorg-driver/xf86-video-cirrus_1.1.0.bb    |    6 +
 .../xorg/xorg-driver/xf86-video-cirrus_1.2.1.bb    |    7 +
 .../xorg/xorg-driver/xf86-video-dummy_0.2.0.bb     |    6 +
 .../xorg/xorg-driver/xf86-video-dummy_0.3.0.bb     |    8 +
 .../xorg/xorg-driver/xf86-video-dummy_0.3.3.bb     |    8 +
 .../xf86-video-fbdev/use-staged-headers.patch      |   48 ++++++
 .../xorg/xorg-driver/xf86-video-fbdev_0.3.1.bb     |    6 +
 .../xorg/xorg-driver/xf86-video-fbdev_0.4.0.bb     |    9 +
 .../xorg/xorg-driver/xf86-video-geode/fixes.patch  |  161 ++++++++++++++++++++
 .../xorg/xorg-driver/xf86-video-geode_2.10.1.bb    |    9 +
 .../xorg/xorg-driver/xf86-video-geode_2.11.0.bb    |    9 +
 .../xorg/xorg-driver/xf86-video-geode_2.11.4.1.bb  |   10 ++
 .../xorg/xorg-driver/xf86-video-geode_2.11.7.bb    |    9 +
 .../xorg/xorg-driver/xf86-video-geode_2.8.0.bb     |    6 +
 .../xorg/xorg-driver/xf86-video-geode_2.9.0.bb     |    9 +
 .../xorg/xorg-driver/xf86-video-glint_1.1.1.bb     |    6 +
 .../xorg/xorg-driver/xf86-video-glint_1.2.0.bb     |   13 ++
 .../xorg/xorg-driver/xf86-video-glint_1.2.1.bb     |    7 +
 .../xorg/xorg-driver/xf86-video-i128_1.1.0.5.bb    |    7 +
 .../xorg/xorg-driver/xf86-video-i128_1.1.0.6.bb    |    7 +
 .../xorg/xorg-driver/xf86-video-i128_1.2.1.bb      |    7 +
 .../xorg/xorg-driver/xf86-video-i128_1.3.0.bb      |    7 +
 .../xorg/xorg-driver/xf86-video-i128_1.3.1.bb      |    7 +
 .../xorg/xorg-driver/xf86-video-i740_1.1.0.bb      |    7 +
 .../xorg/xorg-driver/xf86-video-i740_1.2.0.bb      |    7 +
 .../xorg/xorg-driver/xf86-video-i810_1.6.5.bb      |    8 +
 .../xorg/xorg-driver/xf86-video-intel_2.10.0.bb    |   11 ++
 .../xorg/xorg-driver/xf86-video-intel_2.2.1.bb     |    8 +
 .../xorg/xorg-driver/xf86-video-intel_2.4.2.bb     |    8 +
 .../xorg/xorg-driver/xf86-video-intel_2.6.3.bb     |    8 +
 .../xorg/xorg-driver/xf86-video-mach64_6.8.0.bb    |    8 +
 .../xorg/xorg-driver/xf86-video-mga_1.4.1.bb       |    6 +
 .../xorg/xorg-driver/xf86-video-mga_1.4.9.bb       |    6 +
 .../xorg/xorg-driver/xf86-video-mga_1.9.99.bb      |    7 +
 .../xorg/xorg-driver/xf86-video-neomagic_1.1.1.bb  |    8 +
 .../xorg/xorg-driver/xf86-video-neomagic_1.2.1.bb  |    8 +
 .../xorg/xorg-driver/xf86-video-newport_0.2.1.bb   |    7 +
 .../xorg/xorg-driver/xf86-video-nsc_2.8.2.bb       |   11 ++
 .../xorg/xorg-driver/xf86-video-nv_1.2.2.1.bb      |    6 +
 .../xorg/xorg-driver/xf86-video-nv_2.1.12.bb       |    7 +
 .../xorg/xorg-driver/xf86-video-nv_2.1.16.bb       |    7 +
 .../xorg/xorg-driver/xf86-video-nv_2.1.17.bb       |    7 +
 .../xorg/xorg-driver/xf86-video-nv_2.1.3.bb        |    6 +
 .../xorg/xorg-driver/xf86-video-nv_2.1.7.bb        |    7 +
 .../xorg/xorg-driver/xf86-video-nv_2.1.8.bb        |    7 +
 .../xorg/xorg-driver/xf86-video-nv_2.1.9.bb        |    7 +
 .../xorg-driver/xf86-video-openchrome_0.2.903.bb   |   11 ++
 .../xorg/xorg-driver/xf86-video-r128_6.8.0.bb      |    7 +
 .../xorg/xorg-driver/xf86-video-radeonhd_1.2.0.bb  |   12 ++
 .../xorg/xorg-driver/xf86-video-rendition_4.1.3.bb |    7 +
 .../xorg/xorg-driver/xf86-video-rendition_4.2.0.bb |    7 +
 .../xorg/xorg-driver/xf86-video-s3_0.5.0.bb        |    6 +
 .../xorg/xorg-driver/xf86-video-s3_0.6.0.bb        |    7 +
 .../xorg/xorg-driver/xf86-video-s3virge_1.10.1.bb  |    7 +
 .../xorg/xorg-driver/xf86-video-s3virge_1.9.1.bb   |    6 +
 .../xorg/xorg-driver/xf86-video-savage_2.1.2.bb    |    7 +
 .../xorg/xorg-driver/xf86-video-savage_2.1.3.bb    |    7 +
 .../xorg/xorg-driver/xf86-video-savage_2.2.1.bb    |   14 ++
 .../xorg-driver/xf86-video-siliconmotion_1.5.1.bb  |    6 +
 .../xorg-driver/xf86-video-siliconmotion_1.6.0.bb  |    7 +
 .../xorg/xorg-driver/xf86-video-sis_0.10.0.bb      |   14 ++
 .../xorg/xorg-driver/xf86-video-sis_0.10.1.bb      |   14 ++
 .../xorg/xorg-driver/xf86-video-sis_0.9.3.bb       |    7 +
 .../xorg/xorg-driver/xf86-video-sis_0.9.4.bb       |    8 +
 .../xorg/xorg-driver/xf86-video-sisusb_0.8.1.bb    |    7 +
 .../xorg/xorg-driver/xf86-video-sisusb_0.9.0.bb    |    8 +
 .../xorg/xorg-driver/xf86-video-sisusb_0.9.1.bb    |    8 +
 .../xorg/xorg-driver/xf86-video-suncg14_1.1.0.bb   |    6 +
 .../xorg/xorg-driver/xf86-video-suncg3_1.1.0.bb    |    6 +
 .../xorg/xorg-driver/xf86-video-suncg6_1.1.0.bb    |    6 +
 .../xorg/xorg-driver/xf86-video-sunffb_1.1.0.bb    |    7 +
 .../xorg/xorg-driver/xf86-video-sunffb_1.2.0.bb    |    6 +
 .../xorg/xorg-driver/xf86-video-sunleo_1.1.0.bb    |    6 +
 .../xorg/xorg-driver/xf86-video-suntcx_1.1.0.bb    |    6 +
 .../xorg/xorg-driver/xf86-video-tdfx_1.3.0.bb      |    7 +
 .../xorg/xorg-driver/xf86-video-tdfx_1.4.0.bb      |   13 ++
 .../xorg/xorg-driver/xf86-video-tga_1.1.0.bb       |    8 +
 .../xorg/xorg-driver/xf86-video-tga_1.2.0.bb       |    8 +
 .../xorg/xorg-driver/xf86-video-trident_1.2.3.bb   |    7 +
 .../xorg/xorg-driver/xf86-video-trident_1.2.4.bb   |    8 +
 .../xorg/xorg-driver/xf86-video-trident_1.3.0.bb   |    8 +
 .../xorg/xorg-driver/xf86-video-tseng_1.1.1.bb     |    6 +
 .../xorg/xorg-driver/xf86-video-tseng_1.2.0.bb     |    6 +
 .../xorg/xorg-driver/xf86-video-v4l_0.1.1.bb       |    7 +
 .../xorg/xorg-driver/xf86-video-vesa_1.3.0.bb      |    7 +
 .../xorg/xorg-driver/xf86-video-vesa_2.0.0.bb      |    8 +
 .../xorg/xorg-driver/xf86-video-vesa_2.2.0.bb      |    9 +
 .../xorg/xorg-driver/xf86-video-vmware_10.14.1.bb  |    7 +
 .../xorg/xorg-driver/xf86-video-vmware_10.15.2.bb  |    7 +
 .../xorg/xorg-driver/xf86-video-vmware_10.16.1.bb  |    7 +
 .../xorg/xorg-driver/xf86-video-vmware_10.16.5.bb  |    7 +
 .../xorg/xorg-driver/xf86-video-vmware_10.16.9.bb  |    7 +
 .../xorg/xorg-driver/xf86-video-vmware_11.0.0.bb   |    7 +
 .../xorg/xorg-driver/xf86-video-vmware_11.0.1.bb   |    7 +
 .../xorg/xorg-driver/xf86-video-voodoo_1.1.1.bb    |    8 +
 .../xorg/xorg-driver/xf86-video-voodoo_1.2.0.bb    |    8 +
 .../xorg/xorg-driver/xf86-video-wsfb_0.2.1.bb      |    7 +
 .../xorg/xorg-driver/xf86-video-xgi_1.5.0.bb       |    7 +
 .../xorg/xorg-driver/xf86-video-xgixp_1.7.99.3.bb  |    7 +
 recipes/xorg-driver/xf86-input-acecad_1.1.0.bb     |    6 -
 recipes/xorg-driver/xf86-input-acecad_1.2.1.bb     |    7 -
 recipes/xorg-driver/xf86-input-acecad_1.2.2.bb     |    7 -
 recipes/xorg-driver/xf86-input-aiptek_1.0.1.bb     |    6 -
 recipes/xorg-driver/xf86-input-aiptek_1.1.1.bb     |    6 -
 recipes/xorg-driver/xf86-input-calcomp_1.1.0.bb    |    6 -
 recipes/xorg-driver/xf86-input-calcomp_1.1.1.bb    |    7 -
 recipes/xorg-driver/xf86-input-citron_2.2.0.bb     |    6 -
 recipes/xorg-driver/xf86-input-citron_2.2.1.bb     |    7 -
 .../xorg-driver/xf86-input-digitaledge_1.1.0.bb    |    6 -
 recipes/xorg-driver/xf86-input-dmc_1.1.0.bb        |    6 -
 recipes/xorg-driver/xf86-input-dmc_1.1.1.bb        |    7 -
 recipes/xorg-driver/xf86-input-dynapro_1.1.0.bb    |    6 -
 recipes/xorg-driver/xf86-input-dynapro_1.1.1.bb    |    7 -
 recipes/xorg-driver/xf86-input-elo2300_1.1.0.bb    |    6 -
 recipes/xorg-driver/xf86-input-elo2300_1.1.1.bb    |    7 -
 .../xorg-driver/xf86-input-elographics_1.1.0.bb    |    7 -
 .../xorg-driver/xf86-input-elographics_1.2.2.bb    |    7 -
 .../xf86-input-elographics_X11R7.0-1.0.0.5.bb      |    6 -
 recipes/xorg-driver/xf86-input-evdev_1.1.5.bb      |    7 -
 recipes/xorg-driver/xf86-input-evdev_1.2.0.bb      |    7 -
 recipes/xorg-driver/xf86-input-evdev_1.99.4.bb     |    7 -
 recipes/xorg-driver/xf86-input-evdev_2.0.4.bb      |    7 -
 recipes/xorg-driver/xf86-input-evdev_2.1.0.bb      |    7 -
 recipes/xorg-driver/xf86-input-evdev_2.2.5.bb      |    7 -
 recipes/xorg-driver/xf86-input-evdev_2.2.6.bb      |    7 -
 recipes/xorg-driver/xf86-input-evdev_2.3.1.bb      |    7 -
 recipes/xorg-driver/xf86-input-evdev_2.3.2.bb      |    7 -
 recipes/xorg-driver/xf86-input-fpit_1.1.0.bb       |    6 -
 recipes/xorg-driver/xf86-input-fpit_1.2.0.bb       |    6 -
 recipes/xorg-driver/xf86-input-hyperpen_1.1.0.bb   |    6 -
 recipes/xorg-driver/xf86-input-hyperpen_1.2.0.bb   |    6 -
 recipes/xorg-driver/xf86-input-jamstudio_1.1.0.bb  |    6 -
 recipes/xorg-driver/xf86-input-joystick_1.1.0.bb   |    6 -
 recipes/xorg-driver/xf86-input-joystick_1.3.1.bb   |    7 -
 recipes/xorg-driver/xf86-input-joystick_1.3.2.bb   |    7 -
 recipes/xorg-driver/xf86-input-keyboard_1.1.1.bb   |    7 -
 recipes/xorg-driver/xf86-input-keyboard_1.2.0.bb   |    7 -
 recipes/xorg-driver/xf86-input-keyboard_1.2.2.bb   |    7 -
 recipes/xorg-driver/xf86-input-keyboard_1.3.1.bb   |    8 -
 recipes/xorg-driver/xf86-input-keyboard_1.3.2.bb   |    8 -
 recipes/xorg-driver/xf86-input-magellan_1.1.0.bb   |    6 -
 recipes/xorg-driver/xf86-input-magellan_1.1.1.bb   |    7 -
 recipes/xorg-driver/xf86-input-microtouch_1.1.0.bb |    6 -
 recipes/xorg-driver/xf86-input-microtouch_1.1.1.bb |    7 -
 recipes/xorg-driver/xf86-input-mouse_1.1.2.bb      |    7 -
 recipes/xorg-driver/xf86-input-mouse_1.2.1.bb      |    7 -
 recipes/xorg-driver/xf86-input-mouse_1.2.2.bb      |    7 -
 recipes/xorg-driver/xf86-input-mouse_1.2.3.bb      |    7 -
 recipes/xorg-driver/xf86-input-mouse_1.3.0.bb      |    7 -
 recipes/xorg-driver/xf86-input-mouse_1.4.0.bb      |    7 -
 recipes/xorg-driver/xf86-input-mutouch_1.1.0.bb    |    6 -
 recipes/xorg-driver/xf86-input-mutouch_1.2.0.bb    |    7 -
 recipes/xorg-driver/xf86-input-palmax_1.1.0.bb     |    6 -
 recipes/xorg-driver/xf86-input-penmount_1.2.0.bb   |    6 -
 recipes/xorg-driver/xf86-input-penmount_1.2.1.bb   |    7 -
 recipes/xorg-driver/xf86-input-penmount_1.3.0.bb   |    7 -
 recipes/xorg-driver/xf86-input-spaceorb_1.1.0.bb   |    6 -
 recipes/xorg-driver/xf86-input-summa_1.1.0.bb      |    6 -
 recipes/xorg-driver/xf86-input-synaptics_0.15.0.bb |    7 -
 recipes/xorg-driver/xf86-input-synaptics_1.2.1.bb  |    7 -
 recipes/xorg-driver/xf86-input-tek4957_1.1.0.bb    |    6 -
 recipes/xorg-driver/xf86-input-vmmouse_12.4.0.bb   |    9 -
 recipes/xorg-driver/xf86-input-vmmouse_12.4.3.bb   |    7 -
 recipes/xorg-driver/xf86-input-vmmouse_12.5.1.bb   |    9 -
 recipes/xorg-driver/xf86-input-vmmouse_12.6.6.bb   |    9 -
 recipes/xorg-driver/xf86-input-vmmouse_12.6.9.bb   |    9 -
 recipes/xorg-driver/xf86-input-void_1.1.0.bb       |    6 -
 recipes/xorg-driver/xf86-input-void_1.1.1.bb       |    7 -
 recipes/xorg-driver/xf86-video-apm_1.1.1.bb        |    8 -
 recipes/xorg-driver/xf86-video-apm_1.2.0.bb        |    9 -
 recipes/xorg-driver/xf86-video-ark_0.6.0.bb        |    6 -
 recipes/xorg-driver/xf86-video-ark_0.7.0.bb        |    8 -
 recipes/xorg-driver/xf86-video-ast_0.81.0.bb       |    6 -
 recipes/xorg-driver/xf86-video-ast_0.85.0.bb       |    6 -
 recipes/xorg-driver/xf86-video-ati_6.13.0.bb       |    8 -
 recipes/xorg-driver/xf86-video-ati_6.6.193.bb      |    7 -
 recipes/xorg-driver/xf86-video-ati_6.6.3.bb        |    7 -
 recipes/xorg-driver/xf86-video-ati_6.7.196.bb      |    7 -
 recipes/xorg-driver/xf86-video-ati_6.7.197.bb      |    8 -
 recipes/xorg-driver/xf86-video-ati_6.8.0.bb        |    8 -
 recipes/xorg-driver/xf86-video-chips_1.1.1.bb      |    6 -
 recipes/xorg-driver/xf86-video-chips_1.2.0.bb      |    7 -
 recipes/xorg-driver/xf86-video-cirrus_1.1.0.bb     |    6 -
 recipes/xorg-driver/xf86-video-cirrus_1.2.1.bb     |    7 -
 recipes/xorg-driver/xf86-video-dummy_0.2.0.bb      |    6 -
 recipes/xorg-driver/xf86-video-dummy_0.3.0.bb      |    8 -
 recipes/xorg-driver/xf86-video-dummy_0.3.3.bb      |    8 -
 .../xf86-video-fbdev/use-staged-headers.patch      |   48 ------
 recipes/xorg-driver/xf86-video-fbdev_0.3.1.bb      |    6 -
 recipes/xorg-driver/xf86-video-fbdev_0.4.0.bb      |    9 -
 recipes/xorg-driver/xf86-video-geode/fixes.patch   |  161 --------------------
 recipes/xorg-driver/xf86-video-geode_2.10.1.bb     |    9 -
 recipes/xorg-driver/xf86-video-geode_2.11.0.bb     |    9 -
 recipes/xorg-driver/xf86-video-geode_2.11.4.1.bb   |   10 --
 recipes/xorg-driver/xf86-video-geode_2.11.7.bb     |    9 -
 recipes/xorg-driver/xf86-video-geode_2.8.0.bb      |    6 -
 recipes/xorg-driver/xf86-video-geode_2.9.0.bb      |    9 -
 recipes/xorg-driver/xf86-video-glint_1.1.1.bb      |    6 -
 recipes/xorg-driver/xf86-video-glint_1.2.0.bb      |   13 --
 recipes/xorg-driver/xf86-video-glint_1.2.1.bb      |    7 -
 recipes/xorg-driver/xf86-video-i128_1.1.0.5.bb     |    7 -
 recipes/xorg-driver/xf86-video-i128_1.1.0.6.bb     |    7 -
 recipes/xorg-driver/xf86-video-i128_1.2.1.bb       |    7 -
 recipes/xorg-driver/xf86-video-i128_1.3.0.bb       |    7 -
 recipes/xorg-driver/xf86-video-i128_1.3.1.bb       |    7 -
 recipes/xorg-driver/xf86-video-i740_1.1.0.bb       |    7 -
 recipes/xorg-driver/xf86-video-i740_1.2.0.bb       |    7 -
 recipes/xorg-driver/xf86-video-i810_1.6.5.bb       |    8 -
 recipes/xorg-driver/xf86-video-intel_2.10.0.bb     |   11 --
 recipes/xorg-driver/xf86-video-intel_2.2.1.bb      |    8 -
 recipes/xorg-driver/xf86-video-intel_2.4.2.bb      |    8 -
 recipes/xorg-driver/xf86-video-intel_2.6.3.bb      |    8 -
 recipes/xorg-driver/xf86-video-mach64_6.8.0.bb     |    8 -
 recipes/xorg-driver/xf86-video-mga_1.4.1.bb        |    6 -
 recipes/xorg-driver/xf86-video-mga_1.4.9.bb        |    6 -
 recipes/xorg-driver/xf86-video-mga_1.9.99.bb       |    7 -
 recipes/xorg-driver/xf86-video-neomagic_1.1.1.bb   |    8 -
 recipes/xorg-driver/xf86-video-neomagic_1.2.1.bb   |    8 -
 recipes/xorg-driver/xf86-video-newport_0.2.1.bb    |    7 -
 recipes/xorg-driver/xf86-video-nsc_2.8.2.bb        |   11 --
 recipes/xorg-driver/xf86-video-nv_1.2.2.1.bb       |    6 -
 recipes/xorg-driver/xf86-video-nv_2.1.12.bb        |    7 -
 recipes/xorg-driver/xf86-video-nv_2.1.16.bb        |    7 -
 recipes/xorg-driver/xf86-video-nv_2.1.17.bb        |    7 -
 recipes/xorg-driver/xf86-video-nv_2.1.3.bb         |    6 -
 recipes/xorg-driver/xf86-video-nv_2.1.7.bb         |    7 -
 recipes/xorg-driver/xf86-video-nv_2.1.8.bb         |    7 -
 recipes/xorg-driver/xf86-video-nv_2.1.9.bb         |    7 -
 .../xorg-driver/xf86-video-openchrome_0.2.903.bb   |   11 --
 recipes/xorg-driver/xf86-video-r128_6.8.0.bb       |    7 -
 recipes/xorg-driver/xf86-video-radeonhd_1.2.0.bb   |   12 --
 recipes/xorg-driver/xf86-video-rendition_4.1.3.bb  |    7 -
 recipes/xorg-driver/xf86-video-rendition_4.2.0.bb  |    7 -
 recipes/xorg-driver/xf86-video-s3_0.5.0.bb         |    6 -
 recipes/xorg-driver/xf86-video-s3_0.6.0.bb         |    7 -
 recipes/xorg-driver/xf86-video-s3virge_1.10.1.bb   |    7 -
 recipes/xorg-driver/xf86-video-s3virge_1.9.1.bb    |    6 -
 recipes/xorg-driver/xf86-video-savage_2.1.2.bb     |    7 -
 recipes/xorg-driver/xf86-video-savage_2.1.3.bb     |    7 -
 recipes/xorg-driver/xf86-video-savage_2.2.1.bb     |   14 --
 .../xorg-driver/xf86-video-siliconmotion_1.5.1.bb  |    6 -
 .../xorg-driver/xf86-video-siliconmotion_1.6.0.bb  |    7 -
 recipes/xorg-driver/xf86-video-sis_0.10.0.bb       |   14 --
 recipes/xorg-driver/xf86-video-sis_0.10.1.bb       |   14 --
 recipes/xorg-driver/xf86-video-sis_0.9.3.bb        |    7 -
 recipes/xorg-driver/xf86-video-sis_0.9.4.bb        |    8 -
 recipes/xorg-driver/xf86-video-sisusb_0.8.1.bb     |    7 -
 recipes/xorg-driver/xf86-video-sisusb_0.9.0.bb     |    8 -
 recipes/xorg-driver/xf86-video-sisusb_0.9.1.bb     |    8 -
 recipes/xorg-driver/xf86-video-suncg14_1.1.0.bb    |    6 -
 recipes/xorg-driver/xf86-video-suncg3_1.1.0.bb     |    6 -
 recipes/xorg-driver/xf86-video-suncg6_1.1.0.bb     |    6 -
 recipes/xorg-driver/xf86-video-sunffb_1.1.0.bb     |    7 -
 recipes/xorg-driver/xf86-video-sunffb_1.2.0.bb     |    6 -
 recipes/xorg-driver/xf86-video-sunleo_1.1.0.bb     |    6 -
 recipes/xorg-driver/xf86-video-suntcx_1.1.0.bb     |    6 -
 recipes/xorg-driver/xf86-video-tdfx_1.3.0.bb       |    7 -
 recipes/xorg-driver/xf86-video-tdfx_1.4.0.bb       |   13 --
 recipes/xorg-driver/xf86-video-tga_1.1.0.bb        |    8 -
 recipes/xorg-driver/xf86-video-tga_1.2.0.bb        |    8 -
 recipes/xorg-driver/xf86-video-trident_1.2.3.bb    |    7 -
 recipes/xorg-driver/xf86-video-trident_1.2.4.bb    |    8 -
 recipes/xorg-driver/xf86-video-trident_1.3.0.bb    |    8 -
 recipes/xorg-driver/xf86-video-tseng_1.1.1.bb      |    6 -
 recipes/xorg-driver/xf86-video-tseng_1.2.0.bb      |    6 -
 recipes/xorg-driver/xf86-video-v4l_0.1.1.bb        |    7 -
 recipes/xorg-driver/xf86-video-vesa_1.3.0.bb       |    7 -
 recipes/xorg-driver/xf86-video-vesa_2.0.0.bb       |    8 -
 recipes/xorg-driver/xf86-video-vesa_2.2.0.bb       |    9 -
 recipes/xorg-driver/xf86-video-vmware_10.14.1.bb   |    7 -
 recipes/xorg-driver/xf86-video-vmware_10.15.2.bb   |    7 -
 recipes/xorg-driver/xf86-video-vmware_10.16.1.bb   |    7 -
 recipes/xorg-driver/xf86-video-vmware_10.16.5.bb   |    7 -
 recipes/xorg-driver/xf86-video-vmware_10.16.9.bb   |    7 -
 recipes/xorg-driver/xf86-video-vmware_11.0.0.bb    |    7 -
 recipes/xorg-driver/xf86-video-vmware_11.0.1.bb    |    7 -
 recipes/xorg-driver/xf86-video-voodoo_1.1.1.bb     |    8 -
 recipes/xorg-driver/xf86-video-voodoo_1.2.0.bb     |    8 -
 recipes/xorg-driver/xf86-video-wsfb_0.2.1.bb       |    7 -
 recipes/xorg-driver/xf86-video-xgi_1.5.0.bb        |    7 -
 recipes/xorg-driver/xf86-video-xgixp_1.7.99.3.bb   |    7 -
 364 files changed, 1521 insertions(+), 1521 deletions(-)
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-acecad_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-acecad_1.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-acecad_1.2.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-aiptek_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-aiptek_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-calcomp_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-calcomp_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-citron_2.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-citron_2.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-digitaledge_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-dmc_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-dmc_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-dynapro_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-dynapro_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-elo2300_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-elo2300_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-elographics_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-elographics_1.2.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-elographics_X11R7.0-1.0.0.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_1.1.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_1.99.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.0.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.2.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.2.6.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.3.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.3.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-fpit_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-fpit_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-hyperpen_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-hyperpen_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-jamstudio_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-joystick_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-joystick_1.3.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-joystick_1.3.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.2.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.3.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.3.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-magellan_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-magellan_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-microtouch_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-microtouch_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.2.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.2.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.3.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.4.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-mutouch_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-mutouch_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-palmax_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-penmount_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-penmount_1.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-penmount_1.3.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-spaceorb_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-summa_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-synaptics_0.15.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-synaptics_1.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-tek4957_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.4.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.4.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.5.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.6.6.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.6.9.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-void_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-input-void_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-apm_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-apm_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-ark_0.6.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-ark_0.7.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-ast_0.81.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-ast_0.85.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.13.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.6.193.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.6.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.7.196.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.7.197.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.8.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-chips_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-chips_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-cirrus_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-cirrus_1.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-dummy_0.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-dummy_0.3.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-dummy_0.3.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-fbdev/use-staged-headers.patch
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-fbdev_0.3.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-fbdev_0.4.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-geode/fixes.patch
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.10.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.11.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.11.4.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.11.7.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.8.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.9.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-glint_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-glint_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-glint_1.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.1.0.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.1.0.6.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.3.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.3.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-i740_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-i740_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-i810_1.6.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.10.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.4.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.6.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-mach64_6.8.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-mga_1.4.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-mga_1.4.9.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-mga_1.9.99.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-neomagic_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-neomagic_1.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-newport_0.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-nsc_2.8.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-nv_1.2.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.12.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.16.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.17.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.7.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.8.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.9.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-openchrome_0.2.903.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-r128_6.8.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-radeonhd_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-rendition_4.1.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-rendition_4.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-s3_0.5.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-s3_0.6.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-s3virge_1.10.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-s3virge_1.9.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-savage_2.1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-savage_2.1.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-savage_2.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-siliconmotion_1.5.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-siliconmotion_1.6.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.10.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.10.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.9.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.9.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-sisusb_0.8.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-sisusb_0.9.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-sisusb_0.9.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-suncg14_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-suncg3_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-suncg6_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-sunffb_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-sunffb_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-sunleo_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-suntcx_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-tdfx_1.3.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-tdfx_1.4.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-tga_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-tga_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-trident_1.2.3.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-trident_1.2.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-trident_1.3.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-tseng_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-tseng_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-v4l_0.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-vesa_1.3.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-vesa_2.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-vesa_2.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.14.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.15.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.16.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.16.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.16.9.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_11.0.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_11.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-voodoo_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-voodoo_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-wsfb_0.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-xgi_1.5.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-driver/xf86-video-xgixp_1.7.99.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-acecad_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-acecad_1.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-acecad_1.2.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-aiptek_1.0.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-aiptek_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-calcomp_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-calcomp_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-citron_2.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-citron_2.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-digitaledge_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-dmc_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-dmc_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-dynapro_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-dynapro_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-elo2300_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-elo2300_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-elographics_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-elographics_1.2.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-elographics_X11R7.0-1.0.0.5.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-evdev_1.1.5.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-evdev_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-evdev_1.99.4.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-evdev_2.0.4.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-evdev_2.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-evdev_2.2.5.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-evdev_2.2.6.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-evdev_2.3.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-evdev_2.3.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-fpit_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-fpit_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-hyperpen_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-hyperpen_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-jamstudio_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-joystick_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-joystick_1.3.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-joystick_1.3.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-keyboard_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-keyboard_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-keyboard_1.2.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-keyboard_1.3.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-keyboard_1.3.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-magellan_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-magellan_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-microtouch_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-microtouch_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-mouse_1.1.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-mouse_1.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-mouse_1.2.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-mouse_1.2.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-mouse_1.3.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-mouse_1.4.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-mutouch_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-mutouch_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-palmax_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-penmount_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-penmount_1.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-penmount_1.3.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-spaceorb_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-summa_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-synaptics_0.15.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-synaptics_1.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-tek4957_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-vmmouse_12.4.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-vmmouse_12.4.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-vmmouse_12.5.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-vmmouse_12.6.6.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-vmmouse_12.6.9.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-void_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-void_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-apm_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-apm_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ark_0.6.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ark_0.7.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ast_0.81.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ast_0.85.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ati_6.13.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ati_6.6.193.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ati_6.6.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ati_6.7.196.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ati_6.7.197.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ati_6.8.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-chips_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-chips_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-cirrus_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-cirrus_1.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-dummy_0.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-dummy_0.3.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-dummy_0.3.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-fbdev/use-staged-headers.patch
 delete mode 100644 recipes/xorg-driver/xf86-video-fbdev_0.3.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-fbdev_0.4.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-geode/fixes.patch
 delete mode 100644 recipes/xorg-driver/xf86-video-geode_2.10.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.4.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.7.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-geode_2.8.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-geode_2.9.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-glint_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-glint_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-glint_1.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-i128_1.1.0.5.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-i128_1.1.0.6.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-i128_1.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-i128_1.3.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-i128_1.3.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-i740_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-i740_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-i810_1.6.5.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-intel_2.10.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-intel_2.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-intel_2.4.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-intel_2.6.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-mach64_6.8.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-mga_1.4.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-mga_1.4.9.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-mga_1.9.99.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-neomagic_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-neomagic_1.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-newport_0.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-nsc_2.8.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-nv_1.2.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-nv_2.1.12.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-nv_2.1.16.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-nv_2.1.17.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-nv_2.1.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-nv_2.1.7.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-nv_2.1.8.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-nv_2.1.9.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-openchrome_0.2.903.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-r128_6.8.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-radeonhd_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-rendition_4.1.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-rendition_4.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-s3_0.5.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-s3_0.6.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-s3virge_1.10.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-s3virge_1.9.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-savage_2.1.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-savage_2.1.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-savage_2.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-siliconmotion_1.5.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-siliconmotion_1.6.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-sis_0.10.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-sis_0.10.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-sis_0.9.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-sis_0.9.4.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-sisusb_0.8.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-sisusb_0.9.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-sisusb_0.9.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-suncg14_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-suncg3_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-suncg6_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-sunffb_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-sunffb_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-sunleo_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-suntcx_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-tdfx_1.3.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-tdfx_1.4.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-tga_1.1.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-tga_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-trident_1.2.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-trident_1.2.4.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-trident_1.3.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-tseng_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-tseng_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-v4l_0.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vesa_1.3.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vesa_2.0.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vesa_2.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vmware_10.14.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vmware_10.15.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vmware_10.16.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vmware_10.16.5.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vmware_10.16.9.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vmware_11.0.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vmware_11.0.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-voodoo_1.1.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-voodoo_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-wsfb_0.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-xgi_1.5.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-xgixp_1.7.99.3.bb

diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-acecad_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-acecad_1.1.0.bb
new file mode 100644
index 0000000..b0eef56
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-acecad_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ce0b7bec500273ad935cbfa212b8ac8a"
+SRC_URI[archive.sha256sum] = "3e5feea79f1d48cd46a2a40661140042ac586f90311669f79d65fea6cfc112ad"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-acecad_1.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-acecad_1.2.1.bb
new file mode 100644
index 0000000..0c0a330
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-acecad_1.2.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- AceCad input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2c371317f2aae34c04db63c19759a44e"
+SRC_URI[archive.sha256sum] = "07d2f8a1153d34a6516b8f1129fc32a18f2862bbb58c9bad4637fb282d60385a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-acecad_1.2.2.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-acecad_1.2.2.bb
new file mode 100644
index 0000000..843ef1d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-acecad_1.2.2.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- AceCad input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2d6596b2b0cfa527b5ed4df2014684bf"
+SRC_URI[archive.sha256sum] = "953ebb7d7ed579ce648dd6f6a25307c37ad8230a0336ec6fc58247732835f26e"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-aiptek_1.0.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-aiptek_1.0.1.bb
new file mode 100644
index 0000000..f1c926d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-aiptek_1.0.1.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "951b2b1a270f67d28e2e89fd2b9f15ae"
+SRC_URI[archive.sha256sum] = "3db0e3259034d838c2ff7ae26718422db6d33d89cd1a2defa0efdddbbbfcc28a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-aiptek_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-aiptek_1.1.1.bb
new file mode 100644
index 0000000..499869b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-aiptek_1.1.1.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2aa75313ea5652a8cf93581c65ee6493"
+SRC_URI[archive.sha256sum] = "219116b0275b93333b8471fc94d97320a116d695c4249837fd97763f00a85d77"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-calcomp_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-calcomp_1.1.0.bb
new file mode 100644
index 0000000..e42a680
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-calcomp_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "af13f9de2af4e1d03b2da0c037fd718a"
+SRC_URI[archive.sha256sum] = "ebc446e74eea72d391104b1ce3b2a5376bced098154ec089a944f4311d240904"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-calcomp_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-calcomp_1.1.1.bb
new file mode 100644
index 0000000..91b6c40
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-calcomp_1.1.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- Calcomp input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "689099e2ade8a8c9f68f82fdf569b3ad"
+SRC_URI[archive.sha256sum] = "8117b37da2e031eb983e1e98034710a1511299496fcf235f936caff252fa8957"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-citron_2.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-citron_2.2.0.bb
new file mode 100644
index 0000000..e20503d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-citron_2.2.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1fe53cd055a69650f3c2e02377ec728c"
+SRC_URI[archive.sha256sum] = "26cfa755d3a383f80039fcd286c44ba5f7b353feb8c674f386bb08d741d2c3fe"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-citron_2.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-citron_2.2.1.bb
new file mode 100644
index 0000000..528e31f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-citron_2.2.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X Server -- Citron input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4e254fcefb3bea55772e63c12570f6d9"
+SRC_URI[archive.sha256sum] = "1480ba63b342c00a53292d513bd79a69e1ea7c01a0c77d1a368ffb22e37c1a83"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-digitaledge_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-digitaledge_1.1.0.bb
new file mode 100644
index 0000000..4d44741
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-digitaledge_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "53461c34cc0712aacab92b820b9fcb84"
+SRC_URI[archive.sha256sum] = "24001f19b46b5bc2fcf8212f04863e4efa90175fac797350525e14848ab98a38"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-dmc_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-dmc_1.1.0.bb
new file mode 100644
index 0000000..e263482
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-dmc_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e1bcbdefcb839173de79aeb3cd038b77"
+SRC_URI[archive.sha256sum] = "c5ca8fb2dfe0130767b2c10bd0661277a67e7d5b9171a7f5f6264ec48790473f"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-dmc_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-dmc_1.1.1.bb
new file mode 100644
index 0000000..cc59a54
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-dmc_1.1.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- DMC input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f21f008220bc7687ce1c34ab557ec32f"
+SRC_URI[archive.sha256sum] = "f98c5a7010fa71cee88b4c2470e5cd804e42dfbc5292cf1c20eb75e9b1814002"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-dynapro_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-dynapro_1.1.0.bb
new file mode 100644
index 0000000..96447fc
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-dynapro_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1683178d09dfc604dde9ea2aab950a28"
+SRC_URI[archive.sha256sum] = "fc2ad50b1aa027fe57da53cbb73db0b4b9d0de9032f00dd42e7cc0aae7c50d6a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-dynapro_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-dynapro_1.1.1.bb
new file mode 100644
index 0000000..9b569a3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-dynapro_1.1.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- Dynapro input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d47be12a230c44a05d56d6b79ebcfc38"
+SRC_URI[archive.sha256sum] = "ed0f1ba81febf8e7a20cfaf32b021fcaa102af37f3070d67d6a101eeb6964992"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-elo2300_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-elo2300_1.1.0.bb
new file mode 100644
index 0000000..4439f6c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-elo2300_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "43885769d6f741272dda162e82902b0d"
+SRC_URI[archive.sha256sum] = "9551f67e24c4573867a64d032d1ff6b63654caab8a85d3c6b2af7748daaa2134"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-elo2300_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-elo2300_1.1.1.bb
new file mode 100644
index 0000000..5f98171
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-elo2300_1.1.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- ELO2300 input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4eef20f44954d49571a10b9134fdb663"
+SRC_URI[archive.sha256sum] = "cc2cd97f49cce1795ea74034b1416ff7cd5107e1a69258b09a741d55a98ba005"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-elographics_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-elographics_1.1.0.bb
new file mode 100644
index 0000000..ae3a016
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-elographics_1.1.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- ELOGraphics input driver"
+PE = "2"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ecb2bf1f800d4f5f4c295f2a0e6b1de7"
+SRC_URI[archive.sha256sum] = "1583e1dae6e3ecd34ba55deae7dfc052efede0378f852de6224308d7e7d5b2d8"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-elographics_1.2.2.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-elographics_1.2.2.bb
new file mode 100644
index 0000000..ccda074
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-elographics_1.2.2.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- ELOGraphics input driver"
+PE = "2"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "50a9c32af12ca4733afe23042f012f9c"
+SRC_URI[archive.sha256sum] = "76ded0e6977f7d562a8236bc810423cd050320531be9621d868a48309ebc4d63"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-elographics_X11R7.0-1.0.0.5.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-elographics_X11R7.0-1.0.0.5.bb
new file mode 100644
index 0000000..0857670
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-elographics_X11R7.0-1.0.0.5.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "24c33f833bb2db72a07c3d28bfc0aae9"
+SRC_URI[archive.sha256sum] = "f1b7f84175d33f4d18c83cd0d37bd3962acd668922fa074a8ae29e18517cdda7"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_1.1.5.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_1.1.5.bb
new file mode 100644
index 0000000..45e3010
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_1.1.5.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DEPENDS += " kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "01705ea9a4d1699d5eeb17e7f297a581"
+SRC_URI[archive.sha256sum] = "52b7daab86dade2d189f0378ddf196c018cdc9dd47ade0b3b8fc7591cb4bbe9e"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_1.2.0.bb
new file mode 100644
index 0000000..6dcfa8e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_1.2.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- evdev input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0c7c41d3f1637bb559e80c2ad708f05d"
+SRC_URI[archive.sha256sum] = "b23b231d754cab717a4b145ee3a5f3e73db46d877d23502326e9794d92d976ba"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_1.99.4.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_1.99.4.bb
new file mode 100644
index 0000000..395bfbc
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_1.99.4.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- evdev input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f56d98ab11ef77cfcbafb5d93c697791"
+SRC_URI[archive.sha256sum] = "71e896168819bcf50044c175482d03873c31bc6eb355305a87e94772580789dd"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.0.4.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.0.4.bb
new file mode 100644
index 0000000..c0458e1
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.0.4.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- evdev input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ac97e155ea4db87a8393297493f9c406"
+SRC_URI[archive.sha256sum] = "825adcadaf4c90d4cb1d0bd21dcf67bf3b895f12f8e7bf186ed936445dc015ca"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.1.0.bb
new file mode 100644
index 0000000..5974386
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.1.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- evdev input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a6070ead29b2d81b5b386a96df2661b8"
+SRC_URI[archive.sha256sum] = "45c4b6df8d1dbc4db8aa580be4f3c693ebba4eba4908d82489948827d3bed0e5"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.2.5.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.2.5.bb
new file mode 100644
index 0000000..7605fe3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.2.5.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- evdev input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e926692d74ee81ed459d0fe89439ff8b"
+SRC_URI[archive.sha256sum] = "433fd29043cd427ba486bcce471aae3ad1abca94c8682feff92da0c380b8dff3"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.2.6.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.2.6.bb
new file mode 100644
index 0000000..b490d18
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.2.6.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- evdev input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "bc4b2356e1dbf2d21e1e95249b18f5f8"
+SRC_URI[archive.sha256sum] = "dbf3799e207175e91f50492d51343e5cfdc706f637f6e9f14257b764e86bb3f9"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.3.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.3.1.bb
new file mode 100644
index 0000000..32798ca
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.3.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- evdev input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e56ce4424b89b2409c6e73e007a85da7"
+SRC_URI[archive.sha256sum] = "462f2ae2fd389a87e09fa764a236cd04dcbf85bcfcd8000aa9a3810055511d8f"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.3.2.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.3.2.bb
new file mode 100644
index 0000000..3967e40
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-evdev_2.3.2.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- evdev input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b2bfe368022eedf2671ee28daba31efc"
+SRC_URI[archive.sha256sum] = "029bf469bd013bcc3e384c1297a05a59e4b9b3ba90a26c022b32c0819d115e28"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-fpit_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-fpit_1.1.0.bb
new file mode 100644
index 0000000..57647da
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-fpit_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a31066a2076d18619ceaea67f6d89698"
+SRC_URI[archive.sha256sum] = "8ee3b2df90516182460fbda025153aa7fb2c6ba343e4239d225963a287f694f8"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-fpit_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-fpit_1.2.0.bb
new file mode 100644
index 0000000..261dfb0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-fpit_1.2.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0f3e013d5ff58e0aba3d9e1d18830291"
+SRC_URI[archive.sha256sum] = "87e3dd97d57ddb520cafa5e68fa7846cfc3d9d71cb054cdf0e1d650c7b1cff7e"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-hyperpen_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-hyperpen_1.1.0.bb
new file mode 100644
index 0000000..30d24d6
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-hyperpen_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1dfccb75069e61e0c6f990b47eb58c40"
+SRC_URI[archive.sha256sum] = "d1c20a3340e06c5634759832dcf2edc6acb41476a4f637eba6880730e607f493"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-hyperpen_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-hyperpen_1.2.0.bb
new file mode 100644
index 0000000..cc64178
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-hyperpen_1.2.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "175c1e1ad668ebbbe212c1e975dd14f9"
+SRC_URI[archive.sha256sum] = "689d1c5c1f21eed00ae03a01c57482f7bbef36d7e07156556c99febe28c7d413"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-jamstudio_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-jamstudio_1.1.0.bb
new file mode 100644
index 0000000..31c41f3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-jamstudio_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a32e36a24545791a3408cdc5563b6523"
+SRC_URI[archive.sha256sum] = "ce41b360bd08ea31036b79cfc25a32c854147522e4580f5ca1a203233e657e1a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-joystick_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-joystick_1.1.0.bb
new file mode 100644
index 0000000..ffb9ecc
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-joystick_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e0025215542c7a11c5a7f9548631dbd7"
+SRC_URI[archive.sha256sum] = "11c3e8056e8f44b9a6f348b5366c7e725155563374770b82e339e913b9a60d16"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-joystick_1.3.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-joystick_1.3.1.bb
new file mode 100644
index 0000000..b4bad29
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-joystick_1.3.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- joystick input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ff25ea697cfa1570cc28f4b9cf9c761f"
+SRC_URI[archive.sha256sum] = "1d33b9668e039ea9adc0680c1f2971785508cfd74b2215749db23af23ef8f9ce"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-joystick_1.3.2.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-joystick_1.3.2.bb
new file mode 100644
index 0000000..81bde8f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-joystick_1.3.2.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- joystick input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e48b99e55093525ebb7811a014391a0b"
+SRC_URI[archive.sha256sum] = "6cad238e0a54dec75c5224f9c0774b4fce2a03b06f1c61b404e9ea97d4941d4b"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.1.1.bb
new file mode 100644
index 0000000..75f3b39
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.1.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DEPENDS += " kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "babf094e37bdfc08076d4adb4c69c1d9"
+SRC_URI[archive.sha256sum] = "b7e7377d75f3a10cceb5df18019b8e4498fbed0100478edd4af75bf8cd45d6fd"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.2.0.bb
new file mode 100644
index 0000000..465de76
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.2.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DEPENDS += " kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "06e14029e00b32ed085769775b398efd"
+SRC_URI[archive.sha256sum] = "8c45fc324ea01377f9932250824ee1769bdf1eab6e4b661c22a39deb0b01580a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.2.2.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.2.2.bb
new file mode 100644
index 0000000..e407ff5
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.2.2.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DEPENDS += " kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ab3122921f6359c54e250879288ffd47"
+SRC_URI[archive.sha256sum] = "c25b35524eaf00928d97bd0d8bf9e489d92993b133461b5f4d8d9655d37ec072"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.3.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.3.1.bb
new file mode 100644
index 0000000..46f8650
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.3.1.bb
@@ -0,0 +1,8 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- keyboard input driver"
+DEPENDS += " kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ebe5dcf8eed819103909f18321fc3b9d"
+SRC_URI[archive.sha256sum] = "7b514715dfb5a2512dea3355bc3f09eb879d7184440c5525f0a9d29ec9f3be42"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.3.2.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.3.2.bb
new file mode 100644
index 0000000..7c07927
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-keyboard_1.3.2.bb
@@ -0,0 +1,8 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- keyboard input driver"
+DEPENDS += " kbproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d6fe929c4f6085d6dd67f197ae9c42f6"
+SRC_URI[archive.sha256sum] = "33939ec65dbf56f49e1e7de854a1cf95446e40c533950431901567e67112aef2"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-magellan_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-magellan_1.1.0.bb
new file mode 100644
index 0000000..06b901b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-magellan_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0d6a81aa864ac790d9a8b517ca7016ad"
+SRC_URI[archive.sha256sum] = "8eef54b50c428513a330ed7183ce37f269050252a4d1199d3b00ad6bf0a7833d"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-magellan_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-magellan_1.1.1.bb
new file mode 100644
index 0000000..4e020e6
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-magellan_1.1.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- Magellan input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8a966d3b74dc2a801ff09b895037090c"
+SRC_URI[archive.sha256sum] = "06da7d1b222ba47ba0c7fd561965d78f2c8e46f44c998cb768e98bdc3c0e1741"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-microtouch_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-microtouch_1.1.0.bb
new file mode 100644
index 0000000..d8adb95
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-microtouch_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7b3cc0330d70e7e4e07914fcb325b331"
+SRC_URI[archive.sha256sum] = "7f92f5531495ecfbfd00744198fd4b2aa3b8f5c188b115e55e865e961bca2039"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-microtouch_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-microtouch_1.1.1.bb
new file mode 100644
index 0000000..68c58e0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-microtouch_1.1.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- MicroTouch input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9843fbea6cc0c4129e96ce9a6c893cf6"
+SRC_URI[archive.sha256sum] = "5f2f0b16705c6226081a452f9f876508c388b384fca69106d377cd134cfddfd3"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.1.2.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.1.2.bb
new file mode 100644
index 0000000..a113404
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.1.2.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "Mouse Support in X11"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d8bcd9fb1b4efb02acd251495f9a30c1"
+SRC_URI[archive.sha256sum] = "7d4c2ecbe8f9327f7c8093c05401ab68b22f3343bcf04e4838cc40c21b7f8e0a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.2.1.bb
new file mode 100644
index 0000000..0145028
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.2.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "Mouse Support in X11"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "72b07e65bbea6ab484d84c048f6835fb"
+SRC_URI[archive.sha256sum] = "82671998e2b02ad097e3d5cc7d964e11de0b3ca3dfec4876e8fa2a13af6aacc3"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.2.2.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.2.2.bb
new file mode 100644
index 0000000..431b7a7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.2.2.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "Mouse Support in X11"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c47c598e55e7080b8ea30f70781f7ca3"
+SRC_URI[archive.sha256sum] = "80e9cb52b2036b71289b2140bcd3ac202cf46fd42830761c53120ddac38e7edf"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.2.3.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.2.3.bb
new file mode 100644
index 0000000..6f59dd2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.2.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- mouse input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "47da1fa52584933d045528109f094eff"
+SRC_URI[archive.sha256sum] = "a07cb2169f43018c90b7889781c0db30cda0da03811edccb8c4db533166357ab"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.3.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.3.0.bb
new file mode 100644
index 0000000..d96f51a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.3.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- mouse input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "31a51b0e5ddc4fac19754f48a3adf881"
+SRC_URI[archive.sha256sum] = "054b253f366795c2865714ce8bc545c79e59aa9ce1b7a9a4a05b9c674dff9dec"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.4.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.4.0.bb
new file mode 100644
index 0000000..8193994
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-mouse_1.4.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- mouse input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e7dc0759c14a9bfd373917a49e5f7c7d"
+SRC_URI[archive.sha256sum] = "e6e1dbd64d41c826619a5881c5aeed46095bfdcb87c3e27d65292fc12a5bb7c7"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-mutouch_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-mutouch_1.1.0.bb
new file mode 100644
index 0000000..50516db
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-mutouch_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "98ae915c67cabf0e6d40a425dbdbe10b"
+SRC_URI[archive.sha256sum] = "cc67e0dd4f4fcc8d798f0bfe42b975132c5739bdd80809580a74182e4d1b62ea"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-mutouch_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-mutouch_1.2.0.bb
new file mode 100644
index 0000000..233cf3b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-mutouch_1.2.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- muTouch input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "50711d390d2867e3fa7e06b59b2d575b"
+SRC_URI[archive.sha256sum] = "214f0831f36ebfc081b9f31f91ae27972ced9371b9b2256650998596a097061d"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-palmax_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-palmax_1.1.0.bb
new file mode 100644
index 0000000..f048b9c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-palmax_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0959dbf7972dfb95f56e4bd3f56447cf"
+SRC_URI[archive.sha256sum] = "5c00c85eed2950a575362bee2f21c2fa68eb8af81e7f1d451273a1302eac4145"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-penmount_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-penmount_1.2.0.bb
new file mode 100644
index 0000000..89e8c91
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-penmount_1.2.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0589f2eaa84afb9bd49b226ce7dacdda"
+SRC_URI[archive.sha256sum] = "dea18a07cf8f59e7bc981cfa1f6ef476dd14f7d9bee3bb1a55a6cc49f766150e"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-penmount_1.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-penmount_1.2.1.bb
new file mode 100644
index 0000000..ee0e818
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-penmount_1.2.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- Penmount input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "268af4dceda544d8c815b9b7e87d4536"
+SRC_URI[archive.sha256sum] = "fab08de727da6f56b82d8ecee451a52e7129ff80522e711c5322f1bd2fa9970a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-penmount_1.3.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-penmount_1.3.0.bb
new file mode 100644
index 0000000..4756ec7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-penmount_1.3.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- Penmount input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "24594c0222e631fedccc7c540c420b03"
+SRC_URI[archive.sha256sum] = "9cb4e0e83dcefe1ece814d638bd186785b6bc1debe1aa2101ce2a4ea0376805a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-spaceorb_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-spaceorb_1.1.0.bb
new file mode 100644
index 0000000..16dcb32
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-spaceorb_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "294810ca9e93c4096458c6a0f2fb5679"
+SRC_URI[archive.sha256sum] = "9cd53cb719bf401ff3f72233d3a88c59539b94eaf11e586e307c807a325f0815"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-summa_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-summa_1.1.0.bb
new file mode 100644
index 0000000..351bb09
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-summa_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b37a432fd87bb9f46d011622d6fce6b3"
+SRC_URI[archive.sha256sum] = "f10f2cadd4120b40b3658000c87f910e3005f4d787441c7dd83b48ebbf2a11f2"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-synaptics_0.15.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-synaptics_0.15.0.bb
new file mode 100644
index 0000000..959c651
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-synaptics_0.15.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- mouse input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "939f1c831c5cd3a6f027e982592dfc5b"
+SRC_URI[archive.sha256sum] = "e7d481c375a11df55eb8f12390c329c2bfda3258c689cec11cfec27cb5895c8b"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-synaptics_1.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-synaptics_1.2.1.bb
new file mode 100644
index 0000000..0cfb5df
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-synaptics_1.2.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- mouse input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "29a6f9da5123149e4abc8ff83880ed5c"
+SRC_URI[archive.sha256sum] = "a63b48c5c8eb09416b941dea591a948e111d1b2e14d4620f25377cf47cf877e6"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-tek4957_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-tek4957_1.1.0.bb
new file mode 100644
index 0000000..81965ce
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-tek4957_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "be8a4bd474ad6c85b93f66dd6fcfa6ee"
+SRC_URI[archive.sha256sum] = "09b9506d1bb1deaaf69872392bc56e1d75997bb8157e85a9121749bf5fe15727"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.4.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.4.0.bb
new file mode 100644
index 0000000..8b58d0d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.4.0.bb
@@ -0,0 +1,9 @@
+require xorg-driver-input.inc
+DESCRIPTION = "The VMMouse driver enables support for the special VMMouse protocol \
+that is provided by VMware virtual machines to give absolute pointer \
+positioning. "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "313e403e56702f6c38d1a5c830b60dc2"
+SRC_URI[archive.sha256sum] = "383e0973aad0e96812fc019cb579abaf016f97427fc07466b150fe15739ba63c"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.4.3.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.4.3.bb
new file mode 100644
index 0000000..e2f4af6
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.4.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "44730af795616ed4d4a0cd9a3a07935d"
+SRC_URI[archive.sha256sum] = "d668c4cacd4be6d56608fbdf7779d60120f38f3315e6385a7cc87339124e77ab"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.5.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.5.1.bb
new file mode 100644
index 0000000..b268d75
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.5.1.bb
@@ -0,0 +1,9 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1e2feafb8e4f1b670aeb39bcac9fbb18"
+SRC_URI[archive.sha256sum] = "63608ba07138f01eadb9a02d8054c306501d907dd706ae61fdc030c50a7bfcfb"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.6.6.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.6.6.bb
new file mode 100644
index 0000000..5a9fae1
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.6.6.bb
@@ -0,0 +1,9 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1c57338928a8897b7ca0b5524fcb1223"
+SRC_URI[archive.sha256sum] = "0cb2896b7a284efd6337c019c599fd4d5a6de74a58c6e6c31c31ed399efa8171"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.6.9.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.6.9.bb
new file mode 100644
index 0000000..4b3f2da
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-vmmouse_12.6.9.bb
@@ -0,0 +1,9 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6b7f2ffffc650ed61c9d333aeece893f"
+SRC_URI[archive.sha256sum] = "a5e2069fc080de9c7d037c0def0135a5c93b76a8b535099e021d65a5e1d0b00f"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-void_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-void_1.1.0.bb
new file mode 100644
index 0000000..d1cb5a9
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-void_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ea72a92d43b95f413347df96d6a73933"
+SRC_URI[archive.sha256sum] = "b43c5d920821bd06b6a1a131dd071ab838bf024c3cb092c6d1f10d57b648b0e4"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-input-void_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-input-void_1.1.1.bb
new file mode 100644
index 0000000..a76a38f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-input-void_1.1.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- void input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "862c230f5f6e0c545f232b4c0fa9537a"
+SRC_URI[archive.sha256sum] = "dde062d6267a3fd9d51b0daee88fd84fceea52a6019de51dece46e92012dbc4f"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-apm_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-apm_1.1.1.bb
new file mode 100644
index 0000000..fd2e16a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-apm_1.1.1.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "This is the Alliance Promotion driver for XFree86 4.0+"
+DEPENDS += " xf86rushproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ac7e05f0dfc7e02cac0bf17b9eb89b11"
+SRC_URI[archive.sha256sum] = "09d7e6cf30b94f141f8ebe2560b301a058f645e74108edc28c908e750865dcec"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-apm_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-apm_1.2.0.bb
new file mode 100644
index 0000000..241a11c
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-apm_1.2.0.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+DESCRIPTION = "This is the Alliance Promotion driver for XFree86 4.0+"
+DEPENDS += " xf86rushproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://get-rid-of-host-includes.patch"
+SRC_URI[archive.md5sum] = "4f78650d79656dc803a720049d65682e"
+SRC_URI[archive.sha256sum] = "f0fe020f892e6e3a696a490c86312a1b32672bffb7dead153c24f103540a6185"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-ark_0.6.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-ark_0.6.0.bb
new file mode 100644
index 0000000..a0595f4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-ark_0.6.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6921479baca8f7b156029489fd335854"
+SRC_URI[archive.sha256sum] = "e5abc4f4ae643ce56d5773f052515196f05786235e4afd155a3232e20dbc84d7"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-ark_0.7.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-ark_0.7.0.bb
new file mode 100644
index 0000000..938d501
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-ark_0.7.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- ark display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://get-rid-of-host-includes.patch"
+SRC_URI[archive.md5sum] = "6826c556ebe9a1248cbc7f7edd44f956"
+SRC_URI[archive.sha256sum] = "8e65e73045fabe37c15f6d4895baa09346bdac2f7537607b523aacd7bcf57594"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-ast_0.81.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-ast_0.81.0.bb
new file mode 100644
index 0000000..2623266
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-ast_0.81.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "04bc08907da13612dbc4918fe54e63e3"
+SRC_URI[archive.sha256sum] = "b95553aaf89bef28051c82914cee2b91102dbc2370d0d855404ba453902459b8"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-ast_0.85.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-ast_0.85.0.bb
new file mode 100644
index 0000000..e5c2bc4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-ast_0.85.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b415bf3259ad0acdaf62e3dde76e3289"
+SRC_URI[archive.sha256sum] = "9018ff84e4866d895c037aad33fb31c79d5f47d3f54707600cc3fe6076485b28"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.13.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.13.0.bb
new file mode 100644
index 0000000..974bb83
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.13.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- ATI display driver"
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7b2642442091808002963920c7693aeb"
+SRC_URI[archive.sha256sum] = "6d07847d63798f92237175f2645bf964d083b18c4c439e6c787a5f0c3dd68e31"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.6.193.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.6.193.bb
new file mode 100644
index 0000000..71e1136
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.6.193.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "102b781f543213852401f3422b18ccc7"
+SRC_URI[archive.sha256sum] = "9b0899694000cb91d5643e2482376af24bd495cb01b4c9dcdd6ee3545b0aefae"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.6.3.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.6.3.bb
new file mode 100644
index 0000000..aaaf3a8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.6.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f6d559f9d20f61567d381916b376590f"
+SRC_URI[archive.sha256sum] = "d08a429e1fb1620ae81839181a4dc6cd579d52fc440d44d7bba36d19be355780"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.7.196.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.7.196.bb
new file mode 100644
index 0000000..ab69068
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.7.196.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "06db625391c75c8be86c4dd5a5d713e6"
+SRC_URI[archive.sha256sum] = "8923a08232255ceacf770ef767d86bbfb195dffa9559baa1b1de90f9c947a6d9"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.7.197.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.7.197.bb
new file mode 100644
index 0000000..f9a0d8b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.7.197.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- ATI display driver"
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7bd53945ce6d0b48b7fd558039e82aa2"
+SRC_URI[archive.sha256sum] = "b6c67996cfdbbf9b3a191b9092f5d515dd7fae564544626792dd5ef404e29134"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.8.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.8.0.bb
new file mode 100644
index 0000000..1aa67c2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-ati_6.8.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- ATI display driver"
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3c97c7925ebf4162eeb3463e23adc0e3"
+SRC_URI[archive.sha256sum] = "3863851e3c85d25cc38941eec63e866656806821b028519ae32ab8b276664fba"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-chips_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-chips_1.1.1.bb
new file mode 100644
index 0000000..f083306
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-chips_1.1.1.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3182d43439ca4cbf08ff9aa76990bba3"
+SRC_URI[archive.sha256sum] = "16a81cdb6b311176936c3326d279c0d75530adbcf9a3489eea55992ac5bc7494"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-chips_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-chips_1.2.0.bb
new file mode 100644
index 0000000..79a3cd7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-chips_1.2.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Chips display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0fec6bee65383790485d917247a61629"
+SRC_URI[archive.sha256sum] = "05f38c49b23be36afa68b738faf520b8dbf05b92c769107039426651801d4f99"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-cirrus_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-cirrus_1.1.0.bb
new file mode 100644
index 0000000..b04396f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-cirrus_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "66344e315def275605dafb314ce59851"
+SRC_URI[archive.sha256sum] = "5988962199d5013274f6a6952939e4f405df658bb6616ebf9954c993b1179b1b"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-cirrus_1.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-cirrus_1.2.1.bb
new file mode 100644
index 0000000..c481738
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-cirrus_1.2.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Cirrus display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "bc28fdedaee9059180e2534f9dbcd2f6"
+SRC_URI[archive.sha256sum] = "e7c99ed66326df5fadf6e5d875859a430fec4369415a27cde72a91109f78bb9c"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-dummy_0.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-dummy_0.2.0.bb
new file mode 100644
index 0000000..13bf350
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-dummy_0.2.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "22b7cc20a33443cbd218bd2521850cfe"
+SRC_URI[archive.sha256sum] = "46013885696f3c1a5e05c5d503abc69e691443319a97cf2c6a01ec031e06c910"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-dummy_0.3.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-dummy_0.3.0.bb
new file mode 100644
index 0000000..b375d93
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-dummy_0.3.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- dummy display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://get-rid-of-host-includes.patch"
+SRC_URI[archive.md5sum] = "3d96297556846bee02a74166ffb5d052"
+SRC_URI[archive.sha256sum] = "5a4bbde0b7f0334bb63b159e5ef6e164be3699e3424734c2bd9823f20a30a278"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-dummy_0.3.3.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-dummy_0.3.3.bb
new file mode 100644
index 0000000..625b228
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-dummy_0.3.3.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- dummy display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://get-rid-of-host-includes.patch"
+SRC_URI[archive.md5sum] = "3ffe3a28f4452e66bf56180e7da9cbc5"
+SRC_URI[archive.sha256sum] = "df3f55de7953dba6d7ce10cc5f355da1a6164f781ad9393a38dae502dba4955d"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-fbdev/use-staged-headers.patch b/recipes/obsolete/xorg/xorg-driver/xf86-video-fbdev/use-staged-headers.patch
new file mode 100644
index 0000000..0bf41fd
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-fbdev/use-staged-headers.patch
@@ -0,0 +1,48 @@
+Index: xf86-video-fbdev-0.4.0/src/fbdev.c
+===================================================================
+--- xf86-video-fbdev-0.4.0.orig/src/fbdev.c
++++ xf86-video-fbdev-0.4.0/src/fbdev.c
+@@ -10,29 +10,29 @@
+ #include <string.h>
+ 
+ /* all driver need this */
+-#include "xf86.h"
+-#include "xf86_OSproc.h"
++#include <xf86.h>
++#include <xf86_OSproc.h>
+ 
+-#include "mipointer.h"
+-#include "mibstore.h"
+-#include "micmap.h"
+-#include "colormapst.h"
+-#include "xf86cmap.h"
++#include <mipointer.h>
++#include <mibstore.h>
++#include <micmap.h>
++#include <colormapst.h>
++#include <xf86cmap.h>
+ #include "shadow.h"
+-#include "dgaproc.h"
++#include <dgaproc.h>
+ 
+ /* for visuals */
+-#include "fb.h"
++#include <fb.h>
+ #ifdef USE_AFB
+ #include "afb.h"
+ #endif
+ 
+-#include "xf86Resources.h"
+-#include "xf86RAC.h"
++#include <xf86Resources.h>
++#include <xf86RAC.h>
+ 
+-#include "fbdevhw.h"
++#include <fbdevhw.h>
+ 
+-#include "xf86xv.h"
++#include <xf86xv.h>
+ 
+ #ifdef XSERVER_LIBPCIACCESS
+ #include <pciaccess.h>
+
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-fbdev_0.3.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-fbdev_0.3.1.bb
new file mode 100644
index 0000000..df2f45b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-fbdev_0.3.1.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9ae810c6c6c3c9713a67866fe794d4ff"
+SRC_URI[archive.sha256sum] = "309d1f618c77559ea494c05d45b09577790c44900685e17bc812e4e1b19df6e7"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-fbdev_0.4.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-fbdev_0.4.0.bb
new file mode 100644
index 0000000..77225cf
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-fbdev_0.4.0.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- fbdev display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6572b39fec77b8e6de1c858a93992924"
+SRC_URI[archive.sha256sum] = "bba725daeb2a313b83f2b92855a9ae8aa72c4cc8581f9f62f101ebdf00ac359d"
+
+FILES_${PN} += " file://use-staged-headers.patch"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-geode/fixes.patch b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode/fixes.patch
new file mode 100644
index 0000000..b581b56
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode/fixes.patch
@@ -0,0 +1,161 @@
+diff --git a/README b/README
+index 8ae3ce7..74f3a9a 100644
+--- a/README
++++ b/README
+@@ -1,6 +1,6 @@
+ AMD Geode GX and LX graphics driver for X.Org
+ =============================================
+-README last updated: 2009-08-04
++README last updated: 2009-09-03
+ 
+ GIT repository:
+         git://anongit.freedesktop.org/git/xorg/driver/xf86-video-geode
+@@ -29,15 +29,23 @@ at which point xf86-video-cyrix and xf86-video-nsc will be retired.
+ 
+ = Dependencies =
+ 
+-As of version 2.9.0, this driver depends on X.Org server 1.3 or newer,
++As of version 2.11.4, this driver depends upon X server 1.5 or newer,
++because the GX Randr code utilizes dixSetPrivate whose API was modified 
++in a non backward-compatible way.
++
++  #ifdef'ing the changes from f1268f3ba8404129d358db3bb1e66f3841f7018a 
++  and b28abde0276ddd7f687242f3886f98b0e49a7fc2 might make it possible
++  to build this driver against older X servers. Patches are welcome.
++
++As of version 2.9.0, this driver depends on X server 1.3 or newer,
+ because it utilizes the new common DDC probing libraries from X.Org.
+ 
+-If necessary, it might be possible to create autoconf macros to make 
+-this driver compile against older X servers, following this example:
++  If necessary, it might be possible to create autoconf macros to make 
++  this driver compile against older X servers, following this example:
+ 
+-http://lists.freedesktop.org/archives/xorg-commit/2007-February/010341.html
++  http://lists.freedesktop.org/archives/xorg-commit/2007-February/010341.html
+ 
+-Patches accomplishing the same trick for the Geode driver are welcome.
++  Patches accomplishing the same trick for the Geode driver are welcome.
+ 
+ = FAQ =
+ 
+diff --git a/src/geode.h b/src/geode.h
+index 4f0b467..8fe67b5 100644
+--- a/src/geode.h
++++ b/src/geode.h
+@@ -60,7 +60,7 @@
+ #define LX      0x20
+ 
+ #define PCI_VENDOR_ID_CYRIX  0x1078
+-#define PCI_VENDOR_ID_NS     0x100B
++#define PCI_VENDOR_ID_NS     0x100b
+ #define PCI_VENDOR_ID_AMD    0x1022
+ 
+ #define PCI_CHIP_5530     0x0104
+diff --git a/src/gx_driver.c b/src/gx_driver.c
+index 7ff5418..6f5767d 100644
+--- a/src/gx_driver.c
++++ b/src/gx_driver.c
+@@ -464,7 +464,7 @@ GXPreInit(ScrnInfoPtr pScrni, int flags)
+     /* Fill in the monitor information */
+     pScrni->monitor = pScrni->confScreen->monitor;
+ 
+-    if (!xf86SetDepthBpp(pScrni, 16, 16, 16, Support24bppFb | Support32bppFb))
++    if (!xf86SetDepthBpp(pScrni, 24, 16, 32, Support24bppFb | Support32bppFb))
+ 	return FALSE;
+ 
+     switch (pScrni->depth) {
+diff --git a/src/gx_randr.c b/src/gx_randr.c
+index 2669912..91ca43e 100644
+--- a/src/gx_randr.c
++++ b/src/gx_randr.c
+@@ -56,15 +56,17 @@ typedef struct _GXRandRInfo
+     Rotation supported_rotations;      /* driver supported */
+ } XF86RandRInfoRec, *XF86RandRInfoPtr;
+ 
+-#define AMD_OLDPRIV (GET_ABI_MAJOR(ABI_VIDEODRV_VERSION) < 4)
+-
+ static int GXRandRIndex;
+ 
+-#if AMD_OLDPRIV
+-#define XF86RANDRINFO(p) ((XF86RandRInfoPtr) (p)->devPrivates[GXRandRIndex].ptr)
++#define OLD_VIDEODRV_INTERFACE (GET_ABI_MAJOR(ABI_VIDEODRV_VERSION) < 4)
++
++#if OLD_VIDEODRV_INTERFACE
++#define XF86RANDRINFO(p)   ((XF86RandRInfoPtr) (p)->devPrivates[GXRandRIndex].ptr)
++#define XF86RANDRSET(p, v) (p)->devPrivates[GXRandRIndex].ptr = v
+ #else
+-#define XF86RANDRINFO(p) ((XF86RandRInfoPtr) \
+-			  dixLookupPrivate(&(p)->devPrivates, &GXRandRIndex));
++#define XF86RANDRINFO(p) ((XF86RandRInfoPtr)						\
++			  dixLookupPrivate(&(p)->devPrivates, &GXRandRIndex))
++#define XF86RANDRSET(p, v) dixSetPrivate(&(p)->devPrivates, &GXRandRIndex, v)
+ #endif
+ 
+ static int
+@@ -327,7 +329,7 @@ GXRandRInit(ScreenPtr pScreen, int rotation)
+     if (GXRandRGeneration != serverGeneration) {
+ 	GXRandRGeneration = serverGeneration;
+     }
+-#if AMD_OLDPRIV
++#if OLD_VIDEODRV_INTERFACE
+     GXRandRIndex = AllocateScreenPrivateIndex();
+ #endif
+ 
+@@ -354,10 +356,7 @@ GXRandRInit(ScreenPtr pScreen, int rotation)
+     pRandr->supported_rotations = rotation;
+     pRandr->maxX = pRandr->maxY = 0;
+ 
+-#if AMD_OLDPRIV
+-    pScreen->devPrivates[GXRandRIndex].ptr = pRandr;
+-#else
+-    dixSetPrivate(&pScreen->devPrivates, &GXRandRIndex, pRandr);
+-#endif
++    XF86RANDRSET(pScreen, pRandr);
++
+     return TRUE;
+ }
+diff --git a/src/lx_driver.c b/src/lx_driver.c
+index 08d1fdd..79ec15c 100644
+--- a/src/lx_driver.c
++++ b/src/lx_driver.c
+@@ -331,7 +331,7 @@ LXPreInit(ScrnInfoPtr pScrni, int flags)
+     /* Fill in the monitor information */
+     pScrni->monitor = pScrni->confScreen->monitor;
+ 
+-    if (!xf86SetDepthBpp(pScrni, 16, 16, 16, Support24bppFb | Support32bppFb))
++    if (!xf86SetDepthBpp(pScrni, 24, 16, 32, Support24bppFb | Support32bppFb))
+ 	return FALSE;
+ 
+     switch (pScrni->depth) {
+diff --git a/src/lx_output.c b/src/lx_output.c
+index 5508477..72e5e2a 100644
+--- a/src/lx_output.c
++++ b/src/lx_output.c
+@@ -108,7 +108,7 @@ lx_output_set_property(xf86OutputPtr output, Atom property,
+ 
+ 	    if (!ret) {
+ 		xf86DrvMsg(pScrni->scrnIndex, X_ERROR,
+-		    "Failed to set mode after propery change!\n");
++		    "Failed to set mode after property change!\n");
+ 
+ 		pGeode->Scale = scale;
+ 		return FALSE;
+diff --git a/src/lx_output.c b/src/lx_output.c
+index 72e5e2a..3eecc9e 100644
+--- a/src/lx_output.c
++++ b/src/lx_output.c
+@@ -163,6 +163,13 @@ lx_output_mode_valid(xf86OutputPtr output, DisplayModePtr pMode)
+ 	    return MODE_BAD;
+     }
+ 
++    if (gfx_is_display_mode_supported(pMode->HDisplay,
++                                      pMode->VDisplay,
++                                      pScrni->bitsPerPixel,
++                                      GeodeGetRefreshRate(pMode)) < 0) {
++        return MODE_BAD;
++    }
++
+     return MODE_OK;
+ }
+ 
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.10.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.10.1.bb
new file mode 100644
index 0000000..9a72053
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.10.1.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e307ab55a2a81d7868506df789f76dfb"
+SRC_URI[archive.sha256sum] = "9b6ef818e402e2c1b7b2f36eff657b8104c67d738f10d4d7d39c7bc118a8c650"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.11.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.11.0.bb
new file mode 100644
index 0000000..a909137
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.11.0.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1dbede8f6393edfe6c1ecab2f754b3b2"
+SRC_URI[archive.sha256sum] = "d70c198cde981c3a53b1c41b717dea4bbf1d397d82957f584c641bb5fd02c82d"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.11.4.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.11.4.1.bb
new file mode 100644
index 0000000..dccbd74
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.11.4.1.bb
@@ -0,0 +1,10 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://fixes.patch"
+SRC_URI[archive.md5sum] = "05f85d897ef41d13de354ac0252bf923"
+SRC_URI[archive.sha256sum] = "d739f6762fe3aa7ef7ca74f87fbe4d6ec3bb13a735e5dfb82b6748eda2b31138"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.11.7.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.11.7.bb
new file mode 100644
index 0000000..bdf626f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.11.7.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "086daecd062835eea51e2a718761dda3"
+SRC_URI[archive.sha256sum] = "ed864a37b44dabb760f0b7caac8a796e3b1a0a7f305b44c4684f871b273a9f9b"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.8.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.8.0.bb
new file mode 100644
index 0000000..a342ca1
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.8.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a2b9c70a32b0a6436d837d67fa7aae18"
+SRC_URI[archive.sha256sum] = "f0b68171dd4256c927fbee91ecf84fa28c409b5b6b39cbf47eaa48fd73db305f"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.9.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.9.0.bb
new file mode 100644
index 0000000..5f411b4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-geode_2.9.0.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d7b3254e6f4f1978fecf8f4fa2823259"
+SRC_URI[archive.sha256sum] = "b9aa934b94c0397e32cd702788fe2b6f2398bdc1a8c83594ad25274f82593590"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-glint_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-glint_1.1.1.bb
new file mode 100644
index 0000000..632a7bb
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-glint_1.1.1.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+DEPENDS += " xf86dgaproto drm xf86driproto"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2cf49f701024a145bd25aff9da11d479"
+SRC_URI[archive.sha256sum] = "d63e0dd3f5cecebaf1915193a68ac83e90c1e973e3276a71bd14651d67115e6d"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-glint_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-glint_1.2.0.bb
new file mode 100644
index 0000000..6c721f7
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-glint_1.2.0.bb
@@ -0,0 +1,13 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Glint display driver"
+DEPENDS += " xf86dgaproto drm xf86driproto"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1f5271ac01d4475efe73ab6f2c3646f4"
+SRC_URI[archive.sha256sum] = "a0edd1109c03efdb0f6defc18745f89fb3c11142381e2657f94d492ddd1e7419"
+
+EXTRA_OECONF += " \
+  ac_cv_file__usr_include_xorg_dri_h=yes \
+  ac_cv_file__usr_include_xorg_sarea_h=yes \
+  ac_cv_file__usr_include_xorg_dristruct_h=yes \
+"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-glint_1.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-glint_1.2.1.bb
new file mode 100644
index 0000000..e2a9e9b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-glint_1.2.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Glint display driver"
+DEPENDS += " xf86dgaproto drm xf86driproto"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6d7afdac0a26cf201c3f3b417c31c5e1"
+SRC_URI[archive.sha256sum] = "161780d2127d0548a2017ca461ce38e7a69afce5d921a08604e91478c6be1cda"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.1.0.5.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.1.0.5.bb
new file mode 100644
index 0000000..73be28f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.1.0.5.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "Number Nine I128 for X11"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6e0d3e09fc99d6f0a0e969613ddf58cc"
+SRC_URI[archive.sha256sum] = "a99d2b04b829faa7542545380317c8f59f54ecbd5e0a7008580f3155742d0381"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.1.0.6.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.1.0.6.bb
new file mode 100644
index 0000000..51d911b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.1.0.6.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "Number Nine I128 for X11"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c483efc90b1935025b17e4b9e9c2e4df"
+SRC_URI[archive.sha256sum] = "b52183f5a7d0adee1d21b4b0a0908886b7bbc69dc4498f1e7a3edc4b1988c41c"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.2.1.bb
new file mode 100644
index 0000000..896dc41
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.2.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- i128 display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d0080732eaa15059b0a953aa3522185a"
+SRC_URI[archive.sha256sum] = "0d023cacf8134241cd8efcd5744eb156399406c92f59d3895392f2b5fd055eb1"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.3.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.3.0.bb
new file mode 100644
index 0000000..6b70a68
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.3.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- i128 display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "aff4922d2f02bad7e0d8649358edbcee"
+SRC_URI[archive.sha256sum] = "62eadebd3417ffb3857f10f16597c59541ceb135ddbc30b2140f46d9eb7dddd7"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.3.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.3.1.bb
new file mode 100644
index 0000000..0ff9d08
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-i128_1.3.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- i128 display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3b170a6df5114420cd4021a057918a09"
+SRC_URI[archive.sha256sum] = "49bb23625654ebcd74d0d23f534b074188f4b21c3cd443b06ac83b9485bf9a75"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-i740_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-i740_1.1.0.bb
new file mode 100644
index 0000000..1843998
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-i740_1.1.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "I740 for X11"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "57302e225060a7286ae1a970c87a589b"
+SRC_URI[archive.sha256sum] = "b8f2144c987d8a14f8b477ee3aa43fc1c76d040a77e40938c3c97c8e34e2b7c5"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-i740_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-i740_1.2.0.bb
new file mode 100644
index 0000000..83e2d53
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-i740_1.2.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- i740 display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d0e5a805c546b29b1dd3b55a68d16dc4"
+SRC_URI[archive.sha256sum] = "59c8f6ee465bef033c1c20bfff8121a318efda9656d5dc29f674bb655f18486f"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-i810_1.6.5.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-i810_1.6.5.bb
new file mode 100644
index 0000000..d0a5bb8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-i810_1.6.5.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "I810 for X11"
+DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fc1e0da3430551bf25a7babf7ccfd3bf"
+SRC_URI[archive.sha256sum] = "30d0cd555d8b8b5bb53d93eaae1ad2aecb5c94a760e2346d60b6e194c254e40f"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.10.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.10.0.bb
new file mode 100644
index 0000000..02a9411
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.10.0.bb
@@ -0,0 +1,11 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
+DEPENDS += " virtual/libx11 libxvmc drm xf86driproto "
+RDEPENDS_${PN} += "xserver-xorg-extension-dri \
+             xserver-xorg-extension-dri2 \
+             xserver-xorg-extension-glx"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "78309d4f04dd8ae6585d120377042741"
+SRC_URI[archive.sha256sum] = "e46dd691dc93db7cd6f5f22b84fea7e9f4bfd34f28026cfd680993b3ccfc48ab"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.2.1.bb
new file mode 100644
index 0000000..d962ee4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.2.1.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
+DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3334dc5142871b78fc609fd1b3dac3f2"
+SRC_URI[archive.sha256sum] = "d976c5f5e9c84f3817aba6ad22855446f1c2b9bfa0d53bd11c37c62cfdefa60a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.4.2.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.4.2.bb
new file mode 100644
index 0000000..5da4140
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.4.2.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
+DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5cd6b3ed57c7e78ab51e9d9266e73fb6"
+SRC_URI[archive.sha256sum] = "5afdc91e93ffed09ea5258c6fde210c729ea2b44d83f98acfd92c3da7e99e64b"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.6.3.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.6.3.bb
new file mode 100644
index 0000000..635dc7d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-intel_2.6.3.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
+DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "440c014bbd3072b5d379fe1bdb861918"
+SRC_URI[archive.sha256sum] = "b35a142aeba034ad06b8d9b477c243f82ce9f82ad65a0ee4408630f228e90258"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-mach64_6.8.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-mach64_6.8.0.bb
new file mode 100644
index 0000000..8152ac1
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-mach64_6.8.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
+DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6081b8fa50c689d51f85c2fbaf93867e"
+SRC_URI[archive.sha256sum] = "fba616f88d351759e00a90965e38a0d82608698ae36fc2a18df4036cd384e1a1"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-mga_1.4.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-mga_1.4.1.bb
new file mode 100644
index 0000000..a6911b0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-mga_1.4.1.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ba373233a7d13084d14046a17b02e248"
+SRC_URI[archive.sha256sum] = "5becb5f0caf0f99296db28b32be46eb95d0a88ac8e4829c47cb637fb52d06564"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-mga_1.4.9.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-mga_1.4.9.bb
new file mode 100644
index 0000000..78b197e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-mga_1.4.9.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "11066b84b949cd04300ec819c9c51532"
+SRC_URI[archive.sha256sum] = "d57dd2323052f064092167a232fb7576f46e5d62e98bc9cc6a7f270cc8d0fdc0"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-mga_1.9.99.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-mga_1.9.99.bb
new file mode 100644
index 0000000..2081b47
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-mga_1.9.99.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- MGA display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "29785ff1de2b0f7b7f1c48350449447c"
+SRC_URI[archive.sha256sum] = "82a91e523d40625c9e042ee640276756d1169cca7eb305c691a3378805c4c81c"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-neomagic_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-neomagic_1.1.1.bb
new file mode 100644
index 0000000..12d3378
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-neomagic_1.1.1.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X11 driver for NeoMagic 2200, 2160, 2097, 2093, 2090, 2070"
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7a3d3d6e60b9686d955c45d9ebbd5c1b"
+SRC_URI[archive.sha256sum] = "d6497080967b8285b663fedd7cafd4457578282ebd7da0b216b6fa214dd88a86"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-neomagic_1.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-neomagic_1.2.1.bb
new file mode 100644
index 0000000..72e8a11
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-neomagic_1.2.1.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X11 driver for NeoMagic 2200, 2160, 2097, 2093, 2090, 2070"
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a72f57fca4f4dff9a2c82eb1fe7456f4"
+SRC_URI[archive.sha256sum] = "96e38d5378596174f76c735c4723ff2ac336f9069644502a9b706586b845e0a5"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-newport_0.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-newport_0.2.1.bb
new file mode 100644
index 0000000..ef8a412
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-newport_0.2.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "This is an unaccelerated driver for the SGI newport cards."
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2bd8e5b9ea68e0dcd80dfcaca0eff82c"
+SRC_URI[archive.sha256sum] = "66ac855452690ef896400577806dc1dd86318940f8a62ce20039037318b1ce08"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-nsc_2.8.2.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-nsc_2.8.2.bb
new file mode 100644
index 0000000..8c1893f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-nsc_2.8.2.bb
@@ -0,0 +1,11 @@
+require xorg-driver-video.inc
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1fbdd5e9b5508b032c0102f72d1e555c"
+SRC_URI[archive.sha256sum] = "060493a9dcad81e8912381d2a8d14a3e32a34414296a089756868f3442103c8c"
+
+# This driver is broken because it's seldom updated. It compiles
+# but fails to communicate with the card without this deprecated define.
+EXTRA_OEMAKE += "CFLAGS+=-DXFree86Server"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_1.2.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_1.2.2.1.bb
new file mode 100644
index 0000000..010a7a9
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_1.2.2.1.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e4dc415b1e45db0bbdacc203ed33024a"
+SRC_URI[archive.sha256sum] = "97d47df7720d3cfcb56c4debca9218c3fc5352d34d82bc4880c8a620185f8c5e"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.12.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.12.bb
new file mode 100644
index 0000000..c634388
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.12.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- NV display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "42f12a36d7afc26c817e8e8f5c8b7274"
+SRC_URI[archive.sha256sum] = "f56d2bb42f6c4369dd3c6adc30988c53a229650f910b0db1bb3bf9376054011e"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.16.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.16.bb
new file mode 100644
index 0000000..61efa0f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.16.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- NV display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fb02d5506e35054348d1c2b2c924530d"
+SRC_URI[archive.sha256sum] = "4bf2f964b78d309769faa6a5d21c90a9907886623adf1f30ea890b4329bf578d"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.17.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.17.bb
new file mode 100644
index 0000000..bafcabc
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.17.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- NV display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4401c7b956e60a6d7de68ca6a8ec05d0"
+SRC_URI[archive.sha256sum] = "4286f8994d80a30c7b6b4fc9df6ea5d587f648adc23cb3f523f571738c6900f4"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.3.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.3.bb
new file mode 100644
index 0000000..a0b8b2b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.3.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f9b38e24157c3aac6014119ac18d76da"
+SRC_URI[archive.sha256sum] = "8d9b5ea137c31919f7821e7f3ecbd133158813c1059f4a8ed0a723535d969952"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.7.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.7.bb
new file mode 100644
index 0000000..0e6ea58
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.7.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- NV display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "192414222f1a98e228832ee53f8178c0"
+SRC_URI[archive.sha256sum] = "7c9135d80b519246b2a85ff0481d6ee0fddeb578d669ff490f236f85873e8c5a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.8.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.8.bb
new file mode 100644
index 0000000..7072fd6
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.8.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- NV display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c3e8c98287dc98677bebfbe1ba51ab77"
+SRC_URI[archive.sha256sum] = "825ffb97525517de9f0ff7155946c6e58c278dba11957573cc970dd3b094f94a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.9.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.9.bb
new file mode 100644
index 0000000..c82ed56
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-nv_2.1.9.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- NV display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c6b7e52fa18455c22eb040b8d2575ce5"
+SRC_URI[archive.sha256sum] = "20d92ff3ab4b9ecc150f4ed17a7012a48f56dbf3fb51b51dde769b28922976d9"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-openchrome_0.2.903.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-openchrome_0.2.903.bb
new file mode 100644
index 0000000..6b4d8cb
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-openchrome_0.2.903.bb
@@ -0,0 +1,11 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- openchrome display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c0820787e89958c9114d359b6a3cd464"
+SRC_URI[archive.sha256sum] = "b7e4858d6b5c6428fae2485a2c2097cdf6073268ef812aae2ccbc3d936db7410"
+
+do_configure_prepend() {
+        rm ${S}/acinclude.m4 || true
+}
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-r128_6.8.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-r128_6.8.0.bb
new file mode 100644
index 0000000..490112f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-r128_6.8.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- r128 display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "007bec0c6b07d9d3aeca4da18e561efb"
+SRC_URI[archive.sha256sum] = "5689ca714fee9c9272bee12883b07a0ef2c40358ffb19fa684e963027b56567b"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-radeonhd_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-radeonhd_1.2.0.bb
new file mode 100644
index 0000000..b6b4a95
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-radeonhd_1.2.0.bb
@@ -0,0 +1,12 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- AMD/ATI r5xx, r6xx display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6a932ec17da9ce5a6d9000c1649c3a7e"
+SRC_URI[archive.sha256sum] = "87c6353dd52bbe22d3a45f28fb39de1dd44f41568aaf8a9b0d45a7ed62313e27"
+
+EXTRA_OECONF += " \
+  ac_cv_file___src_AtomBios_includes_atombios_h=yes \
+  ac_cv_file___src_AtomBios_includes_Decoder_h=yes \
+"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-rendition_4.1.3.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-rendition_4.1.3.bb
new file mode 100644
index 0000000..942dc58
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-rendition_4.1.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X11 driver supporting cards based on the V1000 or the V2x00."
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a8b97feccb32184820d5856fe78d34db"
+SRC_URI[archive.sha256sum] = "37e7aef72f7466485f5a3bafd0d43190cb7439de16868bfba2c59bb4c9df4408"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-rendition_4.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-rendition_4.2.0.bb
new file mode 100644
index 0000000..00efa96
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-rendition_4.2.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X11 driver supporting cards based on the V1000 or the V2x00."
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7c03de3804d4c4f6ff59f74050d24b2b"
+SRC_URI[archive.sha256sum] = "b57b62f707d87534a799170e31b33311449cfd7019a56e6b4fa85a4c7faaae15"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-s3_0.5.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-s3_0.5.0.bb
new file mode 100644
index 0000000..aa6bf0f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-s3_0.5.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d95ab6445cab477f39adfbbc81006f67"
+SRC_URI[archive.sha256sum] = "4a1206cb1a200aad8881216547d9913d0e24928138f3b1bb912a3336b9c05c97"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-s3_0.6.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-s3_0.6.0.bb
new file mode 100644
index 0000000..52f9584
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-s3_0.6.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- legacy S3 display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d05e7c3cb044437eda8663e174ba913c"
+SRC_URI[archive.sha256sum] = "ed07e4648b0f405fddd563783b49f971d649dd07cc8bc7737a93ff3d90f6c067"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-s3virge_1.10.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-s3virge_1.10.1.bb
new file mode 100644
index 0000000..2b83d22
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-s3virge_1.10.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- S3 ViRGE display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4a293047e988d4ea1e9e96d3b5793f43"
+SRC_URI[archive.sha256sum] = "9094115621ef73c957cf887332717ec727c751959b1059e3d00fbfe0114a978a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-s3virge_1.9.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-s3virge_1.9.1.bb
new file mode 100644
index 0000000..68b534b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-s3virge_1.9.1.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a91c73285ef67ee7cd9e2da28acb6cc4"
+SRC_URI[archive.sha256sum] = "cef5702963f49e737fb8b1472dc0241f7a5da49f844ac77f2df3e693a84bc822"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-savage_2.1.2.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-savage_2.1.2.bb
new file mode 100644
index 0000000..8f0ed08
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-savage_2.1.2.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6367e921a98f6a7fec9d0a9bc5ff0a47"
+SRC_URI[archive.sha256sum] = "1a9aa442152c139e3c54bc6c323bd13edf0bfff70a81c03969bcb1159317edb2"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-savage_2.1.3.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-savage_2.1.3.bb
new file mode 100644
index 0000000..1c6629f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-savage_2.1.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9c5e541613b07de6e7b2b2df3a2e35b1"
+SRC_URI[archive.sha256sum] = "f5f154df377cb445935d1453d6b7095d63912d5776dcb44f8d3c2f10ab1a3cc5"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-savage_2.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-savage_2.2.1.bb
new file mode 100644
index 0000000..66f4b70
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-savage_2.2.1.bb
@@ -0,0 +1,14 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Savage display driver"
+DEPENDS += " drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "62b8aba48b54eaefeae87df502bf219c"
+SRC_URI[archive.sha256sum] = "adf95cae0fbaf72326c51c4c9e61486eef062bb1706f6ab46d942f2c36d8a37e"
+
+EXTRA_OECONF += " \
+  ac_cv_file__usr_include_xorg_dri_h=yes \
+  ac_cv_file__usr_include_xorg_sarea_h=yes \
+  ac_cv_file__usr_include_xorg_dristruct_h=yes \
+"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-siliconmotion_1.5.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-siliconmotion_1.5.1.bb
new file mode 100644
index 0000000..527b778
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-siliconmotion_1.5.1.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ee35d7714ce44a2b5ac7ad7b7b7dd75a"
+SRC_URI[archive.sha256sum] = "54cf791695a53d4836d32f899b7d34b969edf5415f02e36956b6e72993e21cd7"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-siliconmotion_1.6.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-siliconmotion_1.6.0.bb
new file mode 100644
index 0000000..f5fb737
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-siliconmotion_1.6.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- SiliconMotion display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a8419a8ed17b02b2a6dd4d30d5e94b00"
+SRC_URI[archive.sha256sum] = "cc5301b9c6adb9a0770509b8570d38730d43e9ffce6d6886cd9a090965017e53"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.10.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.10.0.bb
new file mode 100644
index 0000000..162ab1d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.10.0.bb
@@ -0,0 +1,14 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- SiS display driver"
+DEPENDS += " xineramaproto xf86miscproto xf86dgaproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "331d432dccccca91ec7da39ff6bf1218"
+SRC_URI[archive.sha256sum] = "bcc0dcde5d469cc2500676e0ad29dcd12b1370066289902387ead762260e4b40"
+
+EXTRA_OECONF += " \
+  ac_cv_file__usr_include_xorg_dri_h=yes \
+  ac_cv_file__usr_include_xorg_sarea_h=yes \
+  ac_cv_file__usr_include_xorg_dristruct_h=yes \
+"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.10.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.10.1.bb
new file mode 100644
index 0000000..1b58f87
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.10.1.bb
@@ -0,0 +1,14 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- SiS display driver"
+DEPENDS += " xineramaproto xf86miscproto xf86dgaproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9f57c2f5ccbd8340db32da1c74083771"
+SRC_URI[archive.sha256sum] = "11529f094cbdcdaba505596488eda623e0f0bd3c51139359d587ea58b6527307"
+
+EXTRA_OECONF += " \
+  ac_cv_file__usr_include_xorg_dri_h=yes \
+  ac_cv_file__usr_include_xorg_sarea_h=yes \
+  ac_cv_file__usr_include_xorg_dristruct_h=yes \
+"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.9.3.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.9.3.bb
new file mode 100644
index 0000000..c5de372
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.9.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto xf86dgaproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e35d817fa4ee7beb6cd5aa744b9c0783"
+SRC_URI[archive.sha256sum] = "898ee8fb16fff89ba8ac5c83b9f5a2371084719db0cf034140427229191436f6"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.9.4.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.9.4.bb
new file mode 100644
index 0000000..d316d30
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-sis_0.9.4.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- SiS display driver"
+DEPENDS += " xineramaproto xf86miscproto xf86dgaproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "43f12cabf770b06170cdd1cdaafdc50f"
+SRC_URI[archive.sha256sum] = "50856446841526fc393af6bae0fbc39c20bb07e60056a676d0bc620446b593ac"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-sisusb_0.8.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-sisusb_0.8.1.bb
new file mode 100644
index 0000000..5cc4976
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-sisusb_0.8.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "cbd669507e4aa35e468905f09b546333"
+SRC_URI[archive.sha256sum] = "1596b79ab3e33263bde2d456cc0376808abee80b4cde059605f176d98bdb45cb"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-sisusb_0.9.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-sisusb_0.9.0.bb
new file mode 100644
index 0000000..4fce26a
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-sisusb_0.9.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- SiS USB display driver"
+DEPENDS += " xineramaproto xf86miscproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7b1f5465f423a859f306f4f1d6306a1b"
+SRC_URI[archive.sha256sum] = "76b79c9b7d3b35b8e2e5354569bf0936c4afd39a9dcbdf66327714d75137930a"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-sisusb_0.9.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-sisusb_0.9.1.bb
new file mode 100644
index 0000000..2229021
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-sisusb_0.9.1.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- SiS USB display driver"
+DEPENDS += " xineramaproto xf86miscproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "42069e70578bf3fb353cdacad186f6c0"
+SRC_URI[archive.sha256sum] = "b3ca934ce3e31f4a162bf263cad3913edccc46906d09132118b74a2095c157d9"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-suncg14_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-suncg14_1.1.0.bb
new file mode 100644
index 0000000..9729e24
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-suncg14_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9e25784e912cb2f0493b87431fd60773"
+SRC_URI[archive.sha256sum] = "1eca2b0970e725db49f9e462a0c2e618b2616389647335b5aec9d6e495e40527"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-suncg3_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-suncg3_1.1.0.bb
new file mode 100644
index 0000000..031d070
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-suncg3_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b9cb8cfb6a4234bebc434f744af53208"
+SRC_URI[archive.sha256sum] = "3564ebc8ccdfea872d46559166d881e93ac7c17e3ed46bb4087960f491c37df9"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-suncg6_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-suncg6_1.1.0.bb
new file mode 100644
index 0000000..692ddb3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-suncg6_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "aa6b7836fe6ccc99994bf15ff2b74e86"
+SRC_URI[archive.sha256sum] = "d6b1f3b79c57ef5281e0204b2847812cf9fa5df616478f01591445a36537194b"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-sunffb_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-sunffb_1.1.0.bb
new file mode 100644
index 0000000..e20c4fb
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-sunffb_1.1.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "dee23564c0d8069f52c7cd29c78be667"
+SRC_URI[archive.sha256sum] = "f897a427e83cf6965fd82724e3298aea44eb3131ba62f904cb514dfd0a879029"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-sunffb_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-sunffb_1.2.0.bb
new file mode 100644
index 0000000..eead699
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-sunffb_1.2.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "816842de26bce8a935f3c9c3cfedbc42"
+SRC_URI[archive.sha256sum] = "59f2f8fc2399a4d6b0ce733481c58694e723a989f4712c00436d35e27c059292"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-sunleo_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-sunleo_1.1.0.bb
new file mode 100644
index 0000000..0970905
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-sunleo_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0408d95795d754c92d12d6476b6932a1"
+SRC_URI[archive.sha256sum] = "b504d50f261bea9bc9dcd2a9c9c3307b24dee97c18d13b5a6deb3eb393270da9"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-suntcx_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-suntcx_1.1.0.bb
new file mode 100644
index 0000000..dc0cb5d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-suntcx_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "779a31151e44d2fd2a5ee1794f836889"
+SRC_URI[archive.sha256sum] = "72986a3981b746f60df1aba443d610db437fe8d5053e64630686f471c47b01cf"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-tdfx_1.3.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-tdfx_1.3.0.bb
new file mode 100644
index 0000000..5bf9bd0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-tdfx_1.3.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "04c49acb5c5dbde14eabd32d06df6e73"
+SRC_URI[archive.sha256sum] = "6b1a00df5c9628817d08f07c6f18f578950744f3eb63b4397be8b0754e728624"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-tdfx_1.4.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-tdfx_1.4.0.bb
new file mode 100644
index 0000000..371823d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-tdfx_1.4.0.bb
@@ -0,0 +1,13 @@
+require xorg-driver-video.inc
+DEPENDS += " drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "b13132f24683ef759bfb0c1db5096496"
+SRC_URI[archive.sha256sum] = "c3be06d324f2e49ece1f243b10d7180a32fbe65dbbb81e162279c8608800dead"
+
+EXTRA_OECONF += " \
+  ac_cv_file__usr_include_xorg_dri_h=yes \
+  ac_cv_file__usr_include_xorg_sarea_h=yes \
+  ac_cv_file__usr_include_xorg_dristruct_h=yes \
+"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-tga_1.1.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-tga_1.1.0.bb
new file mode 100644
index 0000000..15f4518
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-tga_1.1.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "DEC 21030 X11 driver"
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9eda4d4490706b2dd8f4ecdbaf779856"
+SRC_URI[archive.sha256sum] = "50143dfdd259fd114dc2f41518a4898d5407bf55422251df75812b96a1fa6e9b"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-tga_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-tga_1.2.0.bb
new file mode 100644
index 0000000..4e20ae3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-tga_1.2.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "DEC 21030 X11 driver"
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f3bddf0a64932ca9bd72041ccd3b5501"
+SRC_URI[archive.sha256sum] = "a92f8cad0e21318be465719a9f30a50d5719b0b70bf8e15f3937e7850cf1aea6"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-trident_1.2.3.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-trident_1.2.3.bb
new file mode 100644
index 0000000..3d5815e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-trident_1.2.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c0e8b2f54942b6902b7dd4f30defe800"
+SRC_URI[archive.sha256sum] = "d23eb8fa165d238ddf64da63dcd60c70a01cd761608a18402cfb95aed6722495"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-trident_1.2.4.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-trident_1.2.4.bb
new file mode 100644
index 0000000..7871b1b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-trident_1.2.4.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.org X server -- Trident display driver"
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7f628f7eb4abdc4c49bb252eefc4335a"
+SRC_URI[archive.sha256sum] = "f942596e7427a089be9c9353c45c22002999580197c9715d9363d19ee170ba8d"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-trident_1.3.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-trident_1.3.0.bb
new file mode 100644
index 0000000..729eddb
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-trident_1.3.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.org X server -- Trident display driver"
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e89799579d0cf3858362bd751469e0bf"
+SRC_URI[archive.sha256sum] = "a4f66c9f46f6e93c2c1f10e782a211ddc338b0ff9f0a2ccd2d660db031d3ddb5"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-tseng_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-tseng_1.1.1.bb
new file mode 100644
index 0000000..8f0cf7b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-tseng_1.1.1.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "488aa9c3ec7a95e6589afa4b50bec8b4"
+SRC_URI[archive.sha256sum] = "c9c1f3318715b7268068bc733d00bcab93924e97eb38f94548e442fd6cdfd56e"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-tseng_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-tseng_1.2.0.bb
new file mode 100644
index 0000000..273b05e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-tseng_1.2.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f98fc22142a009dc3a6cdf930c95203f"
+SRC_URI[archive.sha256sum] = "1090d9100934329000ac330d0c66a0ac4f60d2ba83196ea15c2833a28a18b1e3"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-v4l_0.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-v4l_0.1.1.bb
new file mode 100644
index 0000000..407735e
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-v4l_0.1.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "Video 4 Linux adaptor driver for X11"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "69339c38eba2cebc357d67e7a755d734"
+SRC_URI[archive.sha256sum] = "33ad549ea3f6a8da7f58d9964f3f2d83aabc6d64c2ebc2ea0033ac8dacaec870"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-vesa_1.3.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-vesa_1.3.0.bb
new file mode 100644
index 0000000..9b153e5
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-vesa_1.3.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://fix-includepath.patch"
+SRC_URI[archive.md5sum] = "4a307852f3b4850e436a41dab2a73676"
+SRC_URI[archive.sha256sum] = "b96c80ae81f5123ecef344dac4c734b2e281143d3ab7a7e633d6bf04c893e203"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-vesa_2.0.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-vesa_2.0.0.bb
new file mode 100644
index 0000000..983b31d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-vesa_2.0.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://fix-includepath.patch \
+            file://fix-configure-includes.patch"
+SRC_URI[archive.md5sum] = "433cf6f961eb4a2ab6fcb086def0b2b4"
+SRC_URI[archive.sha256sum] = "f20b2e429657552eea207fb8bc4b47c8e293d99c229dcb4da11b7c5bfdc1e165"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-vesa_2.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-vesa_2.2.0.bb
new file mode 100644
index 0000000..81b5d2f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-vesa_2.2.0.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+RDEPENDS_${PN} += "xserver-xorg-module-libint10 "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://fix-includepath.patch \
+            file://fix-configure-includes.patch"
+SRC_URI[archive.md5sum] = "9a86b683f73f3806f55d05cd804a6f4a"
+SRC_URI[archive.sha256sum] = "8b3e077d2534722033d7b1c647aa7f31fc7fbb5014da096b7a53170005e80226"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.14.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.14.1.bb
new file mode 100644
index 0000000..4e3e5f0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.14.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X11 driver for VMware SVGA Device"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "eaf1ce9fa23363799140602afaa10f37"
+SRC_URI[archive.sha256sum] = "1971fd356ba54204c3611edb9144c43c25c21167a5fa5ee725d3f2e3f9864fa9"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.15.2.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.15.2.bb
new file mode 100644
index 0000000..0b787d3
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.15.2.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "99322cbcc9081ad44e9cba63e3df8f7e"
+SRC_URI[archive.sha256sum] = "edae155c82d348b76dabe1373605bf6715b577cdd7a95f8b54ad534dc47c71ff"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.16.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.16.1.bb
new file mode 100644
index 0000000..fbf9826
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.16.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a5e1f2539b82206e411c3647f10c425f"
+SRC_URI[archive.sha256sum] = "91ed99ae936be5df25d310d81e31e0a7efefc023e462d93a9289ac18ebdf4e89"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.16.5.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.16.5.bb
new file mode 100644
index 0000000..e0e0368
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.16.5.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6d78c82ea7c2bb0fcb587d7bb4e8f60a"
+SRC_URI[archive.sha256sum] = "3e4e9abfd806b36076083ef6cacc93b713bfa4ddefe7005edfc15c64f5174366"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.16.9.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.16.9.bb
new file mode 100644
index 0000000..d55c68b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_10.16.9.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3b3d38abfa1f8be4b1e26dcd236bc94f"
+SRC_URI[archive.sha256sum] = "835a5e45b54837cbbd963a48bd09db709717e097e931dd76e68e397a167e8bc1"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_11.0.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_11.0.0.bb
new file mode 100644
index 0000000..fd5dbf8
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_11.0.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2895deafa373b0f87b8a7feaf0ca2373"
+SRC_URI[archive.sha256sum] = "bb538ebb9f000767bcc389562c8deb4cda74aa3e608190f6c3ee1e93d394fb2d"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_11.0.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_11.0.1.bb
new file mode 100644
index 0000000..0caf4aa
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-vmware_11.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "52e9a12843c6469f976db57a7b5f78d2"
+SRC_URI[archive.sha256sum] = "a6371d5acb81ba4457f7ee2c7432941c38f9033ce5278551c6acc9a0827ce7be"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-voodoo_1.1.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-voodoo_1.1.1.bb
new file mode 100644
index 0000000..5e671f4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-voodoo_1.1.1.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X11 driver for Voodoo/Voodoo2"
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "bc878e795688b49a595b355482d27174"
+SRC_URI[archive.sha256sum] = "3975601baee674b2bad0dfe696586f17cc913f1dc7f1d5c4e184623e0461751c"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-voodoo_1.2.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-voodoo_1.2.0.bb
new file mode 100644
index 0000000..720e2d2
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-voodoo_1.2.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X11 driver for Voodoo/Voodoo2"
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7c681d9b57f5e1f798263fc1a9d99245"
+SRC_URI[archive.sha256sum] = "b79ba6d5d4300570c00f8be37c536f47f2d78c18845f70f525da2a29e47c4b8c"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-wsfb_0.2.1.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-wsfb_0.2.1.bb
new file mode 100644
index 0000000..0e11e2d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-wsfb_0.2.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- wsfb display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c159af867a9af3abc4da332189213a76"
+SRC_URI[archive.sha256sum] = "39e358aa17d939f561a28c82b9e7beca202d7ebd7d40d401c88a9dff3d90d148"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-xgi_1.5.0.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-xgi_1.5.0.bb
new file mode 100644
index 0000000..84c4f05
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-xgi_1.5.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "08529fd015191be9244f598aa0894aa6"
+SRC_URI[archive.sha256sum] = "5fb23432ee8940c04494744da8b5f58bebc6ef113e96a50a74f0aa7d98a69194"
diff --git a/recipes/obsolete/xorg/xorg-driver/xf86-video-xgixp_1.7.99.3.bb b/recipes/obsolete/xorg/xorg-driver/xf86-video-xgixp_1.7.99.3.bb
new file mode 100644
index 0000000..fd15b7f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-driver/xf86-video-xgixp_1.7.99.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c541152aee693fad743ef7cbf75a7ffc"
+SRC_URI[archive.sha256sum] = "13a1658ee3ead0ab8e8bf7a9c8f8f0e3e40e38138f45d8431e735cd7184fbbd8"
diff --git a/recipes/xorg-driver/xf86-input-acecad_1.1.0.bb b/recipes/xorg-driver/xf86-input-acecad_1.1.0.bb
deleted file mode 100644
index b0eef56..0000000
--- a/recipes/xorg-driver/xf86-input-acecad_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ce0b7bec500273ad935cbfa212b8ac8a"
-SRC_URI[archive.sha256sum] = "3e5feea79f1d48cd46a2a40661140042ac586f90311669f79d65fea6cfc112ad"
diff --git a/recipes/xorg-driver/xf86-input-acecad_1.2.1.bb b/recipes/xorg-driver/xf86-input-acecad_1.2.1.bb
deleted file mode 100644
index 0c0a330..0000000
--- a/recipes/xorg-driver/xf86-input-acecad_1.2.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- AceCad input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2c371317f2aae34c04db63c19759a44e"
-SRC_URI[archive.sha256sum] = "07d2f8a1153d34a6516b8f1129fc32a18f2862bbb58c9bad4637fb282d60385a"
diff --git a/recipes/xorg-driver/xf86-input-acecad_1.2.2.bb b/recipes/xorg-driver/xf86-input-acecad_1.2.2.bb
deleted file mode 100644
index 843ef1d..0000000
--- a/recipes/xorg-driver/xf86-input-acecad_1.2.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- AceCad input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2d6596b2b0cfa527b5ed4df2014684bf"
-SRC_URI[archive.sha256sum] = "953ebb7d7ed579ce648dd6f6a25307c37ad8230a0336ec6fc58247732835f26e"
diff --git a/recipes/xorg-driver/xf86-input-aiptek_1.0.1.bb b/recipes/xorg-driver/xf86-input-aiptek_1.0.1.bb
deleted file mode 100644
index f1c926d..0000000
--- a/recipes/xorg-driver/xf86-input-aiptek_1.0.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "951b2b1a270f67d28e2e89fd2b9f15ae"
-SRC_URI[archive.sha256sum] = "3db0e3259034d838c2ff7ae26718422db6d33d89cd1a2defa0efdddbbbfcc28a"
diff --git a/recipes/xorg-driver/xf86-input-aiptek_1.1.1.bb b/recipes/xorg-driver/xf86-input-aiptek_1.1.1.bb
deleted file mode 100644
index 499869b..0000000
--- a/recipes/xorg-driver/xf86-input-aiptek_1.1.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2aa75313ea5652a8cf93581c65ee6493"
-SRC_URI[archive.sha256sum] = "219116b0275b93333b8471fc94d97320a116d695c4249837fd97763f00a85d77"
diff --git a/recipes/xorg-driver/xf86-input-calcomp_1.1.0.bb b/recipes/xorg-driver/xf86-input-calcomp_1.1.0.bb
deleted file mode 100644
index e42a680..0000000
--- a/recipes/xorg-driver/xf86-input-calcomp_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "af13f9de2af4e1d03b2da0c037fd718a"
-SRC_URI[archive.sha256sum] = "ebc446e74eea72d391104b1ce3b2a5376bced098154ec089a944f4311d240904"
diff --git a/recipes/xorg-driver/xf86-input-calcomp_1.1.1.bb b/recipes/xorg-driver/xf86-input-calcomp_1.1.1.bb
deleted file mode 100644
index 91b6c40..0000000
--- a/recipes/xorg-driver/xf86-input-calcomp_1.1.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- Calcomp input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "689099e2ade8a8c9f68f82fdf569b3ad"
-SRC_URI[archive.sha256sum] = "8117b37da2e031eb983e1e98034710a1511299496fcf235f936caff252fa8957"
diff --git a/recipes/xorg-driver/xf86-input-citron_2.2.0.bb b/recipes/xorg-driver/xf86-input-citron_2.2.0.bb
deleted file mode 100644
index e20503d..0000000
--- a/recipes/xorg-driver/xf86-input-citron_2.2.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1fe53cd055a69650f3c2e02377ec728c"
-SRC_URI[archive.sha256sum] = "26cfa755d3a383f80039fcd286c44ba5f7b353feb8c674f386bb08d741d2c3fe"
diff --git a/recipes/xorg-driver/xf86-input-citron_2.2.1.bb b/recipes/xorg-driver/xf86-input-citron_2.2.1.bb
deleted file mode 100644
index 528e31f..0000000
--- a/recipes/xorg-driver/xf86-input-citron_2.2.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X Server -- Citron input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4e254fcefb3bea55772e63c12570f6d9"
-SRC_URI[archive.sha256sum] = "1480ba63b342c00a53292d513bd79a69e1ea7c01a0c77d1a368ffb22e37c1a83"
diff --git a/recipes/xorg-driver/xf86-input-digitaledge_1.1.0.bb b/recipes/xorg-driver/xf86-input-digitaledge_1.1.0.bb
deleted file mode 100644
index 4d44741..0000000
--- a/recipes/xorg-driver/xf86-input-digitaledge_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "53461c34cc0712aacab92b820b9fcb84"
-SRC_URI[archive.sha256sum] = "24001f19b46b5bc2fcf8212f04863e4efa90175fac797350525e14848ab98a38"
diff --git a/recipes/xorg-driver/xf86-input-dmc_1.1.0.bb b/recipes/xorg-driver/xf86-input-dmc_1.1.0.bb
deleted file mode 100644
index e263482..0000000
--- a/recipes/xorg-driver/xf86-input-dmc_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e1bcbdefcb839173de79aeb3cd038b77"
-SRC_URI[archive.sha256sum] = "c5ca8fb2dfe0130767b2c10bd0661277a67e7d5b9171a7f5f6264ec48790473f"
diff --git a/recipes/xorg-driver/xf86-input-dmc_1.1.1.bb b/recipes/xorg-driver/xf86-input-dmc_1.1.1.bb
deleted file mode 100644
index cc59a54..0000000
--- a/recipes/xorg-driver/xf86-input-dmc_1.1.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- DMC input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f21f008220bc7687ce1c34ab557ec32f"
-SRC_URI[archive.sha256sum] = "f98c5a7010fa71cee88b4c2470e5cd804e42dfbc5292cf1c20eb75e9b1814002"
diff --git a/recipes/xorg-driver/xf86-input-dynapro_1.1.0.bb b/recipes/xorg-driver/xf86-input-dynapro_1.1.0.bb
deleted file mode 100644
index 96447fc..0000000
--- a/recipes/xorg-driver/xf86-input-dynapro_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1683178d09dfc604dde9ea2aab950a28"
-SRC_URI[archive.sha256sum] = "fc2ad50b1aa027fe57da53cbb73db0b4b9d0de9032f00dd42e7cc0aae7c50d6a"
diff --git a/recipes/xorg-driver/xf86-input-dynapro_1.1.1.bb b/recipes/xorg-driver/xf86-input-dynapro_1.1.1.bb
deleted file mode 100644
index 9b569a3..0000000
--- a/recipes/xorg-driver/xf86-input-dynapro_1.1.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- Dynapro input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d47be12a230c44a05d56d6b79ebcfc38"
-SRC_URI[archive.sha256sum] = "ed0f1ba81febf8e7a20cfaf32b021fcaa102af37f3070d67d6a101eeb6964992"
diff --git a/recipes/xorg-driver/xf86-input-elo2300_1.1.0.bb b/recipes/xorg-driver/xf86-input-elo2300_1.1.0.bb
deleted file mode 100644
index 4439f6c..0000000
--- a/recipes/xorg-driver/xf86-input-elo2300_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "43885769d6f741272dda162e82902b0d"
-SRC_URI[archive.sha256sum] = "9551f67e24c4573867a64d032d1ff6b63654caab8a85d3c6b2af7748daaa2134"
diff --git a/recipes/xorg-driver/xf86-input-elo2300_1.1.1.bb b/recipes/xorg-driver/xf86-input-elo2300_1.1.1.bb
deleted file mode 100644
index 5f98171..0000000
--- a/recipes/xorg-driver/xf86-input-elo2300_1.1.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- ELO2300 input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4eef20f44954d49571a10b9134fdb663"
-SRC_URI[archive.sha256sum] = "cc2cd97f49cce1795ea74034b1416ff7cd5107e1a69258b09a741d55a98ba005"
diff --git a/recipes/xorg-driver/xf86-input-elographics_1.1.0.bb b/recipes/xorg-driver/xf86-input-elographics_1.1.0.bb
deleted file mode 100644
index ae3a016..0000000
--- a/recipes/xorg-driver/xf86-input-elographics_1.1.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- ELOGraphics input driver"
-PE = "2"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ecb2bf1f800d4f5f4c295f2a0e6b1de7"
-SRC_URI[archive.sha256sum] = "1583e1dae6e3ecd34ba55deae7dfc052efede0378f852de6224308d7e7d5b2d8"
diff --git a/recipes/xorg-driver/xf86-input-elographics_1.2.2.bb b/recipes/xorg-driver/xf86-input-elographics_1.2.2.bb
deleted file mode 100644
index ccda074..0000000
--- a/recipes/xorg-driver/xf86-input-elographics_1.2.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- ELOGraphics input driver"
-PE = "2"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "50a9c32af12ca4733afe23042f012f9c"
-SRC_URI[archive.sha256sum] = "76ded0e6977f7d562a8236bc810423cd050320531be9621d868a48309ebc4d63"
diff --git a/recipes/xorg-driver/xf86-input-elographics_X11R7.0-1.0.0.5.bb b/recipes/xorg-driver/xf86-input-elographics_X11R7.0-1.0.0.5.bb
deleted file mode 100644
index 0857670..0000000
--- a/recipes/xorg-driver/xf86-input-elographics_X11R7.0-1.0.0.5.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "24c33f833bb2db72a07c3d28bfc0aae9"
-SRC_URI[archive.sha256sum] = "f1b7f84175d33f4d18c83cd0d37bd3962acd668922fa074a8ae29e18517cdda7"
diff --git a/recipes/xorg-driver/xf86-input-evdev_1.1.5.bb b/recipes/xorg-driver/xf86-input-evdev_1.1.5.bb
deleted file mode 100644
index 45e3010..0000000
--- a/recipes/xorg-driver/xf86-input-evdev_1.1.5.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DEPENDS += " kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "01705ea9a4d1699d5eeb17e7f297a581"
-SRC_URI[archive.sha256sum] = "52b7daab86dade2d189f0378ddf196c018cdc9dd47ade0b3b8fc7591cb4bbe9e"
diff --git a/recipes/xorg-driver/xf86-input-evdev_1.2.0.bb b/recipes/xorg-driver/xf86-input-evdev_1.2.0.bb
deleted file mode 100644
index 6dcfa8e..0000000
--- a/recipes/xorg-driver/xf86-input-evdev_1.2.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- evdev input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0c7c41d3f1637bb559e80c2ad708f05d"
-SRC_URI[archive.sha256sum] = "b23b231d754cab717a4b145ee3a5f3e73db46d877d23502326e9794d92d976ba"
diff --git a/recipes/xorg-driver/xf86-input-evdev_1.99.4.bb b/recipes/xorg-driver/xf86-input-evdev_1.99.4.bb
deleted file mode 100644
index 395bfbc..0000000
--- a/recipes/xorg-driver/xf86-input-evdev_1.99.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- evdev input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f56d98ab11ef77cfcbafb5d93c697791"
-SRC_URI[archive.sha256sum] = "71e896168819bcf50044c175482d03873c31bc6eb355305a87e94772580789dd"
diff --git a/recipes/xorg-driver/xf86-input-evdev_2.0.4.bb b/recipes/xorg-driver/xf86-input-evdev_2.0.4.bb
deleted file mode 100644
index c0458e1..0000000
--- a/recipes/xorg-driver/xf86-input-evdev_2.0.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- evdev input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ac97e155ea4db87a8393297493f9c406"
-SRC_URI[archive.sha256sum] = "825adcadaf4c90d4cb1d0bd21dcf67bf3b895f12f8e7bf186ed936445dc015ca"
diff --git a/recipes/xorg-driver/xf86-input-evdev_2.1.0.bb b/recipes/xorg-driver/xf86-input-evdev_2.1.0.bb
deleted file mode 100644
index 5974386..0000000
--- a/recipes/xorg-driver/xf86-input-evdev_2.1.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- evdev input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a6070ead29b2d81b5b386a96df2661b8"
-SRC_URI[archive.sha256sum] = "45c4b6df8d1dbc4db8aa580be4f3c693ebba4eba4908d82489948827d3bed0e5"
diff --git a/recipes/xorg-driver/xf86-input-evdev_2.2.5.bb b/recipes/xorg-driver/xf86-input-evdev_2.2.5.bb
deleted file mode 100644
index 7605fe3..0000000
--- a/recipes/xorg-driver/xf86-input-evdev_2.2.5.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- evdev input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e926692d74ee81ed459d0fe89439ff8b"
-SRC_URI[archive.sha256sum] = "433fd29043cd427ba486bcce471aae3ad1abca94c8682feff92da0c380b8dff3"
diff --git a/recipes/xorg-driver/xf86-input-evdev_2.2.6.bb b/recipes/xorg-driver/xf86-input-evdev_2.2.6.bb
deleted file mode 100644
index b490d18..0000000
--- a/recipes/xorg-driver/xf86-input-evdev_2.2.6.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- evdev input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "bc4b2356e1dbf2d21e1e95249b18f5f8"
-SRC_URI[archive.sha256sum] = "dbf3799e207175e91f50492d51343e5cfdc706f637f6e9f14257b764e86bb3f9"
diff --git a/recipes/xorg-driver/xf86-input-evdev_2.3.1.bb b/recipes/xorg-driver/xf86-input-evdev_2.3.1.bb
deleted file mode 100644
index 32798ca..0000000
--- a/recipes/xorg-driver/xf86-input-evdev_2.3.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- evdev input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e56ce4424b89b2409c6e73e007a85da7"
-SRC_URI[archive.sha256sum] = "462f2ae2fd389a87e09fa764a236cd04dcbf85bcfcd8000aa9a3810055511d8f"
diff --git a/recipes/xorg-driver/xf86-input-evdev_2.3.2.bb b/recipes/xorg-driver/xf86-input-evdev_2.3.2.bb
deleted file mode 100644
index 3967e40..0000000
--- a/recipes/xorg-driver/xf86-input-evdev_2.3.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- evdev input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b2bfe368022eedf2671ee28daba31efc"
-SRC_URI[archive.sha256sum] = "029bf469bd013bcc3e384c1297a05a59e4b9b3ba90a26c022b32c0819d115e28"
diff --git a/recipes/xorg-driver/xf86-input-fpit_1.1.0.bb b/recipes/xorg-driver/xf86-input-fpit_1.1.0.bb
deleted file mode 100644
index 57647da..0000000
--- a/recipes/xorg-driver/xf86-input-fpit_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a31066a2076d18619ceaea67f6d89698"
-SRC_URI[archive.sha256sum] = "8ee3b2df90516182460fbda025153aa7fb2c6ba343e4239d225963a287f694f8"
diff --git a/recipes/xorg-driver/xf86-input-fpit_1.2.0.bb b/recipes/xorg-driver/xf86-input-fpit_1.2.0.bb
deleted file mode 100644
index 261dfb0..0000000
--- a/recipes/xorg-driver/xf86-input-fpit_1.2.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0f3e013d5ff58e0aba3d9e1d18830291"
-SRC_URI[archive.sha256sum] = "87e3dd97d57ddb520cafa5e68fa7846cfc3d9d71cb054cdf0e1d650c7b1cff7e"
diff --git a/recipes/xorg-driver/xf86-input-hyperpen_1.1.0.bb b/recipes/xorg-driver/xf86-input-hyperpen_1.1.0.bb
deleted file mode 100644
index 30d24d6..0000000
--- a/recipes/xorg-driver/xf86-input-hyperpen_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1dfccb75069e61e0c6f990b47eb58c40"
-SRC_URI[archive.sha256sum] = "d1c20a3340e06c5634759832dcf2edc6acb41476a4f637eba6880730e607f493"
diff --git a/recipes/xorg-driver/xf86-input-hyperpen_1.2.0.bb b/recipes/xorg-driver/xf86-input-hyperpen_1.2.0.bb
deleted file mode 100644
index cc64178..0000000
--- a/recipes/xorg-driver/xf86-input-hyperpen_1.2.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "175c1e1ad668ebbbe212c1e975dd14f9"
-SRC_URI[archive.sha256sum] = "689d1c5c1f21eed00ae03a01c57482f7bbef36d7e07156556c99febe28c7d413"
diff --git a/recipes/xorg-driver/xf86-input-jamstudio_1.1.0.bb b/recipes/xorg-driver/xf86-input-jamstudio_1.1.0.bb
deleted file mode 100644
index 31c41f3..0000000
--- a/recipes/xorg-driver/xf86-input-jamstudio_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a32e36a24545791a3408cdc5563b6523"
-SRC_URI[archive.sha256sum] = "ce41b360bd08ea31036b79cfc25a32c854147522e4580f5ca1a203233e657e1a"
diff --git a/recipes/xorg-driver/xf86-input-joystick_1.1.0.bb b/recipes/xorg-driver/xf86-input-joystick_1.1.0.bb
deleted file mode 100644
index ffb9ecc..0000000
--- a/recipes/xorg-driver/xf86-input-joystick_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e0025215542c7a11c5a7f9548631dbd7"
-SRC_URI[archive.sha256sum] = "11c3e8056e8f44b9a6f348b5366c7e725155563374770b82e339e913b9a60d16"
diff --git a/recipes/xorg-driver/xf86-input-joystick_1.3.1.bb b/recipes/xorg-driver/xf86-input-joystick_1.3.1.bb
deleted file mode 100644
index b4bad29..0000000
--- a/recipes/xorg-driver/xf86-input-joystick_1.3.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- joystick input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ff25ea697cfa1570cc28f4b9cf9c761f"
-SRC_URI[archive.sha256sum] = "1d33b9668e039ea9adc0680c1f2971785508cfd74b2215749db23af23ef8f9ce"
diff --git a/recipes/xorg-driver/xf86-input-joystick_1.3.2.bb b/recipes/xorg-driver/xf86-input-joystick_1.3.2.bb
deleted file mode 100644
index 81bde8f..0000000
--- a/recipes/xorg-driver/xf86-input-joystick_1.3.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- joystick input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e48b99e55093525ebb7811a014391a0b"
-SRC_URI[archive.sha256sum] = "6cad238e0a54dec75c5224f9c0774b4fce2a03b06f1c61b404e9ea97d4941d4b"
diff --git a/recipes/xorg-driver/xf86-input-keyboard_1.1.1.bb b/recipes/xorg-driver/xf86-input-keyboard_1.1.1.bb
deleted file mode 100644
index 75f3b39..0000000
--- a/recipes/xorg-driver/xf86-input-keyboard_1.1.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DEPENDS += " kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "babf094e37bdfc08076d4adb4c69c1d9"
-SRC_URI[archive.sha256sum] = "b7e7377d75f3a10cceb5df18019b8e4498fbed0100478edd4af75bf8cd45d6fd"
diff --git a/recipes/xorg-driver/xf86-input-keyboard_1.2.0.bb b/recipes/xorg-driver/xf86-input-keyboard_1.2.0.bb
deleted file mode 100644
index 465de76..0000000
--- a/recipes/xorg-driver/xf86-input-keyboard_1.2.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DEPENDS += " kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "06e14029e00b32ed085769775b398efd"
-SRC_URI[archive.sha256sum] = "8c45fc324ea01377f9932250824ee1769bdf1eab6e4b661c22a39deb0b01580a"
diff --git a/recipes/xorg-driver/xf86-input-keyboard_1.2.2.bb b/recipes/xorg-driver/xf86-input-keyboard_1.2.2.bb
deleted file mode 100644
index e407ff5..0000000
--- a/recipes/xorg-driver/xf86-input-keyboard_1.2.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DEPENDS += " kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ab3122921f6359c54e250879288ffd47"
-SRC_URI[archive.sha256sum] = "c25b35524eaf00928d97bd0d8bf9e489d92993b133461b5f4d8d9655d37ec072"
diff --git a/recipes/xorg-driver/xf86-input-keyboard_1.3.1.bb b/recipes/xorg-driver/xf86-input-keyboard_1.3.1.bb
deleted file mode 100644
index 46f8650..0000000
--- a/recipes/xorg-driver/xf86-input-keyboard_1.3.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- keyboard input driver"
-DEPENDS += " kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ebe5dcf8eed819103909f18321fc3b9d"
-SRC_URI[archive.sha256sum] = "7b514715dfb5a2512dea3355bc3f09eb879d7184440c5525f0a9d29ec9f3be42"
diff --git a/recipes/xorg-driver/xf86-input-keyboard_1.3.2.bb b/recipes/xorg-driver/xf86-input-keyboard_1.3.2.bb
deleted file mode 100644
index 7c07927..0000000
--- a/recipes/xorg-driver/xf86-input-keyboard_1.3.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- keyboard input driver"
-DEPENDS += " kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d6fe929c4f6085d6dd67f197ae9c42f6"
-SRC_URI[archive.sha256sum] = "33939ec65dbf56f49e1e7de854a1cf95446e40c533950431901567e67112aef2"
diff --git a/recipes/xorg-driver/xf86-input-magellan_1.1.0.bb b/recipes/xorg-driver/xf86-input-magellan_1.1.0.bb
deleted file mode 100644
index 06b901b..0000000
--- a/recipes/xorg-driver/xf86-input-magellan_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0d6a81aa864ac790d9a8b517ca7016ad"
-SRC_URI[archive.sha256sum] = "8eef54b50c428513a330ed7183ce37f269050252a4d1199d3b00ad6bf0a7833d"
diff --git a/recipes/xorg-driver/xf86-input-magellan_1.1.1.bb b/recipes/xorg-driver/xf86-input-magellan_1.1.1.bb
deleted file mode 100644
index 4e020e6..0000000
--- a/recipes/xorg-driver/xf86-input-magellan_1.1.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- Magellan input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8a966d3b74dc2a801ff09b895037090c"
-SRC_URI[archive.sha256sum] = "06da7d1b222ba47ba0c7fd561965d78f2c8e46f44c998cb768e98bdc3c0e1741"
diff --git a/recipes/xorg-driver/xf86-input-microtouch_1.1.0.bb b/recipes/xorg-driver/xf86-input-microtouch_1.1.0.bb
deleted file mode 100644
index d8adb95..0000000
--- a/recipes/xorg-driver/xf86-input-microtouch_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7b3cc0330d70e7e4e07914fcb325b331"
-SRC_URI[archive.sha256sum] = "7f92f5531495ecfbfd00744198fd4b2aa3b8f5c188b115e55e865e961bca2039"
diff --git a/recipes/xorg-driver/xf86-input-microtouch_1.1.1.bb b/recipes/xorg-driver/xf86-input-microtouch_1.1.1.bb
deleted file mode 100644
index 68c58e0..0000000
--- a/recipes/xorg-driver/xf86-input-microtouch_1.1.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- MicroTouch input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9843fbea6cc0c4129e96ce9a6c893cf6"
-SRC_URI[archive.sha256sum] = "5f2f0b16705c6226081a452f9f876508c388b384fca69106d377cd134cfddfd3"
diff --git a/recipes/xorg-driver/xf86-input-mouse_1.1.2.bb b/recipes/xorg-driver/xf86-input-mouse_1.1.2.bb
deleted file mode 100644
index a113404..0000000
--- a/recipes/xorg-driver/xf86-input-mouse_1.1.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "Mouse Support in X11"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d8bcd9fb1b4efb02acd251495f9a30c1"
-SRC_URI[archive.sha256sum] = "7d4c2ecbe8f9327f7c8093c05401ab68b22f3343bcf04e4838cc40c21b7f8e0a"
diff --git a/recipes/xorg-driver/xf86-input-mouse_1.2.1.bb b/recipes/xorg-driver/xf86-input-mouse_1.2.1.bb
deleted file mode 100644
index 0145028..0000000
--- a/recipes/xorg-driver/xf86-input-mouse_1.2.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "Mouse Support in X11"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "72b07e65bbea6ab484d84c048f6835fb"
-SRC_URI[archive.sha256sum] = "82671998e2b02ad097e3d5cc7d964e11de0b3ca3dfec4876e8fa2a13af6aacc3"
diff --git a/recipes/xorg-driver/xf86-input-mouse_1.2.2.bb b/recipes/xorg-driver/xf86-input-mouse_1.2.2.bb
deleted file mode 100644
index 431b7a7..0000000
--- a/recipes/xorg-driver/xf86-input-mouse_1.2.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "Mouse Support in X11"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c47c598e55e7080b8ea30f70781f7ca3"
-SRC_URI[archive.sha256sum] = "80e9cb52b2036b71289b2140bcd3ac202cf46fd42830761c53120ddac38e7edf"
diff --git a/recipes/xorg-driver/xf86-input-mouse_1.2.3.bb b/recipes/xorg-driver/xf86-input-mouse_1.2.3.bb
deleted file mode 100644
index 6f59dd2..0000000
--- a/recipes/xorg-driver/xf86-input-mouse_1.2.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- mouse input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "47da1fa52584933d045528109f094eff"
-SRC_URI[archive.sha256sum] = "a07cb2169f43018c90b7889781c0db30cda0da03811edccb8c4db533166357ab"
diff --git a/recipes/xorg-driver/xf86-input-mouse_1.3.0.bb b/recipes/xorg-driver/xf86-input-mouse_1.3.0.bb
deleted file mode 100644
index d96f51a..0000000
--- a/recipes/xorg-driver/xf86-input-mouse_1.3.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- mouse input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "31a51b0e5ddc4fac19754f48a3adf881"
-SRC_URI[archive.sha256sum] = "054b253f366795c2865714ce8bc545c79e59aa9ce1b7a9a4a05b9c674dff9dec"
diff --git a/recipes/xorg-driver/xf86-input-mouse_1.4.0.bb b/recipes/xorg-driver/xf86-input-mouse_1.4.0.bb
deleted file mode 100644
index 8193994..0000000
--- a/recipes/xorg-driver/xf86-input-mouse_1.4.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- mouse input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e7dc0759c14a9bfd373917a49e5f7c7d"
-SRC_URI[archive.sha256sum] = "e6e1dbd64d41c826619a5881c5aeed46095bfdcb87c3e27d65292fc12a5bb7c7"
diff --git a/recipes/xorg-driver/xf86-input-mutouch_1.1.0.bb b/recipes/xorg-driver/xf86-input-mutouch_1.1.0.bb
deleted file mode 100644
index 50516db..0000000
--- a/recipes/xorg-driver/xf86-input-mutouch_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "98ae915c67cabf0e6d40a425dbdbe10b"
-SRC_URI[archive.sha256sum] = "cc67e0dd4f4fcc8d798f0bfe42b975132c5739bdd80809580a74182e4d1b62ea"
diff --git a/recipes/xorg-driver/xf86-input-mutouch_1.2.0.bb b/recipes/xorg-driver/xf86-input-mutouch_1.2.0.bb
deleted file mode 100644
index 233cf3b..0000000
--- a/recipes/xorg-driver/xf86-input-mutouch_1.2.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- muTouch input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "50711d390d2867e3fa7e06b59b2d575b"
-SRC_URI[archive.sha256sum] = "214f0831f36ebfc081b9f31f91ae27972ced9371b9b2256650998596a097061d"
diff --git a/recipes/xorg-driver/xf86-input-palmax_1.1.0.bb b/recipes/xorg-driver/xf86-input-palmax_1.1.0.bb
deleted file mode 100644
index f048b9c..0000000
--- a/recipes/xorg-driver/xf86-input-palmax_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0959dbf7972dfb95f56e4bd3f56447cf"
-SRC_URI[archive.sha256sum] = "5c00c85eed2950a575362bee2f21c2fa68eb8af81e7f1d451273a1302eac4145"
diff --git a/recipes/xorg-driver/xf86-input-penmount_1.2.0.bb b/recipes/xorg-driver/xf86-input-penmount_1.2.0.bb
deleted file mode 100644
index 89e8c91..0000000
--- a/recipes/xorg-driver/xf86-input-penmount_1.2.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0589f2eaa84afb9bd49b226ce7dacdda"
-SRC_URI[archive.sha256sum] = "dea18a07cf8f59e7bc981cfa1f6ef476dd14f7d9bee3bb1a55a6cc49f766150e"
diff --git a/recipes/xorg-driver/xf86-input-penmount_1.2.1.bb b/recipes/xorg-driver/xf86-input-penmount_1.2.1.bb
deleted file mode 100644
index ee0e818..0000000
--- a/recipes/xorg-driver/xf86-input-penmount_1.2.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- Penmount input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "268af4dceda544d8c815b9b7e87d4536"
-SRC_URI[archive.sha256sum] = "fab08de727da6f56b82d8ecee451a52e7129ff80522e711c5322f1bd2fa9970a"
diff --git a/recipes/xorg-driver/xf86-input-penmount_1.3.0.bb b/recipes/xorg-driver/xf86-input-penmount_1.3.0.bb
deleted file mode 100644
index 4756ec7..0000000
--- a/recipes/xorg-driver/xf86-input-penmount_1.3.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- Penmount input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "24594c0222e631fedccc7c540c420b03"
-SRC_URI[archive.sha256sum] = "9cb4e0e83dcefe1ece814d638bd186785b6bc1debe1aa2101ce2a4ea0376805a"
diff --git a/recipes/xorg-driver/xf86-input-spaceorb_1.1.0.bb b/recipes/xorg-driver/xf86-input-spaceorb_1.1.0.bb
deleted file mode 100644
index 16dcb32..0000000
--- a/recipes/xorg-driver/xf86-input-spaceorb_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "294810ca9e93c4096458c6a0f2fb5679"
-SRC_URI[archive.sha256sum] = "9cd53cb719bf401ff3f72233d3a88c59539b94eaf11e586e307c807a325f0815"
diff --git a/recipes/xorg-driver/xf86-input-summa_1.1.0.bb b/recipes/xorg-driver/xf86-input-summa_1.1.0.bb
deleted file mode 100644
index 351bb09..0000000
--- a/recipes/xorg-driver/xf86-input-summa_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b37a432fd87bb9f46d011622d6fce6b3"
-SRC_URI[archive.sha256sum] = "f10f2cadd4120b40b3658000c87f910e3005f4d787441c7dd83b48ebbf2a11f2"
diff --git a/recipes/xorg-driver/xf86-input-synaptics_0.15.0.bb b/recipes/xorg-driver/xf86-input-synaptics_0.15.0.bb
deleted file mode 100644
index 959c651..0000000
--- a/recipes/xorg-driver/xf86-input-synaptics_0.15.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- mouse input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "939f1c831c5cd3a6f027e982592dfc5b"
-SRC_URI[archive.sha256sum] = "e7d481c375a11df55eb8f12390c329c2bfda3258c689cec11cfec27cb5895c8b"
diff --git a/recipes/xorg-driver/xf86-input-synaptics_1.2.1.bb b/recipes/xorg-driver/xf86-input-synaptics_1.2.1.bb
deleted file mode 100644
index 0cfb5df..0000000
--- a/recipes/xorg-driver/xf86-input-synaptics_1.2.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- mouse input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "29a6f9da5123149e4abc8ff83880ed5c"
-SRC_URI[archive.sha256sum] = "a63b48c5c8eb09416b941dea591a948e111d1b2e14d4620f25377cf47cf877e6"
diff --git a/recipes/xorg-driver/xf86-input-tek4957_1.1.0.bb b/recipes/xorg-driver/xf86-input-tek4957_1.1.0.bb
deleted file mode 100644
index 81965ce..0000000
--- a/recipes/xorg-driver/xf86-input-tek4957_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "be8a4bd474ad6c85b93f66dd6fcfa6ee"
-SRC_URI[archive.sha256sum] = "09b9506d1bb1deaaf69872392bc56e1d75997bb8157e85a9121749bf5fe15727"
diff --git a/recipes/xorg-driver/xf86-input-vmmouse_12.4.0.bb b/recipes/xorg-driver/xf86-input-vmmouse_12.4.0.bb
deleted file mode 100644
index 8b58d0d..0000000
--- a/recipes/xorg-driver/xf86-input-vmmouse_12.4.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "The VMMouse driver enables support for the special VMMouse protocol \
-that is provided by VMware virtual machines to give absolute pointer \
-positioning. "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "313e403e56702f6c38d1a5c830b60dc2"
-SRC_URI[archive.sha256sum] = "383e0973aad0e96812fc019cb579abaf016f97427fc07466b150fe15739ba63c"
diff --git a/recipes/xorg-driver/xf86-input-vmmouse_12.4.3.bb b/recipes/xorg-driver/xf86-input-vmmouse_12.4.3.bb
deleted file mode 100644
index e2f4af6..0000000
--- a/recipes/xorg-driver/xf86-input-vmmouse_12.4.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "44730af795616ed4d4a0cd9a3a07935d"
-SRC_URI[archive.sha256sum] = "d668c4cacd4be6d56608fbdf7779d60120f38f3315e6385a7cc87339124e77ab"
diff --git a/recipes/xorg-driver/xf86-input-vmmouse_12.5.1.bb b/recipes/xorg-driver/xf86-input-vmmouse_12.5.1.bb
deleted file mode 100644
index b268d75..0000000
--- a/recipes/xorg-driver/xf86-input-vmmouse_12.5.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1e2feafb8e4f1b670aeb39bcac9fbb18"
-SRC_URI[archive.sha256sum] = "63608ba07138f01eadb9a02d8054c306501d907dd706ae61fdc030c50a7bfcfb"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-input-vmmouse_12.6.6.bb b/recipes/xorg-driver/xf86-input-vmmouse_12.6.6.bb
deleted file mode 100644
index 5a9fae1..0000000
--- a/recipes/xorg-driver/xf86-input-vmmouse_12.6.6.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1c57338928a8897b7ca0b5524fcb1223"
-SRC_URI[archive.sha256sum] = "0cb2896b7a284efd6337c019c599fd4d5a6de74a58c6e6c31c31ed399efa8171"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-input-vmmouse_12.6.9.bb b/recipes/xorg-driver/xf86-input-vmmouse_12.6.9.bb
deleted file mode 100644
index 4b3f2da..0000000
--- a/recipes/xorg-driver/xf86-input-vmmouse_12.6.9.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6b7f2ffffc650ed61c9d333aeece893f"
-SRC_URI[archive.sha256sum] = "a5e2069fc080de9c7d037c0def0135a5c93b76a8b535099e021d65a5e1d0b00f"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-input-void_1.1.0.bb b/recipes/xorg-driver/xf86-input-void_1.1.0.bb
deleted file mode 100644
index d1cb5a9..0000000
--- a/recipes/xorg-driver/xf86-input-void_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ea72a92d43b95f413347df96d6a73933"
-SRC_URI[archive.sha256sum] = "b43c5d920821bd06b6a1a131dd071ab838bf024c3cb092c6d1f10d57b648b0e4"
diff --git a/recipes/xorg-driver/xf86-input-void_1.1.1.bb b/recipes/xorg-driver/xf86-input-void_1.1.1.bb
deleted file mode 100644
index a76a38f..0000000
--- a/recipes/xorg-driver/xf86-input-void_1.1.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- void input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "862c230f5f6e0c545f232b4c0fa9537a"
-SRC_URI[archive.sha256sum] = "dde062d6267a3fd9d51b0daee88fd84fceea52a6019de51dece46e92012dbc4f"
diff --git a/recipes/xorg-driver/xf86-video-apm_1.1.1.bb b/recipes/xorg-driver/xf86-video-apm_1.1.1.bb
deleted file mode 100644
index fd2e16a..0000000
--- a/recipes/xorg-driver/xf86-video-apm_1.1.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "This is the Alliance Promotion driver for XFree86 4.0+"
-DEPENDS += " xf86rushproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ac7e05f0dfc7e02cac0bf17b9eb89b11"
-SRC_URI[archive.sha256sum] = "09d7e6cf30b94f141f8ebe2560b301a058f645e74108edc28c908e750865dcec"
diff --git a/recipes/xorg-driver/xf86-video-apm_1.2.0.bb b/recipes/xorg-driver/xf86-video-apm_1.2.0.bb
deleted file mode 100644
index 241a11c..0000000
--- a/recipes/xorg-driver/xf86-video-apm_1.2.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "This is the Alliance Promotion driver for XFree86 4.0+"
-DEPENDS += " xf86rushproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://get-rid-of-host-includes.patch"
-SRC_URI[archive.md5sum] = "4f78650d79656dc803a720049d65682e"
-SRC_URI[archive.sha256sum] = "f0fe020f892e6e3a696a490c86312a1b32672bffb7dead153c24f103540a6185"
diff --git a/recipes/xorg-driver/xf86-video-ark_0.6.0.bb b/recipes/xorg-driver/xf86-video-ark_0.6.0.bb
deleted file mode 100644
index a0595f4..0000000
--- a/recipes/xorg-driver/xf86-video-ark_0.6.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6921479baca8f7b156029489fd335854"
-SRC_URI[archive.sha256sum] = "e5abc4f4ae643ce56d5773f052515196f05786235e4afd155a3232e20dbc84d7"
diff --git a/recipes/xorg-driver/xf86-video-ark_0.7.0.bb b/recipes/xorg-driver/xf86-video-ark_0.7.0.bb
deleted file mode 100644
index 938d501..0000000
--- a/recipes/xorg-driver/xf86-video-ark_0.7.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- ark display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://get-rid-of-host-includes.patch"
-SRC_URI[archive.md5sum] = "6826c556ebe9a1248cbc7f7edd44f956"
-SRC_URI[archive.sha256sum] = "8e65e73045fabe37c15f6d4895baa09346bdac2f7537607b523aacd7bcf57594"
diff --git a/recipes/xorg-driver/xf86-video-ast_0.81.0.bb b/recipes/xorg-driver/xf86-video-ast_0.81.0.bb
deleted file mode 100644
index 2623266..0000000
--- a/recipes/xorg-driver/xf86-video-ast_0.81.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "04bc08907da13612dbc4918fe54e63e3"
-SRC_URI[archive.sha256sum] = "b95553aaf89bef28051c82914cee2b91102dbc2370d0d855404ba453902459b8"
diff --git a/recipes/xorg-driver/xf86-video-ast_0.85.0.bb b/recipes/xorg-driver/xf86-video-ast_0.85.0.bb
deleted file mode 100644
index e5c2bc4..0000000
--- a/recipes/xorg-driver/xf86-video-ast_0.85.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b415bf3259ad0acdaf62e3dde76e3289"
-SRC_URI[archive.sha256sum] = "9018ff84e4866d895c037aad33fb31c79d5f47d3f54707600cc3fe6076485b28"
diff --git a/recipes/xorg-driver/xf86-video-ati_6.13.0.bb b/recipes/xorg-driver/xf86-video-ati_6.13.0.bb
deleted file mode 100644
index 974bb83..0000000
--- a/recipes/xorg-driver/xf86-video-ati_6.13.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- ATI display driver"
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7b2642442091808002963920c7693aeb"
-SRC_URI[archive.sha256sum] = "6d07847d63798f92237175f2645bf964d083b18c4c439e6c787a5f0c3dd68e31"
diff --git a/recipes/xorg-driver/xf86-video-ati_6.6.193.bb b/recipes/xorg-driver/xf86-video-ati_6.6.193.bb
deleted file mode 100644
index 71e1136..0000000
--- a/recipes/xorg-driver/xf86-video-ati_6.6.193.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "102b781f543213852401f3422b18ccc7"
-SRC_URI[archive.sha256sum] = "9b0899694000cb91d5643e2482376af24bd495cb01b4c9dcdd6ee3545b0aefae"
diff --git a/recipes/xorg-driver/xf86-video-ati_6.6.3.bb b/recipes/xorg-driver/xf86-video-ati_6.6.3.bb
deleted file mode 100644
index aaaf3a8..0000000
--- a/recipes/xorg-driver/xf86-video-ati_6.6.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f6d559f9d20f61567d381916b376590f"
-SRC_URI[archive.sha256sum] = "d08a429e1fb1620ae81839181a4dc6cd579d52fc440d44d7bba36d19be355780"
diff --git a/recipes/xorg-driver/xf86-video-ati_6.7.196.bb b/recipes/xorg-driver/xf86-video-ati_6.7.196.bb
deleted file mode 100644
index ab69068..0000000
--- a/recipes/xorg-driver/xf86-video-ati_6.7.196.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "06db625391c75c8be86c4dd5a5d713e6"
-SRC_URI[archive.sha256sum] = "8923a08232255ceacf770ef767d86bbfb195dffa9559baa1b1de90f9c947a6d9"
diff --git a/recipes/xorg-driver/xf86-video-ati_6.7.197.bb b/recipes/xorg-driver/xf86-video-ati_6.7.197.bb
deleted file mode 100644
index f9a0d8b..0000000
--- a/recipes/xorg-driver/xf86-video-ati_6.7.197.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- ATI display driver"
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7bd53945ce6d0b48b7fd558039e82aa2"
-SRC_URI[archive.sha256sum] = "b6c67996cfdbbf9b3a191b9092f5d515dd7fae564544626792dd5ef404e29134"
diff --git a/recipes/xorg-driver/xf86-video-ati_6.8.0.bb b/recipes/xorg-driver/xf86-video-ati_6.8.0.bb
deleted file mode 100644
index 1aa67c2..0000000
--- a/recipes/xorg-driver/xf86-video-ati_6.8.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- ATI display driver"
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3c97c7925ebf4162eeb3463e23adc0e3"
-SRC_URI[archive.sha256sum] = "3863851e3c85d25cc38941eec63e866656806821b028519ae32ab8b276664fba"
diff --git a/recipes/xorg-driver/xf86-video-chips_1.1.1.bb b/recipes/xorg-driver/xf86-video-chips_1.1.1.bb
deleted file mode 100644
index f083306..0000000
--- a/recipes/xorg-driver/xf86-video-chips_1.1.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3182d43439ca4cbf08ff9aa76990bba3"
-SRC_URI[archive.sha256sum] = "16a81cdb6b311176936c3326d279c0d75530adbcf9a3489eea55992ac5bc7494"
diff --git a/recipes/xorg-driver/xf86-video-chips_1.2.0.bb b/recipes/xorg-driver/xf86-video-chips_1.2.0.bb
deleted file mode 100644
index 79a3cd7..0000000
--- a/recipes/xorg-driver/xf86-video-chips_1.2.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Chips display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0fec6bee65383790485d917247a61629"
-SRC_URI[archive.sha256sum] = "05f38c49b23be36afa68b738faf520b8dbf05b92c769107039426651801d4f99"
diff --git a/recipes/xorg-driver/xf86-video-cirrus_1.1.0.bb b/recipes/xorg-driver/xf86-video-cirrus_1.1.0.bb
deleted file mode 100644
index b04396f..0000000
--- a/recipes/xorg-driver/xf86-video-cirrus_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "66344e315def275605dafb314ce59851"
-SRC_URI[archive.sha256sum] = "5988962199d5013274f6a6952939e4f405df658bb6616ebf9954c993b1179b1b"
diff --git a/recipes/xorg-driver/xf86-video-cirrus_1.2.1.bb b/recipes/xorg-driver/xf86-video-cirrus_1.2.1.bb
deleted file mode 100644
index c481738..0000000
--- a/recipes/xorg-driver/xf86-video-cirrus_1.2.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Cirrus display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "bc28fdedaee9059180e2534f9dbcd2f6"
-SRC_URI[archive.sha256sum] = "e7c99ed66326df5fadf6e5d875859a430fec4369415a27cde72a91109f78bb9c"
diff --git a/recipes/xorg-driver/xf86-video-dummy_0.2.0.bb b/recipes/xorg-driver/xf86-video-dummy_0.2.0.bb
deleted file mode 100644
index 13bf350..0000000
--- a/recipes/xorg-driver/xf86-video-dummy_0.2.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "22b7cc20a33443cbd218bd2521850cfe"
-SRC_URI[archive.sha256sum] = "46013885696f3c1a5e05c5d503abc69e691443319a97cf2c6a01ec031e06c910"
diff --git a/recipes/xorg-driver/xf86-video-dummy_0.3.0.bb b/recipes/xorg-driver/xf86-video-dummy_0.3.0.bb
deleted file mode 100644
index b375d93..0000000
--- a/recipes/xorg-driver/xf86-video-dummy_0.3.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- dummy display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://get-rid-of-host-includes.patch"
-SRC_URI[archive.md5sum] = "3d96297556846bee02a74166ffb5d052"
-SRC_URI[archive.sha256sum] = "5a4bbde0b7f0334bb63b159e5ef6e164be3699e3424734c2bd9823f20a30a278"
diff --git a/recipes/xorg-driver/xf86-video-dummy_0.3.3.bb b/recipes/xorg-driver/xf86-video-dummy_0.3.3.bb
deleted file mode 100644
index 625b228..0000000
--- a/recipes/xorg-driver/xf86-video-dummy_0.3.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- dummy display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://get-rid-of-host-includes.patch"
-SRC_URI[archive.md5sum] = "3ffe3a28f4452e66bf56180e7da9cbc5"
-SRC_URI[archive.sha256sum] = "df3f55de7953dba6d7ce10cc5f355da1a6164f781ad9393a38dae502dba4955d"
diff --git a/recipes/xorg-driver/xf86-video-fbdev/use-staged-headers.patch b/recipes/xorg-driver/xf86-video-fbdev/use-staged-headers.patch
deleted file mode 100644
index 0bf41fd..0000000
--- a/recipes/xorg-driver/xf86-video-fbdev/use-staged-headers.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Index: xf86-video-fbdev-0.4.0/src/fbdev.c
-===================================================================
---- xf86-video-fbdev-0.4.0.orig/src/fbdev.c
-+++ xf86-video-fbdev-0.4.0/src/fbdev.c
-@@ -10,29 +10,29 @@
- #include <string.h>
- 
- /* all driver need this */
--#include "xf86.h"
--#include "xf86_OSproc.h"
-+#include <xf86.h>
-+#include <xf86_OSproc.h>
- 
--#include "mipointer.h"
--#include "mibstore.h"
--#include "micmap.h"
--#include "colormapst.h"
--#include "xf86cmap.h"
-+#include <mipointer.h>
-+#include <mibstore.h>
-+#include <micmap.h>
-+#include <colormapst.h>
-+#include <xf86cmap.h>
- #include "shadow.h"
--#include "dgaproc.h"
-+#include <dgaproc.h>
- 
- /* for visuals */
--#include "fb.h"
-+#include <fb.h>
- #ifdef USE_AFB
- #include "afb.h"
- #endif
- 
--#include "xf86Resources.h"
--#include "xf86RAC.h"
-+#include <xf86Resources.h>
-+#include <xf86RAC.h>
- 
--#include "fbdevhw.h"
-+#include <fbdevhw.h>
- 
--#include "xf86xv.h"
-+#include <xf86xv.h>
- 
- #ifdef XSERVER_LIBPCIACCESS
- #include <pciaccess.h>
-
diff --git a/recipes/xorg-driver/xf86-video-fbdev_0.3.1.bb b/recipes/xorg-driver/xf86-video-fbdev_0.3.1.bb
deleted file mode 100644
index df2f45b..0000000
--- a/recipes/xorg-driver/xf86-video-fbdev_0.3.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9ae810c6c6c3c9713a67866fe794d4ff"
-SRC_URI[archive.sha256sum] = "309d1f618c77559ea494c05d45b09577790c44900685e17bc812e4e1b19df6e7"
diff --git a/recipes/xorg-driver/xf86-video-fbdev_0.4.0.bb b/recipes/xorg-driver/xf86-video-fbdev_0.4.0.bb
deleted file mode 100644
index 77225cf..0000000
--- a/recipes/xorg-driver/xf86-video-fbdev_0.4.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- fbdev display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6572b39fec77b8e6de1c858a93992924"
-SRC_URI[archive.sha256sum] = "bba725daeb2a313b83f2b92855a9ae8aa72c4cc8581f9f62f101ebdf00ac359d"
-
-FILES_${PN} += " file://use-staged-headers.patch"
diff --git a/recipes/xorg-driver/xf86-video-geode/fixes.patch b/recipes/xorg-driver/xf86-video-geode/fixes.patch
deleted file mode 100644
index b581b56..0000000
--- a/recipes/xorg-driver/xf86-video-geode/fixes.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-diff --git a/README b/README
-index 8ae3ce7..74f3a9a 100644
---- a/README
-+++ b/README
-@@ -1,6 +1,6 @@
- AMD Geode GX and LX graphics driver for X.Org
- =============================================
--README last updated: 2009-08-04
-+README last updated: 2009-09-03
- 
- GIT repository:
-         git://anongit.freedesktop.org/git/xorg/driver/xf86-video-geode
-@@ -29,15 +29,23 @@ at which point xf86-video-cyrix and xf86-video-nsc will be retired.
- 
- = Dependencies =
- 
--As of version 2.9.0, this driver depends on X.Org server 1.3 or newer,
-+As of version 2.11.4, this driver depends upon X server 1.5 or newer,
-+because the GX Randr code utilizes dixSetPrivate whose API was modified 
-+in a non backward-compatible way.
-+
-+  #ifdef'ing the changes from f1268f3ba8404129d358db3bb1e66f3841f7018a 
-+  and b28abde0276ddd7f687242f3886f98b0e49a7fc2 might make it possible
-+  to build this driver against older X servers. Patches are welcome.
-+
-+As of version 2.9.0, this driver depends on X server 1.3 or newer,
- because it utilizes the new common DDC probing libraries from X.Org.
- 
--If necessary, it might be possible to create autoconf macros to make 
--this driver compile against older X servers, following this example:
-+  If necessary, it might be possible to create autoconf macros to make 
-+  this driver compile against older X servers, following this example:
- 
--http://lists.freedesktop.org/archives/xorg-commit/2007-February/010341.html
-+  http://lists.freedesktop.org/archives/xorg-commit/2007-February/010341.html
- 
--Patches accomplishing the same trick for the Geode driver are welcome.
-+  Patches accomplishing the same trick for the Geode driver are welcome.
- 
- = FAQ =
- 
-diff --git a/src/geode.h b/src/geode.h
-index 4f0b467..8fe67b5 100644
---- a/src/geode.h
-+++ b/src/geode.h
-@@ -60,7 +60,7 @@
- #define LX      0x20
- 
- #define PCI_VENDOR_ID_CYRIX  0x1078
--#define PCI_VENDOR_ID_NS     0x100B
-+#define PCI_VENDOR_ID_NS     0x100b
- #define PCI_VENDOR_ID_AMD    0x1022
- 
- #define PCI_CHIP_5530     0x0104
-diff --git a/src/gx_driver.c b/src/gx_driver.c
-index 7ff5418..6f5767d 100644
---- a/src/gx_driver.c
-+++ b/src/gx_driver.c
-@@ -464,7 +464,7 @@ GXPreInit(ScrnInfoPtr pScrni, int flags)
-     /* Fill in the monitor information */
-     pScrni->monitor = pScrni->confScreen->monitor;
- 
--    if (!xf86SetDepthBpp(pScrni, 16, 16, 16, Support24bppFb | Support32bppFb))
-+    if (!xf86SetDepthBpp(pScrni, 24, 16, 32, Support24bppFb | Support32bppFb))
- 	return FALSE;
- 
-     switch (pScrni->depth) {
-diff --git a/src/gx_randr.c b/src/gx_randr.c
-index 2669912..91ca43e 100644
---- a/src/gx_randr.c
-+++ b/src/gx_randr.c
-@@ -56,15 +56,17 @@ typedef struct _GXRandRInfo
-     Rotation supported_rotations;      /* driver supported */
- } XF86RandRInfoRec, *XF86RandRInfoPtr;
- 
--#define AMD_OLDPRIV (GET_ABI_MAJOR(ABI_VIDEODRV_VERSION) < 4)
--
- static int GXRandRIndex;
- 
--#if AMD_OLDPRIV
--#define XF86RANDRINFO(p) ((XF86RandRInfoPtr) (p)->devPrivates[GXRandRIndex].ptr)
-+#define OLD_VIDEODRV_INTERFACE (GET_ABI_MAJOR(ABI_VIDEODRV_VERSION) < 4)
-+
-+#if OLD_VIDEODRV_INTERFACE
-+#define XF86RANDRINFO(p)   ((XF86RandRInfoPtr) (p)->devPrivates[GXRandRIndex].ptr)
-+#define XF86RANDRSET(p, v) (p)->devPrivates[GXRandRIndex].ptr = v
- #else
--#define XF86RANDRINFO(p) ((XF86RandRInfoPtr) \
--			  dixLookupPrivate(&(p)->devPrivates, &GXRandRIndex));
-+#define XF86RANDRINFO(p) ((XF86RandRInfoPtr)						\
-+			  dixLookupPrivate(&(p)->devPrivates, &GXRandRIndex))
-+#define XF86RANDRSET(p, v) dixSetPrivate(&(p)->devPrivates, &GXRandRIndex, v)
- #endif
- 
- static int
-@@ -327,7 +329,7 @@ GXRandRInit(ScreenPtr pScreen, int rotation)
-     if (GXRandRGeneration != serverGeneration) {
- 	GXRandRGeneration = serverGeneration;
-     }
--#if AMD_OLDPRIV
-+#if OLD_VIDEODRV_INTERFACE
-     GXRandRIndex = AllocateScreenPrivateIndex();
- #endif
- 
-@@ -354,10 +356,7 @@ GXRandRInit(ScreenPtr pScreen, int rotation)
-     pRandr->supported_rotations = rotation;
-     pRandr->maxX = pRandr->maxY = 0;
- 
--#if AMD_OLDPRIV
--    pScreen->devPrivates[GXRandRIndex].ptr = pRandr;
--#else
--    dixSetPrivate(&pScreen->devPrivates, &GXRandRIndex, pRandr);
--#endif
-+    XF86RANDRSET(pScreen, pRandr);
-+
-     return TRUE;
- }
-diff --git a/src/lx_driver.c b/src/lx_driver.c
-index 08d1fdd..79ec15c 100644
---- a/src/lx_driver.c
-+++ b/src/lx_driver.c
-@@ -331,7 +331,7 @@ LXPreInit(ScrnInfoPtr pScrni, int flags)
-     /* Fill in the monitor information */
-     pScrni->monitor = pScrni->confScreen->monitor;
- 
--    if (!xf86SetDepthBpp(pScrni, 16, 16, 16, Support24bppFb | Support32bppFb))
-+    if (!xf86SetDepthBpp(pScrni, 24, 16, 32, Support24bppFb | Support32bppFb))
- 	return FALSE;
- 
-     switch (pScrni->depth) {
-diff --git a/src/lx_output.c b/src/lx_output.c
-index 5508477..72e5e2a 100644
---- a/src/lx_output.c
-+++ b/src/lx_output.c
-@@ -108,7 +108,7 @@ lx_output_set_property(xf86OutputPtr output, Atom property,
- 
- 	    if (!ret) {
- 		xf86DrvMsg(pScrni->scrnIndex, X_ERROR,
--		    "Failed to set mode after propery change!\n");
-+		    "Failed to set mode after property change!\n");
- 
- 		pGeode->Scale = scale;
- 		return FALSE;
-diff --git a/src/lx_output.c b/src/lx_output.c
-index 72e5e2a..3eecc9e 100644
---- a/src/lx_output.c
-+++ b/src/lx_output.c
-@@ -163,6 +163,13 @@ lx_output_mode_valid(xf86OutputPtr output, DisplayModePtr pMode)
- 	    return MODE_BAD;
-     }
- 
-+    if (gfx_is_display_mode_supported(pMode->HDisplay,
-+                                      pMode->VDisplay,
-+                                      pScrni->bitsPerPixel,
-+                                      GeodeGetRefreshRate(pMode)) < 0) {
-+        return MODE_BAD;
-+    }
-+
-     return MODE_OK;
- }
- 
diff --git a/recipes/xorg-driver/xf86-video-geode_2.10.1.bb b/recipes/xorg-driver/xf86-video-geode_2.10.1.bb
deleted file mode 100644
index 9a72053..0000000
--- a/recipes/xorg-driver/xf86-video-geode_2.10.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e307ab55a2a81d7868506df789f76dfb"
-SRC_URI[archive.sha256sum] = "9b6ef818e402e2c1b7b2f36eff657b8104c67d738f10d4d7d39c7bc118a8c650"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.0.bb b/recipes/xorg-driver/xf86-video-geode_2.11.0.bb
deleted file mode 100644
index a909137..0000000
--- a/recipes/xorg-driver/xf86-video-geode_2.11.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1dbede8f6393edfe6c1ecab2f754b3b2"
-SRC_URI[archive.sha256sum] = "d70c198cde981c3a53b1c41b717dea4bbf1d397d82957f584c641bb5fd02c82d"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.4.1.bb b/recipes/xorg-driver/xf86-video-geode_2.11.4.1.bb
deleted file mode 100644
index dccbd74..0000000
--- a/recipes/xorg-driver/xf86-video-geode_2.11.4.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://fixes.patch"
-SRC_URI[archive.md5sum] = "05f85d897ef41d13de354ac0252bf923"
-SRC_URI[archive.sha256sum] = "d739f6762fe3aa7ef7ca74f87fbe4d6ec3bb13a735e5dfb82b6748eda2b31138"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.7.bb b/recipes/xorg-driver/xf86-video-geode_2.11.7.bb
deleted file mode 100644
index bdf626f..0000000
--- a/recipes/xorg-driver/xf86-video-geode_2.11.7.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "086daecd062835eea51e2a718761dda3"
-SRC_URI[archive.sha256sum] = "ed864a37b44dabb760f0b7caac8a796e3b1a0a7f305b44c4684f871b273a9f9b"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.8.0.bb b/recipes/xorg-driver/xf86-video-geode_2.8.0.bb
deleted file mode 100644
index a342ca1..0000000
--- a/recipes/xorg-driver/xf86-video-geode_2.8.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a2b9c70a32b0a6436d837d67fa7aae18"
-SRC_URI[archive.sha256sum] = "f0b68171dd4256c927fbee91ecf84fa28c409b5b6b39cbf47eaa48fd73db305f"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.9.0.bb b/recipes/xorg-driver/xf86-video-geode_2.9.0.bb
deleted file mode 100644
index 5f411b4..0000000
--- a/recipes/xorg-driver/xf86-video-geode_2.9.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d7b3254e6f4f1978fecf8f4fa2823259"
-SRC_URI[archive.sha256sum] = "b9aa934b94c0397e32cd702788fe2b6f2398bdc1a8c83594ad25274f82593590"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-glint_1.1.1.bb b/recipes/xorg-driver/xf86-video-glint_1.1.1.bb
deleted file mode 100644
index 632a7bb..0000000
--- a/recipes/xorg-driver/xf86-video-glint_1.1.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xf86dgaproto drm xf86driproto"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2cf49f701024a145bd25aff9da11d479"
-SRC_URI[archive.sha256sum] = "d63e0dd3f5cecebaf1915193a68ac83e90c1e973e3276a71bd14651d67115e6d"
diff --git a/recipes/xorg-driver/xf86-video-glint_1.2.0.bb b/recipes/xorg-driver/xf86-video-glint_1.2.0.bb
deleted file mode 100644
index 6c721f7..0000000
--- a/recipes/xorg-driver/xf86-video-glint_1.2.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Glint display driver"
-DEPENDS += " xf86dgaproto drm xf86driproto"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1f5271ac01d4475efe73ab6f2c3646f4"
-SRC_URI[archive.sha256sum] = "a0edd1109c03efdb0f6defc18745f89fb3c11142381e2657f94d492ddd1e7419"
-
-EXTRA_OECONF += " \
-  ac_cv_file__usr_include_xorg_dri_h=yes \
-  ac_cv_file__usr_include_xorg_sarea_h=yes \
-  ac_cv_file__usr_include_xorg_dristruct_h=yes \
-"
diff --git a/recipes/xorg-driver/xf86-video-glint_1.2.1.bb b/recipes/xorg-driver/xf86-video-glint_1.2.1.bb
deleted file mode 100644
index e2a9e9b..0000000
--- a/recipes/xorg-driver/xf86-video-glint_1.2.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Glint display driver"
-DEPENDS += " xf86dgaproto drm xf86driproto"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6d7afdac0a26cf201c3f3b417c31c5e1"
-SRC_URI[archive.sha256sum] = "161780d2127d0548a2017ca461ce38e7a69afce5d921a08604e91478c6be1cda"
diff --git a/recipes/xorg-driver/xf86-video-i128_1.1.0.5.bb b/recipes/xorg-driver/xf86-video-i128_1.1.0.5.bb
deleted file mode 100644
index 73be28f..0000000
--- a/recipes/xorg-driver/xf86-video-i128_1.1.0.5.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "Number Nine I128 for X11"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6e0d3e09fc99d6f0a0e969613ddf58cc"
-SRC_URI[archive.sha256sum] = "a99d2b04b829faa7542545380317c8f59f54ecbd5e0a7008580f3155742d0381"
diff --git a/recipes/xorg-driver/xf86-video-i128_1.1.0.6.bb b/recipes/xorg-driver/xf86-video-i128_1.1.0.6.bb
deleted file mode 100644
index 51d911b..0000000
--- a/recipes/xorg-driver/xf86-video-i128_1.1.0.6.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "Number Nine I128 for X11"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c483efc90b1935025b17e4b9e9c2e4df"
-SRC_URI[archive.sha256sum] = "b52183f5a7d0adee1d21b4b0a0908886b7bbc69dc4498f1e7a3edc4b1988c41c"
diff --git a/recipes/xorg-driver/xf86-video-i128_1.2.1.bb b/recipes/xorg-driver/xf86-video-i128_1.2.1.bb
deleted file mode 100644
index 896dc41..0000000
--- a/recipes/xorg-driver/xf86-video-i128_1.2.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- i128 display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d0080732eaa15059b0a953aa3522185a"
-SRC_URI[archive.sha256sum] = "0d023cacf8134241cd8efcd5744eb156399406c92f59d3895392f2b5fd055eb1"
diff --git a/recipes/xorg-driver/xf86-video-i128_1.3.0.bb b/recipes/xorg-driver/xf86-video-i128_1.3.0.bb
deleted file mode 100644
index 6b70a68..0000000
--- a/recipes/xorg-driver/xf86-video-i128_1.3.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- i128 display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "aff4922d2f02bad7e0d8649358edbcee"
-SRC_URI[archive.sha256sum] = "62eadebd3417ffb3857f10f16597c59541ceb135ddbc30b2140f46d9eb7dddd7"
diff --git a/recipes/xorg-driver/xf86-video-i128_1.3.1.bb b/recipes/xorg-driver/xf86-video-i128_1.3.1.bb
deleted file mode 100644
index 0ff9d08..0000000
--- a/recipes/xorg-driver/xf86-video-i128_1.3.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- i128 display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3b170a6df5114420cd4021a057918a09"
-SRC_URI[archive.sha256sum] = "49bb23625654ebcd74d0d23f534b074188f4b21c3cd443b06ac83b9485bf9a75"
diff --git a/recipes/xorg-driver/xf86-video-i740_1.1.0.bb b/recipes/xorg-driver/xf86-video-i740_1.1.0.bb
deleted file mode 100644
index 1843998..0000000
--- a/recipes/xorg-driver/xf86-video-i740_1.1.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "I740 for X11"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "57302e225060a7286ae1a970c87a589b"
-SRC_URI[archive.sha256sum] = "b8f2144c987d8a14f8b477ee3aa43fc1c76d040a77e40938c3c97c8e34e2b7c5"
diff --git a/recipes/xorg-driver/xf86-video-i740_1.2.0.bb b/recipes/xorg-driver/xf86-video-i740_1.2.0.bb
deleted file mode 100644
index 83e2d53..0000000
--- a/recipes/xorg-driver/xf86-video-i740_1.2.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- i740 display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d0e5a805c546b29b1dd3b55a68d16dc4"
-SRC_URI[archive.sha256sum] = "59c8f6ee465bef033c1c20bfff8121a318efda9656d5dc29f674bb655f18486f"
diff --git a/recipes/xorg-driver/xf86-video-i810_1.6.5.bb b/recipes/xorg-driver/xf86-video-i810_1.6.5.bb
deleted file mode 100644
index d0a5bb8..0000000
--- a/recipes/xorg-driver/xf86-video-i810_1.6.5.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "I810 for X11"
-DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fc1e0da3430551bf25a7babf7ccfd3bf"
-SRC_URI[archive.sha256sum] = "30d0cd555d8b8b5bb53d93eaae1ad2aecb5c94a760e2346d60b6e194c254e40f"
diff --git a/recipes/xorg-driver/xf86-video-intel_2.10.0.bb b/recipes/xorg-driver/xf86-video-intel_2.10.0.bb
deleted file mode 100644
index 02a9411..0000000
--- a/recipes/xorg-driver/xf86-video-intel_2.10.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
-DEPENDS += " virtual/libx11 libxvmc drm xf86driproto "
-RDEPENDS_${PN} += "xserver-xorg-extension-dri \
-             xserver-xorg-extension-dri2 \
-             xserver-xorg-extension-glx"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "78309d4f04dd8ae6585d120377042741"
-SRC_URI[archive.sha256sum] = "e46dd691dc93db7cd6f5f22b84fea7e9f4bfd34f28026cfd680993b3ccfc48ab"
diff --git a/recipes/xorg-driver/xf86-video-intel_2.2.1.bb b/recipes/xorg-driver/xf86-video-intel_2.2.1.bb
deleted file mode 100644
index d962ee4..0000000
--- a/recipes/xorg-driver/xf86-video-intel_2.2.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
-DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3334dc5142871b78fc609fd1b3dac3f2"
-SRC_URI[archive.sha256sum] = "d976c5f5e9c84f3817aba6ad22855446f1c2b9bfa0d53bd11c37c62cfdefa60a"
diff --git a/recipes/xorg-driver/xf86-video-intel_2.4.2.bb b/recipes/xorg-driver/xf86-video-intel_2.4.2.bb
deleted file mode 100644
index 5da4140..0000000
--- a/recipes/xorg-driver/xf86-video-intel_2.4.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
-DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5cd6b3ed57c7e78ab51e9d9266e73fb6"
-SRC_URI[archive.sha256sum] = "5afdc91e93ffed09ea5258c6fde210c729ea2b44d83f98acfd92c3da7e99e64b"
diff --git a/recipes/xorg-driver/xf86-video-intel_2.6.3.bb b/recipes/xorg-driver/xf86-video-intel_2.6.3.bb
deleted file mode 100644
index 635dc7d..0000000
--- a/recipes/xorg-driver/xf86-video-intel_2.6.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
-DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "440c014bbd3072b5d379fe1bdb861918"
-SRC_URI[archive.sha256sum] = "b35a142aeba034ad06b8d9b477c243f82ce9f82ad65a0ee4408630f228e90258"
diff --git a/recipes/xorg-driver/xf86-video-mach64_6.8.0.bb b/recipes/xorg-driver/xf86-video-mach64_6.8.0.bb
deleted file mode 100644
index 8152ac1..0000000
--- a/recipes/xorg-driver/xf86-video-mach64_6.8.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
-DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6081b8fa50c689d51f85c2fbaf93867e"
-SRC_URI[archive.sha256sum] = "fba616f88d351759e00a90965e38a0d82608698ae36fc2a18df4036cd384e1a1"
diff --git a/recipes/xorg-driver/xf86-video-mga_1.4.1.bb b/recipes/xorg-driver/xf86-video-mga_1.4.1.bb
deleted file mode 100644
index a6911b0..0000000
--- a/recipes/xorg-driver/xf86-video-mga_1.4.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ba373233a7d13084d14046a17b02e248"
-SRC_URI[archive.sha256sum] = "5becb5f0caf0f99296db28b32be46eb95d0a88ac8e4829c47cb637fb52d06564"
diff --git a/recipes/xorg-driver/xf86-video-mga_1.4.9.bb b/recipes/xorg-driver/xf86-video-mga_1.4.9.bb
deleted file mode 100644
index 78b197e..0000000
--- a/recipes/xorg-driver/xf86-video-mga_1.4.9.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "11066b84b949cd04300ec819c9c51532"
-SRC_URI[archive.sha256sum] = "d57dd2323052f064092167a232fb7576f46e5d62e98bc9cc6a7f270cc8d0fdc0"
diff --git a/recipes/xorg-driver/xf86-video-mga_1.9.99.bb b/recipes/xorg-driver/xf86-video-mga_1.9.99.bb
deleted file mode 100644
index 2081b47..0000000
--- a/recipes/xorg-driver/xf86-video-mga_1.9.99.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- MGA display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "29785ff1de2b0f7b7f1c48350449447c"
-SRC_URI[archive.sha256sum] = "82a91e523d40625c9e042ee640276756d1169cca7eb305c691a3378805c4c81c"
diff --git a/recipes/xorg-driver/xf86-video-neomagic_1.1.1.bb b/recipes/xorg-driver/xf86-video-neomagic_1.1.1.bb
deleted file mode 100644
index 12d3378..0000000
--- a/recipes/xorg-driver/xf86-video-neomagic_1.1.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X11 driver for NeoMagic 2200, 2160, 2097, 2093, 2090, 2070"
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7a3d3d6e60b9686d955c45d9ebbd5c1b"
-SRC_URI[archive.sha256sum] = "d6497080967b8285b663fedd7cafd4457578282ebd7da0b216b6fa214dd88a86"
diff --git a/recipes/xorg-driver/xf86-video-neomagic_1.2.1.bb b/recipes/xorg-driver/xf86-video-neomagic_1.2.1.bb
deleted file mode 100644
index 72e8a11..0000000
--- a/recipes/xorg-driver/xf86-video-neomagic_1.2.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X11 driver for NeoMagic 2200, 2160, 2097, 2093, 2090, 2070"
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a72f57fca4f4dff9a2c82eb1fe7456f4"
-SRC_URI[archive.sha256sum] = "96e38d5378596174f76c735c4723ff2ac336f9069644502a9b706586b845e0a5"
diff --git a/recipes/xorg-driver/xf86-video-newport_0.2.1.bb b/recipes/xorg-driver/xf86-video-newport_0.2.1.bb
deleted file mode 100644
index ef8a412..0000000
--- a/recipes/xorg-driver/xf86-video-newport_0.2.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "This is an unaccelerated driver for the SGI newport cards."
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2bd8e5b9ea68e0dcd80dfcaca0eff82c"
-SRC_URI[archive.sha256sum] = "66ac855452690ef896400577806dc1dd86318940f8a62ce20039037318b1ce08"
diff --git a/recipes/xorg-driver/xf86-video-nsc_2.8.2.bb b/recipes/xorg-driver/xf86-video-nsc_2.8.2.bb
deleted file mode 100644
index 8c1893f..0000000
--- a/recipes/xorg-driver/xf86-video-nsc_2.8.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1fbdd5e9b5508b032c0102f72d1e555c"
-SRC_URI[archive.sha256sum] = "060493a9dcad81e8912381d2a8d14a3e32a34414296a089756868f3442103c8c"
-
-# This driver is broken because it's seldom updated. It compiles
-# but fails to communicate with the card without this deprecated define.
-EXTRA_OEMAKE += "CFLAGS+=-DXFree86Server"
diff --git a/recipes/xorg-driver/xf86-video-nv_1.2.2.1.bb b/recipes/xorg-driver/xf86-video-nv_1.2.2.1.bb
deleted file mode 100644
index 010a7a9..0000000
--- a/recipes/xorg-driver/xf86-video-nv_1.2.2.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e4dc415b1e45db0bbdacc203ed33024a"
-SRC_URI[archive.sha256sum] = "97d47df7720d3cfcb56c4debca9218c3fc5352d34d82bc4880c8a620185f8c5e"
diff --git a/recipes/xorg-driver/xf86-video-nv_2.1.12.bb b/recipes/xorg-driver/xf86-video-nv_2.1.12.bb
deleted file mode 100644
index c634388..0000000
--- a/recipes/xorg-driver/xf86-video-nv_2.1.12.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- NV display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "42f12a36d7afc26c817e8e8f5c8b7274"
-SRC_URI[archive.sha256sum] = "f56d2bb42f6c4369dd3c6adc30988c53a229650f910b0db1bb3bf9376054011e"
diff --git a/recipes/xorg-driver/xf86-video-nv_2.1.16.bb b/recipes/xorg-driver/xf86-video-nv_2.1.16.bb
deleted file mode 100644
index 61efa0f..0000000
--- a/recipes/xorg-driver/xf86-video-nv_2.1.16.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- NV display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fb02d5506e35054348d1c2b2c924530d"
-SRC_URI[archive.sha256sum] = "4bf2f964b78d309769faa6a5d21c90a9907886623adf1f30ea890b4329bf578d"
diff --git a/recipes/xorg-driver/xf86-video-nv_2.1.17.bb b/recipes/xorg-driver/xf86-video-nv_2.1.17.bb
deleted file mode 100644
index bafcabc..0000000
--- a/recipes/xorg-driver/xf86-video-nv_2.1.17.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- NV display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4401c7b956e60a6d7de68ca6a8ec05d0"
-SRC_URI[archive.sha256sum] = "4286f8994d80a30c7b6b4fc9df6ea5d587f648adc23cb3f523f571738c6900f4"
diff --git a/recipes/xorg-driver/xf86-video-nv_2.1.3.bb b/recipes/xorg-driver/xf86-video-nv_2.1.3.bb
deleted file mode 100644
index a0b8b2b..0000000
--- a/recipes/xorg-driver/xf86-video-nv_2.1.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f9b38e24157c3aac6014119ac18d76da"
-SRC_URI[archive.sha256sum] = "8d9b5ea137c31919f7821e7f3ecbd133158813c1059f4a8ed0a723535d969952"
diff --git a/recipes/xorg-driver/xf86-video-nv_2.1.7.bb b/recipes/xorg-driver/xf86-video-nv_2.1.7.bb
deleted file mode 100644
index 0e6ea58..0000000
--- a/recipes/xorg-driver/xf86-video-nv_2.1.7.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- NV display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "192414222f1a98e228832ee53f8178c0"
-SRC_URI[archive.sha256sum] = "7c9135d80b519246b2a85ff0481d6ee0fddeb578d669ff490f236f85873e8c5a"
diff --git a/recipes/xorg-driver/xf86-video-nv_2.1.8.bb b/recipes/xorg-driver/xf86-video-nv_2.1.8.bb
deleted file mode 100644
index 7072fd6..0000000
--- a/recipes/xorg-driver/xf86-video-nv_2.1.8.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- NV display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c3e8c98287dc98677bebfbe1ba51ab77"
-SRC_URI[archive.sha256sum] = "825ffb97525517de9f0ff7155946c6e58c278dba11957573cc970dd3b094f94a"
diff --git a/recipes/xorg-driver/xf86-video-nv_2.1.9.bb b/recipes/xorg-driver/xf86-video-nv_2.1.9.bb
deleted file mode 100644
index c82ed56..0000000
--- a/recipes/xorg-driver/xf86-video-nv_2.1.9.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- NV display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c6b7e52fa18455c22eb040b8d2575ce5"
-SRC_URI[archive.sha256sum] = "20d92ff3ab4b9ecc150f4ed17a7012a48f56dbf3fb51b51dde769b28922976d9"
diff --git a/recipes/xorg-driver/xf86-video-openchrome_0.2.903.bb b/recipes/xorg-driver/xf86-video-openchrome_0.2.903.bb
deleted file mode 100644
index 6b4d8cb..0000000
--- a/recipes/xorg-driver/xf86-video-openchrome_0.2.903.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- openchrome display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c0820787e89958c9114d359b6a3cd464"
-SRC_URI[archive.sha256sum] = "b7e4858d6b5c6428fae2485a2c2097cdf6073268ef812aae2ccbc3d936db7410"
-
-do_configure_prepend() {
-        rm ${S}/acinclude.m4 || true
-}
diff --git a/recipes/xorg-driver/xf86-video-r128_6.8.0.bb b/recipes/xorg-driver/xf86-video-r128_6.8.0.bb
deleted file mode 100644
index 490112f..0000000
--- a/recipes/xorg-driver/xf86-video-r128_6.8.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- r128 display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "007bec0c6b07d9d3aeca4da18e561efb"
-SRC_URI[archive.sha256sum] = "5689ca714fee9c9272bee12883b07a0ef2c40358ffb19fa684e963027b56567b"
diff --git a/recipes/xorg-driver/xf86-video-radeonhd_1.2.0.bb b/recipes/xorg-driver/xf86-video-radeonhd_1.2.0.bb
deleted file mode 100644
index b6b4a95..0000000
--- a/recipes/xorg-driver/xf86-video-radeonhd_1.2.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- AMD/ATI r5xx, r6xx display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6a932ec17da9ce5a6d9000c1649c3a7e"
-SRC_URI[archive.sha256sum] = "87c6353dd52bbe22d3a45f28fb39de1dd44f41568aaf8a9b0d45a7ed62313e27"
-
-EXTRA_OECONF += " \
-  ac_cv_file___src_AtomBios_includes_atombios_h=yes \
-  ac_cv_file___src_AtomBios_includes_Decoder_h=yes \
-"
diff --git a/recipes/xorg-driver/xf86-video-rendition_4.1.3.bb b/recipes/xorg-driver/xf86-video-rendition_4.1.3.bb
deleted file mode 100644
index 942dc58..0000000
--- a/recipes/xorg-driver/xf86-video-rendition_4.1.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X11 driver supporting cards based on the V1000 or the V2x00."
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a8b97feccb32184820d5856fe78d34db"
-SRC_URI[archive.sha256sum] = "37e7aef72f7466485f5a3bafd0d43190cb7439de16868bfba2c59bb4c9df4408"
diff --git a/recipes/xorg-driver/xf86-video-rendition_4.2.0.bb b/recipes/xorg-driver/xf86-video-rendition_4.2.0.bb
deleted file mode 100644
index 00efa96..0000000
--- a/recipes/xorg-driver/xf86-video-rendition_4.2.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X11 driver supporting cards based on the V1000 or the V2x00."
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7c03de3804d4c4f6ff59f74050d24b2b"
-SRC_URI[archive.sha256sum] = "b57b62f707d87534a799170e31b33311449cfd7019a56e6b4fa85a4c7faaae15"
diff --git a/recipes/xorg-driver/xf86-video-s3_0.5.0.bb b/recipes/xorg-driver/xf86-video-s3_0.5.0.bb
deleted file mode 100644
index aa6bf0f..0000000
--- a/recipes/xorg-driver/xf86-video-s3_0.5.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d95ab6445cab477f39adfbbc81006f67"
-SRC_URI[archive.sha256sum] = "4a1206cb1a200aad8881216547d9913d0e24928138f3b1bb912a3336b9c05c97"
diff --git a/recipes/xorg-driver/xf86-video-s3_0.6.0.bb b/recipes/xorg-driver/xf86-video-s3_0.6.0.bb
deleted file mode 100644
index 52f9584..0000000
--- a/recipes/xorg-driver/xf86-video-s3_0.6.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- legacy S3 display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d05e7c3cb044437eda8663e174ba913c"
-SRC_URI[archive.sha256sum] = "ed07e4648b0f405fddd563783b49f971d649dd07cc8bc7737a93ff3d90f6c067"
diff --git a/recipes/xorg-driver/xf86-video-s3virge_1.10.1.bb b/recipes/xorg-driver/xf86-video-s3virge_1.10.1.bb
deleted file mode 100644
index 2b83d22..0000000
--- a/recipes/xorg-driver/xf86-video-s3virge_1.10.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- S3 ViRGE display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4a293047e988d4ea1e9e96d3b5793f43"
-SRC_URI[archive.sha256sum] = "9094115621ef73c957cf887332717ec727c751959b1059e3d00fbfe0114a978a"
diff --git a/recipes/xorg-driver/xf86-video-s3virge_1.9.1.bb b/recipes/xorg-driver/xf86-video-s3virge_1.9.1.bb
deleted file mode 100644
index 68b534b..0000000
--- a/recipes/xorg-driver/xf86-video-s3virge_1.9.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a91c73285ef67ee7cd9e2da28acb6cc4"
-SRC_URI[archive.sha256sum] = "cef5702963f49e737fb8b1472dc0241f7a5da49f844ac77f2df3e693a84bc822"
diff --git a/recipes/xorg-driver/xf86-video-savage_2.1.2.bb b/recipes/xorg-driver/xf86-video-savage_2.1.2.bb
deleted file mode 100644
index 8f0ed08..0000000
--- a/recipes/xorg-driver/xf86-video-savage_2.1.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6367e921a98f6a7fec9d0a9bc5ff0a47"
-SRC_URI[archive.sha256sum] = "1a9aa442152c139e3c54bc6c323bd13edf0bfff70a81c03969bcb1159317edb2"
diff --git a/recipes/xorg-driver/xf86-video-savage_2.1.3.bb b/recipes/xorg-driver/xf86-video-savage_2.1.3.bb
deleted file mode 100644
index 1c6629f..0000000
--- a/recipes/xorg-driver/xf86-video-savage_2.1.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9c5e541613b07de6e7b2b2df3a2e35b1"
-SRC_URI[archive.sha256sum] = "f5f154df377cb445935d1453d6b7095d63912d5776dcb44f8d3c2f10ab1a3cc5"
diff --git a/recipes/xorg-driver/xf86-video-savage_2.2.1.bb b/recipes/xorg-driver/xf86-video-savage_2.2.1.bb
deleted file mode 100644
index 66f4b70..0000000
--- a/recipes/xorg-driver/xf86-video-savage_2.2.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Savage display driver"
-DEPENDS += " drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "62b8aba48b54eaefeae87df502bf219c"
-SRC_URI[archive.sha256sum] = "adf95cae0fbaf72326c51c4c9e61486eef062bb1706f6ab46d942f2c36d8a37e"
-
-EXTRA_OECONF += " \
-  ac_cv_file__usr_include_xorg_dri_h=yes \
-  ac_cv_file__usr_include_xorg_sarea_h=yes \
-  ac_cv_file__usr_include_xorg_dristruct_h=yes \
-"
diff --git a/recipes/xorg-driver/xf86-video-siliconmotion_1.5.1.bb b/recipes/xorg-driver/xf86-video-siliconmotion_1.5.1.bb
deleted file mode 100644
index 527b778..0000000
--- a/recipes/xorg-driver/xf86-video-siliconmotion_1.5.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ee35d7714ce44a2b5ac7ad7b7b7dd75a"
-SRC_URI[archive.sha256sum] = "54cf791695a53d4836d32f899b7d34b969edf5415f02e36956b6e72993e21cd7"
diff --git a/recipes/xorg-driver/xf86-video-siliconmotion_1.6.0.bb b/recipes/xorg-driver/xf86-video-siliconmotion_1.6.0.bb
deleted file mode 100644
index f5fb737..0000000
--- a/recipes/xorg-driver/xf86-video-siliconmotion_1.6.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- SiliconMotion display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a8419a8ed17b02b2a6dd4d30d5e94b00"
-SRC_URI[archive.sha256sum] = "cc5301b9c6adb9a0770509b8570d38730d43e9ffce6d6886cd9a090965017e53"
diff --git a/recipes/xorg-driver/xf86-video-sis_0.10.0.bb b/recipes/xorg-driver/xf86-video-sis_0.10.0.bb
deleted file mode 100644
index 162ab1d..0000000
--- a/recipes/xorg-driver/xf86-video-sis_0.10.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- SiS display driver"
-DEPENDS += " xineramaproto xf86miscproto xf86dgaproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "331d432dccccca91ec7da39ff6bf1218"
-SRC_URI[archive.sha256sum] = "bcc0dcde5d469cc2500676e0ad29dcd12b1370066289902387ead762260e4b40"
-
-EXTRA_OECONF += " \
-  ac_cv_file__usr_include_xorg_dri_h=yes \
-  ac_cv_file__usr_include_xorg_sarea_h=yes \
-  ac_cv_file__usr_include_xorg_dristruct_h=yes \
-"
diff --git a/recipes/xorg-driver/xf86-video-sis_0.10.1.bb b/recipes/xorg-driver/xf86-video-sis_0.10.1.bb
deleted file mode 100644
index 1b58f87..0000000
--- a/recipes/xorg-driver/xf86-video-sis_0.10.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- SiS display driver"
-DEPENDS += " xineramaproto xf86miscproto xf86dgaproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9f57c2f5ccbd8340db32da1c74083771"
-SRC_URI[archive.sha256sum] = "11529f094cbdcdaba505596488eda623e0f0bd3c51139359d587ea58b6527307"
-
-EXTRA_OECONF += " \
-  ac_cv_file__usr_include_xorg_dri_h=yes \
-  ac_cv_file__usr_include_xorg_sarea_h=yes \
-  ac_cv_file__usr_include_xorg_dristruct_h=yes \
-"
diff --git a/recipes/xorg-driver/xf86-video-sis_0.9.3.bb b/recipes/xorg-driver/xf86-video-sis_0.9.3.bb
deleted file mode 100644
index c5de372..0000000
--- a/recipes/xorg-driver/xf86-video-sis_0.9.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto xf86dgaproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e35d817fa4ee7beb6cd5aa744b9c0783"
-SRC_URI[archive.sha256sum] = "898ee8fb16fff89ba8ac5c83b9f5a2371084719db0cf034140427229191436f6"
diff --git a/recipes/xorg-driver/xf86-video-sis_0.9.4.bb b/recipes/xorg-driver/xf86-video-sis_0.9.4.bb
deleted file mode 100644
index d316d30..0000000
--- a/recipes/xorg-driver/xf86-video-sis_0.9.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- SiS display driver"
-DEPENDS += " xineramaproto xf86miscproto xf86dgaproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "43f12cabf770b06170cdd1cdaafdc50f"
-SRC_URI[archive.sha256sum] = "50856446841526fc393af6bae0fbc39c20bb07e60056a676d0bc620446b593ac"
diff --git a/recipes/xorg-driver/xf86-video-sisusb_0.8.1.bb b/recipes/xorg-driver/xf86-video-sisusb_0.8.1.bb
deleted file mode 100644
index 5cc4976..0000000
--- a/recipes/xorg-driver/xf86-video-sisusb_0.8.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "cbd669507e4aa35e468905f09b546333"
-SRC_URI[archive.sha256sum] = "1596b79ab3e33263bde2d456cc0376808abee80b4cde059605f176d98bdb45cb"
diff --git a/recipes/xorg-driver/xf86-video-sisusb_0.9.0.bb b/recipes/xorg-driver/xf86-video-sisusb_0.9.0.bb
deleted file mode 100644
index 4fce26a..0000000
--- a/recipes/xorg-driver/xf86-video-sisusb_0.9.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- SiS USB display driver"
-DEPENDS += " xineramaproto xf86miscproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7b1f5465f423a859f306f4f1d6306a1b"
-SRC_URI[archive.sha256sum] = "76b79c9b7d3b35b8e2e5354569bf0936c4afd39a9dcbdf66327714d75137930a"
diff --git a/recipes/xorg-driver/xf86-video-sisusb_0.9.1.bb b/recipes/xorg-driver/xf86-video-sisusb_0.9.1.bb
deleted file mode 100644
index 2229021..0000000
--- a/recipes/xorg-driver/xf86-video-sisusb_0.9.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- SiS USB display driver"
-DEPENDS += " xineramaproto xf86miscproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "42069e70578bf3fb353cdacad186f6c0"
-SRC_URI[archive.sha256sum] = "b3ca934ce3e31f4a162bf263cad3913edccc46906d09132118b74a2095c157d9"
diff --git a/recipes/xorg-driver/xf86-video-suncg14_1.1.0.bb b/recipes/xorg-driver/xf86-video-suncg14_1.1.0.bb
deleted file mode 100644
index 9729e24..0000000
--- a/recipes/xorg-driver/xf86-video-suncg14_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9e25784e912cb2f0493b87431fd60773"
-SRC_URI[archive.sha256sum] = "1eca2b0970e725db49f9e462a0c2e618b2616389647335b5aec9d6e495e40527"
diff --git a/recipes/xorg-driver/xf86-video-suncg3_1.1.0.bb b/recipes/xorg-driver/xf86-video-suncg3_1.1.0.bb
deleted file mode 100644
index 031d070..0000000
--- a/recipes/xorg-driver/xf86-video-suncg3_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b9cb8cfb6a4234bebc434f744af53208"
-SRC_URI[archive.sha256sum] = "3564ebc8ccdfea872d46559166d881e93ac7c17e3ed46bb4087960f491c37df9"
diff --git a/recipes/xorg-driver/xf86-video-suncg6_1.1.0.bb b/recipes/xorg-driver/xf86-video-suncg6_1.1.0.bb
deleted file mode 100644
index 692ddb3..0000000
--- a/recipes/xorg-driver/xf86-video-suncg6_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "aa6b7836fe6ccc99994bf15ff2b74e86"
-SRC_URI[archive.sha256sum] = "d6b1f3b79c57ef5281e0204b2847812cf9fa5df616478f01591445a36537194b"
diff --git a/recipes/xorg-driver/xf86-video-sunffb_1.1.0.bb b/recipes/xorg-driver/xf86-video-sunffb_1.1.0.bb
deleted file mode 100644
index e20c4fb..0000000
--- a/recipes/xorg-driver/xf86-video-sunffb_1.1.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "dee23564c0d8069f52c7cd29c78be667"
-SRC_URI[archive.sha256sum] = "f897a427e83cf6965fd82724e3298aea44eb3131ba62f904cb514dfd0a879029"
diff --git a/recipes/xorg-driver/xf86-video-sunffb_1.2.0.bb b/recipes/xorg-driver/xf86-video-sunffb_1.2.0.bb
deleted file mode 100644
index eead699..0000000
--- a/recipes/xorg-driver/xf86-video-sunffb_1.2.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "816842de26bce8a935f3c9c3cfedbc42"
-SRC_URI[archive.sha256sum] = "59f2f8fc2399a4d6b0ce733481c58694e723a989f4712c00436d35e27c059292"
diff --git a/recipes/xorg-driver/xf86-video-sunleo_1.1.0.bb b/recipes/xorg-driver/xf86-video-sunleo_1.1.0.bb
deleted file mode 100644
index 0970905..0000000
--- a/recipes/xorg-driver/xf86-video-sunleo_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0408d95795d754c92d12d6476b6932a1"
-SRC_URI[archive.sha256sum] = "b504d50f261bea9bc9dcd2a9c9c3307b24dee97c18d13b5a6deb3eb393270da9"
diff --git a/recipes/xorg-driver/xf86-video-suntcx_1.1.0.bb b/recipes/xorg-driver/xf86-video-suntcx_1.1.0.bb
deleted file mode 100644
index dc0cb5d..0000000
--- a/recipes/xorg-driver/xf86-video-suntcx_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "779a31151e44d2fd2a5ee1794f836889"
-SRC_URI[archive.sha256sum] = "72986a3981b746f60df1aba443d610db437fe8d5053e64630686f471c47b01cf"
diff --git a/recipes/xorg-driver/xf86-video-tdfx_1.3.0.bb b/recipes/xorg-driver/xf86-video-tdfx_1.3.0.bb
deleted file mode 100644
index 5bf9bd0..0000000
--- a/recipes/xorg-driver/xf86-video-tdfx_1.3.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "04c49acb5c5dbde14eabd32d06df6e73"
-SRC_URI[archive.sha256sum] = "6b1a00df5c9628817d08f07c6f18f578950744f3eb63b4397be8b0754e728624"
diff --git a/recipes/xorg-driver/xf86-video-tdfx_1.4.0.bb b/recipes/xorg-driver/xf86-video-tdfx_1.4.0.bb
deleted file mode 100644
index 371823d..0000000
--- a/recipes/xorg-driver/xf86-video-tdfx_1.4.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b13132f24683ef759bfb0c1db5096496"
-SRC_URI[archive.sha256sum] = "c3be06d324f2e49ece1f243b10d7180a32fbe65dbbb81e162279c8608800dead"
-
-EXTRA_OECONF += " \
-  ac_cv_file__usr_include_xorg_dri_h=yes \
-  ac_cv_file__usr_include_xorg_sarea_h=yes \
-  ac_cv_file__usr_include_xorg_dristruct_h=yes \
-"
diff --git a/recipes/xorg-driver/xf86-video-tga_1.1.0.bb b/recipes/xorg-driver/xf86-video-tga_1.1.0.bb
deleted file mode 100644
index 15f4518..0000000
--- a/recipes/xorg-driver/xf86-video-tga_1.1.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "DEC 21030 X11 driver"
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9eda4d4490706b2dd8f4ecdbaf779856"
-SRC_URI[archive.sha256sum] = "50143dfdd259fd114dc2f41518a4898d5407bf55422251df75812b96a1fa6e9b"
diff --git a/recipes/xorg-driver/xf86-video-tga_1.2.0.bb b/recipes/xorg-driver/xf86-video-tga_1.2.0.bb
deleted file mode 100644
index 4e20ae3..0000000
--- a/recipes/xorg-driver/xf86-video-tga_1.2.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "DEC 21030 X11 driver"
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f3bddf0a64932ca9bd72041ccd3b5501"
-SRC_URI[archive.sha256sum] = "a92f8cad0e21318be465719a9f30a50d5719b0b70bf8e15f3937e7850cf1aea6"
diff --git a/recipes/xorg-driver/xf86-video-trident_1.2.3.bb b/recipes/xorg-driver/xf86-video-trident_1.2.3.bb
deleted file mode 100644
index 3d5815e..0000000
--- a/recipes/xorg-driver/xf86-video-trident_1.2.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c0e8b2f54942b6902b7dd4f30defe800"
-SRC_URI[archive.sha256sum] = "d23eb8fa165d238ddf64da63dcd60c70a01cd761608a18402cfb95aed6722495"
diff --git a/recipes/xorg-driver/xf86-video-trident_1.2.4.bb b/recipes/xorg-driver/xf86-video-trident_1.2.4.bb
deleted file mode 100644
index 7871b1b..0000000
--- a/recipes/xorg-driver/xf86-video-trident_1.2.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.org X server -- Trident display driver"
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7f628f7eb4abdc4c49bb252eefc4335a"
-SRC_URI[archive.sha256sum] = "f942596e7427a089be9c9353c45c22002999580197c9715d9363d19ee170ba8d"
diff --git a/recipes/xorg-driver/xf86-video-trident_1.3.0.bb b/recipes/xorg-driver/xf86-video-trident_1.3.0.bb
deleted file mode 100644
index 729eddb..0000000
--- a/recipes/xorg-driver/xf86-video-trident_1.3.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.org X server -- Trident display driver"
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e89799579d0cf3858362bd751469e0bf"
-SRC_URI[archive.sha256sum] = "a4f66c9f46f6e93c2c1f10e782a211ddc338b0ff9f0a2ccd2d660db031d3ddb5"
diff --git a/recipes/xorg-driver/xf86-video-tseng_1.1.1.bb b/recipes/xorg-driver/xf86-video-tseng_1.1.1.bb
deleted file mode 100644
index 8f0cf7b..0000000
--- a/recipes/xorg-driver/xf86-video-tseng_1.1.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "488aa9c3ec7a95e6589afa4b50bec8b4"
-SRC_URI[archive.sha256sum] = "c9c1f3318715b7268068bc733d00bcab93924e97eb38f94548e442fd6cdfd56e"
diff --git a/recipes/xorg-driver/xf86-video-tseng_1.2.0.bb b/recipes/xorg-driver/xf86-video-tseng_1.2.0.bb
deleted file mode 100644
index 273b05e..0000000
--- a/recipes/xorg-driver/xf86-video-tseng_1.2.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f98fc22142a009dc3a6cdf930c95203f"
-SRC_URI[archive.sha256sum] = "1090d9100934329000ac330d0c66a0ac4f60d2ba83196ea15c2833a28a18b1e3"
diff --git a/recipes/xorg-driver/xf86-video-v4l_0.1.1.bb b/recipes/xorg-driver/xf86-video-v4l_0.1.1.bb
deleted file mode 100644
index 407735e..0000000
--- a/recipes/xorg-driver/xf86-video-v4l_0.1.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "Video 4 Linux adaptor driver for X11"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "69339c38eba2cebc357d67e7a755d734"
-SRC_URI[archive.sha256sum] = "33ad549ea3f6a8da7f58d9964f3f2d83aabc6d64c2ebc2ea0033ac8dacaec870"
diff --git a/recipes/xorg-driver/xf86-video-vesa_1.3.0.bb b/recipes/xorg-driver/xf86-video-vesa_1.3.0.bb
deleted file mode 100644
index 9b153e5..0000000
--- a/recipes/xorg-driver/xf86-video-vesa_1.3.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://fix-includepath.patch"
-SRC_URI[archive.md5sum] = "4a307852f3b4850e436a41dab2a73676"
-SRC_URI[archive.sha256sum] = "b96c80ae81f5123ecef344dac4c734b2e281143d3ab7a7e633d6bf04c893e203"
diff --git a/recipes/xorg-driver/xf86-video-vesa_2.0.0.bb b/recipes/xorg-driver/xf86-video-vesa_2.0.0.bb
deleted file mode 100644
index 983b31d..0000000
--- a/recipes/xorg-driver/xf86-video-vesa_2.0.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://fix-includepath.patch \
-            file://fix-configure-includes.patch"
-SRC_URI[archive.md5sum] = "433cf6f961eb4a2ab6fcb086def0b2b4"
-SRC_URI[archive.sha256sum] = "f20b2e429657552eea207fb8bc4b47c8e293d99c229dcb4da11b7c5bfdc1e165"
diff --git a/recipes/xorg-driver/xf86-video-vesa_2.2.0.bb b/recipes/xorg-driver/xf86-video-vesa_2.2.0.bb
deleted file mode 100644
index 81b5d2f..0000000
--- a/recipes/xorg-driver/xf86-video-vesa_2.2.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-RDEPENDS_${PN} += "xserver-xorg-module-libint10 "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://fix-includepath.patch \
-            file://fix-configure-includes.patch"
-SRC_URI[archive.md5sum] = "9a86b683f73f3806f55d05cd804a6f4a"
-SRC_URI[archive.sha256sum] = "8b3e077d2534722033d7b1c647aa7f31fc7fbb5014da096b7a53170005e80226"
diff --git a/recipes/xorg-driver/xf86-video-vmware_10.14.1.bb b/recipes/xorg-driver/xf86-video-vmware_10.14.1.bb
deleted file mode 100644
index 4e3e5f0..0000000
--- a/recipes/xorg-driver/xf86-video-vmware_10.14.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X11 driver for VMware SVGA Device"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "eaf1ce9fa23363799140602afaa10f37"
-SRC_URI[archive.sha256sum] = "1971fd356ba54204c3611edb9144c43c25c21167a5fa5ee725d3f2e3f9864fa9"
diff --git a/recipes/xorg-driver/xf86-video-vmware_10.15.2.bb b/recipes/xorg-driver/xf86-video-vmware_10.15.2.bb
deleted file mode 100644
index 0b787d3..0000000
--- a/recipes/xorg-driver/xf86-video-vmware_10.15.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "99322cbcc9081ad44e9cba63e3df8f7e"
-SRC_URI[archive.sha256sum] = "edae155c82d348b76dabe1373605bf6715b577cdd7a95f8b54ad534dc47c71ff"
diff --git a/recipes/xorg-driver/xf86-video-vmware_10.16.1.bb b/recipes/xorg-driver/xf86-video-vmware_10.16.1.bb
deleted file mode 100644
index fbf9826..0000000
--- a/recipes/xorg-driver/xf86-video-vmware_10.16.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a5e1f2539b82206e411c3647f10c425f"
-SRC_URI[archive.sha256sum] = "91ed99ae936be5df25d310d81e31e0a7efefc023e462d93a9289ac18ebdf4e89"
diff --git a/recipes/xorg-driver/xf86-video-vmware_10.16.5.bb b/recipes/xorg-driver/xf86-video-vmware_10.16.5.bb
deleted file mode 100644
index e0e0368..0000000
--- a/recipes/xorg-driver/xf86-video-vmware_10.16.5.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6d78c82ea7c2bb0fcb587d7bb4e8f60a"
-SRC_URI[archive.sha256sum] = "3e4e9abfd806b36076083ef6cacc93b713bfa4ddefe7005edfc15c64f5174366"
diff --git a/recipes/xorg-driver/xf86-video-vmware_10.16.9.bb b/recipes/xorg-driver/xf86-video-vmware_10.16.9.bb
deleted file mode 100644
index d55c68b..0000000
--- a/recipes/xorg-driver/xf86-video-vmware_10.16.9.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3b3d38abfa1f8be4b1e26dcd236bc94f"
-SRC_URI[archive.sha256sum] = "835a5e45b54837cbbd963a48bd09db709717e097e931dd76e68e397a167e8bc1"
diff --git a/recipes/xorg-driver/xf86-video-vmware_11.0.0.bb b/recipes/xorg-driver/xf86-video-vmware_11.0.0.bb
deleted file mode 100644
index fd5dbf8..0000000
--- a/recipes/xorg-driver/xf86-video-vmware_11.0.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2895deafa373b0f87b8a7feaf0ca2373"
-SRC_URI[archive.sha256sum] = "bb538ebb9f000767bcc389562c8deb4cda74aa3e608190f6c3ee1e93d394fb2d"
diff --git a/recipes/xorg-driver/xf86-video-vmware_11.0.1.bb b/recipes/xorg-driver/xf86-video-vmware_11.0.1.bb
deleted file mode 100644
index 0caf4aa..0000000
--- a/recipes/xorg-driver/xf86-video-vmware_11.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "52e9a12843c6469f976db57a7b5f78d2"
-SRC_URI[archive.sha256sum] = "a6371d5acb81ba4457f7ee2c7432941c38f9033ce5278551c6acc9a0827ce7be"
diff --git a/recipes/xorg-driver/xf86-video-voodoo_1.1.1.bb b/recipes/xorg-driver/xf86-video-voodoo_1.1.1.bb
deleted file mode 100644
index 5e671f4..0000000
--- a/recipes/xorg-driver/xf86-video-voodoo_1.1.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X11 driver for Voodoo/Voodoo2"
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "bc878e795688b49a595b355482d27174"
-SRC_URI[archive.sha256sum] = "3975601baee674b2bad0dfe696586f17cc913f1dc7f1d5c4e184623e0461751c"
diff --git a/recipes/xorg-driver/xf86-video-voodoo_1.2.0.bb b/recipes/xorg-driver/xf86-video-voodoo_1.2.0.bb
deleted file mode 100644
index 720e2d2..0000000
--- a/recipes/xorg-driver/xf86-video-voodoo_1.2.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X11 driver for Voodoo/Voodoo2"
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7c681d9b57f5e1f798263fc1a9d99245"
-SRC_URI[archive.sha256sum] = "b79ba6d5d4300570c00f8be37c536f47f2d78c18845f70f525da2a29e47c4b8c"
diff --git a/recipes/xorg-driver/xf86-video-wsfb_0.2.1.bb b/recipes/xorg-driver/xf86-video-wsfb_0.2.1.bb
deleted file mode 100644
index 0e11e2d..0000000
--- a/recipes/xorg-driver/xf86-video-wsfb_0.2.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- wsfb display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c159af867a9af3abc4da332189213a76"
-SRC_URI[archive.sha256sum] = "39e358aa17d939f561a28c82b9e7beca202d7ebd7d40d401c88a9dff3d90d148"
diff --git a/recipes/xorg-driver/xf86-video-xgi_1.5.0.bb b/recipes/xorg-driver/xf86-video-xgi_1.5.0.bb
deleted file mode 100644
index 84c4f05..0000000
--- a/recipes/xorg-driver/xf86-video-xgi_1.5.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "08529fd015191be9244f598aa0894aa6"
-SRC_URI[archive.sha256sum] = "5fb23432ee8940c04494744da8b5f58bebc6ef113e96a50a74f0aa7d98a69194"
diff --git a/recipes/xorg-driver/xf86-video-xgixp_1.7.99.3.bb b/recipes/xorg-driver/xf86-video-xgixp_1.7.99.3.bb
deleted file mode 100644
index fd15b7f..0000000
--- a/recipes/xorg-driver/xf86-video-xgixp_1.7.99.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c541152aee693fad743ef7cbf75a7ffc"
-SRC_URI[archive.sha256sum] = "13a1658ee3ead0ab8e8bf7a9c8f8f0e3e40e38138f45d8431e735cd7184fbbd8"
-- 
1.7.2




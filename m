Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OiTTX-0001Vu-OS
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 16:37:16 +0200
Received: by fxm6 with SMTP id 6so39543fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 07:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=rkZwlu57XqiCvWvxdnadOdzSv3SzsayzqwRl5FvXwLY=;
	b=LcyRL6y+tFgXF9+9roU8o+WpgGehuNk9Gql495bUrmtPm/k3gmyY63JU9zYl/BTGGx
	sMi3dTmsvyYEyi/dZ2tnT5k+phe62SPDQfI8xnbkF9w1nW0tYB5OGkj2ibJLhbTSaSJN
	w7JsZPSfi+DlQehPgVq8afIC4NfU/hIIj/1IA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=odfxnTG6xkmpENDY+av59ocAuOa+3sqfQ7xLbin/lUS15xm3rI9qHUExb3C9AZzHYx
	7/+PETWAKaMGqLh+nlb1vpklvTGOJo3pIPqvtnnHfVxXCtWWXjWYWtnar3Yi/D94IRJv
	vh4lPnGk0X242d5QsSgKng2KRqprPTLloLG00=
Received: by 10.223.105.76 with SMTP id s12mr5030362fao.107.1281364571385;
	Mon, 09 Aug 2010 07:36:11 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 8sm312068fav.38.2010.08.09.07.36.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 09 Aug 2010 07:36:08 -0700 (PDT)
Date: Mon, 9 Aug 2010 16:36:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100809143611.GA4396@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: PACKAGE_ARCH_pn-${PN} should work?
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
X-List-Received-Date: Mon, 09 Aug 2010 14:37:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

or did it worked before?

Today I noticed it keeps PACKAGE_ARCH = "all" in task-x11-server
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=bf3cf7b95cb10c830c39ca4bfec4e7fcc19dad83

It's used in few more places (mostly OM/SHR which can be my fault from merging shr/import):

conf/distro/openmoko.conf:PACKAGE_ARCH_pn-usb-gadget-mode_om-gta01 = "armv4t"
conf/distro/openmoko.conf:PACKAGE_ARCH_pn-usb-gadget-mode_om-gta02 = "armv4t"
conf/distro/openmoko.conf:PACKAGE_ARCH_pn-keymaps_om-gta01 = "armv4t"
conf/distro/openmoko.conf:PACKAGE_ARCH_pn-keymaps_om-gta02 = "armv4t"
conf/distro/openmoko.conf:PACKAGE_ARCH_pn-neod_om-gta01 = "armv4t"
conf/distro/openmoko.conf:PACKAGE_ARCH_pn-neod_om-gta02 = "armv4t"
conf/distro/shr.conf:PACKAGE_ARCH_pn-usb-gadget-mode_om-gta01 = "armv4t"
conf/distro/shr.conf:PACKAGE_ARCH_pn-usb-gadget-mode_om-gta02 = "armv4t"
conf/distro/shr.conf:PACKAGE_ARCH_pn-keymaps_om-gta01 = "armv4t"
conf/distro/shr.conf:PACKAGE_ARCH_pn-keymaps_om-gta02 = "armv4t"
conf/distro/shr.conf:PACKAGE_ARCH_pn-neod_om-gta01 = "armv4t"
conf/distro/shr.conf:PACKAGE_ARCH_pn-neod_om-gta02 = "armv4t"
recipes/fbreader/fbreader_0.8.2a.bb:PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
recipes/freesmartphone/frameworkd_git.bb:PACKAGE_ARCH_pn-${PN}-config = "${MACHINE_ARCH}"
recipes/miniinit/miniinit.bb:PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
recipes/mipl-mipv6/mipv6_1.1-v2.4.26.bb:PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
recipes/mipl-mipv6/mipv6_2.0.2.bb:PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
recipes/obsolete/shr/alsa-scenarii-shr_git.bb:PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
recipes/openmoko2/openmoko-alsa-scenarios_svn.bb:PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
recipes/shadow/shadow.inc:PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
recipes/shr/frameworkd-config-shr_git.bb:PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"
recipes/sysvinit/sysvinit_2.86.bb:PACKAGE_ARCH_pn-${PN}-inittab = "${MACHINE_ARCH}"
recipes/usb-gadget-mode/usb-gadget-mode.bb:PACKAGE_ARCH_pn-${PN} = "${MACHINE_ARCH}"

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



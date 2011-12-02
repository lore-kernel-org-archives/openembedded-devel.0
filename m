Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chris.watkins88@gmail.com>) id 1RWJ4q-0005Pn-IT
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 03:42:16 +0100
Received: by vcbfo13 with SMTP id fo13so2058742vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 18:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=R+QvDgGq02TUUFmvsTWiLKpo5AdamZfZOczWm0x/Z48=;
	b=Ti9jSGFbIaRCDrq776zvhTVGDoSG3hmA8GMVHwXDxDjzHzS2KIcOd439uSwAlG2elq
	ouYbZYCtM4Wf2C+oOnaOsObM3h1RbjWMfInzft1YVtiwOlmHeR66MD2X2Sob7zSIVQeM
	k0FCm3a49OixSKT6ykNVXQvQKOn0H1j2IClzA=
Received: by 10.220.107.5 with SMTP id z5mr1630246vco.159.1322793333403; Thu,
	01 Dec 2011 18:35:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.52.107.33 with HTTP; Thu, 1 Dec 2011 18:35:12 -0800 (PST)
From: Chris Watkins <chris.watkins88@gmail.com>
Date: Fri, 2 Dec 2011 13:35:12 +1100
Message-ID: <CAESPx36Joi7Hzo5KdvNcy6QZDJ+YGXimbjzbbctZogLU_jkRyw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Help building console-image
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
X-List-Received-Date: Fri, 02 Dec 2011 02:42:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I've installed openembedded and managed to build 'task-base' for a mini2440
board (Though I'm not sure exactly what this). Now I'm trying to build
console-image to test on the device using the angstrom-2010.x distro but
I'm getting error messages that I can't figure out how to get around. The
full log file is here http://pastebin.com/raw.php?i=dtkErM5a , and
the error below. I'd appreciate any suggestions on how to fix this or where
to look for problems as I'm new to building embedded systems.

Cheers,

Chris

Error messages:

  satisfy_dependencies_for: Cannot satisfy the following dependencies for
task-base:

 * 	base-passwd * 	busybox * 	modutils-initscripts * 	netbase * 	opkg
* 	util-linux-ng-mount * 	util-linux-ng-umount *
	module-init-tools-depmod * 	dropbear * 	sysfsutils *
	module-init-tools * 	alsa-utils-alsactl * 	alsa-utils-alsamixer *
	usbutils * 	portmap * 	ppp * 	ppp *
 * opkg_install_cmd: Cannot install package task-base.
 * opkg_install_cmd: Cannot install package psplash-angstrom.
 * opkg_install_cmd: Cannot install package psplash-zap.
 * satisfy_dependencies_for: Cannot satisfy the following dependencies
for task-base-extended:
 * 	wireless-tools * 	wpa-supplicant * 	blueprobe * 	bluez4 *
 * opkg_install_cmd: Cannot install package task-base-extended.
 * opkg_install_cmd: Cannot install package initscripts.
 * opkg_install_cmd: Cannot install package udev.
 * opkg_install_cmd: Cannot install package sysvinit.
 * opkg_install_cmd: Cannot install package sysvinit-pidof.
 * opkg_install_cmd: Cannot install package tinylogin.
 * opkg_install_cmd: Cannot install package opkg.


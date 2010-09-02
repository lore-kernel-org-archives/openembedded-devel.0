Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Or4jF-0004Eq-DP
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 10:01:14 +0200
Received: by ewy7 with SMTP id 7so60596ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=vIhE4XZXKXpo49fAr9J/L3pI9yl1ap1YVEmst6VANEc=;
	b=tlCPyMbmS5/cHwHkqlkqCToXeG78Nsuyljnb5NLL6u0vyZU/stPAuwg8MKchKmogt4
	6GV2zpyCDMkxXHPu02LTTP49rHjBLUqKLOdeGwTkY4W9c2+brNl0RAHziODpat8H2cOc
	hKl7c6ZG70gr268KnIko9U+UgIBv08+vXvjns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=qWWYND6qll7s5RtAHDtbvpGuJkp3uYCvW1xEnXFTl5kyoyiw08XpiBBX/qOrM2Tbgu
	gI7y5TRmc92FmoWiRRjOd3qA4FFr7ofduLUNW4mXDQ9uvT7GgTmPTQL9u3zJ4QcZmmQn
	zcx20gO8I07TIpjms0vNI+wIA/YRL/aqJGmP0=
MIME-Version: 1.0
Received: by 10.216.159.195 with SMTP id s45mr8952812wek.43.1283414428082;
	Thu, 02 Sep 2010 01:00:28 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Thu, 2 Sep 2010 01:00:28 -0700 (PDT)
Date: Thu, 2 Sep 2010 01:00:28 -0700
Message-ID: <AANLkTimJ47S_5NRyubHegYQ4S_xYK6aiBu_TkvNrtqCt@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>, 
	openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Can someone help me understand these errors I got in my build
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
X-List-Received-Date: Thu, 02 Sep 2010 08:01:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

When it was going through the final stages in my build I ended up with
some conflict errors and not sure if I understand how to fix this
properly. Do I just remove what its says is why it cant install one
file because another is trying to install the same file ? Or? But I
dont think I am understanding these correctly as I have never gotten
them before. I would really appreciate any help on this one so I can
get my image packaged now that everything is built. Also I can post my
image I am trying to build if that helps its a very bloated desktop
image, here is the error:

also I tried to clean it by doing bitbake -c clean and then bitbake
myimage but still same result.

| Collected errors:
|  * check_data_file_clashes: Package kernel-firmware-down3 wants to
install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/lib/firmware/edgeport/down3.bin
| 	But that file is already provided by package  * linux-firmware
|  * opkg_install_cmd: Cannot install package task-base-extended.
|  * check_data_file_clashes: Package rt73-firmware wants to install
file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/lib/firmware/rt73.bin
| 	But that file is already provided by package  * linux-firmware
|  * opkg_install_cmd: Cannot install package rt73-firmware.
|  * opkg_install_cmd: Cannot install package libnet.
|  * check_data_file_clashes: Package glproto-dev wants to install
file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/include/GL/internal/glcore.h
| 	But that file is already provided by package  * libgl-dev
|  * opkg_install_cmd: Cannot install package artoolkit-dev.
|  * satisfy_dependencies_for: Cannot satisfy the following
dependencies for task-sdk-native:
|  * 	libdbd-sqlite-perl * 	libdbix-simple-perl *
|  * opkg_install_cmd: Cannot install package task-native-sdk.
|  * check_data_file_clashes: Package python-zopeinterface wants to
install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/lib/python2.6/site-packages/setuptools.pth
| 	But that file is already provided by package  * python-setuptools
|  * check_data_file_clashes: Package python-zopeinterface wants to
install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/lib/python2.6/site-packages/site.pyo
| 	But that file is already provided by package  * python-setuptools
|  * check_data_file_clashes: Package python-zopeinterface wants to
install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/lib/python2.6/site-packages/site.py
| 	But that file is already provided by package  * python-setuptools
|  * check_data_file_clashes: Package python-zopeinterface wants to
install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/bin/easy_install-2.6
| 	But that file is already provided by package  * python-setuptools
|  * check_data_file_clashes: Package python-zopeinterface wants to
install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/bin/easy_install
| 	But that file is already provided by package  * python-setuptools
|  * opkg_install_cmd: Cannot install package python-twisted.
|  * opkg_install_cmd: Cannot install package gst-plugin-video4linux2.
|  * resolve_conffiles: Existing conffile
/home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/etc/device_table is
different from the conffile in the new package. The new conffile will
be placed at /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/etc/device_table-opkg.
|  * check_data_file_clashes: Package gpe-theme-clearlooks wants to
install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/share/themes/Clearlooks/gtk-2.0/gtkrc
| 	But that file is already provided by package  * gtk-theme-clearlooks
|  * opkg_install_cmd: Cannot install package gpe-session-scripts.
NOTE: Task failed:
/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/UAV-Dimage-1.0-r0/temp/log.do_rootfs.4216
NOTE: oestats: task failed, see
http://tinderbox.openembedded.net/public/logs/task/7541484.txt
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/user.collection/recipes/images/UAV-Dimage.bb
do_rootfs failed
ERROR: Task 11 (/home/vdubhack/overo-oe/user.collection/recipes/images/UAV-Dimage.bb,
do_rootfs) failed
NOTE: Tasks Summary: Attempted 11557 tasks of which 11540 didn't need
to be rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/user.collection/recipes/images/UAV-Dimage.bb'
failed
NOTE: oestats: build failed, see http://tinderbox.openembedded.net/builds/85611/


Thanks as always !



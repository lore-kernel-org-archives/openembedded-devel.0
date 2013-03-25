Received: from mailrelay.tu-graz.ac.at ([129.27.2.202]
	helo=mailrelay.tugraz.at) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gregor.rudorfer@student.tugraz.at>)
	id 1UKC6o-00010e-EX for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 19:28:09 +0100
Received: from [10.0.0.11] (178-190-147-20.adsl.highway.telekom.at
	[178.190.147.20]) (authenticated bits=0)
	by mailrelay2.tugraz.at (8.14.4/8.14.4) with ESMTP id r2PHhiG0024793
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 18:43:45 +0100 (CET)
X-DKIM: Sendmail DKIM Filter v2.8.3 mailrelay2.tugraz.at r2PHhiG0024793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tugraz.at;
	s=mailrelay; t=1364233427; i=@student.tugraz.at;
	bh=Uy5QDDD2ZQ0AYJKPtwqlwWG+oO2TtZupw8D20L70grw=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type;
	b=MmvlSHuoLfekNXAGLz58wGAlrDMSlujadl8wd8TCjJMtQkQZUz2U7ksk+U6oO+3r9
	ikXkBW2erGgwoKq48OBmufwjSS8E82R2RPxkeinJ7tWO7UUttjoAz0IJs0sz/mDfOT
	5iH21F5f4vlCrl9USATqhNS8TyrG0jkghaWvz+TQ=
Message-ID: <51508CD0.8080702@student.tugraz.at>
Date: Mon, 25 Mar 2013 18:43:44 +0100
From: Gregor Rudorfer <gregor.rudorfer@student.tugraz.at>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-TUG-Backscatter-control: bt4lQm5Tva3SBgCuw0EnZw
X-Spam-Scanner: SpamAssassin 3.003000 
X-Spam-Score-relay: 0.4
X-Scanned-By: MIMEDefang 2.70 on 129.27.10.19
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: package gobject-introspection-native-0.9.10-r0: task do_compile: Failed
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
X-List-Received-Date: Mon, 25 Mar 2013 18:28:25 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi

I have a problem building Angstrom based packages:

I've tried building:

beagleboard-demo-image
angstrom-gnome-image
angstrom-gnome-image-big
angstrom-x-image

all failed at multiple packages. I used bitbake -k so all packages which 
can be built were built, regardless
if errors occurred.

F.e. the beagleboard-demo-image had the following errors

ERROR: 
'/home/elinux/OE/openembedded/recipes/matchbox-wm/matchbox-wm_1.2.bb' failed
ERROR: '/home/elinux/OE/openembedded/recipes/jaaa/clthreads_2.4.0.bb' failed
ERROR: 
'virtual:native:/home/elinux/OE/openembedded/recipes/gobject-introspection/gobject-introspection_0.9.10.bb' 
failed
ERROR: 
'/home/elinux/OE/openembedded/recipes/gnome/gnome-menus_2.30.5.bb' failed
ERROR: 
'/home/elinux/OE/openembedded/recipes/pulseaudio/libatomics-ops_7.3+git20111031.bb' 
failed
ERROR: '/home/elinux/OE/openembedded/recipes/bluez/obexd_0.34.bb' failed
ERROR: '/home/elinux/OE/openembedded/recipes/libnet/libnet_1.1.2.1.bb' 
failed
ERROR: '/home/elinux/OE/openembedded/recipes/fftw/fftwf_3.3.1.bb' failed
ERROR: '/home/elinux/OE/openembedded/recipes/jaaa/clalsadrv_1.2.2.bb' failed
ERROR: '/home/elinux/OE/openembedded/recipes/jaaa/clxclient_3.6.1.bb' failed
ERROR: 
'/home/elinux/OE/openembedded/recipes/mime-support/mime-support_3.44.bb' 
failed
ERROR: 
'/home/elinux/OE/openembedded/recipes/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb' 
failed
ERROR: 
'/home/elinux/OE/openembedded/recipes/debianutils/debianutils_2.30.bb' 
failed
ERROR: 
'/home/elinux/OE/openembedded/recipes/rt2x00/rt73-firmware_1.8.bb' failed
ERROR: '/home/elinux/OE/openembedded/recipes/jaaa/jaaa_0.4.2.bb' failed
ERROR: '/home/elinux/OE/openembedded/recipes/gs/gs_9.01.bb' failed
ERROR: '/home/elinux/OE/openembedded/recipes/mozilla/firefox_3.6.8.bb' 
failed

I was able to solve most of these errors, because most of them were only 
missing links i.e. the SRC_URI links in the .bb files
weren't correct.

At the end I was left with those errors, which seem not to be a easy fix.

ERROR: 
'virtual:native:/home/elinux/OE/openembedded/recipes/gobject-introspection/gobject-introspection_0.9.10.bb' 
failed
ERROR: 
'/home/elinux/OE/openembedded/recipes/pulseaudio/libatomics-ops_7.3+git20111031.bb' 
failed
ERROR: '/home/elinux/OE/openembedded/recipes/fftw/fftwf_3.3.1.bb' failed
ERROR: 
'/home/elinux/OE/openembedded/recipes/gnome/gnome-menus_2.30.5.bb' failed
ERROR: '/home/elinux/OE/openembedded/recipes/gs/gs_9.01.bb' failed
ERROR: '/home/elinux/OE/openembedded/recipes/mozilla/firefox_3.6.8.bb' 
failed


Especially the failure of gobject-introspection_0.9.10.bb gives me 
headaches.

I'm searching google for a solution for over 4 hours now. I've tried out 
different solutions but all didn't work.

I'm using Ubuntu 12.04 LTS

My build configuration is as follows:

BB_VERSION        = "1.12.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "fd43377"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "adb4000"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2013.03"
TARGET_FPU        = "soft"

As you can see my machine is a adb4000. Although it's fully supported by 
OE, the Angstrom online
buildtool (Narcissus) [1] obviously doesn't support it. So I can't use a 
image from the Narcissus online builder.
I've successfully ran the opie-image on this board  without any problems.

| 
/home/elinux/OE/build/tmp/work/i686-linux/gobject-introspection-native-0.9.10-r0/gobject-introspection-0.9.10/tools/.libs/lt-g-ir-compiler: 
symbol lookup error: /usr/lib/libgirepository-1.0.so.1: undefined 
symbol: g_mutex_lock
| make[2]: *** [cairo-1.0.typelib] Error 127
| make[2]: Leaving directory 
`/home/elinux/OE/build/tmp/work/i686-linux/gobject-introspection-native-0.9.10-r0/gobject-introspection-0.9.10/gir'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory 
`/home/elinux/OE/build/tmp/work/i686-linux/gobject-introspection-native-0.9.10-r0/gobject-introspection-0.9.10'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'


My second question is:

Is there a central configuration file somewhere, which tells bitbake 
what recipes it has to compile into an
image? Because I'm thinking of removing those packages, which aren't 
absolutely necessary, so that
I can get a working image in the shortest time as possible. F.e. I don't 
need firefox, ghostscript, the
fast fourier transform package (fftwf) and pulseaudio.
Is there a possibility to do so?

--------------------------------------------------------------------
[1]    http://narcissus.angstrom-distribution.org/



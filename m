Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id B0C176E6FC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 21:11:04 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id jz11so1595083veb.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 14:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=5jW2U6pE1T2qG+i8cUcTy7rZgoibeaedtmYyJAquz2U=;
	b=rwEI9byRP0x9zxF1TDRAD5q90bSacQ3q6eGWpSW5jVSjH0tL5VrllFOdM6yLsPYUjZ
	ne7ZHcMcnSlRa5sGPYF9oCJmDU2/IzCicjMwXpsAT2IAfzWoATEKR41mFeusxckTxx+m
	MWdjTXHALQMU1d4fuSJtrenmgUku7JmIjtWCx4nCBYp51nulvLrOgc8Mzt87W6CeJSL+
	FFz6goUla8Demb5Fak9hdjS6QH4Ak15/88brQ7svbi1IwE/URRXVVxtFKVeOJUmVFgEs
	hrLt5JaRwILkX2pn9/s8hbjCw4q+1x33eSh8e6ClhmZjKaMtccZ+Zdi19ALSDKBAH1n2
	iwyA==
MIME-Version: 1.0
X-Received: by 10.220.247.68 with SMTP id mb4mr5056674vcb.37.1395349865014;
	Thu, 20 Mar 2014 14:11:05 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Thu, 20 Mar 2014 14:11:04 -0700 (PDT)
Date: Thu, 20 Mar 2014 14:11:04 -0700
Message-ID: <CAFeBWL4=C3dWdGNX2UgGUJGu1EGdpodocwJ5hbJLDWowa-OePw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: libxfce4ui build fail on master branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Mar 2014 21:11:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello everyone, I am building my dora bsp layers with OE/poky master to
prepare for 1.6 release.
My console image built just fine, but I am getting this error while
building xfce image.

NOTE: Executing intltoolize --copy --force --automake

NOTE: Executing ACLOCAL="aclocal
--system-acdir=/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-copy/"
autoreconf --verbose --install --force --exclude=autopoint

autoreconf: Entering directory `.'

autoreconf: configure.ac: not using Gettext

autoreconf: running: aclocal
--system-acdir=/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-copy/
--force

aclocal: error: couldn't open directory
'/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-copy/':
No such file or directory

autoreconf: aclocal failed with exit status: 1

ERROR: autoreconf execution failed.

WARNING: exit code 1 from a shell command.

ERROR: Function failed: do_configure (log file is located at
/media/Build/Post-Dora/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/temp/log.do_configure.2388)


This
<https://github.com/gumstix/Gumstix-YoctoProject-Repo/blob/dev/default.xml>is
my manifest just in case.

Thank you for your help!

Adam


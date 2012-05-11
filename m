Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SSnUA-0001oJ-F2
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2012 12:54:10 +0200
Received: by yhjj56 with SMTP id j56so2602417yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2012 03:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Wi0sbFGPgTU2c4WnBrC5mNwQqPS42vqeZCnzm/7ounw=;
	b=SOA9mRwZz6FktvIsq4JUm5QfHg0Rwf1zWC/S4Y3gSWJgOe65OndovqMI0p3CDdj8zU
	tLiXkvQZ+Gz7YGmtDZicUvSH4Taw+nETrffhlbxc5pSj9lha0zbpP+kWkGQ87uGBPzrW
	mwuvTdhWr/sE0lhfs50YmbDtqKN766bTHh8+E5eeXdQdx97HQNBLQITyuiEkWQPLjSgv
	0ukV3Z6J0D+RU6L8Wtirp2zoCQ7+xBbhN171X1+i3gpKpnw0cjJz9N4oAkEV8bPFYR7Q
	/XryYp6LwxfHAjt/Y3DkMUnFVQT8TFj1giR2kv3yB3EGB773iGsElJL3c+yrVAONp3jm
	jgew==
MIME-Version: 1.0
Received: by 10.50.158.134 with SMTP id wu6mr1332944igb.47.1336733054656; Fri,
	11 May 2012 03:44:14 -0700 (PDT)
Received: by 10.231.209.139 with HTTP; Fri, 11 May 2012 03:44:14 -0700 (PDT)
Date: Fri, 11 May 2012 12:44:14 +0200
Message-ID: <CAGiJk9coc2zTnkX0CoM+cM52CDMwvpSwUN4DjjYoyrHnn5jD7Q@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-kde] Status of the meta-kde layer
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
X-List-Received-Date: Fri, 11 May 2012 10:54:10 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

it has been some time since this all started, in the case you haven't
heard of this layer yet I wrote an introduction.


Introduction:
This layer provides recipes for KDE 4 and plasma active.
Plasma Active is the "next generation" GUI - optimized for touch
screen input methods (see http://plasma-active.org/).

This layer also provides Plasma Desktop (although it is not exactly
suited for embedded devices).
It is no longer necessary to install kdelibs-dev or something like
that, currently it just lacks one tool for non KDE hosts and that is
work in progress.

The layer can be found here:
https://gitorious.org/openembedded-core-layers/meta-kde



To provide some visual content, here are some screenshots of KDE
Plasma Desktop cross compiled with OE:

Gumstix Overo KDE 4.8.2
https://docs.google.com/open?id=0Bx-m3uk1yDB-bkVXZk1EUUk2Y00
Gumstix Overo KDE 4.8.2 - konqueror
https://docs.google.com/open?id=0Bx-m3uk1yDB-VDZjc0hXU1lna00
Gumstix Overo KDE 4.8.2 - plasma netbook
https://docs.google.com/open?id=0Bx-m3uk1yDB-YWRuc09qZkR5RG8
Gumstix Overo KDE 4.8.2 - alt+tab graphic performance
https://docs.google.com/open?id=0Bx-m3uk1yDB-cWZjbGx0OEx5ZzQ

The device is a Gumstix Overo Water running the Angstrom distribution.
The window manager kwin_gles works good with the SGX 530 / OpenGL ES
hardware acceleration.

Overall this could be considered "usable", but the time it takes to
start Plasma Desktop seems to be a bit too long for a coffee break.

Maybe I can provide a video in the future, but it doesn't look any
different from the usual KDE stuff (except that it is slower).
Koen Kooi made a video of the Plasma Active system-settings running on
a beagleboard, you can find it here:
http://www.youtube.com/watch?v=LtevobU3A1g



Current issues:
soprano-native
- The onto2vocabulary application is needed in a native flavor.
- This is necessary to build this layer, if the build machine itself
does not have soprano installed

plasma-active / kde-runtime
- Plasma active needs the appletscript declarative scriptengine to work.
- Currently the related library does not work properly.

okular / kconfig_compiler
- This issue blocks all builds of the KDE office suite Calligra, which
has wonderful alternatives to well known office / paint programs (e.g.
Krita)

There are other issues but these have the highest impact.



Testing meta-kde:
Currently it won't work until you can provide soprano-native from your
host or elsewhere.
After this issue is resolved it will be easy to archive on
OpenEmbedded if you use the branch sst-test-images:
https://gitorious.org/openembedded-core-layers/meta-kde/trees/sst-test-images/recipes-images
*just talking to myself* Maybe it would be a good idea to have a git
subtree providing the images, so parsing won't fail over
"systemd-image.bb not found" on Poky?



Yocto Project Poky and meta-kde:
A few off-list mails indicate that there is quite some interest in
running Plasma Active on top of the Poky stack.
It is planned to support Poky, and chances are good that after
soprano-native is finished, KDE can be build with Poky.


-- 
Regards
Samuel



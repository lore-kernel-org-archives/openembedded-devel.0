Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UNToa-0005Cv-4X
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 21:57:48 +0200
Received: by mail-oa0-f43.google.com with SMTP id l10so1942462oag.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 12:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=8S//wTFplIBVAOCqdr+qvj2Vytwwfi6UJVhAS7oqIgw=;
	b=UgraRt6aJIYTzqB5QUdlj6yV8aYJovalu+Iq5hdFdvvdkS//IWOQaQYi0LYcc2XUpX
	EZyK2vE2OdUr/eTR0rLv/4FkjP/awaOKN3J+xdQ/+iD4evFnTrs5mqjTpNL8UBoXdEUV
	ZRWmh2D+fMjj+3K1I4HDfOzJCyiJAuxTifb9xtvzZ5iY92GJSQsus3Rk8Fb9NcR/9u5a
	B5LyNucFC2m91cFnJNlXRg/+45XHCdpEnhRS5sAbJv94jjauin1BL6pTRQhEmw0UzcdU
	tvdEFbHxppWmfOYgtezKuShypNbq6wdZSmBeL0kD2sC0tP2VnGOKT3kp4Mz2L0KjlILn
	U3fw==
MIME-Version: 1.0
X-Received: by 10.182.97.5 with SMTP id dw5mr1951376obb.91.1365018035930; Wed,
	03 Apr 2013 12:40:35 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.76.154.4 with HTTP; Wed, 3 Apr 2013 12:40:35 -0700 (PDT)
Date: Wed, 3 Apr 2013 20:40:35 +0100
X-Google-Sender-Auth: hCA3qkOLA-PaxZTHLmofICyzcRk
Message-ID: <CANyK_8daYNnSHhWELZD7ms7dgXkWwN8FCFAT8OsYZN+yLgvGsQ@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe] VLC 1.1.11 build failure
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
X-List-Received-Date: Wed, 03 Apr 2013 19:57:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm building with MACHINE=raspberrypi and the meta-raspberrypi layer
included (from http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/).

I'm getting an error in do_package for vlc. It seems that paths with a
double forward-slash are ending up in the binaries and this is
confusing the debugedit program invoked in the function
split_and_strip_files - the error message from debugedit written to
the log file is "canonicalization unexpectedly shrank by one
character". A bit of googling says debugedit attempted to replace the
double forward-slash with a single forward-slash but can't handle the
case when the length of a path is reduced by exactly one character.
These paths are coming in when the include paths for qt4 are added to
the cxxflags variable in the file vlc-config. On my system paths like
".../tmp-eglibc/sysroots/raspberrypi/usr//include/qt4/QtCore" are
being added. I can't find where this double forward-slash is
originating from, grep isn't showing me any other files with double
forward-slashes or with a path ending 'usr/' (which may cause a
problem when joined to a path beginning '/include')

I've managed to prevent this error by adding a line to the
do_configure() function in vlc.inc which removes these double
forward-slashes. I can send a patch in for this but I'm not sure if it
is the best fix. I think it would be better to find the original
source for these bad paths but I'm a bit stuck on where to look. The
file vlc-config is generated from vlc-config.in when configure is ran
I've grepped through everything and not found similar paths in any
other files.

Any advice or shall I send in the patch I have?

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk



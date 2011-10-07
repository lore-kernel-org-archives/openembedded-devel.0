Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1RCCgD-0008Uh-6g
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 17:49:45 +0200
Received: by gyg8 with SMTP id 8so3850884gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2011 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=0TuiSy6geg5Mz7QYKVwjvnlWNh74y+pINYY+KjwxJPo=;
	b=fE3otfl2Yb/gyaCpzv6057hX/oabErErdFLEv+qYJODqt4Vy1a5tX4n3OJN4eHEEdp
	cFQg5WZ0YCpu6bJo7QpXjgEU7yal4TOMMcKLB0vUOKJ8WBH/Lp4Nbc9wSOL3Lj/Q55uQ
	MyqiisDZhVWBmszqlugAieJxUtEVqXSYa+7js=
MIME-Version: 1.0
Received: by 10.236.77.233 with SMTP id d69mr10681305yhe.84.1318002247482;
	Fri, 07 Oct 2011 08:44:07 -0700 (PDT)
Received: by 10.236.209.97 with HTTP; Fri, 7 Oct 2011 08:44:07 -0700 (PDT)
Date: Fri, 7 Oct 2011 11:44:07 -0400
Message-ID: <CAOd_LFzBDzxOVnXmkap7dtvwSsozOAVR3HZ6qXSU81gqzxiJWA@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: ijs recipe questions
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
X-List-Received-Date: Fri, 07 Oct 2011 15:49:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I'm trying to port the ijs recipe from oe to meta-oe.  This is what I
have so far:

DESCRIPTION = "Inkjet driver from linuxprinting.org"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://README;md5=6f2f06909c6fd797a9521cd23168ecd0"
HOMEPAGE = "http://www.linuxprinting.org/ijs/"

SRC_URI = "http://www.linuxprinting.org/ijs/download/ijs-${PV}.tar.bz2"

inherit autotools pkgconfig

INSANE_SKIP_${PN} = "dev-so"

EXTRA_OECONF = " --enable-shared "

SRC_URI[md5sum] = "896fdcb7a01c586ba6eb81398ea3f6e9"
SRC_URI[sha256sum] =
"11a5f5084488c480f3ff5a24d64d7147bb64272bf60a0ba51330a56c5b50cab9"

PACKAGES =+ "ijs-bin"
FILES_ijs-bin = "${bindir}/*"
FILES_${PN} += "${libdir}/*.so"

However, it does not seem like I should need the following lines:
INSANE_SKIP_${PN} = "dev-so"  (otherwise, complains about symlinks in
not dev/dgb, etc package)
FILES_${PN} += "${libdir}/*.so"  (otherwise it puts the so files in
the dev package)

What is the best way to convince OE to package the libraries and not
complain about the so links?

Thanks,
Cliff

-- 
=================
http://bec-systems.com



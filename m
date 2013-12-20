Return-Path: <david.good1@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0DA60C18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2013 23:47:23 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id a1so3073326wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2013 15:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=koRk5y82adc+/QSAoyDnT0bBB+8LJbctrR3lpJKDGuo=;
	b=0RK5F8HIlg2HiRpGjBdjUiQr76iAS9aXv3Ztt9CdcbYVVwPuK8vJ43iJU3GXuEJr8H
	sN+BHL2XnG2RR47ZBpYvAKh3EA10VPyQVGDlxfiv3C/nUJs9/DCfVKD+A/VYx7aW0rrK
	jfyKoh+pqKvoKSSso/b2DBKhZz/r8S966a7ILNM8UzjuyNUT9jTSGIGTKDa492KHqolG
	SQ3pD1yVmFJKp6tLxJH/o1CI7vmv+JGHXTIeWAB5zSB6W1+vVw1+dKXuwYBm6U8wTGzV
	A6od+j46qrhUW2jEmWh2M66FD+aUNnO1yWGFRzpGi/k55dv6NhlRJAxstuvGGxvoOnBF
	LlmQ==
X-Received: by 10.180.106.134 with SMTP id gu6mr9959906wib.31.1387583243576;
	Fri, 20 Dec 2013 15:47:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.171.202 with HTTP; Fri, 20 Dec 2013 15:47:03 -0800 (PST)
From: David Good <david.good1@gmail.com>
Date: Fri, 20 Dec 2013 17:47:03 -0600
Message-ID: <CALMFhSzE_9ithEKn-hM8QKP52_wenU7ExgoWyRNw2fH6Dy=NbQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: tdom bitbake configure invocation
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
X-List-Received-Date: Fri, 20 Dec 2013 23:47:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello All,

I've been trying to write a bitbake recipe for the tdom package (XML in
Tcl), and am almost there, but am a little confused about paths and
variables in bitbake.

The tdom package normally requires you to go into an os specific build dir
and then invoke configure like this: ../configure

I couldn't figure out how to make the oe_runconf do that, so I made a
do_configure() function to do it by hand.  This "works" in that I get to
the compile stage, but the output makefile still has references to
-L/usr/lib in some places.

At this point, I'm literally just trying things and running bitbake to see
what happens, but I even if this does complete, I'm not confident that it
will be correct.

Can anyone suggest how to attack this problem or at least tell me if I'm on
the right or wrong track?

Here is my tdom_8.8.3.bb file so far:

DESCRIPTION = "XML data processing in Tcl"
LICENSE = "MPL-1"
SECTION = "devel/tcltk"
HOMEPAGE = "http://tdom.github.io/"
DEPENDS = "tcl-native"
LIC_FILES_CHKSUM = "file://../LICENSE;md5=4673aaff544d4c9b9a521cb8e0860bfb"
PR = "r0"

SRC_URI = "git://github.com/tDOM/tdom.git;protocol=git;tag=master"

S = "${WORKDIR}/git/unix"

inherit autotools

EXTRAEXTRA_OECONF = "--with-tcl=${STAGING_LIBDIR}"

do_configure() {
        ../configure --with-tcl=${STAGING_LIBDIR}
--host=arm-angstrom-linux-gnueabi
}

Thanks!

--David


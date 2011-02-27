Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hvontres@gmail.com>) id 1PtbNB-0001h8-RB
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Feb 2011 08:48:57 +0100
Received: by wwe15 with SMTP id 15so3134946wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Feb 2011 23:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=IO1Me2U085imLJw2l1y83C/QCfFhnoQXk1iwo2XEBEk=;
	b=huDjBOd7X/7T3m1jCtFbskiewjRVwokFlCJU4UZzBsaYSS8fyRG02pNsZmDN/B6hxA
	TpY/aSom2nE0Gytm+jL3rV3dK2uEd+/TaYTxbcuaOmi2/0Kl3Sxh04DweszP+vlLgxFE
	f7jlX0sKI6dowokrk/k3t005805KwbyAHAnZk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EYVWck9JsVZNTtmN1+I7nqEtkcexRDhvJBVHqTXuLyuXr6amE7QXk6V9eoYjAGABTT
	0pxWi4+99ktvaM3ezdMWRAPD7NlIjYFpcgLxrB7wEvkC2z7IuobCBcFoL3ZM27i9r394
	g+HQYPsw/5psajfY+eTKCCWzLyrGz2HDkAsH8=
MIME-Version: 1.0
Received: by 10.216.87.130 with SMTP id y2mr3689846wee.58.1298792851297; Sat,
	26 Feb 2011 23:47:31 -0800 (PST)
Received: by 10.216.174.21 with HTTP; Sat, 26 Feb 2011 23:47:31 -0800 (PST)
In-Reply-To: <AANLkTimD1wN43i3WW1qBmfZamxiz3HGkoebOa4dxWyGB@mail.gmail.com>
References: <AANLkTimD1wN43i3WW1qBmfZamxiz3HGkoebOa4dxWyGB@mail.gmail.com>
Date: Sat, 26 Feb 2011 23:47:31 -0800
Message-ID: <AANLkTinzJHmo-ycPSP3cgUh8azLpbMG1=k1VP8heu69K@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Subject: Problem with autotools and host=armv5teb-oe-linux-gnueabi
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
X-List-Received-Date: Sun, 27 Feb 2011 07:48:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am trying to get a recipie for apcupsd working with the latest
openembedded. I had this recipie working a couple of weeks ago, but
now I get the following errors:


configure: loading site script /home/henry/oe/openembedded/site/endian-big
configure: loading site script /home/henry/oe/openembedded/site/arm-common
configure: loading site script /home/henry/oe/openembedded/site/common-linux
configure: loading site script /home/henry/oe/openembedded/site/common-glibc
configure: loading site script /home/henry/oe/openembedded/site/armeb-linux
configure: loading site script /home/henry/oe/openembedded/site/common
checking for true... /home/henry/oe/slug/tmp/sysroots/x86_64-linux/usr/bin/true
checking for false...
/home/henry/oe/slug/tmp/sysroots/x86_64-linux/usr/bin/false
checking build system type... x86_64-pc-linux-gnu
checking host system type... Invalid configuration
`armeb-oe-linux-gnueabi': machine `armeb-oe' not recognized
configure: error: /bin/sh
/home/henry/oe/slug/tmp/work/armv5teb-oe-linux-gnueabi/apcupsd-3.14.8-r0/apcupsd-3.14.8/autoconf/config.sub
armeb-oe-linux-gnueabi failed

This was working with the host set to armv5teb-linux-gnueabi.

Here is the recipie for reference:

inherit autotools
DEPENDS = "gd"

SRC_URI = "${SOURCEFORGE_MIRROR}/project/apcupsd/apcupsd%20-%20Stable/${PV}/apcupsd-${PV}.tar.gz;name=archive"

SRC_URI[archive.md5sum] ="cd17f0a903dc2220e55ed54e242359d2"
SRC_URI[archive.sha256sum] =
"8e7f2574d3abaf6637da3e790860c3f9ba64fab1ec7e50bb080de4439441c5a7"

EXTRA_OECONF= " --enable-usb --enable-install-distdir --enable-test"
LD=${CXX}
STRIP =. " -s --strip-program="


--
Henry von Tresckow (hvontres)



-- 
Henry von Tresckow (hvontres)



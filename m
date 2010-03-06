Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NnnfT-0000em-Rn
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 07:39:29 +0100
Received: by fxm20 with SMTP id 20so4551145fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Mar 2010 22:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=102AQY4TdsIKzy3ifYGiGlmYybbDy9Em/ptNQVNo1EI=;
	b=GaofXgqkUmBveyYQXtdM/uNQADk2FTGjnfaqP7CClYnFfWBH6WdWS95jfsCzmQER/2
	y24V0Zk+W6STKHI8/gKzq3Ei7fJgqP/rKhk0l6CoAdZ/FvBRVK/VeO3H34XeEYOJ//4H
	Vgsgkumq8LDFGCn5ekglpRuw+URLfn5LYvxqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=UOJtm9Ki+RPyVHtAmegqiMbiINV8hPZPp/5Z6f3M9648qm7uZi8uhh4omxbVY4z636
	it3AczUbNoPbip3/n8vKJhqM/pjCQ2ag0/GjHfAJw5kblxjA1iF0foD9N+mowvt1Eqgr
	ARXB/0hDdfICMub3pS9iTpnreaCNp1LM+3OK0=
MIME-Version: 1.0
Received: by 10.223.100.150 with SMTP id y22mr2005663fan.99.1267857386205; 
	Fri, 05 Mar 2010 22:36:26 -0800 (PST)
In-Reply-To: <E1NnJzb-0001K2-HM@melo.openembedded.org>
References: <E1NnJzb-0001K2-HM@melo.openembedded.org>
Date: Sat, 6 Mar 2010 07:36:26 +0100
Message-ID: <141020e31003052236w4afdcc26x1008a539f0491c9a@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [oe-commits] Phil Blundell : gtk+: build gtk-demo and package it appropriately
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
X-List-Received-Date: Sat, 06 Mar 2010 06:39:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 4, 2010 at 11:58 PM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: a3b0920d0cc2cecac9eea4993ad18a64b207d7af
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3Da3b0920d0cc2cecac9eea4993ad18a64b207d7af
>
> Author: Phil Blundell <philb@gnu.org>
> Date: =A0 Thu Mar =A04 22:56:33 2010 +0000
>
> gtk+: build gtk-demo and package it appropriately

Hi,

after this patch I get build failure in those re-enable demos:

| make[2]: Entering directory
`/OE/tmpdir-dev-shr/work/armv4t-oe-linux-gnueabi/gtk+-2.18.6-r8.3/gtk+-2.18=
.6/demos'
| /OE/tmpdir-dev-shr/staging/x86_64-linux/usr/bin/gdk-pixbuf-csource
--raw --build-list         \
|               apple_red  ./apple-red.png      \
|                 gnome_foot ./gnome-foot.png   \
|         > test-inline-pixbufs.h                               \
|       || (rm -f test-inline-pixbufs.h && false)
| failed to load "./apple-red.png": Couldn't recognize the image file
format for file './apple-red.png'
| make[2]: *** [test-inline-pixbufs.h] Error 1
| make[2]: Leaving directory
`/OE/tmpdir-dev-shr/work/armv4t-oe-linux-gnueabi/gtk+-2.18.6-r8.3/gtk+-2.18=
.6/demos'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/OE/tmpdir-dev-shr/work/armv4t-oe-linux-gnueabi/gtk+-2.18.6-r8.3/gtk+-2.18=
.6'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed

bitbake@jama ~/build.dev.shr.gta $
/OE/tmpdir-dev-shr/staging/x86_64-linux/usr/bin/gdk-pixbuf-csource -v
gdk-pixbuf-csource version 2.12.11

seems like that version from
recipes/gtk+/gdk-pixbuf-csource-native_2.12.11.bb

and gtk+-native explicitly removes this
recipes/gtk+/gtk+_2.18.6.bb:
do_install_virtclass-native () {
        autotools_do_install
        find ${D}${libdir} -name "libpixbufloader-*.la" -exec rm \{\} \;
        rm ${D}${bindir}/gdk-pixbuf-csource
        echo "going native!"
}

So I guess that
find ${D}${libdir} -name "libpixbufloader-*.so" -exec rm \{\} \;
in gtk+-native could help gdk-pixbuf-csource-native to work

but replacing gdk-pixbuf-csource-native with gtk+-native would be much bett=
er

There is also bug when you rebuild gdk-pixbuf-csource-native and then
don't rebuild gtk+-native to fix pkgconfig gtk.
http://bugs.openembedded.org/show_bug.cgi?id=3D5405

Please GTK/OE gurus fix this, thanks.



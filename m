Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NMrsr-0006Dx-3y
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 00:41:52 +0100
Received: by iwn32 with SMTP id 32so3568420iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 15:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=etPpx8ABcAMwkBIyAZP/vx+g+9e69qe/sMsfQxgSt7s=;
	b=U+98LlAh+kNnpOU/m20dezGEzMvdwD1iTPf6Me14zM9/iZayjPy1pIibtGoeUTbNnn
	/KujTq8QwjNjjIxVjC2nWfjup7TtAjtDHsga96duJS7gHBKOt292lkOAB9i70zcdQsGD
	O1zucdwvLPcZKhRflBK+PCrgvy/nfwiIWyaL4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DXnkFBA3gu+YuZI0lIRlY9pkp5j12KxBEPchFERg2DvFjaxka0TeX2MluZFmXxb5OM
	9e6htqFyHoCV3XxryGH/ZsxTzduDk92TTFwVIe0ISDwi3/+7+g/EI/73hDf5OAAYIf+n
	MTjErPkfnqnlUZwOcvO91q8MnEdWV6zZHT9Ss=
MIME-Version: 1.0
Received: by 10.231.170.201 with SMTP id e9mr2985534ibz.15.1261438796826; Mon, 
	21 Dec 2009 15:39:56 -0800 (PST)
In-Reply-To: <4B2FE953.30301@mayer-electronics.de>
References: <4B2FE953.30301@mayer-electronics.de>
Date: Mon, 21 Dec 2009 15:39:56 -0800
Message-ID: <19c1b8a90912211539q33828e79xb8646adeccd3e0d@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Cannot build gpe-mini browser
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
X-List-Received-Date: Mon, 21 Dec 2009 23:41:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2009 at 1:32 PM, Florian Mayer (Mayer Electronics)
<Florian.Mayer@mayer-electronics.de> wrote:
> Hello,
>
> if I try to bitbake gpe-mini-browser, I get the following output:
>
> | arm-angstrom-linux-gcc -march=3Darmv4 -mtune=3Dstrongarm
> -DPACKAGE_NAME=3D\"gpe-mini-browser\" -DPACKAGE_TARNAME=3D\"gpe-mini-brow=
ser\"
> -DPACKAGE_VERSION=3D\"0.21\" -DPACKAGE_STRING=3D\"gpe-mini-browser\ 0.21\=
"
> -DPACKAGE_BUGREPORT=3D\"philippedeswert@scarlet.be\"
> -DPACKAGE=3D\"gpe-mini-browser\" -DVERSION=3D\"0.21\" -DSTDC_HEADERS=3D1
> -DGETTEXT_PACKAGE=3D\"gpe-mini-browser\" -DHAVE_SYS_TYPES_H=3D1
> -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAVE_MEMO=
RY_H=3D1
> -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UNI=
STD_H=3D1
> -DHAVE_LOCALE_H=3D1 -DHAVE_LC_MESSAGES=3D1 -DHAVE_BIND_TEXTDOMAIN_CODESET=
=3D1
> -DHAVE_GETTEXT=3D1 -DHAVE_DCGETTEXT=3D1 -DENABLE_NLS=3D1 -I.
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
include/gtk-2.0
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
lib/gtk-2.0/include
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
include/atk-1.0
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
include/cairo
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
include/pango-1.0
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
include/glib-2.0
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
lib/glib-2.0/include
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
include/pixman-1
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
include/freetype2
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
include/libpng12
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
include/gtk-webcore/webi
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
include/gtk-webcore
> -I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/=
include/gtk-webcore/
> =C2=A0 -DPREFIX=3D\"/usr\" -Wall
> =C2=A0-isystem/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstro=
m-linux/usr/include
> =C2=A0-Os -Wall -g -pedantic -std=3Dc99 =C2=A0 -MT db-backend.o -MD -MP -=
MF
> .deps/db-backend.Tpo -c -o db-backend.o db-backend.c
> | db-backend.c:224: warning: C99 inline functions are not supported; usin=
g
> GNU89
> | db-backend.c:224: warning: to disable this warning use -fgnu89-inline o=
r
> the gnu_inline function attribute
> | mv -f .deps/db-backend.Tpo .deps/db-backend.Po
> | arm-angstrom-linux-gcc -march=3Darmv4 -mtune=3Dstrongarm =C2=A0-Os -Wal=
l -g
> -pedantic -std=3Dc99
> =C2=A0-L/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linu=
x/usr/lib
> -Wl,-rpath-link,/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angst=
rom-linux/usr/lib
> -Wl,-O1 -Wl,--hash-style=3Dgnu -o gpe-mini-browser interface-calls.o
> loading-calls.o misc-calls.o settings.o =C2=A0gpe-mini-browser.o db-backe=
nd.o
> =C2=A0-lgpewidget -lgtk_webcore_nrcit -lgthread-2.0 -lgtk_webcore_nrcore =
-lcurl
> -lgtk_webcore_jscore -lXft -lgtk-x11-2.0 -lXrender -lX11 -lgdk-x11-2.0
> -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lca=
iro
> -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lglib-2.=
0
> -lsqlite
> |
> /home/gonzo/ARM-devel/oe/build/tmp/cross/arm-oabi/lib/gcc/arm-angstrom-li=
nux/4.2.4/../../../../arm-angstrom-linux/bin/ld:
> gpe-mini-browser: hidden symbol `__ltdf2' in
> /home/gonzo/ARM-devel/oe/build/tmp/cross/arm-oabi/lib/gcc/arm-angstrom-li=
nux/4.2.4/libgcc.a(_cmpdf2.o)
> is referenced by DSO

My guess is that libgcc is not linked in correctly to a shared library
that is being pulled in here.
 You can add -lgcc to the commandline and see if that helps but you
have to find out which library is it.
if you add --verbose to the linking command above then it will show
more details about options being
passed to ld which can give more idea. For shared objects gcc might be
pulling in libgcc_s.so to link with
and assuming that libgcc.a and libgcc_s has same symbols which may not
be the case.


> |
> /home/gonzo/ARM-devel/oe/build/tmp/cross/arm-oabi/lib/gcc/arm-angstrom-li=
nux/4.2.4/../../../../arm-angstrom-linux/bin/ld:
> final link failed: Nonrepresentable section on output
> | collect2: ld returned 1 exit status
> | make[1]: *** [gpe-mini-browser] Error 1

This error I believe is due to first problem above.

Thx

-Khem



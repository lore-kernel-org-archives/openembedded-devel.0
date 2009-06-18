Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MHMDr-000655-6d
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 20:20:27 +0200
Received: by gxk2 with SMTP id 2so1716584gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2009 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=O6uQj7Z9QayYrld6+O2CxfV3wGHyC+K6ANcBanXJTTU=;
	b=LjrD4wPnDNtzXB/3gxIX/a2IiigXxIX0UQkBILl/5IzgUQrQI+i88Zh9KiYBHBlg37
	kjoeDi6/Nz+m05TPuoTG1t6WMs9AAn2cSg/enkzGgZH0MZP1ndqI2cXFcLUs97QDJjID
	9QxGBMu/6wry0R2uhCCw/8Rr5v8r1VMkQTfeQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=WbgiJL2TlzSVYts8K4eNHW3xjrZ8vXbiaAXwj5AWTu8oj5WXDa258fI++9OZX6EiWs
	xekcobhP5d9WvJKFoB1q+I6IHzUuOAYGBBE6HCAzA6Ep1VXgXYtd4rlLuyVLF4qEa7Tc
	EDoYllwNUDBEoL/IxfFGvkebhKtORYAZwo7Kc=
MIME-Version: 1.0
Received: by 10.150.229.21 with SMTP id b21mr4040912ybh.263.1245348591579; 
	Thu, 18 Jun 2009 11:09:51 -0700 (PDT)
In-Reply-To: <1244838263.5958.34.camel@dax.rpnet.com>
References: <1244836535.4151.140.camel@lenovo.internal.reciva.com>
	<1244838263.5958.34.camel@dax.rpnet.com>
Date: Thu, 18 Jun 2009 14:09:51 -0400
Message-ID: <f96d234e0906181109y4ee832bcu7b53037c917709be@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [rfc] change default for BUILD_OPTIMIZATION, remove spurious 	assignments
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
X-List-Received-Date: Thu, 18 Jun 2009 18:20:27 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2009 at 4:24 PM, Richard Purdie<rpurdie@rpsys.net> wrote:
> On Fri, 2009-06-12 at 20:55 +0100, Phil Blundell wrote:
>> I'd like to propose changing the bitbake.conf default for
>> BUILD_OPTIMIZATION from "-O2" to "-O2 -g". =A0There seems no harm in
>> building debuggable binaries for host-side utilities and it makes life
>> somewhat easier when things go wrong.
>>
>> Also, while investigating why assignments to this variable from
>> local.conf didn't do what I was expecting, I discovered that a whole lot
>> of files inside conf/, notably all of the sane-toolchain-*.inc files,
>> contain their own assignments to BUILD_OPTIMIZATION for no good reason
>> that I can see. =A0I would also propose to delete the assignments from
>> those files. =A0(There are a few other assignments in files that are
>> either DISTRO or MACHINE specific but I intend to leave those alone.)
>
> Acked-by: Richard Purdie <rpurdie@linux.intel.com>
>
> Poky actually uses -ggdb now which makes the -dbg packages useful (if
> huge).

Poky currently uses:
##################################################################
# Optimization flags.
##################################################################

FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
-frename-registers -O2 -ggdb -feliminate-unused-debug-types"
DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer -g"
SELECTED_OPTIMIZATION =3D "${@bb.data.getVar(['FULL_OPTIMIZATION',
'DEBUG_OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) =3D=3D '1'], d,
1)}"
BUILD_OPTIMIZATION =3D "-O2"

OE uses:
##################################################################
# Optimization flags.
##################################################################

FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
-frename-registers -O2"
DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer -g"
SELECTED_OPTIMIZATION =3D "${@bb.data.getVar(['FULL_OPTIMIZATION',
'DEBUG_OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) =3D=3D '1'], d,
1)}"
BUILD_OPTIMIZATION =3D "-O2 -g"

I agree, debug symbols are nice in *dbg packages.  Are there any other
thoughts pro/con for changing OE to match Poky FULL_OPTIMIZATION
settings?

As to -ggdb3, the following information may be helpful.

-ggdblevel

           Request debugging information and also use level to specify
how much information.  The default level is 2.

           Level 0 produces no debug information at all.  Thus, -g0 negates=
 -g.

           Level 1 produces minimal information, enough for making
backtraces in parts of the program that you don=92t plan to debug.
           This includes descriptions of functions and external
variables, but no information about local variables and no line
numbers.

           Level 3 includes extra information, such as all the macro
definitions present in the program.  Some debuggers support macro
           expansion when you use -g3.

So maybe a good way to do this is:
FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
-frename-registers -O2 -ggdb -feliminate-unused-debug-types"
DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer -ggdb3"
BUILD_OPTIMIZATION =3D "-O2 -ggdb"

That way with *dbg packages installed, you could at least get a back
trace with a normal build.  If you needed line numbers, you could set
DEBUG_BUILD and rebuild packages of interest.

Any thoughts on -g vs -ggdb for BUILD_OPTIMIZATION?

Thanks,
Cliff



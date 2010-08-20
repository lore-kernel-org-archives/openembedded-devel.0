Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OmUmC-0003ta-2l
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 18:49:22 +0200
Received: by gwb15 with SMTP id 15so1355996gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 09:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ujtrIJT7oafEQ5weAPvsPscg/B0nqF6zqNdwhSej1WA=;
	b=UErYo2bWj9h26L/Nh0EZCL6258vKkaxv0dvvONFVxfxiv6+MgBiuooNt2w4+nT4iW4
	pfDUZhI0/le/Ek/FDLLRlxF1I79X7G/XYf9orDYmC+/YFw308ATiFPlQfronfshTs2y5
	4R7rWOAF7a93jr7LUwEEN4KyFHsIuFPhrJfqQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sE52KJ06xJHaVQiAxb9ZlsnHrUm6h50m7YWrxlS8573jaZrf1AHr3x2Z0tWfVUAkbH
	ZIpSAvRGm06zJ0TZ5BtWOo78X/2n6b/y1VN1iy6MHygSr1uu1mlEX2ZSCWDgLEbS283m
	YHW9J0netzFyjE9nlheYMtM8G6D6fm7oS6NnM=
MIME-Version: 1.0
Received: by 10.151.14.5 with SMTP id r5mr1851541ybi.333.1282322925531; Fri,
	20 Aug 2010 09:48:45 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Fri, 20 Aug 2010 09:48:45 -0700 (PDT)
In-Reply-To: <AANLkTi=T03QKXLOxx11BtG0=LcAGuzVqaqXx7yF+jTjV@mail.gmail.com>
References: <1282313977-31805-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1282315196.13038.44.camel@mill.internal.reciva.com>
	<AANLkTin4OrsobbFpGe-vaTfUCdbjAi=XF65VfJzYjrWm@mail.gmail.com>
	<AANLkTi=T03QKXLOxx11BtG0=LcAGuzVqaqXx7yF+jTjV@mail.gmail.com>
Date: Fri, 20 Aug 2010 18:48:45 +0200
Message-ID: <AANLkTik2H4eiDukh5gYJyQEJ=sDv+hu5eajQLy6HAvVw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] native.bbclass: add (re)definitions for TARGET_SYS and HOST_SYS
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
X-List-Received-Date: Fri, 20 Aug 2010 16:49:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/20 Khem Raj <raj.khem@gmail.com>:
> On Fri, Aug 20, 2010 at 8:34 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Aug 20, 2010 at 7:39 AM, Phil Blundell <philb@gnu.org> wrote:
>>> On Fri, 2010-08-20 at 16:19 +0200, Frans Meulenbroeks wrote:
>>>> @@ -23,6 +23,7 @@ TARGET_VENDOR =3D "${BUILD_VENDOR}"
>>>> =A0TARGET_PREFIX =3D "${BUILD_PREFIX}"
>>>> =A0TARGET_CC_ARCH =3D "${BUILD_CC_ARCH}"
>>>> =A0TARGET_EXEEXT =3D "${BUILD_EXEEXT}"
>>>> +TARGET_SYS =3D "${BUILD_SYS}"
>>
>> bitbake.conf already has
>>
>> TARGET_SYS=3D${TARGET_ARCH}${TARGET_VENDOR}${@['-' +
>> bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d,
>> 1) =3D=3D ('' or 'custom')]}
>>
>> so once you have TARGET_OS set correctly this should work well for nativ=
e too.
>
>
> hmm _local ok if you override TARGET_OS locally then lot of other
> things will change
> because now TARGET_OS will not be reset to whatever native wants. even if=
 you
> redefine TARGET_SYS may not be sufficient. Somehow if you can make
> native.bbclass
> to stubbornly ignore TARGET_OS override that might work.
>
I don't want to override TARGET_OS (and in fact this could be done in
the machine definition).

The hardware I am working with is a powerpc system quite similar to
calamari. It is an e500v2 which supports/needs spe.
For calamari/angstrom things work by the grace of the following code
in angstrom.eglibc.inc:

TARGET_OS =3D "linux"

TARGET_OS .=3D "${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in
['arm', 'armeb']]}"
TARGET_OS .=3D "${@['','-gnuspe'][bb.data.getVar('TARGET_ARCH',d,1) in
['ppc', 'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari']]}"

and actually if I replace calamari with my machine name it works.
The code seems too specific because afaik each ppc e500 core requires gnusp=
e.

The reason the override was there and not in the machine config, is
because at some point I thought this inc file would mask my
definition, so I wanted to be really really sure I got the gnuspe
settings.
I've had a discussion on this with pb and RP on irc, the problem is
probably not here but in gmp-native. Earlier native recipes (like
openssl-native, libcurses-native etc etc) build fine but for
gmp-native configure fails.
We've also looked at the patch for gmp-native and at least the darwin
patch indicates there is something fishy here.
My "patch" fixed things for me, but as it stands it is probably not
the proper solution but the answer is in gmp.
And my misperception was that for native recipes target and host
should be the sam, but for gmp-native configure is called with

--build=3Dx86_64-linux --host=3Dx86_64-linux --target=3Dx86_64-linux-gnuspe

and it barfs upon the target value. Is this target value ok??? As I
said I expected here that build=3D=3Dhost=3D=3Dtarget (for a native recipe)=
.

Frans

PS:  I'm doing a rebuild from scratch now with the patch undone and
TARGET_OS being defined in the machine conf. When finished I can
provide some more detailed info on the error.



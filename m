Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nk7gs-0008A2-Gq
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 04:13:37 +0100
Received: by iwn9 with SMTP id 9so3991859iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 19:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0vr1mVSoWPvMVSYDr0jelW3Lf9kNY/IX4NIZouK6cX8=;
	b=RSp8MhFB3HdgPSWbUTW7XlDIppqqgnIbDrEHv1IacAiR/whe0tkvKV3DkzjC2sUKtE
	z5jPT0BMHTLs0LOvK057VvmEMTA3pftO3ooE4Qwr/0OFOZBl1qgNLE+t5U/HUzSVHPJn
	MXhj20ve/u2TZveY9y94+W/vMQVBqJKWspK/8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DRQjsSI7JEyHVsH9gp6qfTvK/WXCiphqX1js7oiT1l71bGYIL39HYxwiFTTWN+6Dkr
	6FKwVx0QjFteAWsxH5F8qbkm6WvUsWo+yG6FMXnAr55Bu5otrTlSlE3nWlBsWasE16x8
	Y3u6ji5+ttZL9U8WbxYLNA6F3Ajus4zfe0J2Y=
MIME-Version: 1.0
Received: by 10.231.152.75 with SMTP id f11mr1062861ibw.50.1266981048647; Tue, 
	23 Feb 2010 19:10:48 -0800 (PST)
In-Reply-To: <f96d234e1002231243h1e75af62g90d490aa792fbe96@mail.gmail.com>
References: <f96d234e1002230827y25028493l7f25ab05b6fbac76@mail.gmail.com>
	<19c1b8a91002231036u46b1b35andf9fb71345805669@mail.gmail.com>
	<f96d234e1002231243h1e75af62g90d490aa792fbe96@mail.gmail.com>
Date: Tue, 23 Feb 2010 19:10:48 -0800
Message-ID: <19c1b8a91002231910y3b44f0ecuc8992499c1a4086@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gettext native failure
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
X-List-Received-Date: Wed, 24 Feb 2010 03:13:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2010 at 12:43 PM, Cliff Brake <cliff.brake@gmail.com> wrote=
:
> On Tue, Feb 23, 2010 at 1:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Feb 23, 2010 at 8:27 AM, Cliff Brake <cliff.brake@gmail.com> wro=
te:
>>> make[4]: Entering directory
>>> `/scratch/oe/oe-from-scratch/tmp/work/x86_64-linux/gettext-native-0.17-=
r5/gettext-0.17/gettext-tools/src'
>>> =E2=88=98 /bin/sh ../x86_64-linux-libtool --tag=3DCC =C2=A0 --mode=3Dli=
nk gcc
>>> -std=3Dgnu99 =C2=A0-isystem/scratch/oe/oe-from-scratch/tmp/staging/x86_=
64-linux/usr/include
>>> -O2 -g =C2=A0-L/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr=
/lib
>>> -Wl,-rpath-link,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/us=
r/lib
>>> -Wl,-rpath,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
>>> -Wl,-O1 -o msgcmp msgcmp-msgcmp.o libgettextsrc.la
>>> =E2=88=98 x86_64-linux-libtool: link: gcc -std=3Dgnu99
>>> -isystem/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/includ=
e
>>> -O2 -g -Wl,-rpath-link
>>> -Wl,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
>>> -Wl,-rpath -Wl,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr=
/lib
>>> -Wl,-O1 -o .libs/msgcmp msgcmp-msgcmp.o
>>> -L/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
>>> ./.libs/libgettextsrc.so
>>> /scratch/oe/oe-from-scratch/tmp/work/x86_64-linux/gettext-native-0.17-r=
5/gettext-0.17/gettext-tools/gnulib-lib/.libs/libgettextlib.so
>>> /usr/lib/libcroco-0.6.so /usr/lib/libglib-2.0.so -lncurses -lc
>>> -Wl,-rpath -Wl,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr=
/lib
>>> =E2=88=98 /usr/lib64/libxml2.so.2: undefined reference to `gzopen64'
>>> =E2=88=98 collect2: ld returned 1 exit status
>>>
>>> http://bugs.openembedded.org/show_bug.cgi?id=3D2679
>>>
>>> http://bugs.openembedded.org/show_bug.cgi?id=3D5139
>>>
>>> Looks like a classic case of using the staging libz, but libxml2 from
>>> the host. =C2=A0It appears that libxml2 cannot be built in OE until get=
text
>>> is built. =C2=A0Any thoughts on this one?
>>
>>
>> http://patchwork.openembedded.org/patch/185/
>>
>> and then more detailed explanation is here
>> http://article.gmane.org/gmane.comp.handhelds.openembedded/22700/match=
=3Dlibxml2
>>
>> IIRC when I tested it. It was not happening with gcc 4.4.x
>> Which version of gcc do you have on your build box.
>
> cbrake@happy:/scratch/oe/oe-testing$ gcc --version
> gcc (Ubuntu 4.4.1-4ubuntu9) 4.4.1
> Copyright (C) 2009 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions. =C2=A0There=
 is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E.
>
> I read through your links, but those are for building libxml2. =C2=A0I'm
> still trying to build gettext.

I see. gettext requires libxml2 at buildtime therefore adding
libxml2-native to DEPENDS
should solve this. libxml2-native should not depend on gettext-native
if it does then its a bug.

Dependency chain which pulls in gettext-native is

insane.bbclass -> desktop-file-utils-native -> glib-2.0-native -> gettext-n=
ative

so my guess is that it has not yet built libxml2-native when it starts
to build gettext-native and defaults to whatever is on the build
system due to parallel'ness of bitbake

>
> Cliff
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



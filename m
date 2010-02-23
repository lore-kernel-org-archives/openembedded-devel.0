Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Nk1ds-00006G-Tl
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 21:46:08 +0100
Received: by iwn9 with SMTP id 9so3703455iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 12:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=a+QshypUBJCWyFDZZpYekE/rMmsOH/KiBZ5iSgws+6k=;
	b=oYkVQ7WT1qqCeUhZX2GBICgoBzjFr/AAPFI2GCTe6faWAomIhhPZcjL5lXWJADZmXv
	nMMFw3OBiYAvunqhsKAYZpN9worldEvfUS1bfL/qam64qYBoJ1yuUndCffJizzh5uS4P
	1FrM+n0NN3PBWHXH/3Vxe9ZMLEJ18/iFErujE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PpELHBCy/FVuYlZuizQGJMkvVzoYLs6BodexdTuqoDHr7Ec7dDopjiZmDAmHvDwluO
	jSK0f2pb/ZpfNb9rvBz6jpugs99pRy/iHBziexJJYWQMkwt9SJHKlgU0dfB2CQ2pTlLa
	7OZN3bV2ppQoC/n+u8KhEu7d2e79skZF6ydKM=
MIME-Version: 1.0
Received: by 10.231.157.83 with SMTP id a19mr626152ibx.41.1266957799262; Tue, 
	23 Feb 2010 12:43:19 -0800 (PST)
In-Reply-To: <19c1b8a91002231036u46b1b35andf9fb71345805669@mail.gmail.com>
References: <f96d234e1002230827y25028493l7f25ab05b6fbac76@mail.gmail.com>
	<19c1b8a91002231036u46b1b35andf9fb71345805669@mail.gmail.com>
Date: Tue, 23 Feb 2010 15:43:18 -0500
Message-ID: <f96d234e1002231243h1e75af62g90d490aa792fbe96@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: cliff.brake@gmail.com
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
X-List-Received-Date: Tue, 23 Feb 2010 20:46:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2010 at 1:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Feb 23, 2010 at 8:27 AM, Cliff Brake <cliff.brake@gmail.com> wrot=
e:
>> make[4]: Entering directory
>> `/scratch/oe/oe-from-scratch/tmp/work/x86_64-linux/gettext-native-0.17-r=
5/gettext-0.17/gettext-tools/src'
>> =E2=88=98 /bin/sh ../x86_64-linux-libtool --tag=3DCC =C2=A0 --mode=3Dlin=
k gcc
>> -std=3Dgnu99 =C2=A0-isystem/scratch/oe/oe-from-scratch/tmp/staging/x86_6=
4-linux/usr/include
>> -O2 -g =C2=A0-L/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/=
lib
>> -Wl,-rpath-link,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr=
/lib
>> -Wl,-rpath,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
>> -Wl,-O1 -o msgcmp msgcmp-msgcmp.o libgettextsrc.la
>> =E2=88=98 x86_64-linux-libtool: link: gcc -std=3Dgnu99
>> -isystem/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/include
>> -O2 -g -Wl,-rpath-link
>> -Wl,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
>> -Wl,-rpath -Wl,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/=
lib
>> -Wl,-O1 -o .libs/msgcmp msgcmp-msgcmp.o
>> -L/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
>> ./.libs/libgettextsrc.so
>> /scratch/oe/oe-from-scratch/tmp/work/x86_64-linux/gettext-native-0.17-r5=
/gettext-0.17/gettext-tools/gnulib-lib/.libs/libgettextlib.so
>> /usr/lib/libcroco-0.6.so /usr/lib/libglib-2.0.so -lncurses -lc
>> -Wl,-rpath -Wl,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/=
lib
>> =E2=88=98 /usr/lib64/libxml2.so.2: undefined reference to `gzopen64'
>> =E2=88=98 collect2: ld returned 1 exit status
>>
>> http://bugs.openembedded.org/show_bug.cgi?id=3D2679
>>
>> http://bugs.openembedded.org/show_bug.cgi?id=3D5139
>>
>> Looks like a classic case of using the staging libz, but libxml2 from
>> the host. =C2=A0It appears that libxml2 cannot be built in OE until gett=
ext
>> is built. =C2=A0Any thoughts on this one?
>
>
> http://patchwork.openembedded.org/patch/185/
>
> and then more detailed explanation is here
> http://article.gmane.org/gmane.comp.handhelds.openembedded/22700/match=3D=
libxml2
>
> IIRC when I tested it. It was not happening with gcc 4.4.x
> Which version of gcc do you have on your build box.

cbrake@happy:/scratch/oe/oe-testing$ gcc --version
gcc (Ubuntu 4.4.1-4ubuntu9) 4.4.1
Copyright (C) 2009 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

I read through your links, but those are for building libxml2.  I'm
still trying to build gettext.

Cliff



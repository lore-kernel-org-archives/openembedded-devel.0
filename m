Return-Path: <danismostlikely@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 058A27702B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 04:14:19 +0000 (UTC)
Received: by ykdv3 with SMTP id v3so21391452ykd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 20:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6kqFcG0a743JptC0eUBFg90ntJYFLJnLyoKWfuibrTI=;
	b=CVpRQMrOmTLcTceAFTB3kKDVLd+nbQ1QVeahYImPi+UYvOooG1Jn614qzKno1cYxK2
	iuq0QTa8O0vIWo2ph4tolTVtk5wVLKJcBz7PgRuv6Fh+PU/O8egLCzhX0d0Ozhualjk9
	K7Us9zzOf3JRazodcsqcH8AuxB8eGbUZuj4a9NbquK6JmDcu9bYYW3bGeTdia9GzLnBW
	bpM4tYhHzQ7oDab/I92WYzALLXykBMUGFN16N58kva1kD2andZ4AYYE3LNWVpC2DR9wf
	Hqx/ksyd/BS++tO76Qm3v9aEOare7+LUK52mg7I9FOJy9kDS/INDKXsbSXvSLVr36ry5
	h8pw==
MIME-Version: 1.0
X-Received: by 10.31.182.208 with SMTP id g199mr5244722vkf.21.1446696859549;
	Wed, 04 Nov 2015 20:14:19 -0800 (PST)
Received: by 10.31.237.197 with HTTP; Wed, 4 Nov 2015 20:14:19 -0800 (PST)
In-Reply-To: <D1A3A172-D87B-4999-A6A6-41E66F2E28A4@gmail.com>
References: <1446695721-21521-1-git-send-email-danismostlikely@gmail.com>
	<D1A3A172-D87B-4999-A6A6-41E66F2E28A4@gmail.com>
Date: Wed, 4 Nov 2015 22:14:19 -0600
Message-ID: <CACS+7ZTvXj0dM0Sp-SXnpE-S=SmWy5s6qG3ZM0gWZCuOTgqL=A@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] tmux: update to 2.1
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
X-List-Received-Date: Thu, 05 Nov 2015 04:14:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4 November 2015 at 22:05, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Nov 4, 2015, at 7:55 PM, Dan McGregor <danismostlikely@gmail.com> wro=
te:
>>
>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>
>> tmux 1.6 is three years old. Update to latest.
>>
>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>> ---
>> meta-oe/recipes-extended/tmux/tmux_1.6.bb | 18 ------------------
>> meta-oe/recipes-extended/tmux/tmux_2.1.bb | 17 +++++++++++++++++
>
> this is ok but use git format-parch -M so it can detect renames. Its easy=
 to review.

Interesting. I did do that, but apparently the default wasn't good
enough to detect this one.

>
>> 2 files changed, 17 insertions(+), 18 deletions(-)
>> delete mode 100644 meta-oe/recipes-extended/tmux/tmux_1.6.bb
>> create mode 100644 meta-oe/recipes-extended/tmux/tmux_2.1.bb
>>
>> diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes=
-extended/tmux/tmux_1.6.bb
>> deleted file mode 100644
>> index b4294d7..0000000
>> --- a/meta-oe/recipes-extended/tmux/tmux_1.6.bb
>> +++ /dev/null
>> @@ -1,18 +0,0 @@
>> -SUMMARY =3D "Terminal multiplexer"
>> -HOMEPAGE =3D "http://tmux.sourceforge.net"
>> -SECTION =3D "console/utils"
>> -
>> -LICENSE =3D "ISC"
>> -LIC_FILES_CHKSUM =3D "file://tmux.c;beginline=3D3;endline=3D17;md5=3D86=
85b4455330a940fab1ff451aa941a0"
>> -
>> -DEPENDS =3D "ncurses libevent"
>> -
>> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/tmux/${BP}.tar.gz"
>> -SRC_URI[md5sum] =3D "3e37db24aa596bf108a0442a81c845b3"
>> -SRC_URI[sha256sum] =3D "faee08ba1bd8c22537cd5b7458881d1bdb4985df88ed6bc=
5967c56881a7efbd6"
>> -
>> -inherit autotools pkgconfig
>> -
>> -do_configure_prepend () {
>> -    sed -i -e 's:-I/usr/local/include::' ${S}/Makefile.am || bb_fatal "=
sed failed"
>> -}
>> diff --git a/meta-oe/recipes-extended/tmux/tmux_2.1.bb b/meta-oe/recipes=
-extended/tmux/tmux_2.1.bb
>> new file mode 100644
>> index 0000000..6e2c88d
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/tmux/tmux_2.1.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY =3D "Terminal multiplexer"
>> +HOMEPAGE =3D "http://tmux.sourceforge.net"
>> +SECTION =3D "console/utils"
>> +
>> +LICENSE =3D "ISC"
>> +LIC_FILES_CHKSUM =3D "file://tmux.c;beginline=3D3;endline=3D17;md5=3D86=
85b4455330a940fab1ff451aa941a0"
>> +
>> +DEPENDS =3D "ncurses libevent"
>> +
>> +
>> +SRC_URI =3D "git://github.com/tmux/tmux.git;branch=3Dmaster"
>> +SRCREV ?=3D =E2=80=9C310f0a960ca64fa3809545badc629c0c166c6cd2=E2=80=9D
>
> is it as point release for 2.1 ? if not then may be SRCPV should be appen=
ded to PV
>

That SRCREV corresponds to the version 2.1 tag in the git repository.
I haven't confirmed that it's the same as the release tarball though.
>> +
>
>> +S =3D "${WORKDIR}/git"
>> +B =3D "${WORKDIR}/build"
>> +
>> +inherit autotools pkgconfig
>> --
>> 2.6.2.11.gb05c2f9
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


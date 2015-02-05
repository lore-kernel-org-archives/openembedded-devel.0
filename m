Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id E540C72DEC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:49:52 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id hn18so46795803igb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 10:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ZRgmAt1oiy7bFjXAvR7P9XV2oYVauBxGxozGvwFJd+4=;
	b=jcitwGx7C+oGH1vIBPOAAdNv8UB1fBQFZYfFKGX42K2L7fWLh1OrOnkL9S3al6O5sK
	iD04UPQjtLh2G7cMqCdc4AynQXtRAE7aKywM1vB0jO4mtQU5oESphMKgnVadpT0dk8LW
	Gp9r9v9gojMKVwHVJp4Hcau7zLt1Tk/Hd3/Oq07iziu5vYrRITV5DHpQtQgkkuf/sY/d
	vCm8mlTFAErPTgliqCO0IYKRt0AXWZ1zi6RKxgR/yIK7O4ToJM52SVMM6EHrvG4FNToQ
	ER9N+nBm19+UiwfOf4FD75mJQ2yJ35rXeXxt6Qh1ZaP8suxBW0gwTxANx/+i9konPk3p
	yA8A==
X-Received: by 10.50.78.232 with SMTP id e8mr10559687igx.5.1423162193646; Thu,
	05 Feb 2015 10:49:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.8.166 with HTTP; Thu, 5 Feb 2015 10:49:23 -0800 (PST)
In-Reply-To: <CAHQecY5gQE=3tgBfAUffiw=Q3wvY3x3wN07w4G_M+Hy83bQwqw@mail.gmail.com>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
	<3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB0D891E@dor-sms-xch01.digi.com>
	<3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
	<C89D77F8-3BC6-412A-B220-67AD52600F5F@gmail.com>
	<CAHQecY5gQE=3tgBfAUffiw=Q3wvY3x3wN07w4G_M+Hy83bQwqw@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Thu, 5 Feb 2015 10:49:23 -0800
Message-ID: <CAK8F28kB5SDdjm76_DgReMSFJuZ60-hpHjUhnAVkPw14eELpoA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, "Viguera,
	Javier" <Javier.Viguera@digi.com>
Subject: Re: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and dizzy
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
X-List-Received-Date: Thu, 05 Feb 2015 18:50:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Why clean the downloads directory?

Roughly how big is the download directory after a world build?

For gumstix, I maintain a source mirror on AWS S3 populated by our
automated builders running BB_GENERATE_MIRROR_TARBALLS =3D "1".  If it
would be useful to the community, I can see about adding files to this
as an additional mirror.

--Ash

On Thu, Feb 5, 2015 at 10:04 AM, Tom King <ka6sox@gmail.com> wrote:
> We have the BW, Jenkins can do the rsync from the World Builds (if we
>  clean the downloads directory) and I'll have to add some space to the
> Mirror Server but thats doable.
>
> Tom
>
> On Thu, Feb 5, 2015 at 9:52 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> > On Feb 5, 2015, at 8:49 AM, Paul Eggleton <paul.eggleton@linux.intel.c=
om>
>> wrote:
>> >
>> > On Tuesday 03 February 2015 09:05:54 Viguera, Javier wrote:
>> >>> -----Original Message-----
>> >>> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
>> >>>
>> >>> I agree, #2 is the best option to take care of the older branches.
>> >>>
>> >>> Tom, can you please fetch the following files and add them to the OE
>> >>> source
>> >>>
>> >>> mirror:
>> >>>  http://distfiles.lesslinux.org/crda-1.1.3.tar.bz2
>> >>>  http://distfiles.lesslinux.org/2013.01.11-regulatory.bin
>> >>>
>> >>> I've verified the md5sums match the recipe:
>> >>>  29579185e06a75675507527243d28e5c  crda-1.1.3.tar.bz2
>> >>>  e0c8a5ca63fb8bf803213f9a0c90b50b  2013.01.11-regulatory.bin
>> >>
>> >> Good to know we agree on the best option.
>> >>
>> >> Could I make a humble request to speed up the copy of the packages to=
 OE
>> >> source mirror?
>> >>
>> >> We have a BSP layer that depends on this and currently our build is
>> broken
>> >> fetching crda.
>> >
>> > I've been thinking about this, and this is getting ridiculous. Instead=
 of
>> > manually adding files to the OE source mirror, I think it's time we
>> simply had
>> > a populated fallback source mirror that has all the sources for at lea=
st
>> the
>> > recipes in layers hosted on openembedded.org (if not other commonly us=
ed
>> > layers) aside from OE-Core which is already handled by the
>> yoctoproject.org
>> > mirrors. This issue keeps coming up far too often.
>> >
>> > Is there a possibility we can set this up?
>>
>> We can infact setup a rsync from download directory of Martin=E2=80=99s =
world
>> build jobs
>> looking at Tom for help
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


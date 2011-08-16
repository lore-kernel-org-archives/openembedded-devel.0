Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtPwO-0005OK-O7
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 22:08:48 +0200
Received: by yxi19 with SMTP id 19so233307yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 13:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=VgqUxjP9In8/3MI79uBOL/Oyki9pLqUzhgr+BqEMD5s=;
	b=HhKUp5FfxCA7eadwBntZXrAD+wcqhvMCaBVj6vyuiDIcgeQuoUgz5Pp5mKKahy3IA5
	DzJyXGtrkEaf2MBm8Dvk+QOQ6Aeen7RvIDyp/dF9bZGxgCtbzErEBHqhXOMjBn2gaPBh
	rYF2ujVtjfpXjuEFmieiQj65Ff3tt31FYIH9k=
Received: by 10.142.215.10 with SMTP id n10mr42665wfg.290.1313525050262; Tue,
	16 Aug 2011 13:04:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.197 with HTTP; Tue, 16 Aug 2011 13:03:40 -0700 (PDT)
In-Reply-To: <1313523876.3630.14.camel@lenovo.internal.reciva.com>
References: <CAOd_LFx5+NyXY4cTZ76yfccaFea8_WsFm2t_ZnkLk1xKD9Xzyw@mail.gmail.com>
	<1313523876.3630.14.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2011 13:03:40 -0700
Message-ID: <CAMKF1srdqe0GKEYx5N9UTmt0jdJjixDioGRD--m-sU8ZoPT3hA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: error building PXA270 target with oe-core/angstrom
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
X-List-Received-Date: Tue, 16 Aug 2011 20:08:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 12:44 PM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2011-08-16 at 15:32 -0400, Cliff Brake wrote:
>> | ../libcpp/libcpp.a(files.o): In function `validate_pch':
>> | files.c:(.text+0x1978): undefined reference to `fprintf_unlocked'
>> | ../libcpp/libcpp.a(line-map.o): In function `linemap_check_files_exite=
d':
>> | line-map.c:(.text+0xfa): undefined reference to `fprintf_unlocked'
>> | ../libcpp/libcpp.a(line-map.o): In function `linemap_add':
>> | line-map.c:(.text+0x258): undefined reference to `fprintf_unlocked'
>> | line-map.c:(.text+0x308): undefined reference to `fprintf_unlocked'
>> | ../libcpp/libcpp.a(symtab.o): In function `ht_dump_statistics':
>> | symtab.c:(.text+0x1cc): undefined reference to `fprintf_unlocked'
>
> That looks rather like something is wrong with your host's build
> environment. =C2=A0Apparently gcc has decided that you have fprintf_unloc=
ked
> and using it would be a good idea. =C2=A0AFAIK, there are no glibcs in th=
e
> wild which do actually implement fprintf_unlocked so it seems that gcc
> must be mistaken in its belief.
>
> I think you might need to do a bit of poking at config.log to see what's
> up.
>

Do you have eglibc-nativesdk staged ?


> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



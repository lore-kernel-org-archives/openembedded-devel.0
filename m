Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QtQmO-0003KK-9s
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 23:02:32 +0200
Received: by yxi19 with SMTP id 19so270629yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hwyYdJQnzXcopcjawArEPhmacRrLfHVtIzfgZN6sSRM=;
	b=ky5fdZuapEUxcBR5p/EMQV3Y9fY/w+Qhr36SHlmaL7ikYdSvk/Lm2bVlIycLZedltd
	fq5xBlD4Oq2jppBKr9m2UTE5xoOZC/dxxXiE4AOxvNdVbkZwCMb/9mCUt/MQEIiWGSe0
	IXHaCnWhliU+iMZbwzjJwHCKqTH7z8zX9LT4M=
MIME-Version: 1.0
Received: by 10.236.23.6 with SMTP id u6mr537712yhu.230.1313528274386; Tue, 16
	Aug 2011 13:57:54 -0700 (PDT)
Received: by 10.236.106.100 with HTTP; Tue, 16 Aug 2011 13:57:53 -0700 (PDT)
In-Reply-To: <1313523876.3630.14.camel@lenovo.internal.reciva.com>
References: <CAOd_LFx5+NyXY4cTZ76yfccaFea8_WsFm2t_ZnkLk1xKD9Xzyw@mail.gmail.com>
	<1313523876.3630.14.camel@lenovo.internal.reciva.com>
Date: Tue, 16 Aug 2011 16:57:53 -0400
Message-ID: <CAOd_LFzXGuHfm908XYyU6KPCZha6CF6AzCuK3DL65Qd5jkAnig@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
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
X-List-Received-Date: Tue, 16 Aug 2011 21:02:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 3:44 PM, Phil Blundell <philb@gnu.org> wrote:
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
> environment. =A0Apparently gcc has decided that you have fprintf_unlocked
> and using it would be a good idea. =A0AFAIK, there are no glibcs in the
> wild which do actually implement fprintf_unlocked so it seems that gcc
> must be mistaken in its belief.
>
> I think you might need to do a bit of poking at config.log to see what's
> up.

http://bec-systems.com/oe/config.log

I've not learned much more yet other than locate the above file.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com



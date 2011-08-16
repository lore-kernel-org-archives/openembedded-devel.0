Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QtQeh-0002mN-G4
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 22:54:35 +0200
Received: by yxi19 with SMTP id 19so265551yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 13:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=vtIKGfquDFDsrM2fMw2V5PCOs1ah5/HguluEcv9dk0o=;
	b=d60QmDYSLG41KKuZ7ujTwsnGRAMG1tFtNmG3byDaiWHNcOzIB64RLUW/+wBuMty3Cz
	niOKr6SqOdvciiGJwEQo2E0J/KViXcqBvYwpyi1XpvVZCKRZqit5lqFfnEhk04BcgN6f
	qtMad5PgCVHuUR0exfsDsntP64Yr48E/3Box8=
MIME-Version: 1.0
Received: by 10.236.23.6 with SMTP id u6mr509772yhu.230.1313527797477; Tue, 16
	Aug 2011 13:49:57 -0700 (PDT)
Received: by 10.236.106.100 with HTTP; Tue, 16 Aug 2011 13:49:57 -0700 (PDT)
In-Reply-To: <CAMKF1srdqe0GKEYx5N9UTmt0jdJjixDioGRD--m-sU8ZoPT3hA@mail.gmail.com>
References: <CAOd_LFx5+NyXY4cTZ76yfccaFea8_WsFm2t_ZnkLk1xKD9Xzyw@mail.gmail.com>
	<1313523876.3630.14.camel@lenovo.internal.reciva.com>
	<CAMKF1srdqe0GKEYx5N9UTmt0jdJjixDioGRD--m-sU8ZoPT3hA@mail.gmail.com>
Date: Tue, 16 Aug 2011 16:49:57 -0400
Message-ID: <CAOd_LFwQk0vCwVw-FEs5JOs9cPe_kbJHBEi9My+VaKtoM0k7Jg@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Aug 2011 20:54:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 4:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Aug 16, 2011 at 12:44 PM, Phil Blundell <philb@gnu.org> wrote:
>> On Tue, 2011-08-16 at 15:32 -0400, Cliff Brake wrote:
>>> | ../libcpp/libcpp.a(files.o): In function `validate_pch':
>>> | files.c:(.text+0x1978): undefined reference to `fprintf_unlocked'
>>> | ../libcpp/libcpp.a(line-map.o): In function `linemap_check_files_exit=
ed':
>>> | line-map.c:(.text+0xfa): undefined reference to `fprintf_unlocked'
>>> | ../libcpp/libcpp.a(line-map.o): In function `linemap_add':
>>> | line-map.c:(.text+0x258): undefined reference to `fprintf_unlocked'
>>> | line-map.c:(.text+0x308): undefined reference to `fprintf_unlocked'
>>> | ../libcpp/libcpp.a(symtab.o): In function `ht_dump_statistics':
>>> | symtab.c:(.text+0x1cc): undefined reference to `fprintf_unlocked'
>>
>> That looks rather like something is wrong with your host's build
>> environment. =A0Apparently gcc has decided that you have fprintf_unlocke=
d
>> and using it would be a good idea. =A0AFAIK, there are no glibcs in the
>> wild which do actually implement fprintf_unlocked so it seems that gcc
>> must be mistaken in its belief.
>>
>> I think you might need to do a bit of poking at config.log to see what's
>> up.
>>
>
> Do you have eglibc-nativesdk staged ?

No, if I try to bitbake eglibc-nativesdk, it fails trying to compile
gcc-cross-initial_4.5.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com



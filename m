Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7616B8AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 16:18:57 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id f8-v6so7578027pgq.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 08:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=nulxOQ/qxEDz1j5HB87s1m6O0YsIilAqLWks3n3Pz4M=;
	b=oQL23EDeeVD1v4LbOD/SoDHnsbRmXKCgFTHOaYuXu1ByVKoCgkQSLp4FYv/+apbU8f
	cVU5Jtp5KePKrNrveHfRTuCII4BScZfvWiFMJxt1z9fiHbj00vfA6xGUREDYrDqfqOJn
	oX77tvZVER1TvF53OX0Q5o/j8ZhTiG2WPCJnMw5xrr3vf0MEKELu7h3mBTt5fuowCQkB
	p3huYIxDd0h3I7LoVLd+GKOvcG6MY4v5rFA56gkCaaiXZFNpOllGUfPmuh5G9UqPQdVr
	S70p3yhGNPjD1DbQF4ImnTbCBngy+0IkitfxYJdQyfmzF98fMDrH2Zck2B14cwRFg+WB
	pLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=nulxOQ/qxEDz1j5HB87s1m6O0YsIilAqLWks3n3Pz4M=;
	b=PGPCS50YZRMwxFG35UMvnZ7SpyrfCTrwIk8MUAQXhmpTjiFJ5vdCsggQKH/Pt82Sc8
	/H66KyULgD0rDIcybdp5ULFvtUWkgXfQMfPO7PmSSVst1RnB/8GypYI/1G8RF6ygnPmp
	IroAOqeTy0wxT+/1FFv0+9LZjO9EB1mvIaXthCxQV+1m2nYUzF5LCVhRxLcfC+wWL38J
	YzFnXeLfX9rOfidf5Bw9pk6r/AktAXEyHKgaTNyLTaiwc/DtI+Q+N/+3XMsJ3bsSUD4H
	nJZUCUagLlGa+FjuRMlEb7SEEkA7XkbfaQV7d6pdMfxYULLqXEyT8ZRtMIKr9G0dihPc
	rOSw==
X-Gm-Message-State: AGRZ1gK7esoiTxMlVX1XuHPk4e7FkM6TxPwbSiWe0khIoHc0FIQLWtYV
	6YEB+AipQn/4S1lBvha6tZ0EfVkL
X-Google-Smtp-Source: AJdET5fqt/GsfCOPaj7IgugT5pA+ZHXcczM8qHt4EPpIUj3nuy17furgW+XzRyMoICXT1Z1hbUwBvQ==
X-Received: by 2002:a63:c24c:: with SMTP id l12mr2360258pgg.146.1542212337764; 
	Wed, 14 Nov 2018 08:18:57 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:7db3:34a2:3c95:1c57?
	([2601:202:4180:c33:7db3:34a2:3c95:1c57])
	by smtp.gmail.com with ESMTPSA id
	x194-v6sm41259773pfd.32.2018.11.14.08.18.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Nov 2018 08:18:56 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <1542148831-30197-1-git-send-email-akuster808@gmail.com>
	<CA+chaQfCoBFsOzLj6Vdf2tFX4hebD4bpqdXOMU4JstMScnJrBQ@mail.gmail.com>
	<9c0a4188-2393-aa18-6139-d6600d2507f7@gmail.com>
	<20181114151723.GA1417@jama>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e9b230a1-7544-f54c-c74c-02900bd15ac3@gmail.com>
Date: Wed, 14 Nov 2018 08:18:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181114151723.GA1417@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meta-oe: add selftest for sources.oe.org
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2018 16:18:57 -0000
X-Groupsio-MsgNum: 75384
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="24q2I3ObI26yDcssMM1APL56TrvMgWWAI"

--24q2I3ObI26yDcssMM1APL56TrvMgWWAI
Content-Type: multipart/mixed; boundary="eWeAAqNot0iG0RovsgYAcucKJwKkYIcd6";
 protected-headers="v1"
From: akuster808 <akuster808@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <e9b230a1-7544-f54c-c74c-02900bd15ac3@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: add selftest for sources.oe.org
References: <1542148831-30197-1-git-send-email-akuster808@gmail.com>
 <CA+chaQfCoBFsOzLj6Vdf2tFX4hebD4bpqdXOMU4JstMScnJrBQ@mail.gmail.com>
 <9c0a4188-2393-aa18-6139-d6600d2507f7@gmail.com> <20181114151723.GA1417@jama>
In-Reply-To: <20181114151723.GA1417@jama>

--eWeAAqNot0iG0RovsgYAcucKJwKkYIcd6
Content-Type: multipart/alternative;
 boundary="------------258A74C0D261BD400169515A"
Content-Language: en-US

--------------258A74C0D261BD400169515A
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On 11/14/18 7:17 AM, Martin Jansa wrote:
> On Tue, Nov 13, 2018 at 03:27:39PM -0800, akuster808 wrote:
>> On 11/13/18 2:55 PM, Martin Jansa wrote:
>>> Is this the right URL?=A0http://sources.openembedded.org/mirror/source=
s/
>>> returns 404
>> I thought it was.
>>
>> I get 404 with http://sources.openembedded.org/
>> <http://sources.openembedded.org/mirror/sources/>
> This link is http://sources.openembedded.org/mirror/sources/, that's why
> it's 404, with http://sources.openembedded.org/ you get 403, which is
> fine.
>>> meta/classes/mirrors.bbclass also uses:
>>> cvs://.*/.*=A0 =A0 =A0http://sources.openembedded.org/ \n \
>>> svn://.*/.*=A0 =A0 =A0http://sources.openembedded.org/ \n \
>>> git://.*/.*=A0 =A0 =A0http://sources.openembedded.org/ \n \
>>> hg://.*/.*=A0 =A0 =A0 http://sources.openembedded.org/ \n \
>>> bzr://.*/.*=A0 =A0 =A0http://sources.openembedded.org/ \n \
>>> p4://.*/.*=A0 =A0 =A0 http://sources.openembedded.org/ \n \
>>> osc://.*/.*=A0 =A0 =A0http://sources.openembedded.org/ \n \
>>> https?$://.*/.* http://sources.openembedded.org/ \n \
>>> ftp://.*/.*=A0 =A0 =A0http://sources.openembedded.org/ \n \
>>> npm://.*/?.*=A0 =A0 http://sources.openembedded.org/ \n \
>>>
>> I will change the URL's. thanks.
>>> without the /mirror/sources suffix, maybe it's copy & paste issue from
>>> downloads.yoctoproject.org <http://downloads.yoctoproject.org> which
>>> uses /mirror/sources?
>>> git://.*/.*=A0 =A0 =A0http://downloads.yoctoproject.org/mirror/sources=
/ \n \
>>>
>>> But if the test works for you, then something even worse is going on :=
).
>>
>> it found:
>>
>> Summary: 5 tasks failed:
>> =A0
>> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-g=
raphics/pango/pango_1.42.4.bb:do_fetch
>> =A0
>> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-g=
raphics/jpeg/libjpeg-turbo_2.0.0.bb:do_fetch
>> =A0
>> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-k=
ernel/dtc/dtc_1.4.7.bb:do_fetch
>> =A0
>> virtual:native:/home/akuster/OE/master/meta-openembedded/meta-networkin=
g/recipes-support/c-ares/c-ares_1.14.0.bb:do_fetch
>> =A0
>> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-d=
evtools/binutils/binutils_2.31.bb:do_fetch
>>
>> with url changes i see:
>>
>> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-g=
raphics/jpeg/libjpeg-turbo_2.0.0.bb:do_fetch
>> =A0
>> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-g=
raphics/pango/pango_1.42.4.bb:do_fetch
>> =A0
>> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-d=
evtools/elfutils/elfutils_0.174.bb:do_fetch
>> =A0
>> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-e=
xtended/libarchive/libarchive_3.3.3.bb:do_fetch
>> =A0
>> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-s=
upport/mpfr/mpfr_4.0.1.bb:do_fetch
>> =A0
>> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-k=
ernel/dtc/dtc_1.4.7.bb:do_fetch
>> =A0
>> virtual:native:/home/akuster/OE/master/meta-openembedded/meta-networkin=
g/recipes-support/c-ares/c-ares_1.14.0.bb:do_fetch
>> =A0
>> virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-d=
evtools/binutils/binutils_2.31.bb:do_fetch
>>
>> maybe the OE system needs to be checked out.
> I've checked it yesterday and it's broken since Aug 6.
>
> See IRC log from earlier today:
> 00:14 < armpit> sources.openembedded.org needs updating ; )
> 00:17 < JaMa> armpit: khem: the builder lost access to the fileserver as=
 shown in
> http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-rsync/475/co=
nsole
> 00:18 < JaMa> something changed between Aug 6th and 9th
>

/I think Khem is looking into it./

/Looks like the selftest has a use./

/- armin/

>>
>> - armin
>>
>>> On Tue, Nov 13, 2018 at 11:40 PM Armin Kuster <akuster808@gmail.com
>>> <mailto:akuster808@gmail.com>> wrote:
>>>
>>>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>>>     <mailto:akuster808@gmail.com>>
>>>     ---
>>>     =A0meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py | 30
>>>     ++++++++++++++++++++++
>>>     =A01 file changed, 30 insertions(+)
>>>     =A0create mode 100644 meta-oe/lib/oeqa/selftest/cases/meta_oe_sour=
ces.py
>>>
>>>     diff --git a/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
>>>     b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
>>>     new file mode 100644
>>>     index 0000000..79bebf5
>>>     --- /dev/null
>>>     +++ b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
>>>     @@ -0,0 +1,30 @@
>>>     +import os
>>>     +import re
>>>     +import glob as g
>>>     +import shutil
>>>     +import tempfile
>>>     +from oeqa.selftest.case import OESelftestTestCase
>>>     +from oeqa.utils.commands import runCmd, bitbake, get_bb_var,
>>>     get_bb_vars
>>>     +
>>>     +class MetaOESourceMirroring(OESelftestTestCase):
>>>     +=A0 =A0 # Can we download everything from the OpenEmbedded Source=
s
>>>     Mirror over http only
>>>     +=A0 =A0 def test_oe_source_mirror(self):
>>>     +=A0 =A0 =A0 =A0 self.write_config("""
>>>     +BB_ALLOWED_NETWORKS =3D " sources.openembedded.org
>>>     <http://sources.openembedded.org>"
>>>     +MIRRORS =3D ""
>>>     +DL_DIR =3D "${TMPDIR}/test_oe_downloads"
>>>     +PREMIRRORS =3D "\\
>>>     +=A0 =A0 bzr://.*/.*=A0 =A0http://sources.openembedded.org/mirror/=
sources/
>>>     \\n \\
>>>     +=A0 =A0 cvs://.*/.*=A0 =A0http://sources.openembedded.org/mirror/=
sources/
>>>     \\n \\
>>>     +=A0 =A0 git://.*/.*=A0 =A0http://sources.openembedded.org/mirror/=
sources/
>>>     \\n \\
>>>     +=A0 =A0 gitsm://.*/.* http://sources.openembedded.org/mirror/sour=
ces/
>>>     \\n \\
>>>     +=A0 =A0 hg://.*/.*=A0 =A0 http://sources.openembedded.org/mirror/=
sources/
>>>     \\n \\
>>>     +=A0 =A0 osc://.*/.*=A0 =A0http://sources.openembedded.org/mirror/=
sources/
>>>     \\n \\
>>>     +=A0 =A0 p4://.*/.*=A0 =A0 http://sources.openembedded.org/mirror/=
sources/
>>>     \\n \\
>>>     +=A0 =A0 svn://.*/.*=A0 =A0http://sources.openembedded.org/mirror/=
sources/
>>>     \\n \\
>>>     +=A0 =A0 ftp://.*/.*=A0 =A0 =A0
>>>     http://sources.openembedded.org/mirror/sources/ \\n \\
>>>     +=A0 =A0 http://.*/.*=A0 =A0
>>>     =A0http://sources.openembedded.org/mirror/sources/ \\n \\
>>>     +=A0 =A0 https://.*/.*=A0 =A0
>>>     http://sources.openembedded.org/mirror/sources/ \\n"
>>>     +=A0 =A0 """)
>>>     +
>>>     +=A0 =A0 =A0 =A0 bitbake("world --runall fetch")
>>>     --=20
>>>     2.7.4
>>>
>>>     --=20
>>>     _______________________________________________
>>>     Openembedded-devel mailing list
>>>     Openembedded-devel@lists.openembedded.org
>>>     <mailto:Openembedded-devel@lists.openembedded.org>
>>>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>

--------------258A74C0D261BD400169515A--

--eWeAAqNot0iG0RovsgYAcucKJwKkYIcd6--

--24q2I3ObI26yDcssMM1APL56TrvMgWWAI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJb7ErvAAoJEO6LtJn0Vuf5xyEQANhCTPkp+j1rft1/trTXWcIQ
1uFhe2JxkUXcvYba10x1QreRXMsfpIl5VyuPsIyr2+mum+CIX8ZQe6oJCtJQpTHb
2+kHGlr/KoC502r/yfTN9tXb4DCEr41XIx88pb5OLlHep1QmYKBDn344L2klSUIV
lbTdOfpbQ6n5iBIZAJONor2j28EX04ju9MwNjlTuvnknlWKessjiqfBsYIDwhA7U
j1Yj1/iS6PGJqR/Zhh9ofDiSxsu9kPApqaOlBGyOED8rjEbJVDo5Pcpp3YNC7Cgl
u9ERRXn8xbZ0cal86ktIjWR8ItydZ0EWQzy6WApdt9dfyZ0uNqCWKkbP3KQJ8O6y
/nS2W1AK+yc+g1U0xG9nEOm493fjO1+NaQD5FFe/M+w8psEMdkUN00lkHMESKVb3
LIj85zok+oETmsGirRU+kkk1PQ7HI1GAMzASGgKB7PXOux+FTFPROtPBCb4MC0Co
E2OABLbje69o9goRamW5qPfWsbYrHxcnDVM/W8sdffrYSTk+MYGHk23+2VAg/24l
rL7ElEoCPk5MH1fcRSOAFhiFcyeQn9/9w1mDAU8IrHBXdPyA6ud3LKYDW34Y5y0K
RHpaBM44nnhf5ItPNRNRvSFzsDWaLR9YV4ZHUZc47Rzt2uzXGTU1RYDWACucqROK
DeOtvPbZMTZl9i49NhI6
=xagR
-----END PGP SIGNATURE-----

--24q2I3ObI26yDcssMM1APL56TrvMgWWAI--

Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id B27336C3DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 23:27:40 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id b5so371396plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 15:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=lRcqujf3xobomvpR8+WoOlNxNrBHiN8sBWQYjHhW77U=;
	b=CYSSJP/Eg1cAyJ63Axa71Ge52IFb0ekhqdTO4rFAPJ67XKg/accyEtBrty/mOEtreI
	uX9JDpWlr5PmonZ0ggE0xG6ZEg74hqDI+lIEoIxBzFT0ehvJGRhipxRcbUgshQPW7eJp
	AD+mFfbIY7miSFF2qkNHrK1y5fkNrRnXHG+Pnp0y+YSEy71Zewt1RAc6ING50TIvp3cB
	7//IlBOsTL7TF4eJUX3ToJ0FP2NYbsT4ZxU87XyeTLKlUWhrkJTNSkqslFABp5yzr2Ek
	iMMOoYBjBIl2d0F4cMrMzbmBh6g8GuvcZXPe2suFV6P+Vo4oc0w4oPmkBczzk9UMOzdO
	QTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=lRcqujf3xobomvpR8+WoOlNxNrBHiN8sBWQYjHhW77U=;
	b=ohdIDwloLc30ic4J8KVB/NlLaje4fiqCb9+BNwbGU9HwRjlWqgOB4SoIGYOjd5RHFV
	E7nuAXMoB55HQ8vTWrgnPVgHOJAljPohW3E6EcQGzuuyRwoTxNUtMQ4lyXC1WwuJEG9V
	Kfv8IJBwII51mTVETQIsSFTaGBm0QFAKhwS3yXY4yzbG1XFjOReML+u0CL2BN0YbeqM/
	ewIEtt4B/h1gmNNJhrqgvPQPOorAnWf84KUGwo5mwVf2RdUy1Tge0HSvapw6KPYljeOJ
	Vt4o29KIpAQZAwW20cr9+h5FewGutpi6BS9st0STjw6TDEsjuGweCBBeoTdkHV/jidkQ
	XRlA==
X-Gm-Message-State: AGRZ1gIoKpl7dM8WdkZnUJmyvlR0wGvedqtIZMj0Ig35Ivf08/iAtWiz
	2nCLHxIQavmkUL1kqLmqKTrbuP1h
X-Google-Smtp-Source: AJdET5dmJLrfucoXbqLsUGtiarpZzrQhzIPt/vCBm79AuM42n+L4w4bfkq/CMkIgyD0uBKf9r9g/uA==
X-Received: by 2002:a17:902:27a8:: with SMTP id
	d37-v6mr7193741plb.0.1542151661385; 
	Tue, 13 Nov 2018 15:27:41 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:75ee:9e74:d500:909d?
	([2601:202:4180:c33:75ee:9e74:d500:909d])
	by smtp.gmail.com with ESMTPSA id
	78sm2305015pft.184.2018.11.13.15.27.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 15:27:40 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <1542148831-30197-1-git-send-email-akuster808@gmail.com>
	<CA+chaQfCoBFsOzLj6Vdf2tFX4hebD4bpqdXOMU4JstMScnJrBQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <9c0a4188-2393-aa18-6139-d6600d2507f7@gmail.com>
Date: Tue, 13 Nov 2018 15:27:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQfCoBFsOzLj6Vdf2tFX4hebD4bpqdXOMU4JstMScnJrBQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Nov 2018 23:27:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 11/13/18 2:55 PM, Martin Jansa wrote:
> Is this the right URL?=C2=A0http://sources.openembedded.org/mirror/sour=
ces/
> returns 404

I thought it was.

I get 404 with http://sources.openembedded.org/
<http://sources.openembedded.org/mirror/sources/>

>
> meta/classes/mirrors.bbclass also uses:
> cvs://.*/.*=C2=A0 =C2=A0 =C2=A0http://sources.openembedded.org/ \n \
> svn://.*/.*=C2=A0 =C2=A0 =C2=A0http://sources.openembedded.org/ \n \
> git://.*/.*=C2=A0 =C2=A0 =C2=A0http://sources.openembedded.org/ \n \
> hg://.*/.*=C2=A0 =C2=A0 =C2=A0 http://sources.openembedded.org/ \n \
> bzr://.*/.*=C2=A0 =C2=A0 =C2=A0http://sources.openembedded.org/ \n \
> p4://.*/.*=C2=A0 =C2=A0 =C2=A0 http://sources.openembedded.org/ \n \
> osc://.*/.*=C2=A0 =C2=A0 =C2=A0http://sources.openembedded.org/ \n \
> https?$://.*/.* http://sources.openembedded.org/ \n \
> ftp://.*/.*=C2=A0 =C2=A0 =C2=A0http://sources.openembedded.org/ \n \
> npm://.*/?.*=C2=A0 =C2=A0 http://sources.openembedded.org/ \n \
>
I will change the URL's. thanks.
> without the /mirror/sources suffix, maybe it's copy & paste issue from
> downloads.yoctoproject.org <http://downloads.yoctoproject.org> which
> uses /mirror/sources?
> git://.*/.*=C2=A0 =C2=A0 =C2=A0http://downloads.yoctoproject.org/mirror=
/sources/ \n \
>
> But if the test works for you, then something even worse is going on :)=
=2E


it found:

Summary: 5 tasks failed:
=C2=A0
virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-gra=
phics/pango/pango_1.42.4.bb:do_fetch
=C2=A0
virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-gra=
phics/jpeg/libjpeg-turbo_2.0.0.bb:do_fetch
=C2=A0
virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-ker=
nel/dtc/dtc_1.4.7.bb:do_fetch
=C2=A0
virtual:native:/home/akuster/OE/master/meta-openembedded/meta-networking/=
recipes-support/c-ares/c-ares_1.14.0.bb:do_fetch
=C2=A0
virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-dev=
tools/binutils/binutils_2.31.bb:do_fetch

with url changes i see:

virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-gra=
phics/jpeg/libjpeg-turbo_2.0.0.bb:do_fetch
=C2=A0
virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-gra=
phics/pango/pango_1.42.4.bb:do_fetch
=C2=A0
virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-dev=
tools/elfutils/elfutils_0.174.bb:do_fetch
=C2=A0
virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-ext=
ended/libarchive/libarchive_3.3.3.bb:do_fetch
=C2=A0
virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-sup=
port/mpfr/mpfr_4.0.1.bb:do_fetch
=C2=A0
virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-ker=
nel/dtc/dtc_1.4.7.bb:do_fetch
=C2=A0
virtual:native:/home/akuster/OE/master/meta-openembedded/meta-networking/=
recipes-support/c-ares/c-ares_1.14.0.bb:do_fetch
=C2=A0
virtual:native:/home/akuster/OE/master/openembedded-core/meta/recipes-dev=
tools/binutils/binutils_2.31.bb:do_fetch

maybe the OE system needs to be checked out.


- armin

>
> On Tue, Nov 13, 2018 at 11:40 PM Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>     =C2=A0meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py | 30
>     ++++++++++++++++++++++
>     =C2=A01 file changed, 30 insertions(+)
>     =C2=A0create mode 100644 meta-oe/lib/oeqa/selftest/cases/meta_oe_so=
urces.py
>
>     diff --git a/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
>     b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
>     new file mode 100644
>     index 0000000..79bebf5
>     --- /dev/null
>     +++ b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
>     @@ -0,0 +1,30 @@
>     +import os
>     +import re
>     +import glob as g
>     +import shutil
>     +import tempfile
>     +from oeqa.selftest.case import OESelftestTestCase
>     +from oeqa.utils.commands import runCmd, bitbake, get_bb_var,
>     get_bb_vars
>     +
>     +class MetaOESourceMirroring(OESelftestTestCase):
>     +=C2=A0 =C2=A0 # Can we download everything from the OpenEmbedded S=
ources
>     Mirror over http only
>     +=C2=A0 =C2=A0 def test_oe_source_mirror(self):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config("""
>     +BB_ALLOWED_NETWORKS =3D " sources.openembedded.org
>     <http://sources.openembedded.org>"
>     +MIRRORS =3D ""
>     +DL_DIR =3D "${TMPDIR}/test_oe_downloads"
>     +PREMIRRORS =3D "\\
>     +=C2=A0 =C2=A0 bzr://.*/.*=C2=A0 =C2=A0http://sources.openembedded.=
org/mirror/sources/
>     \\n \\
>     +=C2=A0 =C2=A0 cvs://.*/.*=C2=A0 =C2=A0http://sources.openembedded.=
org/mirror/sources/
>     \\n \\
>     +=C2=A0 =C2=A0 git://.*/.*=C2=A0 =C2=A0http://sources.openembedded.=
org/mirror/sources/
>     \\n \\
>     +=C2=A0 =C2=A0 gitsm://.*/.* http://sources.openembedded.org/mirror=
/sources/
>     \\n \\
>     +=C2=A0 =C2=A0 hg://.*/.*=C2=A0 =C2=A0 http://sources.openembedded.=
org/mirror/sources/
>     \\n \\
>     +=C2=A0 =C2=A0 osc://.*/.*=C2=A0 =C2=A0http://sources.openembedded.=
org/mirror/sources/
>     \\n \\
>     +=C2=A0 =C2=A0 p4://.*/.*=C2=A0 =C2=A0 http://sources.openembedded.=
org/mirror/sources/
>     \\n \\
>     +=C2=A0 =C2=A0 svn://.*/.*=C2=A0 =C2=A0http://sources.openembedded.=
org/mirror/sources/
>     \\n \\
>     +=C2=A0 =C2=A0 ftp://.*/.*=C2=A0 =C2=A0 =C2=A0
>     http://sources.openembedded.org/mirror/sources/ \\n \\
>     +=C2=A0 =C2=A0 http://.*/.*=C2=A0 =C2=A0
>     =C2=A0http://sources.openembedded.org/mirror/sources/ \\n \\
>     +=C2=A0 =C2=A0 https://.*/.*=C2=A0 =C2=A0
>     http://sources.openembedded.org/mirror/sources/ \\n"
>     +=C2=A0 =C2=A0 """)
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake("world --runall fetch")
>     --=20
>     2.7.4
>
>     --=20
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


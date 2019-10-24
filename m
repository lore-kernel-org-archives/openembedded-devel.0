Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 006CA7F9AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 23:00:53 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 71so55705qkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DpAY6Wn52s4OPH8DU9YKFyctSs8cH/BlpKb75hFJirw=;
	b=Hf4HA3hkS4aOn6QTqlpe62324OQYZrlEWmsonSWYNsdJDkuHpTf0ngetQ5ZGTf4iJN
	BWA0t9hGalw3ELekZz4RgdQO3gi/gun8Bx86RbT/9AQQFG3FRUJgl2C62RGMSZRcjHXg
	1cJewdD1VJ/ckn0qaxM90IzWma4Z9sv+9uoEs2Wvqg/pJyiJsOj/8v97cukFbrmNw2zR
	6MgrvNGs82omgx0adCwDCPd85WEmvk6HNAI+kfcFLbqhYSt+/GH6vSO6X7C/Z1CAgBIt
	k3fLzT8HePjwZWzbeL1qibQyzxyyBLQMNNdFPfZ7s8tlTyaKZZ0YH3gfALU9eMWRayR6
	TKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DpAY6Wn52s4OPH8DU9YKFyctSs8cH/BlpKb75hFJirw=;
	b=KCIcU7xIE6lSIFwolbMgXTlSORsUpB+f2lIPMCRSnx3CEZuUaXPxUuSTH0zEcj6Qq4
	QQjf4oG3hJ9EUrAevcvpd7s8utpoWSawVKVCOjz89KY7fdjTfaajBEDlJzT+5ioMt+na
	PL2qBUp0aFllEAMgBWn8LSAMibSx6VKT3VeK0yerD3SHQ9Sbgdx+h8SPPDOv50UCDZB/
	QqyZUsrP+VEXuF9QZw+s8Yd88buMf/zmGifknjFzsH9QE4ZLqR6W9uu6f8OHtT1le+6b
	pala52+tJjq/GTsWgUv3O3PP+U3Gt9zxEJKKX4TLuySxBsPGoXdaooAYvD2G3NEPU7T3
	dEAQ==
X-Gm-Message-State: APjAAAXQkKKjknaKnYDPoovFaLTdVl/PHc8NqAbnX8UCSR1yV6Q/qksZ
	cHmj9BG0H+3qV2lTScjad1t8Zm01YYVNKpXlaXo=
X-Google-Smtp-Source: APXvYqy2L4ijQuDDNKns9jZWZEn5rHcEp5juBfAX/Fvqsewly1sthdNWe/HBW3wGjCLO6EsFC1rCblqZjr8GE9WVCV0=
X-Received: by 2002:a37:b985:: with SMTP id j127mr161147qkf.337.1571958054118; 
	Thu, 24 Oct 2019 16:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191009123218.19821-1-m.schwan@phytec.de>
	<84402ad74c6fc2da7db63f59d9082c35b6686ee4.camel@phytec.de>
	<CAMKF1srpMJYKpH05Z5Ubv7CB_nAQ3O70-z3V0O+MwedsOQrtEA@mail.gmail.com>
In-Reply-To: <CAMKF1srpMJYKpH05Z5Ubv7CB_nAQ3O70-z3V0O+MwedsOQrtEA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2019 00:00:27 +0100
Message-ID: <CAMKF1sotEEJe9NwkD5+pht-MZW+WKAY+CKjyJ7h5miovyVZs1w@mail.gmail.com>
To: Martin Schwan <m.schwan@phytec.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] python-waitress: Add recipes
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
X-List-Received-Date: Thu, 24 Oct 2019 23:00:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Now I see that its already in master see

https://git.openembedded.org/meta-openembedded/commit/?id=3Daaeb37656349db7=
f8562bf0ac1c11685f20a5212

On Thu, Oct 24, 2019 at 1:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Martin
>
> Thanks for following up on this usually patches appear on patchwork.opene=
mbedded.org and I pick it up from there it seems either I missed it or it d=
id not appear on patchwork
>
> If it=E2=80=99s not staged in master-next and there is no response to it =
then it went missing I am traveling these days so a bit sporadic on respons=
es I will check it next time I am near computer and stage it if all is ok
>
> Thanks for your contribution
>
> On Thu, Oct 24, 2019 at 12:38 PM Martin Schwan <m.schwan@phytec.de> wrote=
:
>>
>> Hi,
>>
>> just wanted to kindly ask if anyone had time reviewing this patch? This
>> is my first patch for this project, maybe I am missing something. Is
>> there anything that stops this from being merged?
>>
>> On Wed, 2019-10-09 at 14:32 +0200, Martin Schwan wrote:
>> > Waitress is a pure-Python WSGI server.
>> >
>> > Signed-off-by: Martin Schwan <m.schwan@phytec.de>
>> > ---
>> > Changes in v2:
>> >  - Fixed missing "K" in "LIC_FILES_CHKSUM"
>> > ---
>> >  .../recipes-devtools/python/python-waitress.inc        | 10 +++++++++=
+
>> >  .../recipes-devtools/python/python-waitress_1.3.1.bb   |  2 ++
>> >  .../recipes-devtools/python/python3-waitress_1.3.1.bb  |  2 ++
>> >  3 files changed, 14 insertions(+)
>> >  create mode 100644 meta-python/recipes-devtools/python/python-waitres=
s.inc
>> >  create mode 100644 meta-python/recipes-devtools/python/python-waitres=
s_1.3.1.bb
>> >  create mode 100644 meta-python/recipes-devtools/python/python3-waitre=
ss_1.3.1.bb
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python-waitress.inc b=
/meta-python/recipes-devtools/python/python-waitress.inc
>> > new file mode 100644
>> > index 000000000..732c31dbd
>> > --- /dev/null
>> > +++ b/meta-python/recipes-devtools/python/python-waitress.inc
>> > @@ -0,0 +1,10 @@
>> > +SUMMARY =3D "A WSGI server for Python"
>> > +DESCRIPTION =3D "Waitress is meant to be a production-quality pure-Py=
thon WSGI \
>> > +    server with very acceptable performance."
>> > +HOMEPAGE =3D "https://github.com/Pylons/waitress"
>> > +SECTION =3D "devel/python"
>> > +LICENSE =3D "ZPL-2.1"
>> > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D78ccb3640dc841e1baecb3=
e27a6966b2"
>> > +
>> > +SRC_URI[md5sum] =3D "d9132d313de0c5e0fec34ef9ede5442e"
>> > +SRC_URI[sha256sum] =3D "278e09d6849acc1365404bbf7d790d0423b159802e850=
c726e8cd0a126a2dac7"
>> > diff --git a/meta-python/recipes-devtools/python/python-waitress_1.3.1=
.bb b/meta-python/recipes-devtools/python/python-waitress_1.3.1.bb
>> > new file mode 100644
>> > index 000000000..26a628ea0
>> > --- /dev/null
>> > +++ b/meta-python/recipes-devtools/python/python-waitress_1.3.1.bb
>> > @@ -0,0 +1,2 @@
>> > +inherit setuptools pypi
>> > +require python-waitress.inc
>> > diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.3.=
1.bb b/meta-python/recipes-devtools/python/python3-waitress_1.3.1.bb
>> > new file mode 100644
>> > index 000000000..83c8b66d8
>> > --- /dev/null
>> > +++ b/meta-python/recipes-devtools/python/python3-waitress_1.3.1.bb
>> > @@ -0,0 +1,2 @@
>> > +inherit setuptools3 pypi
>> > +require python-waitress.inc
>> > --
>> > 2.23.0
>> >
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


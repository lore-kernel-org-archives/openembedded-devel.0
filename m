Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E5D4B60269
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Dec 2016 23:32:02 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i88so8238119pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 15:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=BYViE5NQh3XtzCAFyBk1XmGvyZ8yJzyAbLwO6pKdQE4=;
	b=nF8yoRy9xeXCgUX2hWO0C0Yt9j6d5D0EAI1O6/aVzO93MtyCIT5EzAkwhA2Z2o2Pyu
	FwYxqVMRR97b3svcAxnbHiwvWfy97uNUypi9x0EIbkIFQdCdOaax4VPZtMfzxfezOg2l
	SBCW4gwL/CC27j+Uu28O1x1U9hYAQlzKWcpXXKCYIJEfkGr9GLIwNfeoZOjvt40nZx0D
	NzQPzsGd8BmqXF9VG89qUGd6XBoDxQK2261tJAjFs90d8qgAhOWCsJztj5TXUzCEmYa+
	wASvpy+u1t0iYPl9NvG0Qu9X+YBtSIj6VNlIoSL49C+KgLBa3guIDdHMVdejPi4NFml7
	o/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=BYViE5NQh3XtzCAFyBk1XmGvyZ8yJzyAbLwO6pKdQE4=;
	b=GjOGRIWOH+JkEvNkxYmH75s9//kmzfPygUmfnbAmZ285Ic8rBNSs30vuIEMvwHlmAO
	LbOBZB/yo5a/saNbX1DB28Z+LfpQ2YaRNDtAkeAnXaAE5OQFRJ/3cLidlKIdBJlIlt+Q
	QIleYIoLWFmJcfgJjl4ttOI6g6J4NUR8UeAnaFlpRi2dzhSv4cvSkr7GYUgXk5QevH+X
	l269b6gDDNLqYdYE8e5uNwGZ+vfYbW7/mrMTnWNdXZbLqqJIwLqa27vmfHQLoaN00jYC
	15NFmKp35g6wJyYKP2G3G4+CRjXLHj+FgpuyYnLqnDjtYP4usfXbxZzl4M28yy8wGYkK
	qpog==
X-Gm-Message-State: AKaTC03BHcDS83dQxnzNcVwW3m/UGTWIqREWynU06oyf9hAwi8EIC/QH95djZ1m8AGad/A==
X-Received: by 10.99.128.198 with SMTP id j189mr106227174pgd.151.1480980723716;
	Mon, 05 Dec 2016 15:32:03 -0800 (PST)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r21sm29814247pfd.44.2016.12.05.15.32.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 15:32:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Mon, 5 Dec 2016 15:32:00 -0800
References: <1480979306-21331-1-git-send-email-schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1480979306-21331-1-git-send-email-schnitzeltony@googlemail.com>
Message-Id: <689CB891-7D18-4FEB-9BE5-DF2CD80B066E@gmail.com>
X-Mailer: Apple Mail (2.3251)
Subject: Re: [meta-xfce][PATCH 1/2] exo: fix build after perl update
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
X-List-Received-Date: Mon, 05 Dec 2016 23:32:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Dec 5, 2016, at 3:08 PM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> fixes:
>=20
> | checking for perl5... no
> | checking for perl... perl
> | checking for perl module URI::Escape... no
> | checking for perl module URI::file... no
> | checking for perl module URI::URL... no
> | configure: error: Atleast one of the required Perl modules =
(URI::Escape, URI::file and URI::URL) was not found on your system
>=20

I was seeing same errors. Should this be using native perl instead ?

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
> meta-xfce/recipes-xfce/exo/exo_0.11.1.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb =
b/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
> index c145ce0..733ba24 100644
> --- a/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
> +++ b/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
> @@ -24,6 +24,8 @@ SRC_URI_append_class-native =3D " \
> SRC_URI[md5sum] =3D "866292556586facb034191aa66431697"
> SRC_URI[sha256sum] =3D =
"c70c47f690284a5cb4f507dd89088efbdd8123506f924e33a5f97aab74eb97d4"
>=20
> +export PERL =3D "${bindir}/perl"
> +
> PACKAGES =3D+ "exo-csource"
>=20
> # Note: python bindings did not work in oe-dev and are about to be =
moved to
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



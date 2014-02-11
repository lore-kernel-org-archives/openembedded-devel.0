Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id CF70A6E8E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 03:46:25 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lf10so7077886pab.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 19:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=QZH1lvhnP5EN99ESlba6KVWV9s2iaN/mKdP10uggkKI=;
	b=RmRnvI+yImW/b3giHXKtoqFHyqQPBh5pYTKM6Ts4BgpIGzSMAafwLJKaN67BhUK/jr
	7dtR2PrhXLkmd22CGeCFVofjaHz0BFMMJKzL8q+BXyczqEAs14oe3EsSVdCXuwdbQInw
	hoGa+aElAYt7tMKEo45FaXASrp8EljQpM0SzRrpS9OY80c9dwIRFQ1n/75OCC4JIDBEe
	7WO4SzzOWxrKljzLE0NzrX5Ok1Qy22WMF3SUUfrfMxmj1Rm33s9syGkUuEG9zpp9ph4H
	WJO7WF2ITRy55Euel2iNJ4WwOq+KC7/gVYjuy8tcS2GKmxN76uXVVPxaq1kwCo8zm9Au
	E/Cw==
X-Received: by 10.66.121.234 with SMTP id ln10mr29665082pab.20.1392090386825; 
	Mon, 10 Feb 2014 19:46:26 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	ns7sm47658826pbc.32.2014.02.10.19.46.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Feb 2014 19:46:25 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1384772140-11095-1-git-send-email-ross.burton@intel.com>
Date: Mon, 10 Feb 2014 19:46:22 -0800
Message-Id: <5A9624FF-2937-41FE-A4D9-FC7DEC339D0D@gmail.com>
References: <1384772140-11095-1-git-send-email-ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1827)
Subject: Re: [meta-oe][PATCH] python-mako: use BBCLASSEXTEND instead of native recipe
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
X-List-Received-Date: Tue, 11 Feb 2014 03:46:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Nov 18, 2013, at 2:55 AM, Ross Burton <ross.burton@intel.com> wrote:

> There isn't a need for a separate native recipe, so use BBCLASSEXTEND =
and
> overrides.

you also seems to b creating nativesdk versions. Are they needed or just =
need to be documented in commit msg

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb |    5 =
-----
> meta-oe/recipes-devtools/python/python-mako_0.7.2.bb        |    3 +++
> 2 files changed, 3 insertions(+), 5 deletions(-)
> delete mode 100644 =
meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb
>=20
> diff --git =
a/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb =
b/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb
> deleted file mode 100644
> index 05479db..0000000
> --- a/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require python-mako_${PV}.bb
> -inherit native pythonnative
> -
> -DEPENDS =3D "python-native"
> -RDEPENDS_${PN} =3D ""
> diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb =
b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
> index 9e381f3..1d2bdd7 100644
> --- a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
> +++ b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
> @@ -17,3 +17,6 @@ RDEPENDS_${PN} =3D "python-threading \
>                   python-netclient \
>                   python-html \
> "
> +RDEPENDS_${PN}_class-native =3D ""
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



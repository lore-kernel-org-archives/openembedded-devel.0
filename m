Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E9EA171A5B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 17:55:54 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so13975478pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 09:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=WJTIE4/NwgGE40L6NYmTgJMFt1mzEJPd4H7ywJ3oggA=;
	b=SLbGuwIK4nzyCqAg2+5Olk9d5SIIzNVLa+KhNEvhL8dqRMIkEGNtosepRGBoSi0KpS
	QK3jI+ktU9Wcwp1v4/U3nPAGUsA6IcDbNTWLwrz5IFaRHECBapoZT+bUfTf4N7qxLwOk
	h+mlm0Dj+W/6igp9xiLh4fFqpqKEtRPiPvWcSkaqoGIY4p+x5OW85bDVU1sVkAatB0xc
	MJfx6CM1882crHsQ56fHDoLAMK2AyA/r6HGYDo+pv1NaFlnF3on0ZmBgBkpWHTNU5/fT
	RCfAH1YkocP+h/nVL+gaJ3ZoN/FbbMv19jJPTnfMo0Bv/ZBWJn6Pl9pi9wQ5UAXADWZh
	6Mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=WJTIE4/NwgGE40L6NYmTgJMFt1mzEJPd4H7ywJ3oggA=;
	b=B3poZsOATe2P/QNMyDi3Lv06sjqPtt9h1EjycQ1RsjRCxfuh8agnQCyvwdlUgARIXP
	Rfz7/uDVFLLNWMaUIWEYZE2Pa+d5n4TN0Vcirt7xAKt+noGQ2HXnxlSKSF8Pg8HbenBa
	SlRpOnnFedgwbleyOJEQ+ATbgOWGqsJNryoup/ZH6Cgqw/EmBp6Qc31gIgtz6YyP2R18
	2k0rxS0cgXs0Iuboy7ucHM9CA84dJbxuYBaNrggXp2JD/jbMIDf/PzvzRJMmhLNWBu/n
	Nu2ursE2fiq2BVnNtO6FX16hfOYzReyG2cC5BpjZV9xzAn/klH4+5EfcxPXFounFIt65
	uvjA==
X-Gm-Message-State: AKaTC03NWk/vKoB2PpPyrLXOsZTJkZWYNh+AvMsFAiDoac8LTU331O7KHDPwXTxgQQ7mBQ==
X-Received: by 10.99.234.21 with SMTP id c21mr1953058pgi.166.1479491756081;
	Fri, 18 Nov 2016 09:55:56 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:c4:5d55:7c7:2db8])
	by smtp.gmail.com with ESMTPSA id
	o126sm1392168pga.34.2016.11.18.09.55.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Nov 2016 09:55:55 -0800 (PST)
To: openembedded-devel@lists.openembedded.org,
	"Davis, Michael" <michael.davis@essvote.com>
References: <1479486866-19082-1-git-send-email-michael.davis@essvote.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <0fc00b6f-e526-d7c8-5a68-46fe42b3a24a@gmail.com>
Date: Fri, 18 Nov 2016 09:55:44 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <1479486866-19082-1-git-send-email-michael.davis@essvote.com>
Subject: Re: [meta-browser][PATCH] chromium: Fix ILL_ILLOPN signal in sandbox
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
X-List-Received-Date: Fri, 18 Nov 2016 17:55:56 -0000
X-Groupsio-MsgNum: 63895
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="JAfCamK9FIUxsLo4P6Tw13Ea24KVK1IqD"

--JAfCamK9FIUxsLo4P6Tw13Ea24KVK1IqD
Content-Type: multipart/mixed; boundary="69JN2gfSaQCTxlbNK2E49h40W0nueP75V";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
 "Davis, Michael" <michael.davis@essvote.com>
Message-ID: <0fc00b6f-e526-d7c8-5a68-46fe42b3a24a@gmail.com>
Subject: Re: [oe] [meta-browser][PATCH] chromium: Fix ILL_ILLOPN signal in
 sandbox
References: <1479486866-19082-1-git-send-email-michael.davis@essvote.com>
In-Reply-To: <1479486866-19082-1-git-send-email-michael.davis@essvote.com>

--69JN2gfSaQCTxlbNK2E49h40W0nueP75V
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/18/16 8:34 AM, Davis, Michael wrote:
> Fix Aw Snap! error when running chromium 52 in Morty with sandbox enabl=
ed.
>=20

The patch is fine. However, this issue is seen in qtwebengine few moths a=
go
please add references to the commit so we can track this patch with futur=
e
upgrades .e.g.

http://code.qt.io/cgit/qt/qtwebengine-chromium.git/commit/?h=3D49-based&i=
d=3Db12ffcd411d4776f7120ccecb3be34344d930d2b

> Signed-off-by: Michael Davis <michael.davis@essvote.com>
> ---
>  .../chromium/chromium/chromium/unset-madv-free.patch      | 15 +++++++=
++++++++
>  recipes-browser/chromium/chromium_52.0.2743.76.bb         |  1 +
>  2 files changed, 16 insertions(+)
>  create mode 100644 recipes-browser/chromium/chromium/chromium/unset-ma=
dv-free.patch
>=20
> diff --git a/recipes-browser/chromium/chromium/chromium/unset-madv-free=
=2Epatch b/recipes-browser/chromium/chromium/chromium/unset-madv-free.pat=
ch
> new file mode 100644
> index 0000000..15d4982
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium/chromium/unset-madv-free.patch
> @@ -0,0 +1,15 @@
> +diff -Naur chromium-52.0.2743.76/third_party/WebKit/Source/wtf/allocat=
or/PageAllocator.cpp chromium-52.0.2743.76b/third_party/WebKit/Source/wtf=
/allocator/PageAllocator.cpp
> +--- chromium-52.0.2743.76/third_party/WebKit/Source/wtf/allocator/Page=
Allocator.cpp	2016-07-15 17:02:49.000000000 -0500
> ++++ chromium-52.0.2743.76b/third_party/WebKit/Source/wtf/allocator/Pag=
eAllocator.cpp	2016-11-18 09:13:01.109731385 -0600
> +@@ -41,6 +41,11 @@
> + #include <errno.h>
> + #include <sys/mman.h>
> +=20
> ++#if OS(LINUX) && defined(MADV_FREE)
> ++// Added in Linux 4.5, but it breaks the sandbox.
> ++#undef MADV_FREE
> ++#endif
> ++
> + #ifndef MADV_FREE
> + #define MADV_FREE MADV_DONTNEED
> + #endif
> diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb b/recipe=
s-browser/chromium/chromium_52.0.2743.76.bb
> index 14b519c..5be3c32 100644
> --- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
> +++ b/recipes-browser/chromium/chromium_52.0.2743.76.bb
> @@ -9,6 +9,7 @@ SRC_URI +=3D "\
>          file://0005-Override-root-filesystem-access-restriction.patch =
\
>          file://chromium/0011-Replace-readdir_r-with-readdir.patch \
>          file://chromium/remove-Werror.patch \
> +        file://chromium/unset-madv-free.patch \
>          ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file=
://component-build.gypi', '', d)} \
>          ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', '=
file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', =
d)} \
>  "
>=20


--69JN2gfSaQCTxlbNK2E49h40W0nueP75V--

--JAfCamK9FIUxsLo4P6Tw13Ea24KVK1IqD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgvQKoACgkQuwUzVZGdMxSbxgCfbNnF3Lf5+6ZDCASrp6weSMhS
SCEAnRMA0K+HfTboPFhWgPjoNGmJzSU7
=SpsW
-----END PGP SIGNATURE-----

--JAfCamK9FIUxsLo4P6Tw13Ea24KVK1IqD--

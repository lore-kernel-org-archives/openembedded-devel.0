Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id BF56B72A78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 14:27:11 +0000 (UTC)
Received: by wgin8 with SMTP id n8so30352071wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=nY/2uYqr2SwsnSW0yuDt7N2A6igXTtLRn0LL+DwlIVI=;
	b=GbDvUHLlpkWbxkL9o/FE9paMLebC0zSeUH52GBgNRSBgiPLk6FYWjC8w7YBn2LsX0c
	5QVcdfTKrVaq4cOwJzPx2S5DxSKTQzwPT9ttzd/tUIWWPfm5v/UnBCdGtv6nZUI3OlGe
	4Z6T9iPXGf/Jlp/VfoXi0bD8xjsisVBBMU9PhstptcOkcrfQ2YjRqkJ5jzFIfzzet1Sb
	ey485rN64nGyV/MK75ybijJN/E3smJd5rGV+6y6U+kX/iFzJZXoZr5o/5oa4EIN+fTTZ
	EfKV25L9jkuT5drXkK0SfMQf73LaTM7lPzBwaPW5S9VTBwyDkUOt/01WSSIcLGscmtFq
	hqTA==
X-Received: by 10.194.235.71 with SMTP id uk7mr43090132wjc.13.1430317631770;
	Wed, 29 Apr 2015 07:27:11 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ei4sm21422821wib.22.2015.04.29.07.27.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Apr 2015 07:27:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Apr 2015 16:27:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150429142718.GA2369@jama>
References: <1620830615.3767281.1430230294080.JavaMail.root@openwide.fr>
	<1242158112.3767308.1430230347909.JavaMail.root@openwide.fr>
MIME-Version: 1.0
In-Reply-To: <1242158112.3767308.1430230347909.JavaMail.root@openwide.fr>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: fix typo
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
X-List-Received-Date: Wed, 29 Apr 2015 14:27:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2015 at 04:12:27PM +0200, Alexis Cellier wrote:
> In the qt.conf file created, fix typo on "TargetSpec" (was "TartgetSpec").

How was this tested before sending?

In my builds it causes:
| Cannot read /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtbase/5.4.1+g=
itAUTOINC+f58e882b75-r0/build/mkspecs/linux-oe-g++/qmake.conf: No such file=
 or directory
| Could not read qmake configuration file /OE/build/oe-core/tmp-glibc/work/=
i586-oe-linux/qtbase/5.4.1+gitAUTOINC+f58e882b75-r0/build/mkspecs/linux-oe-=
g++/qmake.conf.

So I agree it's a typo, but if we cannot make it work, then we should
remove the line completely.

>=20
> Signed-off-by: Alexis Cellier <alexis.cellier@openwide.fr>
> ---
>  classes/qmake5_base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 44575c4..dbdaf78 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -79,7 +79,7 @@ HostBinaries =3D ${OE_QMAKE_PATH_HOST_BINS}
>  HostData =3D ${OE_QMAKE_PATH_HOST_DATA}
>  HostLibraries =3D ${OE_QMAKE_PATH_HOST_LIBS}
>  HostSpec =3D ${OE_QMAKESPEC}
> -TartgetSpec =3D ${OE_XQMAKESPEC}
> +TargetSpec =3D ${OE_XQMAKESPEC}
>  ExternalHostBinaries =3D ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
>  Sysroot =3D ${STAGING_DIR_TARGET}
>  EOF
> --=20
> 2.3.5
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lzvp1-0005AH-3C
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 May 2009 18:42:47 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1554688yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 May 2009 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=1JTxYA/jW9YDxn8yR4+30AJfitWCYU6hOj3kHu2odsU=;
	b=oa1gc3e9cU+v84prdi/JBC6A3ztiuaHYr2cFz60ukdvfXWocbb28nJ8wbxShDoBt7q
	/Q6XSj7hoazIOCjlgFP8w0J1rLcKRSJrBEBArwEJD3UPPVAgfThvMLpggGv68/EFf2kI
	ZDqjr5YAjlpuqKogzPkllvAv9DSa1FiMeJybU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=QUgmc9GAAMATyViADFGbrWBprTuB0ptPV3sBDa7nZ/1yKad0XV2Et9R8wzv5KysanO
	I9rWc/hhq6uU5gzsHDtyk9xjF5DQhdAEAfK7D0Co9ZDSdiJsfqPY//WmHHQwbG/DT4R/
	HVk1vhKQgGddG5ExVMFF1dwKymuVsJbgek1i0=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.151.8 with SMTP id y8mr6257891and.94.1241195837776; Fri, 
	01 May 2009 09:37:17 -0700 (PDT)
In-Reply-To: <1241181034-25945-1-git-send-email-khimov@altell.ru>
References: <1241181034-25945-1-git-send-email-khimov@altell.ru>
Date: Fri, 1 May 2009 13:37:17 -0300
X-Google-Sender-Auth: d3add449396b001f
Message-ID: <be7a9f3d0905010937xae89ee2q9a6b0ff70028485@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] bridge-utils: remove old versions
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
X-List-Received-Date: Fri, 01 May 2009 16:42:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Fri, May 1, 2009 at 9:30 AM, Roman I Khimov <khimov@altell.ru> wrote:
> Version 1.0.4 FTBFS and both with 0.9.7 are very old. No distro sets any
> version as preferred, so it's safe to assume that everyone is on 1.2 now.
> ---
> =A0.../bridge-utils/bridge-utils-0.9.7/failout.patch =A0| =A0 16 --------=
--------
> =A0recipes/bridge-utils/bridge-utils_0.9.7.bb =A0 =A0 =A0 =A0 | =A0 10 --=
--------
> =A0recipes/bridge-utils/bridge-utils_1.0.4.bb =A0 =A0 =A0 =A0 | =A0 14 --=
------------
> =A03 files changed, 0 insertions(+), 40 deletions(-)
> =A0delete mode 100644 recipes/bridge-utils/bridge-utils-0.9.7/failout.pat=
ch
> =A0delete mode 100644 recipes/bridge-utils/bridge-utils_0.9.7.bb
> =A0delete mode 100644 recipes/bridge-utils/bridge-utils_1.0.4.bb
>
> diff --git a/recipes/bridge-utils/bridge-utils-0.9.7/failout.patch b/reci=
pes/bridge-utils/bridge-utils-0.9.7/failout.patch
> deleted file mode 100644
> index ca6e958..0000000
> --- a/recipes/bridge-utils/bridge-utils-0.9.7/failout.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -
> -#
> -# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
> -#
> -
> ---- bridge-utils-0.9.7/Makefile.in~failout =A0 =A0 2002-04-03 10:19:36.0=
00000000 -0600
> -+++ bridge-utils-0.9.7/Makefile.in =A0 =A0 2004-06-03 14:17:35.000000000=
 -0500
> -@@ -13,7 +13,7 @@
> - SUBDIRS=3Dlibbridge brctl doc
> -
> - all:
> -- =A0 =A0 =A0for x in $(SUBDIRS); do (cd $$x && $(MAKE) ); done
> -+ =A0 =A0 =A0for x in $(SUBDIRS); do (cd $$x && $(MAKE) ) || exit 1; don=
e
> -
> - clean:
> - =A0 =A0 =A0 for x in $(SUBDIRS); do (cd $$x && $(MAKE) clean ); done
> diff --git a/recipes/bridge-utils/bridge-utils_0.9.7.bb b/recipes/bridge-=
utils/bridge-utils_0.9.7.bb
> deleted file mode 100644
> index 1ab9424..0000000
> --- a/recipes/bridge-utils/bridge-utils_0.9.7.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION =3D "Tools for ethernet bridging."
> -LICENSE =3D "GPL"
> -SECTION =3D "console/network"
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tgz \
> - =A0 =A0 =A0 =A0 =A0file://failout.patch;patch=3D1"
> -S =3D "${WORKDIR}/bridge-utils-${PV}"
> -
> -inherit autotools
> -
> -EXTRA_OECONF =3D "--with-linux-headers=3D${STAGING_INCDIR}"
> diff --git a/recipes/bridge-utils/bridge-utils_1.0.4.bb b/recipes/bridge-=
utils/bridge-utils_1.0.4.bb
> deleted file mode 100644
> index d72a627..0000000
> --- a/recipes/bridge-utils/bridge-utils_1.0.4.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION =3D "Tools for ethernet bridging."
> -HOMEPAGE =3D "http://bridge.sourceforge.net/"
> -SECTION =3D "console/network"
> -LICENSE =3D "GPL"
> -DEPENDS =3D "sysfsutils"
> -RRECOMMENDS =3D "kernel-module-bridge"
> -PR =3D "r1"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz"
> -S =3D "${WORKDIR}/bridge-utils-${PV}"
> -
> -inherit autotools
> -
> -EXTRA_OECONF =3D "--with-linux-headers=3D${STAGING_INCDIR}"
> --
> 1.6.2.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br



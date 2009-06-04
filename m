Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MCE0i-0006bP-SL
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 16:33:40 +0200
Received: by fxm20 with SMTP id 20so796066fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2009 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Zvu74BDZEWt1rkYaQgmk/cb1BbgzGqnte53VFJqc3ZE=;
	b=nItV3R6WJbFXxcJ9GBS+VhU7mE16O3g32LhWlAibJbJMy6r9tb5fH9zqFXicJ+AHVg
	MAQKhO31bRL1z/7l4WnIO44WsuzmKgDmYX665HEXWMWh8RKJ0Ml9qJoOWe9In/KVQE4p
	HP/irEWy/ZKk5gYoj8EaPzvi1Y8oonz9VYAk8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=t3prIrneEMRttEwUM63O4eC9nUgorMWT2tO0den+QwNkKVTJmEIBhTXAgjR9fGj22Q
	3XCUuGsfrX2i8i6JR+4Uql85Rz3MRvRlZP9wjKb2ZEhE7O4b6RMX9nCQ5j7OGtr9Fibu
	+OF8/6ghMsIpOcQKgT4grarLE/JDlE0mMgUlU=
MIME-Version: 1.0
Received: by 10.103.171.6 with SMTP id y6mr1441003muo.110.1244125474970; Thu, 
	04 Jun 2009 07:24:34 -0700 (PDT)
In-Reply-To: <1234795059.5643.2.camel@EPBYMINW0568>
References: <1234795059.5643.2.camel@EPBYMINW0568>
Date: Thu, 4 Jun 2009 17:24:34 +0300
Message-ID: <fce2a370906040724i70161f7bs213d17fe97650c96@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] neon: bump version to 0.28.3
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
X-List-Received-Date: Thu, 04 Jun 2009 14:33:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

So what's the status of the patch? Can you update neon library?

PS: Sorry for the previous unneeded email.

On Mon, Feb 16, 2009 at 5:37 PM, Ihar Hrachyshka
<ihar.hrachyshka@gmail.com> wrote:
> Seems that current neon versions doesn't work with gnutls 2.x
>
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
> =C2=A0conf/checksums.ini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A04 ++++
> =C2=A0packages/neon/neon_0.28.3.bb | =C2=A0 16 ++++++++++++++++
> =C2=A02 files changed, 20 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 packages/neon/neon_0.28.3.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 178f45c..a08be2a 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -15674,6 +15674,10 @@ sha256=3D76472e51576b42bfc129e487ae7dd3a5e1f1f38=
0105b422fc14ee408e3a881df
> =C2=A0md5=3D516c576c0ca5c0a01ad24d018093cfee
> =C2=A0sha256=3D8a29457052b73ac0139e3b2824a74323256dd7631b1691239ddb18124e=
231a71
>
> +[http://www.webdav.org/neon/neon-0.28.3.tar.gz]
> +md5=3D47599a328862ce64ac3c52726d6daa12
> +sha256=3D90dee51b4c70bc50ce2fa106ca945349b81cd86c90aa9d4dbff73abb284fcdc=
2
> +
> =C2=A0[http://downloads.sourceforge.net/net-snmp/net-snmp-5.1.2.tar.gz]
> =C2=A0md5=3D8080555ab3f90011f25d5122042d9a8d
> =C2=A0sha256=3D1fca69e934c3d526e308450cc5af2478d440e012922dd0bb10388fcf09=
3ef32e
> diff --git a/packages/neon/neon_0.28.3.bb b/packages/neon/neon_0.28.3.bb
> new file mode 100644
> index 0000000..0e347e7
> --- /dev/null
> +++ b/packages/neon/neon_0.28.3.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "neon is an HTTP and WebDAV client library, with a C int=
erface."
> +SECTION =3D "libs"
> +LICENSE =3D "LGPL"
> +DEPENDS =3D "zlib libxml2 expat time gnutls"
> +
> +DEFAULT_PREFERENCE =3D "1"
> +
> +SRC_URI =3D "http://www.webdav.org/${PN}/${P}.tar.gz"
> +
> +inherit autotools binconfig lib_package pkgconfig
> +
> +EXTRA_OECONF =3D "--with-ssl=3Dgnutls --with-libxml2 --with-expat --enab=
le-shared"
> +
> +do_stage () {
> + =C2=A0 =C2=A0 =C2=A0 autotools_stage_all
> +}
> --
> 1.5.6.3
>
>
>



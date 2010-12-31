Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PYiZi-0006Xs-UD
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 18:15:35 +0100
Received: by ywi6 with SMTP id 6so5053933ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 09:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=RWEQUA7M+Fb1doi4bmpH2tu24vbZmp7o3epsRi6htHU=;
	b=jUk+Jeso4CwS2HPx9sffH3aO+bUpwnY+lC6mso6h6q+nYMeMtBy8G/tHtCHbNRYCpk
	Pmfzgiml65wAtLrwQ/tnxicVZjT3hKWZuQDMvqMmSWihNud/4rK7LPBOGrKJGIErTTPz
	qD6V7y8DK63ODswi65fslRO0y5GbvWnu/7v60=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=c1n3WO7iWrQCoWvOb+rg+30pJUUT8KiCkHykk+EdL48zdrL4NyOY3diiwVugVr+47K
	Kji/ohMsO9U8P4yWyiu7WaZQ23kGRexFBgnGjHtAv51M8ASDOMwq9C+nEg0m61kZVNV3
	XTZLquIK7KyTpKz/Yg12RasxUn4dx+RHrzisg=
Received: by 10.90.10.31 with SMTP id 31mr9015568agj.85.1293815711924; Fri, 31
	Dec 2010 09:15:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 31 Dec 2010 09:14:51 -0800 (PST)
In-Reply-To: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Dec 2010 09:14:51 -0800
Message-ID: <AANLkTi=kATNZpvbMESpVEDK9=eCo5Bq-paSKWYNJneH9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] u-boot: added 2010.12 recipe (DEFAULT_PREFERENCE = -1)
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
X-List-Received-Date: Fri, 31 Dec 2010 17:15:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I thought it was preferred for some machine. Whats the use of a DP=3D-1
recipe? So you intend to use it.

On Fri, Dec 31, 2010 at 7:47 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =C2=A0recipes/u-boot/u-boot_2010.12.bb | =C2=A0 19 +++++++++++++++++++
> =C2=A01 files changed, 19 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/u-boot/u-boot_2010.12.bb
>
> diff --git a/recipes/u-boot/u-boot_2010.12.bb b/recipes/u-boot/u-boot_201=
0.12.bb
> new file mode 100644
> index 0000000..174bebf
> --- /dev/null
> +++ b/recipes/u-boot/u-boot_2010.12.bb
> @@ -0,0 +1,19 @@
> +PR =3D "r0"
> +require u-boot.inc
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
> +SRC_URI[md5sum] =3D "9024bbceabd176ae1d52df6db2e84bda"
> +SRC_URI[sha256sum] =3D "1705772db7a18635693676abb8818542167cb131921c456a=
1edd0ed47e6b77fe"
> +
> +
> +TARGET_LDFLAGS =3D ""
> +
> +inherit base
> +
> +do_compile () {
> + =C2=A0 =C2=A0 =C2=A0 oe_runmake ${UBOOT_MACHINE}
> + =C2=A0 =C2=A0 =C2=A0 oe_runmake all
> +}
> +
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



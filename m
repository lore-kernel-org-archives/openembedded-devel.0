Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Re30Y-0001up-5C
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Dec 2011 12:09:50 +0100
Received: by eaal1 with SMTP id l1so8296013eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2011 03:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=BVNd84FKKBlT2v3jWa2wkBgCOrOrAA9Uq9uCl9nwTH8=;
	b=G5kGR5I7pWvuaAkJkNDMAPzZbf1g4kc1pKsewnbAzWBenNE0XBDGu3L92crBFqzIlP
	M8e5S55SD/s1CdLGKZDRKpbpKfEpZ6yoKQtjj7OF68nVSLJ5JOAd3BrOeHtbF0fFl1cf
	ohOFv/IMcyPkS8hkcC+2wvOML0+13C/eOchwk=
MIME-Version: 1.0
Received: by 10.204.133.207 with SMTP id g15mr3947177bkt.17.1324638159201;
	Fri, 23 Dec 2011 03:02:39 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Fri, 23 Dec 2011 03:02:39 -0800 (PST)
In-Reply-To: <1324624336-18713-1-git-send-email-eric@eukrea.com>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
Date: Fri, 23 Dec 2011 09:02:39 -0200
X-Google-Sender-Auth: eq47a3xiG6rpEAhlmpNsYCewMMo
Message-ID: <CAP9ODKqMKWHN66pSq6GvpSy_fOk8CNZ5jXnGx_WULmyEGH9ZvQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Fri, 23 Dec 2011 11:09:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

+1 :-) very cool :-D

2011/12/23 Eric B=E9nard <eric@eukrea.com>

> * python support is needed for providing finer scripting control
> in gdb, and for remote controling gdb for example from qtcreator
> * gdb/configure tries to autodetect python using python executable
> with --includes --ldflags --exec-prefix to get the right flags
> As it's difficult to achieve in OE's context, we generate a
> script which will return the right values and make gdb's build
> system happy. This idea was taken from the following article :
>
> http://www.mentby.com/doug-evans-2/python-enabled-gdb-on-windows-and-relo=
cation.html
> * tested using angstrom & armv7/armv5 targets & qtcreator 201005 & 2.4.0
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  .../gdb/gdb-cross-canadian_7.3.1.bbappend          |   20
> ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
>  create mode 100644
> meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bbappend
>
> diff --git
> a/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bbappend
> b/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bbappend
> new file mode 100644
> index 0000000..3bbfe38
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bbappend
> @@ -0,0 +1,20 @@
> +DEPENDS +=3D "python-nativesdk"
> +RDEPENDS +=3D "python-nativesdk-core python-nativesdk-lang
> python-nativesdk-re \
> +                        python-nativesdk-codecs
> python-nativesdk-netclient"
> +
> +EXTRA_OECONF_append =3D "--with-python=3D${WORKDIR}/python"
> +PRINC =3D "1"
> +
> +do_configure_prepend() {
> +cat > ${WORKDIR}/python << EOF
> +#! /bin/sh
> +case "\$2" in
> +       --includes) echo
> "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${exec_p=
refix}/include/python${PYTHON_BASEVERSION}/"
> ;;
> +       --ldflags) echo
> "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${libdir=
}/python${PYTHON_BASEVERSION}/config/config
> -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> +       --exec-prefix) echo "/usr" ;;
> +       *) exit 1 ;;
> +esac
> +exit 0
> +EOF
> +       chmod +x ${WORKDIR}/python
> +}
> --
> 1.7.6.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


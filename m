Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LzUWc-0003J1-0L
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 13:33:58 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1102309yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2009 04:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=LzCci5XK9PyRQCwlYhrHbgL4SWd6/uO4+U4nMsyirwU=;
	b=Sh3vGl95Wckj/x82CsLfL1DVjjS+nb8eixhJoNu544QOKd7ZW9lUIm1N/OlFLzk9xE
	fURijf+xIGwX0wVeeg55b/vg3MnckQ0jA0W03Nl6X1ukSAP+DHplmy417QKutjLoJ5t7
	nKGKH3kqJC18qYsPvaF6gNC+shUr1yERdk8so=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=A5L1vHOf1VySd24sVhZ4v7LpdVSBlu0epq7PNoq1fPfUZ75TzYUDzil4T2QG44uVH7
	UoodjRJkYaGt/HVhaND6gOiZxvzooWToZQlP4x6pYr2O7XQc45MYzWJh10fe/XdxTysK
	LO0hyI5AOgVQCvDe9GcbpU9nCoHuOwkHtIE9A=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.231.35.66 with SMTP id o2mr1213658ibd.30.1241090916115; Thu, 
	30 Apr 2009 04:28:36 -0700 (PDT)
In-Reply-To: <1241079609-5912-2-git-send-email-khimov@altell.ru>
References: <be7a9f3d0904270832j4832bc6fqcf058fdfc3d8479@mail.gmail.com>
	<1241079609-5912-1-git-send-email-khimov@altell.ru>
	<1241079609-5912-2-git-send-email-khimov@altell.ru>
Date: Thu, 30 Apr 2009 08:28:36 -0300
X-Google-Sender-Auth: ef1dd385186f26b8
Message-ID: <be7a9f3d0904300428r7165818dode4ede80f39cb00b@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/4] coreutils-native: remove autotools and quilt dependencies
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
X-List-Received-Date: Thu, 30 Apr 2009 11:33:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Apr 30, 2009 at 5:20 AM, Roman I Khimov <khimov@altell.ru> wrote:
> Allows to build coreutils-native at very early stage in build process.
> ---
> =A0recipes/coreutils/coreutils-native.inc =A0 =A0| =A0 =A08 ++++++++
> =A0recipes/coreutils/coreutils-native_6.0.bb | =A0 =A02 +-
> =A0recipes/coreutils/coreutils-native_7.1.bb | =A0 =A02 +-
> =A0recipes/coreutils/coreutils-native_7.2.bb | =A0 =A02 +-
> =A04 files changed, 11 insertions(+), 3 deletions(-)
> =A0create mode 100644 recipes/coreutils/coreutils-native.inc
>
> diff --git a/recipes/coreutils/coreutils-native.inc b/recipes/coreutils/c=
oreutils-native.inc
> new file mode 100644
> index 0000000..c4dda17
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-native.inc
> @@ -0,0 +1,8 @@
> +inherit native
> +
> +INHIBIT_AUTOTOOLS_DEPS =3D "1"
> +PATCHTOOL =3D "patch"
> +
> +do_configure() {
> + =A0 =A0 =A0 oe_runconf
> +}
> diff --git a/recipes/coreutils/coreutils-native_6.0.bb b/recipes/coreutil=
s/coreutils-native_6.0.bb
> index 057dfa6..a3754df 100644
> --- a/recipes/coreutils/coreutils-native_6.0.bb
> +++ b/recipes/coreutils/coreutils-native_6.0.bb
> @@ -2,4 +2,4 @@ FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,=
1))}/coreutils-${PV}"
> =A0S =3D "${WORKDIR}/coreutils-${PV}"
>
> =A0require coreutils_${PV}.bb
> -inherit native
> +require coreutils-native.inc
> diff --git a/recipes/coreutils/coreutils-native_7.1.bb b/recipes/coreutil=
s/coreutils-native_7.1.bb
> index 057dfa6..a3754df 100644
> --- a/recipes/coreutils/coreutils-native_7.1.bb
> +++ b/recipes/coreutils/coreutils-native_7.1.bb
> @@ -2,4 +2,4 @@ FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,=
1))}/coreutils-${PV}"
> =A0S =3D "${WORKDIR}/coreutils-${PV}"
>
> =A0require coreutils_${PV}.bb
> -inherit native
> +require coreutils-native.inc
> diff --git a/recipes/coreutils/coreutils-native_7.2.bb b/recipes/coreutil=
s/coreutils-native_7.2.bb
> index 057dfa6..a3754df 100644
> --- a/recipes/coreutils/coreutils-native_7.2.bb
> +++ b/recipes/coreutils/coreutils-native_7.2.bb
> @@ -2,4 +2,4 @@ FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,=
1))}/coreutils-${PV}"
> =A0S =3D "${WORKDIR}/coreutils-${PV}"
>
> =A0require coreutils_${PV}.bb
> -inherit native
> +require coreutils-native.inc
> --
> 1.6.2.4
>
>
> --
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
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



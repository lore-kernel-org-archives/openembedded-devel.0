Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsrfI-00034B-GS
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 08:28:25 +0200
Received: by iwn2 with SMTP id 2so4927405iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 23:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SNhbO3WMHPImUjOwfIhOSNl//PgvE0KFtL/ZKF1vdWE=;
	b=tZ5yKXnB082o2o1vuERwfzr76JCPCHGaru/W7RFgQrKWZobKhPFpYGsuXpM2dHzk3I
	z+Yd0uZR3mua2GUDgOAL17Q8iwzIigUktiJc4SSNSdwA6GYU8XKzqWkFGHUfnGEXdwCy
	zN1e9VccYoS6Vq5tox1wJshvCO7FVCIv7VI2E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=mlA9KC7gpbihMkW9xxRd+qkpe0b7GIHmO4Po/Tfy9xCanEMcM8pM9ex140oAm79Das
	bVz5i9iAuERE848mXiBIvEI+MXFHa1YJYTp6aB1Mi3+XYMs+Yswp0N5wpffP4cHQHOAh
	yoqkM9JfJIKZZvOpWffKbtCvDGOIznBqRh5e8=
MIME-Version: 1.0
Received: by 10.231.174.84 with SMTP id s20mr7577271ibz.94.1283840846709; Mon,
	06 Sep 2010 23:27:26 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 23:27:26 -0700 (PDT)
In-Reply-To: <1283809310-29893-1-git-send-email-eric@eukrea.com>
References: <1283809310-29893-1-git-send-email-eric@eukrea.com>
Date: Tue, 7 Sep 2010 08:27:26 +0200
Message-ID: <AANLkTi=LswfyrP_t-5G2iipd6umjkAmdwFiECLmZXMXW@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] mercurial-native: add recipe
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
X-List-Received-Date: Tue, 07 Sep 2010 06:28:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/6 Eric B=E9nard <eric@eukrea.com>:
> * mercurial is a distributed SCM
> * having the native recipe inside OpenEmbedded gives the
> possibility to fetch code from mercurial's repositories
> without the need to have mercurial installed on the host
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
> =A0recipes/mercurial/mercurial-native_1.6.3.bb | =A0 23 +++++++++++++++++=
++++++
> =A01 files changed, 23 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/mercurial/mercurial-native_1.6.3.bb
>
> diff --git a/recipes/mercurial/mercurial-native_1.6.3.bb b/recipes/mercur=
ial/mercurial-native_1.6.3.bb
> new file mode 100644
> index 0000000..58fcaf1
> --- /dev/null
> +++ b/recipes/mercurial/mercurial-native_1.6.3.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION =3D "The Mercurial distributed SCM"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPLv2"
> +
> +SRC_URI =3D "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz=
;name=3Dsrc"
> +
> +DEPENDS =3D "python-native"
> +PR =3D "r0"
> +
> +S =3D "${WORKDIR}/mercurial-${PV}"
> +EXTRA_OEMAKE =3D "STAGING_LIBDIR=3D${STAGING_LIBDIR} STAGING_INCDIR=3D${=
STAGING_INCDIR} \
> + =A0 =A0 =A0 BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} PREFIX=3D${=
STAGING_DIR_NATIVE}/usr"
> +
> +do_install () {
> + =A0 =A0 =A0 =A0install -d ${STAGING_DIR_NATIVE}/usr

I'm a little bit surprised that you need this. I had expected install
to take care of that.
Otherwise, the recipe looks fine to me (but haven't test-build it yet)

Frans
> + =A0 =A0 =A0 =A0oe_runmake install
> +}
> +
> +inherit native
> +
> +SRC_URI[src.md5sum] =3D "fcd61edc488d1b9aa831dde6f14d9a13"
> +SRC_URI[src.sha256sum] =3D "57e5d26d35fbec71206378e3af111193e6eee7bb1dfb=
6447bbc4b9e03ce937bd"
> +
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



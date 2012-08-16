Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T21dx-0003On-MM
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Aug 2012 17:05:53 +0200
Received: by ggmq1 with SMTP id q1so3263973ggm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2012 07:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=+zUgMIavVHIMgyi9bO/ePREPgAOGkQiFbG31Dcd+3I0=;
	b=wn3yoSt/jk+8PaeJrjOiHjKH8N4eXgSfIxJ6TOWgiyeH1lMsD9F0RzJwliD5pFVw9W
	NaX/JYuDx7Q+DzAZShC/bi5AtYraOmrIwMjUZL5y2aapZLF47/a/0yOayI8PjvPhylRA
	AU/rN1UFSRrDtg25oUd1+RbwlNeBFlNsxYBSo8A1/YhmvcPBOcSHmgnXYZX4GG3ZiKVr
	C4K+FSQRcaurhJgUvs9UIhFr/YWPE3T6BqlWW2f5GpnbAa0XDKs2Lmz9oEgWY/QaY51X
	iovZIb559Z1RG9CdEj+5lk2LUJHFtsf75LP2HysvrZ0pfCOwiS9wQCAw7R6Ew4Y4qcJP
	bbpw==
MIME-Version: 1.0
Received: by 10.50.15.202 with SMTP id z10mr1928408igc.50.1345128835374; Thu,
	16 Aug 2012 07:53:55 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 16 Aug 2012 07:53:55 -0700 (PDT)
In-Reply-To: <1345126066-1406-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120716182528.GO3729@jama.jama.net>
	<1345126066-1406-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 16 Aug 2012 16:53:55 +0200
Message-ID: <CALbNGRSYnVxuifOOVi-ki+SXCsZ1dL3dCTYscvfBdi0-QdczgQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-systemd][PATCH] systemd.bbclass: add option to disable automatic RRECOMMENDS pkg-systemd_base -> pkg-systemd
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
X-List-Received-Date: Thu, 16 Aug 2012 15:05:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2012 at 4:07 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-systemd/classes/systemd.bbclass |   16 ++++++++++------
>  1 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/=
systemd.bbclass
> index 4036f91..96d7f8f 100644
> --- a/meta-systemd/classes/systemd.bbclass
> +++ b/meta-systemd/classes/systemd.bbclass
> @@ -2,6 +2,8 @@ DEPENDS_append =3D " systemd-systemctl-native"
>
>  SYSTEMD_AUTO_ENABLE ??=3D "enable"
>
> +SYSTEMD_AUTO_RRECOMMENDS ??=3D "enable"
> +
>  systemd_postinst() {
>  OPTS=3D""
>
> @@ -208,12 +210,14 @@ python populate_packages_prepend () {
>          if len(rdepends_arr) =3D=3D 0 and pkg_systemd !=3D '${PN}' and n=
ot pkg_systemd_base in rdepends:
>              rdepends =3D '%s %s' % (rdepends, pkg_systemd_base)
>          d.setVar('RDEPENDS_' + pkg_systemd, rdepends)
> -        # RRECOMMENDS_${pkg_systemd_base} +=3D pkg_systemd systemd
> -        rrecommends =3D d.getVar('RRECOMMENDS_' + pkg_systemd_base, 1) o=
r ""
> -        # not rrecommending myself AND avoid double entries
> -        if pkg_systemd !=3D pkg_systemd_base and not pkg_systemd in rrec=
ommends.split():
> -            rrecommends =3D '%s %s' % (rrecommends, pkg_systemd)
> -        d.setVar('RRECOMMENDS_' + pkg_systemd_base, rrecommends)
> +        auto_rrecommends =3D d.getVar('SYSTEMD_AUTO_RRECOMMENDS', 1) or =
'enable'
> +        if auto_rrecommends =3D=3D 'enable':
> +            # RRECOMMENDS_${pkg_systemd_base} +=3D pkg_systemd systemd
> +            rrecommends =3D d.getVar('RRECOMMENDS_' + pkg_systemd_base, =
1) or ""
> +            # not rrecommending myself AND avoid double entries
> +            if pkg_systemd !=3D pkg_systemd_base and not pkg_systemd in =
rrecommends.split():
> +                rrecommends =3D '%s %s' % (rrecommends, pkg_systemd)
> +            d.setVar('RRECOMMENDS_' + pkg_systemd_base, rrecommends)
>
>      # run all modifications once when creating package
>      if os.path.exists('${D}'):
> --
> 1.7.8.6
>
>
Although I don't have this use case - I like this one. Off topic: We
should think of documentation for the systemd variables...

Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>



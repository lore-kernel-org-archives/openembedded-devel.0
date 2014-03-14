Return-Path: <joe@deserted.net>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 81A826F799
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 14:30:57 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id t19so5447179igi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 07:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=X6F1giVbq5T3xlwZo1HFNCEDqEpN64GHGBDoRt5Hm5o=;
	b=c+3vBwYf6Prff8UhVkNxeyYmj5Gwzppn5GTaJ4HYsGlI9/fueWK7eRLs6im4HmKNyO
	+u4RzwxRyiPcyuA4S43yPWtBAMfINXW8Hj+gqeALIxEQ0PG9uzlDxJPXAEgA3jwNLfdX
	zvNSV1z3R+qdcctSBYxKOUtmjKQ3u3vV+y2GWOA+q5//LLskBN/5o4/ymb30+sS6zaiF
	il3uVPQES6dfBEEHF+140q5O7jEtah4B02NYzlWZG1ufdLPmWgCyvsHL1M+X/QyIYdya
	BpazgkzlgoJpTxAklUmhwIbx3HH8FDsAV+10AqHxZgc8EB/zgCJe2KvHoQH8eyJkcMjy
	8UiQ==
X-Gm-Message-State: ALoCoQkhDozoIkXe7XzgxqFdmr6EzNZa0F1oyXb5mHyyWY5UtgOz3fTqMnYHIUpByV3ocGDSveaR
X-Received: by 10.50.60.103 with SMTP id g7mr8108963igr.20.1394807457959;
	Fri, 14 Mar 2014 07:30:57 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	v2sm19803892igk.7.2014.03.14.07.30.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 14 Mar 2014 07:30:57 -0700 (PDT)
Date: Fri, 14 Mar 2014 10:30:54 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140314143050.GD8326@deserted.net>
References: <1394517250-15467-1-git-send-email-xufeng.zhang@windriver.com>
	<1394517250-15467-2-git-send-email-xufeng.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1394517250-15467-2-git-send-email-xufeng.zhang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH 1/2] ntp: Running ntpd daemon as ntp:ntp
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
X-List-Received-Date: Fri, 14 Mar 2014 14:30:57 -0000
X-Groupsio-MsgNum: 48670
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Content-Disposition: inline

--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged both of these.  Thanks.

-J.

[[oe] [PATCH 1/2] ntp: Running ntpd daemon as ntp:ntp] On 14.03.11 (Tue 13:=
54) Xufeng Zhang wrote:

> Adding ntp:ntp(user:group) to system and running
> ntpd dameon as ntp:ntp.
>=20
> Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/files/ntpd |    2 +-
>  meta-networking/recipes-support/ntp/ntp.inc    |    6 +++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/files/ntpd b/meta-networ=
king/recipes-support/ntp/files/ntpd
> index 53fa2d1..f1e78aa 100755
> --- a/meta-networking/recipes-support/ntp/files/ntpd
> +++ b/meta-networking/recipes-support/ntp/files/ntpd
> @@ -23,7 +23,7 @@ startdaemon(){
>  	# this.  If ntpd seems to disappear after a while assume TICKADJ
>  	# above is set to a totally incorrect value.
>  	echo -n "Starting ntpd: "
> -	start-stop-daemon --start -x /usr/bin/ntpd -- -p /var/run/ntp.pid "$@"
> +	start-stop-daemon --start -x /usr/bin/ntpd -- -u ntp:ntp -p /var/run/nt=
p.pid "$@"
>  	echo "done"
>  }
>  stopdaemon(){
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index 8381b9e..7876c0b 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -25,13 +25,17 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool=
/ntp4/ntp-4.2/ntp-${PV}.tar.g
>             file://ntpd.list \
>  "
> =20
> -inherit autotools update-rc.d systemd
> +inherit autotools update-rc.d useradd systemd
> =20
>  # The ac_cv_header_readline_history is to stop ntpdc depending on either
>  # readline or curses
>  EXTRA_OECONF +=3D "--with-net-snmp-config=3Dno --without-ntpsnmpd ac_cv_=
header_readline_history_h=3Dno"
>  CFLAGS_append =3D " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
> =20
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM_${PN} =3D "--system --home-dir /var/lib/ntp \
> +                       --shell /bin/false --user-group ntp"
> +
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[openssl] =3D "--with-openssl-libdir=3D${STAGING_LIBDIR} \
>                            --with-openssl-incdir=3D${STAGING_INCDIR} \
> --=20
> 1.7.0.2
>=20
--=20
-Joe MacDonald.
:wq

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlMjEpoACgkQwFvcllog0XxWdwCgqav4YAs9+PvMk06aUP+0SN6f
48UAmwcC6kbp0E2x/Yqc26Cs1Jq8UCKD
=SWyH
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--

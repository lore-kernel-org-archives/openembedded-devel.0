Return-Path: <joe@deserted.net>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7266C6BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:14:51 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so899187eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=pEwvODgftSyYV+cidgq7wrTJq/a7ueY1eI8uLALieOc=;
	b=ObpZBHkM3ee1arCuKAWnkQ01qVUKGUoZziOvayZbBYfnX+dCDn26Z2BmFNdEjaQ6by
	5/FWiCEj+fwu18fbM5CeC/LVjfTKmS8LboFynG6GXfMVUTEafOkOuPcKokTYBrZLthBe
	3c7zQPI2uHr4n7849xqdp65H+R13hXbvnUQAwPqWFQGScHGW+f3DKw6wWZEfYVXHLe6X
	OMJPRBmjqnBhieRoxYGIXIo2A+3tugpc2tzFXyS8YMtkroOybrsiXmZrGiy3L1dAIlMY
	Z2Edr6Ngy+b3USFOtuiIFNXltKD1pBXpqGFOD2zJBsJXNwxVWZKr/5VUrlvWgBUG9X61
	HH6A==
X-Gm-Message-State: ALoCoQnmVnevawRs1h1LF5galsh3nJZHUpKcIS380FvC8I93BV0a8dOL74mlDqAoOeO/IUmgjH8K
X-Received: by 10.14.3.9 with SMTP id 9mr2396506eeg.72.1378386892486;
	Thu, 05 Sep 2013 06:14:52 -0700 (PDT)
Received: from deserted.net ([128.224.252.2]) by mx.google.com with ESMTPSA id
	r48sm48586849eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 06:14:51 -0700 (PDT)
Date: Thu, 5 Sep 2013 09:14:47 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130905131445.GL5086@deserted.net>
References: <1377681778-2387-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1377681778-2387-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH meta-networking] tftp-hpa: add error check for disk filled up
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
X-List-Received-Date: Thu, 05 Sep 2013 13:14:51 -0000
X-Groupsio-MsgNum: 46102
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4oF+6Ged69J0+4/e"
Content-Disposition: inline

--4oF+6Ged69J0+4/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [PATCH meta-networking] tftp-hpa: add error check for disk filled up]=
 On 13.08.28 (Wed 17:22) rongqing.li@windriver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> Add error check when the write-buffer is finally flushed to the file,
> the caller can detect if the disk filled up (or had an i/o error) and
> return a NOSAPCE nak to the other side.
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  .../files/add-error-check-for-disk-filled-up.patch |   81 ++++++++++++++=
++++++
>  .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |    4 +-
>  2 files changed, 84 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/add-er=
ror-check-for-disk-filled-up.patch
>=20
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/add-error-che=
ck-for-disk-filled-up.patch b/meta-networking/recipes-daemons/tftp-hpa/file=
s/add-error-check-for-disk-filled-up.patch
> new file mode 100644
> index 0000000..073b769
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-=
disk-filled-up.patch
> @@ -0,0 +1,81 @@
> +From bd5773947af5ca80ca546ad5625818fc912bdd60 Mon Sep 17 00:00:00 2001
> +From: "Roy.Li" <rongqing.li@windriver.com>
> +Date: Thu, 22 Aug 2013 08:56:09 +0800
> +Subject: [PATCH] tftp-hpa: add error check for disk filled up
> +
> +Upstream-status: Pending [Sent to http://www.syslinux.org/archives/2013-=
August/020765.html]
> +
> +Add error check when the write-buffer is finally flushed to the file,
> +the caller can detect if the disk filled up (or had an i/o error) and
> +return a NOSAPCE nak to the other side.
> +
> +Signed-off-by: Ming Liu <ming.liu@windriver.com>
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + common/tftpsubs.c |    8 +++++---
> + tftpd/tftpd.c     |   12 ++++++++++--
> + 2 files changed, 15 insertions(+), 5 deletions(-)
> +
> +diff --git a/common/tftpsubs.c b/common/tftpsubs.c
> +index 8c999f6..b4d4ffe 100644
> +--- a/common/tftpsubs.c
> ++++ b/common/tftpsubs.c
> +@@ -206,20 +206,22 @@ int write_behind(FILE * file, int convert)
> +=20
> +     p =3D buf;
> +     ct =3D count;
> ++    count =3D 0;
> +     while (ct--) {              /* loop over the buffer */
> +         c =3D *p++;               /* pick up a character */
> +         if (prevchar =3D=3D '\r') { /* if prev char was cr */
> +             if (c =3D=3D '\n')      /* if have cr,lf then just */
> +-                fseek(file, -1, 1);     /* smash lf on top of the cr */
> ++                count =3D count - 1;
> +             else if (c =3D=3D '\0') /* if have cr,nul then */
> +                 goto skipit;    /* just skip over the putc */
> +             /* else just fall through and allow it */
> +         }
> +-        putc(c, file);
> ++        buf[count] =3D c;
> ++        count ++;
> +       skipit:
> +         prevchar =3D c;
> +     }
> +-    return count;
> ++    return write(fileno(file), buf, count);
> + }
> +=20
> + /* When an error has occurred, it is possible that the two sides
> +diff --git a/tftpd/tftpd.c b/tftpd/tftpd.c
> +index 1873e70..c2adbda 100644
> +--- a/tftpd/tftpd.c
> ++++ b/tftpd/tftpd.c
> +@@ -1681,7 +1681,11 @@ static void tftp_recvfile(const struct formats *p=
f, struct tftphdr *oap, int oac
> +             syslog(LOG_WARNING, "tftpd: write(ack): %m");
> +             goto abort;
> +         }
> +-        write_behind(file, pf->f_convert);
> ++        if(write_behind(file, pf->f_convert) < 0) {
> ++            nak(ENOSPACE, NULL);
> ++            (void)fclose(file);
> ++            goto abort;
> ++        }
> +         for (;;) {
> +             n =3D recv_time(peer, dp, PKTSIZE, 0, &r_timeout);
> +             if (n < 0) {        /* really? */
> +@@ -1712,7 +1716,11 @@ static void tftp_recvfile(const struct formats *p=
f, struct tftphdr *oap, int oac
> +             goto abort;
> +         }
> +     } while (size =3D=3D segsize);
> +-    write_behind(file, pf->f_convert);
> ++    if(write_behind(file, pf->f_convert) < 0) {
> ++        nak(ENOSPACE, NULL);
> ++        (void)fclose(file);
> ++        goto abort;
> ++    }
> +     (void)fclose(file);         /* close data file */
> +=20
> +     ap->th_opcode =3D htons((u_short) ACK);       /* send the "final" a=
ck */
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/m=
eta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> index cb5b234..9cb25f0 100644
> --- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> +++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> @@ -23,7 +23,9 @@ SRC_URI =3D "http://kernel.org/pub/software/network/tft=
p/tftp-hpa/tftp-hpa-${PV}.t
>             file://tftp-hpa-0.49-stats.patch \
>             file://tftp-hpa-5.2-pktinfo.patch \
>             file://default \
> -           file://init"
> +           file://init \
> +           file://add-error-check-for-disk-filled-up.patch \
> +"
> =20
>  SRC_URI[md5sum] =3D "46c9bd20bbffa62f79c958c7b99aac21"
>  SRC_URI[sha256sum] =3D "0a9f88d4c1c02687b4853b02ab5dd8779d4de4ffdb9b2e5c=
9332841304d1a269"
--=20
-Joe MacDonald.
:wq

--4oF+6Ged69J0+4/e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIog8UACgkQwFvcllog0XyIygCgkN7oPTV5fWOlsJrjf2sV6Io4
HHoAnR7bINlgGFVtGTxkCly0AqqhdQbb
=Fm3U
-----END PGP SIGNATURE-----

--4oF+6Ged69J0+4/e--

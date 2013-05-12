Received: from mail-we0-f174.google.com ([74.125.82.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UbVd1-0005SK-OD; Sun, 12 May 2013 14:43:55 +0200
Received: by mail-we0-f174.google.com with SMTP id x53so5318890wes.33
	for <multiple recipients>; Sun, 12 May 2013 05:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=g5abr5MGBVPJspe22dlaqwwLOxlMxkzGccERPvbkGMs=;
	b=tb9alI5yGqO+8DU/Lw71FF+4Q/sHdrPQMk2voTQ8gGCCBqXf0VOwFFguKk0ARmjA8q
	kzqxdggP/L7rad5aLuLc/tNALqafMlNyaG2Z2FXPczar7CK3PxfDedsN3mB5FC08AZ7h
	YzlwEll4TgzWeWI0K5YoBABhx6hYTTWA7CfxY9bznWo2HEiR8FQSZ7UobM6T+cqHyMFm
	xd3GlnDVdeEKO9fgxScrkMn7W4WOAkCGkUz3kKlVh7iBfrBNFjV09+cygo327RqW1+mt
	Z3xOE7V8LocOSMcGKbCXf7RIdeEUfVsS31rs5732vlWcaI6I1YT4x3HDnWyBiegLa1VD
	I4kQ==
MIME-Version: 1.0
X-Received: by 10.180.76.230 with SMTP id n6mr13119467wiw.28.1368361543732;
	Sun, 12 May 2013 05:25:43 -0700 (PDT)
Received: by 10.194.19.42 with HTTP; Sun, 12 May 2013 05:25:43 -0700 (PDT)
In-Reply-To: <20130510085752.79D095045B@opal>
References: <20130510085752.79D095045B@opal>
Date: Sun, 12 May 2013 14:25:43 +0200
Message-ID: <CA+chaQfGmH3z1WwKPReO7SG8BFPRZHtoiPXuLTNeZ__1ZXMJ9A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-commits@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFtvZS1jb21taXRzXSBBbmRyZWFzIE3DvGxsZXIgOiBwcm9mdHBkOiByZW1vdmUgcG9zdGluc3QgLSBkaXJlY3RvcnkgY2FuIGJlIHNldHVwIG9mZmxpbmUgaW4gZG9faW5zdGFsbA==?=
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
X-List-Received-Date: Sun, 12 May 2013 12:44:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

FILES_${PN} needs to be updated after this

proftpd-1.3.4b: proftpd: Files/directories were installed but not shipped
  /home
  /home/ftp
  /home/ftp/pub



On Fri, May 10, 2013 at 10:57 AM, <git@git.openembedded.org> wrote:

> Module: meta-openembedded.git
> Branch: master
> Commit: 8c709eb9fda970e06a7114c00c5e027fd3621259
> URL:
> http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=3D8c7=
09eb9fda970e06a7114c00c5e027fd3621259
>
> Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> Date:   Mon Apr 29 17:01:13 2013 +0200
>
> proftpd: remove postinst - directory can be setup offline in do_install
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> ---
>
>  .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |   16
> +++++-----------
>  1 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bbb/m=
eta-networking/recipes-daemons/proftpd/
> proftpd_1.3.4b.bb
> index 28a7357..806413b 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.proftpd.org"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb0d1484d11915fa88a6a7702f1dc=
184"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
>  SRC_URI =3D "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
>             file://make.patch \
> @@ -47,6 +47,10 @@ do_install () {
>
>      install -d ${D}${sysconfdir}/default
>      install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/proftpd
> +
> +    # create the pub directory
> +    mkdir -p ${D}/home/${FTPUSER}/pub/
> +    chown -R ${FTPUSER}:${FTPGROUP} ${D}/home/${FTPUSER}/pub
>  }
>
>  INITSCRIPT_NAME =3D "proftpd"
> @@ -55,13 +59,3 @@ INITSCRIPT_PARAM =3D "defaults 85 15"
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM_${PN} =3D "${FTPGROUP}"
>  USERADD_PARAM_${PN} =3D "--system -g ${FTPGROUP} ${FTPUSER}"
> -
> -pkg_postinst_${PN} () {
> -    if [ "x$D" !=3D "x" ] ; then
> -        exit 1
> -    fi
> -
> -    # create the pub directory
> -    mkdir -p /home/${FTPUSER}/pub/
> -    chown -R ${FTPUSER}:${FTPGROUP} /home/${FTPUSER}/pub
> -}
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 82681601A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 21:21:02 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id b187so66943608wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 14:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=U49uNwOo400PqS7nqvgGZDW/l8TMrR1EG2r/fdP1RHI=;
	b=dEUY63XJvRPQHhzWt5XXId4+ZiLkjqgDMhc89GyPBo8oiN9cbcAPm8WsxKaTqfLAT9
	vjpwqFq905mZ21hWpzVBRMWYQyEO7sddJK55jRtZ/uho6yR5CT8WJ3uQQwG2uQ+JKxXw
	L34NEIzVZMjVBjDeRyfkQ6848dJn8JP3gWluHMqwO5sCaH/jnzb1+3TirULEjAAIA2UI
	Fk8cjPXnkaqJbf1ftmoIvw2rwNjhlxS5eI/xI5hjb+rfwXx+WP5HlHnDzeZARCX2dCjO
	KDEqc4p9kEKUhH/x6WN6nzxM/SX9JdDfTZqD48vykvSSO5xQO+vJGbn9kO+X4TOaapbr
	2rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=U49uNwOo400PqS7nqvgGZDW/l8TMrR1EG2r/fdP1RHI=;
	b=AsWPIRYuHcPpRdOKMCI9pU8IiOWAxQlpYNeLQ12uuv0RXDex10MQVleyPaZ1Hr0Lxy
	O1mz+LGD7qGe7IK6gO01Yo8N/nD/d48mcRsDaqzraEQMOBFcALG8uef1dpqtpzZ/SNCg
	p7MYajDql1lwofxjlekWW29znFMX+yL9/WIhJf2OhEJKIn1d3FgHxPdjtww/lJPdZsaf
	/bP/BTZwTNC/YPA6OnLGfd0w6quqFZ/H9h1yNXflxhr5haLQrdw9fqHdN9w8zBzGbNt/
	bzLZGDDy4VurCGSN7lQRfr3qIY9tPWJUL2VGP4h5IiIVuMnp1iSYtnOqxFwD4rL8s4Xu
	wtEQ==
X-Gm-Message-State: AE9vXwMSU8yeVZvUUYMOl726eVu3sJDUyfMv1VplOU3xYndOKbDQ1/Kpuz7drAuVrIL6Y8jnEEDYYsaE+U2sqQ==
X-Received: by 10.194.235.69 with SMTP id uk5mr4512760wjc.53.1473888062987;
	Wed, 14 Sep 2016 14:21:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.154.225 with HTTP; Wed, 14 Sep 2016 14:21:02 -0700 (PDT)
In-Reply-To: <1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
	<1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 Sep 2016 23:21:02 +0200
Message-ID: <CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] samba: unblacklist and link with bfd on arm only
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 21:21:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

What about the other 2 issues mentioned in the comment?

On Wed, Sep 14, 2016 at 10:14 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> index 7d7fa02..53721b1 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> @@ -88,7 +88,8 @@ EXTRA_OECONF +=3D "--enable-fhs \
>                  "
>  DISABLE_STATIC =3D ""
>
> -LDFLAGS +=3D "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES'=
,
> 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
> +LDFLAGS +=3D "-Wl,-z,relro,-z,now"
> +LDFLAGS_append_arm =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
>
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false',
> d)}; then
> @@ -317,8 +318,3 @@ FILES_${PN}-python-dbg =3D "${libdir}/python${PYTHON_
> BASEVERSION}/site-packages/.d
>
>  RDEPENDS_${PN}-pidl_append =3D " perl"
>  FILES_${PN}-pidl =3D "${bindir}/pidl ${datadir}/perl5/Parse"
> -
> -# http://errors.yoctoproject.org/Errors/Details/81004/
> -# before this issue it was also failing in do_package and
> -# autodetecting libpam dependency
> -PNBLACKLIST[samba] ?=3D "BROKEN: fails to build with new binutils-2.27"
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


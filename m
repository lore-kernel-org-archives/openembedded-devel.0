Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id AE33777136
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 17:04:21 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id s13-v6so186096uad.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 10:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WLZ4K4sXW7wDpXTEqGu6h+HL5ujaw7FQw/8OVhQVUJk=;
	b=FQ5ZMwbrphnHqRpENOCQo3zHOF7E53ICys67U2ePTftEZGtvgXjO+oKhmkDcSqg7Q9
	RsOG1tM1c/Dsrl9p9Wr/lg7Y+rzlHwS0OmjeAKFlfx8Z8HKxZ0x0S/LMWkDC/ctkQ5mZ
	Zj3xXBTsAi3Yk8140CLCQ5ZfLZjugRjqOEuG+KIFcN6AOaeBykqSRNnzJggz0dGXvDJE
	CY/O2NXCpNuZTJ/DHQYmoSFVcUEQW9RpbDPJvUnP0tabJm1AOfunxMKdxtEa4qEBXXEF
	fF5kRJX2eGXyKPB6UWgd+77t06zMCMJ1ScLLKWXSfgrOPOTzzMPLuOk1mBMrg5Eih+Vl
	qwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WLZ4K4sXW7wDpXTEqGu6h+HL5ujaw7FQw/8OVhQVUJk=;
	b=NjzWmGj+QDbmzQJqC/FPW63BAVPl/8bY1kt7KvSjlOgvYcB6ooEsKxSv0KMjJB4Usq
	RvYE3BfWSQrvhi0iA+lGPsOwz44INRftTFvCJ3j2A9ryaTlrWbWjECJANGWYyIJOG9hz
	J82a2bZA/jk7pSBU2wGeVyxJkjsMG3OBQ12lM9klolp/KBGpaw8+4fTKm/fudpghb/Nz
	z+RZcyUjDcFw2jlNqG7bzFZorGsOj5G+GButfNREJHiWbYMh9Lss7B+mWoF6MLVn7QOO
	ndinCBxedKTatpkixVydJE+8xE3Pthdc1Q8nrXKe5//+j81qgo0Lukk/dLA37rxNu+qO
	T0Nw==
X-Gm-Message-State: APt69E0okUql7kHF1LgC8ESdDQHmiEtjYnuXWfG+Wiig0NNkNzgUQ4wE
	M90I84YRXVmKNwIsLtwSiIt53CeD6V3P0s5//Dg=
X-Google-Smtp-Source: ADUXVKKrygsbICCZJXu4zs7PstoINJGwXXCmvYcRK7K+6oGtJsHqRHXMdgpyLEi8QNT13gFEOcyGX0gA9PKSIzTOAHU=
X-Received: by 2002:a9f:3b9b:: with SMTP id
	r27-v6mr13789509uah.191.1529514262277; 
	Wed, 20 Jun 2018 10:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <1527370560-622-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1B56A49860EB2D45ADE3731B15C959FD0170F9E99F@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD0170F9E99F@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jun 2018 10:03:55 -0700
Message-ID: <CAMKF1soR7hC521cHbfN=Ze1-0VU47hUt6-DDDY08zjT-g+YtsA@mail.gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] samba:Deleted config for lsb, since this part has been deleted from samba upstream.
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
X-List-Received-Date: Wed, 20 Jun 2018 17:04:22 -0000
Content-Type: text/plain; charset="UTF-8"

Can you rebase it on latest master or master-next and resend.
On Wed, Jun 20, 2018 at 12:39 AM Lei, Maohui <leimaohui@cn.fujitsu.com> wrote:
>
> Ping
>
> > -----Original Message-----
> > From: Lei, Maohui
> > Sent: Sunday, May 27, 2018 5:36 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Lei, Maohui
> > Subject: [oe] [meta-networking][PATCH] samba:Deleted config for lsb, since this
> > part has been deleted from samba upstream.
> >
> > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > ---
> >  .../recipes-connectivity/samba/samba_4.7.6.bb      | 25 ++++++++--------------
> >  1 file changed, 9 insertions(+), 16 deletions(-)
> >
> > diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb b/meta-
> > networking/recipes-connectivity/samba/samba_4.7.6.bb
> > index a8517c5..b570e4b 100644
> > --- a/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
> > +++ b/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
> > @@ -46,8 +46,6 @@ DEPENDS_append_libc-musl = " libtirpc"
> >  CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
> >  LDFLAGS_append_libc-musl = " -ltirpc"
> >
> > -LSB = ""
> > -LSB_linuxstdbase = "lsb"
> >
> >  INITSCRIPT_NAME = "samba"
> >  INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
> > @@ -68,7 +66,6 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES',
> > 'systemd zeroconf', d)}
> >                     acl ad-dc cups gnutls ldap mitkrb5 \
> >  "
> >
> > -RDEPENDS_${PN}-base += "${LSB}"
> >  RDEPENDS_${PN}-ctdb-tests += "bash util-linux-getopt"
> >
> >  PACKAGECONFIG[acl] = "--with-acl-support,--without-acl-support,acl"
> > @@ -150,19 +147,15 @@ do_install_append() {
> >      install -m644 packaging/systemd/samba.conf.tmp
> > ${D}${sysconfdir}/tmpfiles.d/samba.conf
> >      echo "d ${localstatedir}/log/samba 0755 root root -" \
> >          >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
> > -    if [ "${LSB}" = "lsb" ]; then
> > -        install -d ${D}${sysconfdir}/init.d
> > -        install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d/samba
> > -    else
> > -        install -d ${D}${sysconfdir}/init.d
> > -        install -m 0755 packaging/sysv/samba.init
> > ${D}${sysconfdir}/init.d/samba
> > -        sed -e 's,/opt/samba/bin,${sbindir},g' \
> > -            -e 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \
> > -            -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
> > -            -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba,g' \
> > -            -e 's,/usr/bin,${base_bindir},g' \
> > -            -i ${D}${sysconfdir}/init.d/samba
> > -    fi
> > +
> > +    install -d ${D}${sysconfdir}/init.d
> > +    install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba
> > +    sed -e 's,/opt/samba/bin,${sbindir},g' \
> > +        -e 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \
> > +        -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
> > +        -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba,g' \
> > +        -e 's,/usr/bin,${base_bindir},g' \
> > +        -i ${D}${sysconfdir}/init.d/samba
> >
> >      install -d ${D}${sysconfdir}/samba
> >      echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
> > --
> > 1.9.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


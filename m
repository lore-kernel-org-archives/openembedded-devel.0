Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ra9tw-0000cl-W3
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 18:42:57 +0100
Received: by lami14 with SMTP id i14so30072lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 09:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=61mV74iRs7lWdsYb55g32CqlsSU2JK+fNcQLffrj+uI=;
	b=emsw5tD2Udcv4VWn0DRpN4jRQso9mok3MiEfAQQKSNLncM9i72CEcdsGnGXf0Si2Xr
	+m4KoP3ky0xWLbYRmlB9Y1a+ELTkleo4Y3ZkhlVTADdZy8JW3cDnBsfe3SICyYbty8Sk
	uHdBA1nW8+sdaR8pvwhHnt7tFpxnJ6fKLzGCI=
Received: by 10.152.130.232 with SMTP id oh8mr1998106lab.6.1323711361298; Mon,
	12 Dec 2011 09:36:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Mon, 12 Dec 2011 09:35:30 -0800 (PST)
In-Reply-To: <1323707082-9185-2-git-send-email-philip@balister.org>
References: <1323707082-9185-1-git-send-email-philip@balister.org>
	<1323707082-9185-2-git-send-email-philip@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Dec 2011 09:35:30 -0800
Message-ID: <CAMKF1soquX6jz+ZFpUEgWPkAUFxhcHXBQSug7tFJck8y+1QKng@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 2/2] gvfs : Fix build failure due to introduction of host includes.
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
X-List-Received-Date: Mon, 12 Dec 2011 17:42:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2011 at 8:24 AM, Philip Balister <philip@balister.org> wrot=
e:
> Tested with Angstrom on usrp-e1xx.
>
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
> =C2=A0meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb b/meta-gnome/rec=
ipes-gnome/gvfs/gvfs_1.8.2.bb
> index 5a230eb..fd4a089 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
> @@ -14,6 +14,7 @@ SRC_URI[archive.md5sum] =3D "402f94b187b197b403d25c85ca=
eb9562"
> =C2=A0SRC_URI[archive.sha256sum] =3D "0895ac8f6d416e1b15433b6b6b68eb119c6=
e8b04fdb66db665d684355ef89345"
>
> =C2=A0EXTRA_OECONF =3D "--disable-samba \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-archiv=
e \

You are disabling archive backend explicitly. It might be that someone is u=
sing
it successfully. Why does it not work ?

> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-samba-incl=
udes=3D${STAGING_INCDIR} \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-samba-libs=
=3D${STAGING_LIBDIR} \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-archive-in=
cludes=3D${STAGING_INCDIR} \

the above option is not needed when you are disabling libarchive anyway

> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MfgZn-0006vr-C9
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 22:55:39 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1387354qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 13:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=xqmTjW6OjbE8osMNUhehvYF4G7bnNyYRZXsxmSebv6g=;
	b=jTbfAF12AuLbSK6aaaENLfjLuP+/rpmNGtayNzpONSToNYoAwY0SyOBKRvmrUEvR5D
	LLz+abSpdXOgnTS3Mm+Pny2KC5mKhZqudvkuBem7Nv1y/xYqcGM4I8nkjKOcoHSQBdZR
	YsCWsznncmMs5HEIbkzF6H0kk6Z8IlqRgOY3E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=uvJySlRkPpI0cXBhVLjFFUnrjQYFv9raUk/DPAkNOEnaZMwmPsQIBJzAnfMkJCE0yW
	q5j+R+/czfTNbfPsWGJo+rNMAg0oM1nnviFMHXOXLrcImAWFbYogTWGb0sLyV/FjnaZB
	d5nur8wDt4d07msFlhXSETNAxuz7Z6ZnRZ6AU=
MIME-Version: 1.0
Received: by 10.229.37.74 with SMTP id w10mr1154915qcd.73.1251146273487; Mon, 
	24 Aug 2009 13:37:53 -0700 (PDT)
In-Reply-To: <1251140186-26944-1-git-send-email-edoiron@cbnco.com>
References: <1251140186-26944-1-git-send-email-edoiron@cbnco.com>
Date: Mon, 24 Aug 2009 13:37:53 -0700
Message-ID: <19c1b8a90908241337y3f3f9239x6470ecbe91ab2d63@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Evan Doiron <edoiron@cbnco.com>
Subject: Re: [PATCH] rsync: add v3.0.6
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
X-List-Received-Date: Mon, 24 Aug 2009 20:55:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2009 at 11:56 AM, Evan Doiron<edoiron@cbnco.com> wrote:
> Signed-off-by: Evan Doiron <edoiron@cbnco.com>
> ---
> =C2=A0conf/checksums.ini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A04 ++++
> =C2=A0recipes/rsync/rsync_3.0.6.bb | =C2=A0 16 ++++++++++++++++
> =C2=A02 files changed, 20 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/rsync/rsync_3.0.6.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 3ee124d..ba06d5d 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -21714,6 +21714,10 @@ sha256=3D17697db5bb9de399b71f7927070f60b3554b70b=
0ecc0419b50455d56560ea169
> =C2=A0md5=3D2122d460b4119749c6e5993938a9b501
> =C2=A0sha256=3D17697db5bb9de399b71f7927070f60b3554b70b0ecc0419b50455d5656=
0ea169
>
> +[http://rsync.samba.org/ftp/rsync/src/rsync-3.0.6.tar.gz]
> +md5=3De9865d093a18e4668b9d31b635dc8e99
> +sha256=3D33cc969364cb66b3e345fa7db2c651a8e07de0e58743ec03899c4ba86953e1b=
3
> +
> =C2=A0[http://downloads.sourceforge.net/nogravity/rt-nogravity-data.zip]
> =C2=A0md5=3Dc7536e907363ea1da63430b49e42931d
> =C2=A0sha256=3Dd7d5a3d17f492049fceb2b9ea22c4c2af7243506219d83f7005b77ae41=
0add29
> diff --git a/recipes/rsync/rsync_3.0.6.bb b/recipes/rsync/rsync_3.0.6.bb
> new file mode 100644
> index 0000000..bdb2ba1
> --- /dev/null
> +++ b/recipes/rsync/rsync_3.0.6.bb
> @@ -0,0 +1,16 @@
> +require rsync.inc
> +
> +PR =3D "r0"

no need of PR if it is r0 its automatically set to r0

> +
> +SRC_URI +=3D "\
> + =C2=A0file://m4.patch;patch=3D1 \
> + =C2=A0file://rsyncd.conf \
> +"
> +# The source tarball from 3.0.6 seems to need this
> +do_configure_append(){
> + =C2=A0oe_runmake reconfigure
> +}
> +
> +do_compile_prepend() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i "s/conf_stop make_stop//" Makefile
> +}

this you can make as do_configure_append instead IMO

> --
> 1.6.0.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



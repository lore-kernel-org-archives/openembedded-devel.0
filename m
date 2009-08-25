Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mg0hd-00007Z-KI
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 20:25:11 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1639986qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 11:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bwOdeKzKVodfBAn0rSA7mTMId+uNiD/eR4AcaP8NGF8=;
	b=MqWPK4jUzXh1v1cNWlQSrjUlD7I5An7HvlQWKPgwrxPt3W3A6VB8eQcl+COEOUlrPl
	oZA3OpRx/UMYTENXWUDUInPwOHqBHvSI8F/68ZvPiAxP8yFNMmp1HJE1nnU23zlmPdAC
	SkMcDzevJyu3f8eogLgaiKF60Nq4W/tqocQxM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UwSyPu+ruu2QZ6Sdp32VUFKODHw6W98bz7pKtrYApPWrnN1nmJXe7+ysSqR2IYpM/y
	jAvTcO6KYj0UEDxdN2RshniQB1w/tQ1JG3T4b3GFzSajpbmkurVH1QdvXrugUX4P3t0E
	V/N8pjO5qLKFfyTdFdRg+sNx9278ZkOnbVZbg=
MIME-Version: 1.0
Received: by 10.229.23.6 with SMTP id p6mr1711342qcb.48.1251223633798; Tue, 25 
	Aug 2009 11:07:13 -0700 (PDT)
In-Reply-To: <1251217448-8279-1-git-send-email-edoiron@cbnco.com>
References: <4A93F7F2.7030207@cbnco.com>
	<1251217448-8279-1-git-send-email-edoiron@cbnco.com>
Date: Tue, 25 Aug 2009 11:07:13 -0700
Message-ID: <19c1b8a90908251107l5a52991es3db758b2ad7d2de7@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] rsync: add v3.0.6
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
X-List-Received-Date: Tue, 25 Aug 2009 18:25:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2009 at 9:24 AM, Evan Doiron<edoiron@cbnco.com> wrote:
> Signed-off-by: Evan Doiron <edoiron@cbnco.com>
> ---
> =C2=A0conf/checksums.ini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A04 ++++
> =C2=A0recipes/rsync/rsync_3.0.6.bb | =C2=A0 12 ++++++++++++
> =C2=A02 files changed, 16 insertions(+), 0 deletions(-)
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
> index 0000000..614b051
> --- /dev/null
> +++ b/recipes/rsync/rsync_3.0.6.bb
> @@ -0,0 +1,12 @@
> +require rsync.inc
> +
> +PR =3D "r0"

get rid of this one. Otherwise it looks ok

Acked-by: Khem Raj >raj.khem@gmail.com>

> +
> +SRC_URI +=3D "\
> + =C2=A0file://m4.patch;patch=3D1 \
> + =C2=A0file://rsyncd.conf \
> +"
> +# The source tarball from 3.0.6 seems to need this
> +do_configure_append(){
> + =C2=A0oe_runmake reconfigure
> +}
> --
> 1.6.0.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



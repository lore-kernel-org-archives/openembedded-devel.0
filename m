Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pabee-0001ei-LR
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 23:16:28 +0100
Received: by iyj18 with SMTP id 18so15062355iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 14:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wxZ59lrBrk/nii4Hqxoz3IHMvxpOh9/X/gnc2pkhO5g=;
	b=TUyaPuFbN/NbKHWRoKv5E218IJnWstjZuOgdv9ziPIRtKrjEa0SpbKuR54YrmJEfaD
	8QA77Q4ANI0QWuttkNUa6g4Em2Luo2MqBfw1F90m4fzHj5mWQY6txZTsVzc85vVxLVJs
	Ik9kFtTtVllgHc9TnqIqsGOwNHc888SvtWIGI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iRVYNf7QE/yhMuCvt9fBnxA5p+2eZAr5D2juvBPHyDYSdm++8pCN4FfabYuBo6HPxK
	ysJRFRo51OnB1/WauwoFtjPhSdG5MpV1tZbVHQmT/ACcIPb/W+4AgYqKSTUvkRBwKw30
	VsiUtkChstkPi5MCifVBHRsIeUyFsvyGKp6ow=
MIME-Version: 1.0
Received: by 10.231.10.76 with SMTP id o12mr7720285ibo.144.1294265763939; Wed,
	05 Jan 2011 14:16:03 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Wed, 5 Jan 2011 14:16:03 -0800 (PST)
In-Reply-To: <1294241612-28405-2-git-send-email-Martin.Jansa@gmail.com>
References: <1294241612-28405-1-git-send-email-Martin.Jansa@gmail.com>
	<1294241612-28405-2-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 5 Jan 2011 23:16:03 +0100
Message-ID: <AANLkTi=fLp_jkWRvb9qNeFE=gBW7NJp0UFNdXMO_UU3u@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] mysql5-native: put make install to do_install after autotools_stage_all was removed with do_stage in eaf0fc03acfb262bcd614a14086a1b28ec850f46
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
X-List-Received-Date: Wed, 05 Jan 2011 22:16:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/5 Martin Jansa <martin.jansa@gmail.com>:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0recipes/mysql/mysql5-native_5.1.40.bb | =A0 =A04 ++++
> =A01 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/mysql/mysql5-native_5.1.40.bb b/recipes/mysql/mysql5=
-native_5.1.40.bb
> index 40d07ec..8001783 100644
> --- a/recipes/mysql/mysql5-native_5.1.40.bb
> +++ b/recipes/mysql/mysql5-native_5.1.40.bb
> @@ -12,6 +12,10 @@ EXTRA_OEMAKE =3D ""
> =A0EXTRA_OECONF =3D " --with-embedded-server "
>
> =A0do_install() {
> + =A0 =A0 =A0 =A0oe_runmake 'DESTDIR=3D${D}' install
> + =A0 =A0 =A0 =A0mv -f ${D}${libdir}/mysql/* ${D}${libdir}
> + =A0 =A0 =A0 =A0rmdir ${D}${libdir}/mysql
> +
> =A0 =A0 =A0 =A0 install -d ${D}${bindir}
> =A0 =A0 =A0 =A0 install -m 0755 sql/gen_lex_hash ${D}${bindir}/
> =A0}
> --

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

who wished people removing do-stage would actually verify their work
(like they expect others to do).



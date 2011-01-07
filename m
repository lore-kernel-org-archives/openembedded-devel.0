Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PbKeF-0008RJ-Kj
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 23:19:03 +0100
Received: by gwaa12 with SMTP id a12so4822637gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 14:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=txd623Vf+rBdcNYfJXJWG2V58hw7OHuHtV4VbFSWb1o=;
	b=uUPZlQY2smPKwPwWYOsR/4Df4dQKTMOB8hpxeG+u8NafcZAEuFYlmUYhIgQ0apnOJ0
	uqZp07E/txJvYMqgDa+vx/hfyDlQFnHkhtjtFaPs5sGy+CfMQzCKmrfYnooxewQrFpJt
	FGWCmz4/iSdZeQtVgGYqTnu6IhN0H+b5nhzFg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=NJhSYJrZwmL8CBfRo2tyTr6PsycO2D6he3ZYGHMdPLgwFnq3loj6g1B32Tv934XZrk
	kKD1BvhvNjaMtLb6BjmkiWZPIrgEspv2/S3XOivbBnohe+pf8Q6n969PYuowFvdA7nUE
	hml8xWhWy5sMvZPDNoQFPwnQl3kF5jlb9Rj1k=
Received: by 10.90.104.20 with SMTP id b20mr3849149agc.193.1294438716633; Fri,
	07 Jan 2011 14:18:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 7 Jan 2011 14:18:15 -0800 (PST)
In-Reply-To: <1294428159-5340-1-git-send-email-j-lance1@ti.com>
References: <1294428159-5340-1-git-send-email-j-lance1@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jan 2011 14:18:15 -0800
Message-ID: <AANLkTikptt38aAptW4Mbcxr578LPmHB9ZOQfuM0ODKfH@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jeff Lance <j-lance1@ti.com>
Subject: Re: [PATCH 1/1] am-sysinfo: update the SRCREV
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
X-List-Received-Date: Fri, 07 Jan 2011 22:19:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 7, 2011 at 11:22 AM, Jeff Lance <jefflance01@gmail.com> wrote:
> =C2=A0* SRCREV update to pull in the following:
> =C2=A0 =C2=A0* remove all compiler generated files from this repository
> =C2=A0 =C2=A0* Modification for CCSv5 projects to build for arm926ej-s.
> =C2=A0 =C2=A0* This is to overcome a CCSv5 limitation where you can't pas=
s in CFLAGS externally
> =C2=A0 =C2=A0* This only affects building with CCSv5, it does not affect =
the Arago build.
>
> Signed-off-by: Jeff Lance <j-lance1@ti.com>
> ---
> =C2=A0recipes/ti/am-sysinfo_svn.bb | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/ti/am-sysinfo_svn.bb b/recipes/ti/am-sysinfo_svn.bb
> index 9193836..07c292d 100644
> --- a/recipes/ti/am-sysinfo_svn.bb
> +++ b/recipes/ti/am-sysinfo_svn.bb
> @@ -4,9 +4,9 @@ LICENSE =3D "BSD"
> =C2=A0SECTION =3D "system"
> =C2=A0PRIORITY =3D "optional"
>
> -SRCREV =3D "2"
> +SRCREV =3D "5"
> =C2=A0PV =3D "1.0"
> -PR =3D "r1+svnr${SRCPV}"
> +PR =3D "r2+svnr${SRCPV}"
>

I think you do not need to bump r1->r2

> =C2=A0SRC_URI =3D "svn://gforge.ti.com/svn/am_sysinfo/;module=3Dtrunk;pro=
to=3Dhttps;user=3Danonymous;pswd=3D''"
>
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



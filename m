Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S16JM-0007ND-Aq
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Feb 2012 02:20:32 +0100
Received: by vcbfl13 with SMTP id fl13so5791vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 17:12:08 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.220.156.139 as permitted sender) client-ip=10.220.156.139; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.220.156.139 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.220.156.139])
	by 10.220.156.139 with SMTP id x11mr3011852vcw.18.1330132328676
	(num_hops = 1); Fri, 24 Feb 2012 17:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZxSDSKglzzQqt1CY718PiIWnXVOU/g4vq9Syhw5gQ9M=;
	b=XV7I1Rz9kjU4yxcXADyacTe32YNmk82z92XUC5r/HDbvVFAU1APWK9ZF8P1PGwrwgY
	mS3ArAu74K9HaPk3l/BlRxaiQ7vVKtcdHbLVcpi7enVYRd/XTu0Vc2XCm3vAxH35MvhE
	XiJzFZA0pOqdsVOCnEV6FonWSS1a0su8yXkv0=
MIME-Version: 1.0
Received: by 10.220.156.139 with SMTP id x11mr2371462vcw.18.1330132327884;
	Fri, 24 Feb 2012 17:12:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Fri, 24 Feb 2012 17:12:07 -0800 (PST)
In-Reply-To: <1330126696-4716-1-git-send-email-schnitzeltony@googlemail.com>
References: <1330126696-4716-1-git-send-email-schnitzeltony@googlemail.com>
Date: Fri, 24 Feb 2012 23:12:07 -0200
X-Google-Sender-Auth: kk0NBbu4qaVZ1IueeUmEop5UVPc
Message-ID: <CAP9ODKqb-AN5rW+Cpgq7OudwdqGfHwXAYP28irskS+kU8BRXRQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-mozilla, v2 1/3] firefox-gen-l10n-recipes: INC_PR as PR for l10n-recipes
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
X-List-Received-Date: Sat, 25 Feb 2012 01:20:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Applied.

On Fri, Feb 24, 2012 at 21:38, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
> =A0scripts/firefox-gen-l10n-recipes | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/firefox-gen-l10n-recipes b/scripts/firefox-gen-l10n-=
recipes
> index 435697b..65126a2 100755
> --- a/scripts/firefox-gen-l10n-recipes
> +++ b/scripts/firefox-gen-l10n-recipes
> @@ -26,7 +26,7 @@ cat > firefox-l10n-${lang_code}_$1.bb <<EOF
>
> =A0require firefox-l10n.inc
>
> -PR =3D "\${INC_PR}.1"
> +PR =3D "\${INC_PR}"
>
> =A0SRC_URI[md5sum] =3D "$md5"
> =A0SRC_URI[sha256sum] =3D "$sha256"
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



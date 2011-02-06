Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PlukV-0002cm-AY
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 03:53:15 +0100
Received: by yie16 with SMTP id 16so1402729yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Feb 2011 18:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=uRQQ/W1wXGFfYDYloO/tNy8rroKUoKEnKHMJdGAvNd8=;
	b=PPH7ItrPLNE+MsD3IJPNOA/vB/jU8Ze2yXwD7AbavRc8JTfGpmD7nNs4d3LZ65aq92
	ceq7DIRoEtUvD7/3/Kuk/BM2tQZAFyUKjhk8Nl8kOaWhAdfsGRNZ43mskWYRo2yTKmnY
	9m6EEWfLohYku03ndg66NpFkSBfgQWSUmxq28=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=SaGURE2fE+pRc4KQ2JV8gaco/wgIbW1vEdsqGvfXs/BJiY9NE5Q/5GSBBeWFB0J+3y
	7iyJIk1SzFKJBRDpwS6ev57WpFhfjaRCbBa4tsHKyXRrUo9CEDSYoFbJrDrQUTJO/YSp
	HBEFPJEnGdgJUAgvHHu2IKVBKswevyVdh0U4c=
Received: by 10.90.51.20 with SMTP id y20mr17587889agy.115.1296960734767; Sat,
	05 Feb 2011 18:52:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Sat, 5 Feb 2011 18:51:54 -0800 (PST)
In-Reply-To: <1296926448-2465-1-git-send-email-filip.zyzniewski@gmail.com>
References: <1296926448-2465-1-git-send-email-filip.zyzniewski@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Feb 2011 18:51:54 -0800
Message-ID: <AANLkTiknYT+Ds+0URZXr1+08=8LBD2ekiV2Ng3xP-QsV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] apt_0.7.20.2: fixed compilation errors with gcc-4.4.
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
X-List-Received-Date: Sun, 06 Feb 2011 02:53:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 5, 2011 at 9:20 AM, Filip Zyzniewski
<filip.zyzniewski@gmail.com> wrote:
> Just like in apt-native_0.7.20.2.bb.
> Related bugzilla entry: http://bugs.openembedded.org/show_bug.cgi?id=3D55=
11

Please submit the patch with proper signoff

> ---
> =C2=A0recipes/apt/apt_0.7.20.2.bb | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/apt/apt_0.7.20.2.bb b/recipes/apt/apt_0.7.20.2.bb
> index bd0f41e..b03ef5d 100644
> --- a/recipes/apt/apt_0.7.20.2.bb
> +++ b/recipes/apt/apt_0.7.20.2.bb
> @@ -5,6 +5,7 @@ require apt.inc
>
> =C2=A0SRC_URI +=3D "file://no-doxygen.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-ko-translation.patch =
\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-gcc-4.4-compile.pat=
ch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://use-host.patch "
> =C2=A0PR =3D "r2"

you need to bump PR too

>
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



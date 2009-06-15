Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MGBa6-0001Dd-Rn
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 14:46:34 +0200
Received: by yw-out-1718.google.com with SMTP id 5so1754200ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2009 05:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=GC+EkmkZfKLwoYUflJzURxVG5Ayzfxm0SeA02Ke9aG0=;
	b=xRwFKARaHQMpnAr461hYPZkthLR0i0kv/729l+IHTSw8ik/q3noMFuXAdYx066vEOn
	ySAuqwts4rJeM4Rs4VuDFir08gIAizVyejw2PTrgksojmA1bnPLTc5iMWP1rVjdXx55W
	LiVnnEmmnBqw9CpiJyQdJxUVX8E3XAFDlacxA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=EwjIrL/ZL4JE8O8apR9XotNYuOVvDEyfXR24wacE8SvtSbcL6kQPz+PR4GKBEOS9R7
	4oMa6HlvbObeasbOUUsK9cw+1okKNAfLt6TLApDBhV9qBl/M/UF9OwI/oNxPFGPwA76g
	3NGy2xZvNWnNFFJO2ocQK7y7tzXYu9L/zDSbM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.248.16 with SMTP id v16mr8783824anh.60.1245069381554; Mon, 
	15 Jun 2009 05:36:21 -0700 (PDT)
In-Reply-To: <1244859753-28054-1-git-send-email-no2spam@nospam.arcornews.de>
References: <1244859753-28054-1-git-send-email-no2spam@nospam.arcornews.de>
Date: Mon, 15 Jun 2009 09:36:21 -0300
X-Google-Sender-Auth: 81058a40947ac854
Message-ID: <be7a9f3d0906150536s5aa9679aj922da841044dd0bd@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Subject: Re: [PATCH] preferred-xorg-versions-X11R7.4.inc: pin xextproto-native and xtrans-native
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
X-List-Received-Date: Mon, 15 Jun 2009 12:46:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Fri, Jun 12, 2009 at 11:22 PM, Rolf
Leggewie<no2spam@nospam.arcornews.de> wrote:
> From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
>
> This file is sourced by the jlime, kaleios and minimal distribution.
>
> Pin down
> * xextproto-native: 7.0.3
> * xtrans: 1.2.1
>
> These are the latest two versions to successfully compile in the Xorg 7.4=
 context.
> Others require a more recent xorg-macros.m4.
>
> http://tinderbox.openembedded.net/builds/158904/
> http://tinderbox.openembedded.net/builds/159024/
> ---
> =A0.../include/preferred-xorg-versions-X11R7.4.inc =A0 =A0| =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.4.inc b/co=
nf/distro/include/preferred-xorg-versions-X11R7.4.inc
> index 46fa8d4..21f9758 100644
> --- a/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
> +++ b/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
> @@ -195,6 +195,7 @@ PREFERRED_VERSION_xtrans ?=3D "1.2.1"
> =A0# This should be here but is needed until bitbake can do
> =A0# versioned depends
> =A0PREFERRED_VERSION_mesa ?=3D "7.2"
> +PREFERRED_VERSION_xtrans-native ?=3D "1.2.1"
>
> =A0# proto
> =A0PREFERRED_VERSION_applewmproto ?=3D "1.0.3"
> @@ -218,6 +219,7 @@ PREFERRED_VERSION_videoproto ?=3D "2.2.2"
> =A0PREFERRED_VERSION_windowswmproto ?=3D "1.0.3"
> =A0PREFERRED_VERSION_xmiscproto ?=3D "1.1.2"
> =A0PREFERRED_VERSION_xextproto ?=3D "7.0.3"
> +PREFERRED_VERSION_xextproto-native ?=3D "7.0.3"
> =A0PREFERRED_VERSION_xf86dgaproto ?=3D "2.0.3"
> =A0PREFERRED_VERSION_xf86driproto ?=3D "2.0.4"
> =A0PREFERRED_VERSION_xf86miscproto ?=3D "0.9.2"
> --
> 1.6.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br



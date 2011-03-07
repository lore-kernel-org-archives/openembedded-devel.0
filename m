Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PwgIY-0004fI-IS
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 20:40:54 +0100
Received: by fxm8 with SMTP id 8so4441782fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2011 11:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=KJVcRRRCNAbFCVMi9BvtF+wQRfvX1ksN+Bj4JKD63go=;
	b=HGi/PoAXn8oE0f9kINe/AcKn0pn3xOJO4Y5l5qmPyvAznrXhdB+6qkg0eCRjohCsin
	oVgLL4ehawPCWDxxdrwVynbyXC0hWUCYUz+oMvCu4sJ1MpHHxI65sgVPeVv/8sKboMPk
	TN2XTUKmE1A5bHVpnhGev77I54bQ6PcghdpHE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=M6/efO+o4W5JybNnR8rz/JfPZiPv8yNxMrNiZTdTTO8PIWAgtwsx7mk6HXQ5krou1J
	5oI6iBQPHtialzBIJESCuH3YlxgisEkktLs5/GRkxL5mb72H9wlw8AdHQmQvJtJcZaPX
	ORO3kqc/LuT0M9O/dXmtkaMlp6EFptcAWOui4=
Received: by 10.223.76.147 with SMTP id c19mr1543436fak.55.1299526758217; Mon,
	07 Mar 2011 11:39:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Mon, 7 Mar 2011 11:38:48 -0800 (PST)
In-Reply-To: <1299524617-7212-1-git-send-email-tom_rini@mentor.com>
References: <1299524617-7212-1-git-send-email-tom_rini@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Mar 2011 11:38:48 -0800
Message-ID: <AANLkTikS8xArUAz6mGf=uF=aCffOU78AQ07+iB=90N9p@mail.gmail.com>
To: Tom Rini <tom_rini@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gettext.bbclass: Drop target gettext from DEPENDS.
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
X-List-Received-Date: Mon, 07 Mar 2011 19:40:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 7, 2011 at 11:03 AM, Tom Rini <tom_rini@mentor.com> wrote:
> This should be handled via virtual/libintl already.
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

you have to do some uclibc x11 image build from scratch to check for fallou=
ts

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0classes/gettext.bbclass | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/gettext.bbclass b/classes/gettext.bbclass
> index 968531b..6c480b5 100644
> --- a/classes/gettext.bbclass
> +++ b/classes/gettext.bbclass
> @@ -11,7 +11,7 @@ python () {
> =C2=A0 =C2=A0 gettext_after_parse(d)
> =C2=A0}
>
> -DEPENDS_GETTEXT =3D "gettext gettext-native virtual/libiconv virtual/lib=
intl"
> +DEPENDS_GETTEXT =3D "gettext-native virtual/libiconv virtual/libintl"
>
> =C2=A0DEPENDS =3D+ "${DEPENDS_GETTEXT}"
> =C2=A0EXTRA_OECONF +=3D "--enable-nls"
> --
> 1.7.0.4
>
>



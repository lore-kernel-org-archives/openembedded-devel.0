Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1Mh2rd-0006ni-8q
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Aug 2009 16:55:41 +0200
Received: by bwz6 with SMTP id 6so687530bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2009 07:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qLH4KpBMXl+HZzDVg7MuO2nZaCMflIuMvKwy1SJz6TI=;
	b=mw0eo0duFEfOaozRMMR4MsxWNOuiLLdbAJtKu0D68luVQTmQeZrbSNxOQdHp7wx9Yu
	W3igzFr5eWZMfeifm40hoHiSUCnAjhx9ov9M8rNQK3KPzBF1NdTE66MVseg+1m/8Zwlo
	UTpci8cbufE5sdjzjo+g3R751GdVggQDWMtwU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=eKycbn48cVtHrtnDby3vuPuicFjP+v6dHwXe4h7AMDfxvjyht250EdZawh6k8yoQYj
	kiwlsuuWiuStmGHtitqx6FtBZahEzHYTUjSXLqXCV9UFyPzOPsTmWHOtXtY/4+gJxzA+
	+MOVNsbP8NX0ynay1bP5Sx5Txa6ne/u4nkq98=
MIME-Version: 1.0
Received: by 10.103.84.10 with SMTP id m10mr325764mul.60.1251470248568; Fri, 
	28 Aug 2009 07:37:28 -0700 (PDT)
In-Reply-To: <1246474461-16671-9-git-send-email-marcin@juszkiewicz.com.pl>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
	<1246474461-16671-9-git-send-email-marcin@juszkiewicz.com.pl>
Date: Fri, 28 Aug 2009 17:37:28 +0300
Message-ID: <fce2a370908280737n25668cdi7cacd82a8a141499@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [STABLE][PATCH 014/125] qemu-native.inc : force qemu native to use our C/LDFLAGS so that you don't need the required dev packages installed on host. Use our OE versions
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
X-List-Received-Date: Fri, 28 Aug 2009 14:55:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Any chance our stable maintainers will check the patch? :-\

On Wed, Jul 1, 2009 at 9:54 PM, Marcin
Juszkiewicz<marcin@juszkiewicz.com.pl> wrote:
> From: Graeme Gregory <dp@xora.org.uk>
>
>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
> =C2=A0recipes/qemu/qemu-native.inc | =C2=A0 =C2=A03 +++
> =C2=A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/qemu/qemu-native.inc b/recipes/qemu/qemu-native.inc
> index e4064a2..9edad66 100644
> --- a/recipes/qemu/qemu-native.inc
> +++ b/recipes/qemu/qemu-native.inc
> @@ -1,3 +1,6 @@
> =C2=A0inherit native
>
> =C2=A0DEPENDS =3D "libsdl-native zlib-native"
> +
> +export OS_CFLAGS=3D"${CFLAGS} ${LDFLAGS}"
> +
> --
> 1.6.3.1
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



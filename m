Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lwi0F-0006Aa-TP
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 21:21:04 +0200
Received: by yw-out-1718.google.com with SMTP id 9so92059ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 12:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=WSQL+HlWoSWTTq16gZoc351LM9pMuDCKFUnp7hpJDK0=;
	b=QsAS1kY3x3G6oUmZWbQ0Mlos1NHqFioTAgKsG8r4bwT5oThIaOelVlFE5hHphMX+Fa
	5YO8yCN39H4w5M1LKMeG3cCAXt5zH/KYGcQe6AfT1IwBpdmXC3ROxNAsDkkf6k9lEht6
	eyGYsE1rD+pJdYJ8Me/L784gSvhCKBQTGPGt8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=suq2biZVzf7+dUWdKpXQeot/+D9j9nKuFx+exp42HFIsh/achQs1rzxxiF9cTEUzwv
	oStv/HUIm3F/nrUr/unn3Z0kdUuYDCZMX0rlrQomFVkH4gdg3+eB70t6hzznlA2anD6Z
	hD3vTYGiH9HPJ65xtADBEsd2+RI40yFWdZwCI=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.164.20 with SMTP id m20mr161148ane.31.1240427790914; Wed, 
	22 Apr 2009 12:16:30 -0700 (PDT)
In-Reply-To: <1240427393-31060-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240427393-31060-1-git-send-email-marcin@juszkiewicz.com.pl>
Date: Wed, 22 Apr 2009 16:16:30 -0300
X-Google-Sender-Auth: 59cb5a178a71f627
Message-ID: <be7a9f3d0904221216p1c06df41x54f0a3e5017b5115@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] java.bbclass: Use force (-f) for ln (suggested by Marcin).
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
X-List-Received-Date: Wed, 22 Apr 2009 19:21:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

HACK! The email is (none) :P

On Wed, Apr 22, 2009 at 4:09 PM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> From: Robert Schuster <rschus@entw2.(none)>
>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
> =A0classes/java.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/java.bbclass b/classes/java.bbclass
> index 38256d7..cacd2ce 100644
> --- a/classes/java.bbclass
> +++ b/classes/java.bbclass
> @@ -72,7 +72,7 @@ oe_jarinstall() {
> =A0 =A0 =A0 oewarn "file was in the way. removing:" $dir/$1
> =A0 =A0 =A0 rm $dir/$1
> =A0 =A0 fi
> - =A0 =A0ln -s $destname $dir/$1
> + =A0 =A0ln -sf $destname $dir/$1
> =A0 =A0 shift
> =A0 done
> =A0}
> --
> 1.6.3.rc0
>
>
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



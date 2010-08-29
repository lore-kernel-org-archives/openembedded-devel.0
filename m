Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ope16-0001zz-L6
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 11:17:33 +0200
Received: by iwn2 with SMTP id 2so3872626iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 02:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=mM40nNS+MI0+fKV9HXRlNoHLjLpSBZyjO9t5LYGSgQg=;
	b=PzRWfLB2w+1a8kD4a/ru8/NSz4dfcpydv/R8pfyyYjlk6VJD3QrRfW2Vj4RV1tYzxi
	4HXxim6zLBd3h2Q22+yENh0OYCPjrkjcGWWzOrVVXyyv+/gO5JMPf1mRItyKq7vWkzQ+
	3kgmdNi4K1KIJichN8F2B1NBic2Yh3j7z2u0s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gdm8QnXeIrGnS4Zrd1F3+rPgUViwhv+s8e0QIL+N6QhTk+YEsDT68hOwZOx/rWps1N
	gS+unfcUbilkqLQWUj53SJmAO7x36rBx8dki8EW3tCty27ST5svtGIVcZANW5E7OMtIZ
	2m9gYOLUQ88RG6TaJAvuGe+rVUpPsupBdGDs4=
Received: by 10.231.19.6 with SMTP id y6mr3589248iba.16.1283073423143; Sun, 29
	Aug 2010 02:17:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sun, 29 Aug 2010 02:16:43 -0700 (PDT)
In-Reply-To: <1283025996-28435-2-git-send-email-eric@eukrea.com>
References: <4C776F96.2000307@eukrea.com>
	<1283025996-28435-1-git-send-email-eric@eukrea.com>
	<1283025996-28435-2-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 02:16:43 -0700
Message-ID: <AANLkTiki_iDV1gX2qPFUv9bxeNtKM5ORcn4WnLba6ib2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] sdk.bbclass: allow virtclass-sdk override
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
X-List-Received-Date: Sun, 29 Aug 2010 09:17:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 28, 2010 at 1:06 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =A0classes/sdk.bbclass | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/classes/sdk.bbclass b/classes/sdk.bbclass
> index 198d147..c8fa076 100644
> --- a/classes/sdk.bbclass
> +++ b/classes/sdk.bbclass
> @@ -66,3 +66,5 @@ FILES_${PN}-dbg +=3D "${prefix}/.debug \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"
>
> =A0export PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
> +
> +OVERRIDES .=3D ":virtclass-sdk"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



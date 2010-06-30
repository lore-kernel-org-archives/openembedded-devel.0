Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OTrL6-0007e9-Dj
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 09:04:29 +0200
Received: by bwz11 with SMTP id 11so215173bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 23:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Dz+0r+OUQibSAmyfe5lJObm1ODHvk32RrYlOy3y3FTM=;
	b=gYBmXjYOYEe1B3oZh+F3B09P0hUm3H8CYd7MfaGA1/gGk4CkJRj/UNNvXpNt6DgqzH
	rQAulfWHZaX6D+iIyZY46mJSwdgE7c/n3ADDnjJXyAxF9rW5iA9hUeVY/YpJfKm5Hju4
	YXyKKtv6zgYKayolJMkZz6/9cSbMvipI2AcmQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Er5FJNkRueAIBl01PwXRHifTzQlAPi3T4hydmdhyLIpfu5fGgxk/jChP9deb3Iids2
	Dqql0N5qB0bds4/LSWOV8/sDtkKXtR2t9Q+YoyXHJqFZs+J+kQ2J46agILBrpRefOJZl
	KMwT3JBNRJzejA1rSu73nrlTJvtv/YYGJOgV0=
MIME-Version: 1.0
Received: by 10.204.68.203 with SMTP id w11mr5294807bki.78.1277881158074; Tue, 
	29 Jun 2010 23:59:18 -0700 (PDT)
Received: by 10.204.73.81 with HTTP; Tue, 29 Jun 2010 23:59:18 -0700 (PDT)
In-Reply-To: <1277859158-28315-2-git-send-email-joaohf@gmail.com>
References: <1277859158-28315-1-git-send-email-joaohf@gmail.com>
	<1277859158-28315-2-git-send-email-joaohf@gmail.com>
Date: Wed, 30 Jun 2010 08:59:18 +0200
Message-ID: <AANLkTimJvXelRbFpB9fmSl0v5oW83K4r5-L2DV37KYtN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] add unifdef to kernel 2.6.22
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
X-List-Received-Date: Wed, 30 Jun 2010 07:04:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

subject line (and patch commit message) should read:
[PATCH] add unifdef to linux-libc-headers 2.6.22

Frans

2010/6/30 Joao H. Freitas <joaohf@gmail.com>:
> ---
> =A0.../linux-libc-headers_2.6.22.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
> index 12845e0..d1b6206 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb
> @@ -5,7 +5,8 @@ DEPENDS +=3D "unifdef-native"
> =A0PR =3D "r4"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar=
.bz2 \
> - =A0 =A0 =A0 =A0 =A0 file://procinfo.h"
> + =A0 =A0 =A0 =A0 =A0 file://procinfo.h \
> + =A0 =A0 =A0 =A0 =A0 file://unifdef.patch"
>
> =A0S =3D "${WORKDIR}/linux-${PV}"
>
> --
> 1.7.0.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



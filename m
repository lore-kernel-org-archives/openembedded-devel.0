Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QBefd-0001ZR-0w
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 04:58:37 +0200
Received: by qwh5 with SMTP id 5so2394555qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 19:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=VIaUCvFvYjvnoYIYS/BgkD4TZ5X9KDBKcYSG29f+c1I=;
	b=wEiSRD11Z8vWCUytWL5zEgrKUmbFidzzhlxDxqk7ip7rhoh3m054jmukzUMlwrjHby
	RXflRhwiCOMzWYo0YzcP7aOEJBRhjBpjlAG2YudymiA07wYvggMxZ+OXxx0f0zX7tXDG
	y8UTTgTzxMApkyqcQlL+4Y4QUxVUfiPpbmk3E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=v3TdZVvi4Jdx9wBRc09q89yR0dC0i0XQYBikSrfikToH/cjP/1NGt/zUFSLYhcMTIG
	8FzMoN2XE/KpCcKLy5EsKMpBWRRZbut9vacf9+ycdZppFqD2dCgkXTkRDqX1qQ5YDqOH
	/CW3qWlrDUEfnf5moCa0H5EB5UZnKvAoZh1PA=
MIME-Version: 1.0
Received: by 10.224.211.194 with SMTP id gp2mr2367376qab.179.1303095372439;
	Sun, 17 Apr 2011 19:56:12 -0700 (PDT)
Received: by 10.224.89.78 with HTTP; Sun, 17 Apr 2011 19:56:12 -0700 (PDT)
In-Reply-To: <iofbt7$hur$1@dough.gmane.org>
References: <1302328581-30367-1-git-send-email-heroor@gmail.com>
	<1302328581-30367-3-git-send-email-heroor@gmail.com>
	<iofbt7$hur$1@dough.gmane.org>
Date: Mon, 18 Apr 2011 08:26:12 +0530
Message-ID: <BANLkTi=430sn7z55DsCfFVafKoeUZnUx8w@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: prabu@ti.com
Subject: Re: [PATCH 3/3] libgles-omap3: Remove SGX Fixup for TI816x.
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
X-List-Received-Date: Mon, 18 Apr 2011 02:58:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2011 at 12:05 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 09-04-11 07:56, Siddharth Heroor wrote:
>> From: Siddharth Heroor <heroor@ti.com>
>>
>> * Unlike OMAP3, the SGX core has not undergone revisions in TI816x.
>> =A0 The libraries for TI816x are also fixed and do not need fixup based
>> =A0 on revision of the SGX core.
>>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>
> So, I'm back from travelling now and I'll have to NAK this patch:
>
> 1) it assumes netra will never have an sgx core update and makes it
> diverge from the other platforms.
>
> 2) it adds a useless 2 second boot delay
>
> So the net result is a harder to maintain slower version of the scripts,
> which is not acceptable.
The SGX core revision being read by devmem2 returns 5, but the correct
version of SGX libraries for TI816x is ES6.x. So, the original
pvr-init script copies the libraries from ES5.x and overwrites the
correctly installed libraries as part of boot. I will need to check
with the 3D Graphics SDK team on why the 2 second delay is required
(its present in targetfs/38xx-demo).

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNqzLnMkyGM64RGpERAgHyAKCXhRIKrqjA1FMKG+nJ8U2d+rAfYgCfSxEf
> cywcK4FZnaGd12H1+B9fk4Q=3D
> =3DgoBu
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Sid



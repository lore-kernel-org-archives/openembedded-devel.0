Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PnaR6-0001gp-Ko
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 18:36:08 +0100
Received: by gwaa12 with SMTP id a12so690170gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 09:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=LfcssoWZwqAVt2mq4NCMV964U8zNfL1VtGxT09lo/Ho=;
	b=TFmJQ9mqy/RMAKSDv5tiVwhOFjHfEBREMr4P7aUrxqT/tpfJ8r5GxKXc+MB65SBAE2
	ap/mfn2WJFHdCi5NNrccVx54sDlzShITP8aq4udPTaRU7J78VI+oO9GYHvfPRCLkRgYL
	qVdTrX5n84B9azm+TvujQwllKhPJ2Raiu/NMk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=S4OvOOVAQtd917aidfnfsFhGDY22EjsyWrTNdr7A1wDuP/d0kUYxh2tCiPn6P82UaZ
	k2SBbNESSBKwQ5HYhUT8Udzdo1ruHsjnxYZopf2nAncrtu+7r/o3a3C7cfQCTgiDaag6
	G7y/kjI+KT4dqncC87CbyABi5OYzyIhEjOtVk=
Received: by 10.91.160.30 with SMTP id m30mr3060478ago.61.1297359303272; Thu,
	10 Feb 2011 09:35:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Thu, 10 Feb 2011 09:29:34 -0800 (PST)
In-Reply-To: <1297282989-7580-1-git-send-email-filip.zyzniewski@gmail.com>
References: <1297282989-7580-1-git-send-email-filip.zyzniewski@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Feb 2011 09:29:34 -0800
Message-ID: <AANLkTinDhX0fSSTNa9CuiFv7Ty_4D=5bOhvfHo8OgzQi@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: kristoffer.ericson@gmail.com
Subject: Re: [PATCH] base-files: update fstab for jornada7xx
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
X-List-Received-Date: Thu, 10 Feb 2011 17:36:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 9, 2011 at 12:23 PM, Filip Zyzniewski
<filip.zyzniewski@gmail.com> wrote:
> We use the scsi subsystem for PCMCIA ATA access, so device files are
> /dev/sda*, not /dev/hda*.
> See recipes/linux/linux-jlime-jornada7xx-2.6.34+git/defconf_jlime:702.

is this always going to be the case ? IOW what if someone does not use
inux-jlime-jornada7xx-2.6.34+git recipe

>
> Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>



> ---
> =C2=A0recipes/base-files/base-files/jornada7xx/fstab | =C2=A0 =C2=A06 +++=
---
> =C2=A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/base-files/base-files/jornada7xx/fstab b/recipes/bas=
e-files/base-files/jornada7xx/fstab
> index f0c23d9..a06a1b6 100644
> --- a/recipes/base-files/base-files/jornada7xx/fstab
> +++ b/recipes/base-files/base-files/jornada7xx/fstab
> @@ -1,7 +1,7 @@
> =C2=A0proc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /proc =C2=A0 proc =C2=A0 =
=C2=A0defaults =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=
=A00
> -/dev/hda2 =C2=A0 =C2=A0 =C2=A0 / =C2=A0 =C2=A0 =C2=A0 ext2 =C2=A0 =C2=A0=
defaults =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A00
> -/dev/hda1 =C2=A0 =C2=A0 =C2=A0/mnt/cf auto =C2=A0 =C2=A0defaults,sync,no=
auto =C2=A0 =C2=A00 =C2=A00
> -/dev/hda3 =C2=A0 =C2=A0 =C2=A0 none =C2=A0 =C2=A0swap =C2=A0 =C2=A0sw =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00 =C2=A00
> +/dev/sda2 =C2=A0 =C2=A0 =C2=A0 / =C2=A0 =C2=A0 =C2=A0 ext2 =C2=A0 =C2=A0=
defaults =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A00
> +/dev/sda1 =C2=A0 =C2=A0 =C2=A0/mnt/cf auto =C2=A0 =C2=A0defaults,sync,no=
auto =C2=A0 =C2=A00 =C2=A00
> +/dev/sda3 =C2=A0 =C2=A0 =C2=A0 none =C2=A0 =C2=A0swap =C2=A0 =C2=A0sw =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00 =C2=A00
> =C2=A0tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/var/volatiles =C2=A0tmpfs =
=C2=A0 defaults =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =
=C2=A00
> =C2=A0tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/mnt/ram =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tmpfs =C2=A0 defaults =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A00
> =C2=A0tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/s=
hm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpfs =C2=A0 =C2=A0 =C2=A0mode=
=3D0777 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =C2=A00
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



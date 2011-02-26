Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PtOZS-0007eM-9N
	for openembedded-devel@openembedded.org; Sat, 26 Feb 2011 19:08:46 +0100
Received: by mail-fx0-f47.google.com with SMTP id 8so2493666fxm.6
	for <openembedded-devel@openembedded.org>;
	Sat, 26 Feb 2011 10:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=edmgJmx7klYVJgFu5csI4HVFeqXUZxvGVazzYSvl69g=;
	b=kL1ZFPh10CaFsVs/P/1iGIyKNMqExHrHJZKCUjj21O6OpWIRijFTUjH5ygsXwqGVvJ
	qBLiot5hsjROgPZIe3/VLRjsCyLtK/6HDeyTOMByi9/Tj31k38Eb2fIhM8KY13Tk+tgC
	NxbjQYu12azMvtQ3BFvYNfZIoCSjwFIpdTKOo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=ldv9PJscqTRCYsE+mMx8bgtBQhKyY5KJ7+1/6QlLPa4ISeQ0HyOTCMDHmsBsS6MGT4
	yiUp4sqS8qHogpJs4P2ejaPPwmJBo04zSz3x/qO9YbAMST8MQPuCrCyj1A7qUd7XDp57
	o7LT4Z29E3lYUG0W9ECaCyraQ1kjVpU3mNUg4=
Received: by 10.223.114.203 with SMTP id f11mr4375396faq.20.1298743645038;
	Sat, 26 Feb 2011 10:07:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Sat, 26 Feb 2011 10:07:05 -0800 (PST)
In-Reply-To: <1298742255-23389-3-git-send-email-ynezz@true.cz>
References: <1298742255-23389-1-git-send-email-ynezz@true.cz>
	<1298742255-23389-3-git-send-email-ynezz@true.cz>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Feb 2011 10:07:05 -0800
Message-ID: <AANLkTina0cDpgB=vicVLNKNV8u99jkqx=Ho+5P=M2wZP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 2/2] minimal-uclibc: add xattr to distro features to fix build failure of libcap2
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
X-List-Received-Date: Sat, 26 Feb 2011 18:08:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 26, 2011 at 9:44 AM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> cap_file.c:8:23: fatal error: sys/xattr.h: No such file or directory
>
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0conf/distro/minimal-uclibc.conf | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/minimal-uclibc.conf b/conf/distro/minimal-uclibc=
.conf
> index bc9615b..ca4253a 100644
> --- a/conf/distro/minimal-uclibc.conf
> +++ b/conf/distro/minimal-uclibc.conf
> @@ -35,7 +35,7 @@ require conf/distro/minimal.conf
> =C2=A0# FEATURE SELECTION
> =C2=A0###################################################################=
##########
> =C2=A0# We want images supporting the following features (for task-base)
> -DISTRO_FEATURES =3D "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget =
usbhost pci"
> +DISTRO_FEATURES =3D "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget =
usbhost pci xattr"
> =C2=A0# Following feature is for ARM and E500 based machines
> =C2=A0DISTRO_FEATURES +=3D "eabi"
> =C2=A0# pam is needed on uclibc if using shadow
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



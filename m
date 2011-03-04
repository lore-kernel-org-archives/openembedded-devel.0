Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvQfm-00010U-AS
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 09:47:42 +0100
Received: by fxm8 with SMTP id 8so1931734fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 00:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=nUzty1W9dqFFDi51v6Zdom0R1pudKi6QVucH1HbIZ60=;
	b=O2de71YKLOCnV4jbpiG6PMFvFlHNrzIXGiMkws8tLDw/odPb2X2pJQZZlo54wIwF8e
	prtR9IRdsBZWErMjFQLLn205OCXxqDNPm01Jj8T0FEALGkrT0+henf6IZo6EDvvLEkMo
	nrRJ9HS2ms2R49fubdwpaZioh2/YMBHzYmiG0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=ZqUUoWf+4vSokU4V4SaWQXknZpjiFaaL4xbOYh6tryIg+dPagY8SRIvk5T2OZHWaF9
	vliE3ENwNXK6LLBmK/lvkPhZ7vhPdzbON7HxsmgKhDeWJufZE8Xi38IaiJzwm7OgQNmP
	D4wfFjjdktehMNUVqg6UBlTSz84nuMYakl6dM=
Received: by 10.223.77.19 with SMTP id e19mr464866fak.36.1299228373140; Fri,
	04 Mar 2011 00:46:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Fri, 4 Mar 2011 00:45:43 -0800 (PST)
In-Reply-To: <1299225769-12329-1-git-send-email-Martin.Jansa@gmail.com>
References: <1299225769-12329-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2011 00:45:43 -0800
Message-ID: <AANLkTikgA=b5DcrfzHpians8edKrdC9AjvRqqQam5_RV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] linux-kexecboot: remove extra quotes arround INITRAMFS_COMPRESSION RD_COMPRESSION, which made 'make oldconfig' to ignore them
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
X-List-Received-Date: Fri, 04 Mar 2011 08:47:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 4, 2011 at 12:02 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0recipes/linux/linux-kexecboot.inc | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/linux/linux-kexecboot.inc b/recipes/linux/linux-kexe=
cboot.inc
> index 87ef03d..9154f42 100644
> --- a/recipes/linux/linux-kexecboot.inc
> +++ b/recipes/linux/linux-kexecboot.inc
> @@ -153,9 +153,9 @@ do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/.config
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo '${KERNEL_COM=
PRESSION}' >>${S}/.config
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo '"${INITRAMFS_COM=
PRESSION}"' >>${S}/.config
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo '${INITRAMFS_COMP=
RESSION}' >>${S}/.config
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'CONFIG_INITR=
AMFS_SOURCE=3D"initramfs.cpio.${INITRAMFS_COMPRESSION_SUFFIX}"' >>${S}/.con=
fig
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo '"${RD_COMPRESSIO=
N}"' >>${S}/.config
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo '${RD_COMPRESSION=
}' >>${S}/.config
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes '' | oe_runmake oldconfig
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



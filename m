Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SNmMo-00012j-9b
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 16:41:50 +0200
Received: by wera1 with SMTP id a1so505755wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 07:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=WYv1vspD99uC/ZoW7Egho9O5r154qvErUUQQLOQMyEo=;
	b=D++fDXca0GpJC1D5MqUwnWs8rJd3C88KMTxWNm2BQ0tYErlX3YznMEEavGjItji6bQ
	PWqBt0QSamEiYMenXSsz1X8/1ExhJQyroQlLQrP3Mwsdh0hUGz9DfnPGDZj1zcTjpyvt
	cTu6gwpdFMbXy0koH2nHEsO2xm46sYTqkXw1LTVD4yEFNMbnIHVxURxiBGGx1xCM6f9C
	R2bBAmRpXW8OksVKVzPDk86pCHSdxnkR5IMVBG+VunN+lKhCVV0uluPEnqXWSTJ2B+ds
	Ri8Ob/0j3rYqOTheSZkxcwELSzvnMraI5lj90cpWEMaRZiNroMpd708AY1NspjWg9fR1
	otcw==
MIME-Version: 1.0
Received: by 10.180.98.8 with SMTP id ee8mr6581044wib.14.1335537132219; Fri,
	27 Apr 2012 07:32:12 -0700 (PDT)
Received: by 10.216.178.70 with HTTP; Fri, 27 Apr 2012 07:32:12 -0700 (PDT)
In-Reply-To: <1335536773-1543-1-git-send-email-rep.dot.nop@gmail.com>
References: <1335536773-1543-1-git-send-email-rep.dot.nop@gmail.com>
Date: Fri, 27 Apr 2012 16:32:12 +0200
Message-ID: <CAC1BbcTbQ44eXxaG6tU_6WeqV6yc_1kCEj_Q9UvD+P2HB2wRhw@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2][meta-micro] busybox: mdev was removed
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
X-List-Received-Date: Fri, 27 Apr 2012 14:41:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Forgot to hint that these 2 are against meta-micro, sorry.
thanks,

On 27 April 2012 16:26, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wr=
ote:
> bea936913fcf684c23d36f740050dea118d5caad removed mdev, so rm now unused
> file, too.
>
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
> =A0recipes/busybox/files/mdev | =A0 =A09 ---------
> =A01 file changed, 9 deletions(-)
> =A0delete mode 100644 recipes/busybox/files/mdev
>
> diff --git a/recipes/busybox/files/mdev b/recipes/busybox/files/mdev
> deleted file mode 100644
> index 14ba837..0000000
> --- a/recipes/busybox/files/mdev
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -#!/bin/sh
> -
> -mount proc /proc -t proc
> -mount sys /sys -t sysfs
> -mount -t tmpfs tmpfs /dev =A0-o size=3D64k,mode=3D0755
> -mkdir /dev/pts /dev/shm
> -mount -t devpts devpts /dev/pts
> -echo "/sbin/mdev" > /proc/sys/kernel/hotplug
> -mdev -s
> --
> 1.7.10
>



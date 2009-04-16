Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LuXQ6-0007Zo-7v
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 21:38:48 +0200
Received: by gxk18 with SMTP id 18so1527020gxk.12
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=wE/QxUoPUK/wbiZjmB39g8rNBlakz4coxHNRCBKErgI=;
	b=s5mUt4G41JPR5ZTx/BPBIgY7DrOSvWo0VERWaiWkC7myfXb75VDlxMZ5WLv6mDZ6Yo
	4cr3QBfXUQviMOrtiSE9T8Tj1a+FalXMan11BS3vd7jnNUa0aHEsn588fVH3d/KR4YRb
	l15rpKieumNzcnJAVJNMaoLarCDWPsiHlHW1o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=xdDd22rxpt3A0VJsXmCMHTofQMz8aN/w82Nmu3Q4SwERGmdR3vG7O+BJxHnOlyE+8d
	FQIaOQLRNOJeuxGCIe6UMPZb/STI52NoZJoIjk4anFJxTJNPUAfzznmZzhM4GgkjTGw9
	Vw+VQUJzcCDaTxjUH4msIFlfTS+eK0DVQaH78=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.231.18.130 with SMTP id w2mr1991898iba.11.1239910488709; Thu, 
	16 Apr 2009 12:34:48 -0700 (PDT)
In-Reply-To: <1239882421-19769-1-git-send-email-khimov@altell.ru>
References: <1239882421-19769-1-git-send-email-khimov@altell.ru>
Date: Thu, 16 Apr 2009 16:34:48 -0300
X-Google-Sender-Auth: aa00a46d2e2fe788
Message-ID: <be7a9f3d0904161234k369a076euff8631ada9639177@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.170
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] image.bbclass: IMAGE_VARS->IMAGE_BOOT, make 	overridable
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
X-List-Received-Date: Thu, 16 Apr 2009 19:38:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Apr 16, 2009 at 8:47 AM, Roman I Khimov <khimov@altell.ru> wrote:
> IMAGE_VARS usage forces images to have init, dev management, login
> management and other stuff. In cases where you don't need any of those
> (like initramfs images or other special-purpose images) you need to
> override 4 variables in order to get clean image that only installs
> things from IMAGE_INSTALL.
>
> So, this changes IMAGE_VARS to more meaningful IMAGE_BOOT and makes it
> possible to build images without boot components with single
> IMAGE_BOOT=3D"".
> ---
> =A0classes/image.bbclass | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/classes/image.bbclass b/classes/image.bbclass
> index fd0df4d..9012de2 100644
> --- a/classes/image.bbclass
> +++ b/classes/image.bbclass
> @@ -17,16 +17,16 @@ IMAGE_INITSCRIPTS ?=3D "initscripts"
> =A0#
> =A0IMAGE_LOGIN_MANAGER ?=3D "tinylogin"
>
> -IMAGE_VARS =3D "${IMAGE_INITSCRIPTS} \
> +IMAGE_BOOT ?=3D "${IMAGE_INITSCRIPTS} \
> =A0${IMAGE_DEV_MANAGER} \
> =A0${IMAGE_INIT_MANAGER} \
> =A0${IMAGE_LOGIN_MANAGER} "
>
> -RDEPENDS +=3D "${IMAGE_INSTALL} ${IMAGE_VARS}"
> +RDEPENDS +=3D "${IMAGE_INSTALL} ${IMAGE_BOOT}"
>
> =A0# "export IMAGE_BASENAME" not supported at this time
> =A0IMAGE_BASENAME[export] =3D "1"
> -export PACKAGE_INSTALL ?=3D "${IMAGE_INSTALL} ${IMAGE_VARS}"
> +export PACKAGE_INSTALL ?=3D "${IMAGE_INSTALL} ${IMAGE_BOOT}"
>
> =A0# We need to recursively follow RDEPENDS and RRECOMMENDS for images
> =A0do_rootfs[recrdeptask] +=3D "do_deploy do_populate_staging"
> --
> 1.6.2.1
>
>
> --
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
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



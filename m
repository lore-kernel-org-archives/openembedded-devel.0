Received: from gv-out-0910.google.com ([216.239.58.186])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NAkJh-0005OR-51
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 14:11:28 +0100
Received: by gv-out-0910.google.com with SMTP id e6so218707gvc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 05:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=d3ipL1eIp4p9iqVN5CpJ+lteYv7dOQMh65sB72EfZU0=;
	b=wpWY3LhR2SzhsJG9sK6g40QKDYFhaC9MZ0o3oDoNpB6EoCwrOuoDQwRx0xRj7XKUV1
	/mvCTJL/FNWRkrausBeHOcKFbOeUV5yKdQP6s1yqm6F0GcO44VsQh3p9z2HhA/XYqEO/
	9DEmEx+Za1yz8unIhYx+JPelwAwKAo8MDq0qU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Hs+WctpWZAw4X8LZwroC6FuxoxGB9UcDJZiT+J7myZkh/CxOGVGda00PfUa8bFbqG8
	D8LPod/NxTNTonAyWxNzRHWN9UlmQUlJ82saw874MevaV+7apgiTG4tl8pI/lhCM8VcK
	ap2JrYbgDGpMixaKTsB2ZREu2wy5x0ShyB/Jc=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.162.129 with SMTP id l1mr116880hbd.201.1258549802378; Wed, 
	18 Nov 2009 05:10:02 -0800 (PST)
In-Reply-To: <1258504066-24834-1-git-send-email-leon@sidebranch.com>
References: <1258504066-24834-1-git-send-email-leon@sidebranch.com>
Date: Wed, 18 Nov 2009 11:10:02 -0200
X-Google-Sender-Auth: c18d1183d268e700
Message-ID: <be7a9f3d0911180510p6f359154ve1c6219ca8ac0f4c@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 216.239.58.186
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] kernel.bbclass: Move do_menuconfigure after do_configure.
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
X-List-Received-Date: Wed, 18 Nov 2009 13:11:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Tue, Nov 17, 2009 at 10:27 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Currently, menuconfigure comes after the patch task and before
> the configure task. If someone runs the menuconfigure task,
> then builds the kernel, the configure task will overwrite the
> configuration just edited. This is unexpected and/or unwanted
> behaviour.
>
> Rather moved menuconfigure past configure, so that the OpenEmbedded
> supplied defconfig can be edited afterwards.
>
> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> ---
> =A0classes/kernel.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 9c1f637..cf7cc4f 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -218,7 +218,7 @@ do_menuconfig() {
> =A0 =A0 =A0 =A0fi
> =A0}
> =A0do_menuconfig[nostamp] =3D "1"
> -addtask menuconfig after do_patch
> +addtask menuconfig after do_configure
>
> =A0pkg_postinst_kernel () {
> =A0 =A0 =A0 =A0cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${=
KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYP=
E}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
> --
> 1.6.0.4
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



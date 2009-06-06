Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MD5uI-0006Yj-Lt
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 02:06:38 +0200
Received: by an-out-0708.google.com with SMTP id b6so1286467ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jun 2009 16:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=QlLm0KHPmF90ith7tviVNi8+HgsZaV9/RMzx0oX5b9Q=;
	b=Ezn+wc+GenetDU5bPm6hE5NsHrhrobUVmZe81uMj1nPNx36lIXPmLKRyKQYRhxplH3
	SdZMm21TfVo/WQNgR9z1m6OpaJZIQc9iLWCwYqXxsy4A8KuGDxa2RTn6ce1tYUFNIrYg
	5Us8pclgyyk/z9bN81EsslSHxccSfUfyMizOY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=pQHD70fXDrd3tPF9UdxPp9kscXAxtWr9mB8gNvDOJQysjVyNMkltOpFS3QFNJKFciF
	kc6TFU/e3Xq5eQjlrm6aR+9Rm7OWQHJrUOQ849C3UgyUNEzXxrEI/pXFXgFL1jwO50m2
	C7Kh2sDDsMcN7QYQUcw62ANvTcYz2PzScFgpw=
MIME-Version: 1.0
Received: by 10.231.15.7 with SMTP id i7mr1318713iba.43.1244332639500; Sat, 06 
	Jun 2009 16:57:19 -0700 (PDT)
In-Reply-To: <1244281096-16000-1-git-send-email-k.kooi@student.utwente.nl>
References: <1244281096-16000-1-git-send-email-k.kooi@student.utwente.nl>
Date: Sun, 7 Jun 2009 01:57:19 +0200
Message-ID: <c384c5ea0906061657t2e117281m3de566d968848258@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [STABLE][PATCH] omapfbplay: update for 2.6.29 header location change
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
X-List-Received-Date: Sun, 07 Jun 2009 00:06:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2009 at 11:38 AM, Koen Kooi<koen.kooi@gmail.com> wrote:
> From: Koen Kooi <koen@openembedded.org>
>
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
> =A0recipes/ffmpeg/omapfbplay_git.bb | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/ffmpeg/omapfbplay_git.bb b/recipes/ffmpeg/omapfbplay=
_git.bb
> index 202c29f..67189c5 100644
> --- a/recipes/ffmpeg/omapfbplay_git.bb
> +++ b/recipes/ffmpeg/omapfbplay_git.bb
> @@ -20,6 +20,7 @@ CFLAGS +=3D " -I. -I${STAGING_KERNEL_DIR}/include "
> =A0do_compile() {
> =A0 =A0 =A0 =A0cp ${STAGING_KERNEL_DIR}/arch/arm/plat-omap/include/mach/o=
mapfb.h ${S} || true
> =A0 =A0 =A0 =A0cp ${STAGING_KERNEL_DIR}/include/asm-arm/arch-omap/omapfb.=
h ${S} || true
> + =A0 =A0 =A0 cp ${STAGING_KERNEL_DIR}/include/linux/omapfb.h ${S} || tru=
e
> =A0 =A0 =A0 =A0oe_runmake -e
> =A0}
>
> --
> 1.6.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
Acked-by: Leon Woestenberg <leon@sidebranch.com>


--=20
Leon



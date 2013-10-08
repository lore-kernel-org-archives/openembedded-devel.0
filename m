Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2295C6CF3F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 22:50:47 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id er20so7502312lab.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 15:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=9E7QAsmelbGOdrOjjTaG2kNJFjhiUBg8hmu2EXW21I8=;
	b=mTLOXkK01YfGCoHvLdaHgkK9O5rB4PXdNy7cQTZ7GEU6Ni3hDeVIMBysxjU7FLsMoA
	mJJqoPWI764haDial3Rm2+GjsKz6rlFkBEm6u9riTnLD4roteikF5CmdSEnpNuCtpcYu
	K8RgfqhyKfoPwrwcZtm9ufUKURPGDSn+8fREQdf7DEhGXZ3P/T1RqA/zBppL3+IZONb+
	iAniz7q85EXsw8Z/aQ8fdnlOweDrt4lYZf59FSABcgcpMhPaAXnJfCByX2QPJr5J3fL9
	J1qhWyhpI/O2E6X7nAZR9TMWl2Xh5GuCIvH/blEsWP0NwZpSnzRZREvU6Eremfj/CD95
	zrBw==
MIME-Version: 1.0
X-Received: by 10.152.88.74 with SMTP id be10mr3430040lab.4.1381272649302;
	Tue, 08 Oct 2013 15:50:49 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Tue, 8 Oct 2013 15:50:49 -0700 (PDT)
In-Reply-To: <1381272223-7380-1-git-send-email-andrea.adami@gmail.com>
References: <1381272223-7380-1-git-send-email-andrea.adami@gmail.com>
Date: Wed, 9 Oct 2013 00:50:49 +0200
Message-ID: <CAAQYJAvBeEm0SQjZMTV7PgJDsP5uyWZWZz_1KC-fH7PRw+dn5Q@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] linux-yocto-handhelds.inc: split COMPATIBLE_MACHINE filtering
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2013 22:50:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Patch sent too soon. Wrong.
Please ignore it


On Wed, Oct 9, 2013 at 12:43 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> This allows to add new machines to one single kernel variant
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-yocto-handhelds.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto-handhelds.inc b/recipes-kernel/linux/linux-yocto-handhelds.inc
> index 2e0b7a9..145dbc6 100644
> --- a/recipes-kernel/linux/linux-yocto-handhelds.inc
> +++ b/recipes-kernel/linux/linux-yocto-handhelds.inc
> @@ -1,4 +1,5 @@
> -COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
> +COMPATIBLE_MACHINE_linux-yocto .= "|akita|c7x0|collie|poodle|spitz|tosa"
> +COMPATIBLE_MACHINE_linux-yocto-tiny-kexecboot .= "|akita|c7x0|collie|poodle|spitz|tosa"
>
>  KMACHINE_akita = "akita"
>  KMACHINE_c7x0 = "c7x0"
> --
> 1.8.1.5
>
Sorry for the noise

Andrea


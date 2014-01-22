Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 752B160017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:12:24 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wm4so453160obc.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Uxh2ERP2GLzDxCCt3DStfEvjAFcgq7jPWrBrWmyVc+Y=;
	b=U8RScOkAa3erAmWE3Ne873DXDdQTNGN4pNhuINb0PSPplThLFN5KvamXoIUPoaXMM0
	uGtbjx025tN+vqz20F70aqooRN+7i/IpZnpTSor49mkUto2Pe0ikDqxq2FeIStHFsNrP
	+sCROAhWMsf/kIUMphsWma3ucZXKaiROXTlS6IN4WRk0Om3utoTdnaObURVmssQQpwiv
	EHTYDFnJzIkFrKvukj3f0miZuqTmot8keOeB+nV69q5bfek7ey71rwyF85n+7i0AoudZ
	8sLoMRuDEcTg8hRzSNQIFlJux3fPiOCMoGLvWKvAFK67epfq0dPCRY49WYq17LkdZIey
	EbhQ==
MIME-Version: 1.0
X-Received: by 10.182.241.8 with SMTP id we8mr1430198obc.62.1390399945399;
	Wed, 22 Jan 2014 06:12:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:12:25 -0800 (PST)
In-Reply-To: <1389960374-16694-1-git-send-email-koen.kooi@linaro.org>
References: <1389960374-16694-1-git-send-email-koen.kooi@linaro.org>
Date: Wed, 22 Jan 2014 12:12:25 -0200
X-Google-Sender-Auth: zHUchMwiVfKJUvWc0DfpqSwDjaQ
Message-ID: <CAP9ODKrent_rgpxic-kxf2SbzwBfBtnmynabsTAaFXi+7e5sfA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCHv2 1/3] acpica: update to 20140114 release
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
X-List-Received-Date: Wed, 22 Jan 2014 14:12:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

On Fri, Jan 17, 2014 at 10:06 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  .../acpica/{acpica_20131115.bb => acpica_20140114.bb}                | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-extended/acpica/{acpica_20131115.bb => acpica_20140114.bb} (91%)
>
> diff --git a/meta-oe/recipes-extended/acpica/acpica_20131115.bb b/meta-oe/recipes-extended/acpica/acpica_20140114.bb
> similarity index 91%
> rename from meta-oe/recipes-extended/acpica/acpica_20131115.bb
> rename to meta-oe/recipes-extended/acpica/acpica_20140114.bb
> index 8c9ecd4..5cc2d5a 100644
> --- a/meta-oe/recipes-extended/acpica/acpica_20131115.bb
> +++ b/meta-oe/recipes-extended/acpica/acpica_20140114.bb
> @@ -15,9 +15,8 @@ SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
>      file://cross-compile.patch \
>      file://no-werror.patch \
>      "
> -
> -SRC_URI[md5sum] = "1bd5b14c4c567ca2a113c05f4b28f29c"
> -SRC_URI[sha256sum] = "d699a880b84e04205eda2d5ad048c1c38a57289240caa5f0fb7ebdcd3aac83d2"
> +SRC_URI[md5sum] = "fcd4b7304f1bfabc7d4b9cfdecc6b0c6"
> +SRC_URI[sha256sum] = "0d5bd32690ab77e21ab143ef25361c314a4ed13c33a5fb3ddd6f5559ab24ebc3"
>
>  S = "${WORKDIR}/acpica-unix2-${PV}"
>
> --
> 1.8.4.2
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


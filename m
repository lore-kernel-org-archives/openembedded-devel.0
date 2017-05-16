Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id BEDED77D42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 11:24:59 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x71so8050143vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 04:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V+NeCbdzv4VWTEoxjzmeBf/6nr9lCIqv7QgI/As4Vq0=;
	b=HhILRMqLwg339KJJdDhSceiD20KpXNPv4Ka/qtTJjgdsP3AemvNl7jIXWWsV3/tL3h
	3YyRdvw0W5+bSK0lXhaVgQwpnzPzV+49IXecRfMJLfa0AN95zaoRQEH5ULsTOLhq9iGq
	Nllv5NAw2lFeZpyEMOs8iRi4iEzbcyT/ermq+OozhCYnyHbnjRrVD9adoA55NSgOqgo4
	GJB1ApQt/PGppyZgMMcZdaaTYdujtOoIfQ2fsVroOfxAK0a+0cWt5aoVxY6hwI3xuU9n
	eL235L53LbcoO7vnUGI67XMM9F8W29qAkTYcJkPXh1NItsYaIt8xJbVqnk/dvcfjaiYx
	sihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V+NeCbdzv4VWTEoxjzmeBf/6nr9lCIqv7QgI/As4Vq0=;
	b=PQMGB3W+v5qsoRN6ryje1mksEz/fq0bDzl3AW3YlWNtoxBHkLpJxpN8ZCO+MDRZoy9
	IN3//AinDimcU/keEX9XnsoU4VFOOiHYm3IbvzrCswVgfiGNRkffwEH9KLdoi1TAR904
	m5hVvrwGBL33X86s+FseN2JZEhGfeau6vzo+J9OwzQm68ZWXiGUohOjT8T7kZo6Tcyhp
	c80rOzQJkqXeExbO8/fdikRo7FgV7AXz4X7AH6omaAJEC7d0digd8aOO6h1/V8Lop0Q+
	pnCWdks2PfTgaLUfy7VLWBuKV+Bg6LBEtDCU/yU+5/U310NdVQP3B2SQt2gIUcDJ9GFb
	VbUw==
X-Gm-Message-State: AODbwcAaVqF7/vPyXZdGXeLKaUdowsGIgttZRsBRz+84dpTUihGWtOtY
	6Xu4OIaoB5KQwcWrdWsZhPUJ5MKliA==
X-Received: by 10.31.221.135 with SMTP id u129mr4392962vkg.67.1494933900689;
	Tue, 16 May 2017 04:25:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.47.74 with HTTP; Tue, 16 May 2017 04:25:00 -0700 (PDT)
In-Reply-To: <1494933798-24865-1-git-send-email-liu.ming50@gmail.com>
References: <1494933798-24865-1-git-send-email-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 16 May 2017 13:25:00 +0200
Message-ID: <CALatG=4QHznBsksQhyo-p6vmm0vUn8GXJgxAV2dkp9GbvE8FwQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [meta-oe] [PATCH V3] xerces-c: fix a wrong PACKAGECONFIG option
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 May 2017 11:25:00 -0000
Content-Type: text/plain; charset="UTF-8"

Changes in V3: Also modified the commit message, I forgot changing it in V2.

//Ming Liu


2017-05-16 13:23 GMT+02:00 <liu.ming50@gmail.com>:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> In xerces-c's configure, these options is being referred as follows:
> ......
>     curl_flags="-I$with_curl/include"
>     curl_libs="-L$with_curl/lib -lcurl"
>
>     icu_flags="-I$with_icu/include"
>     icu_libs="-L$with_icu/lib -licuuc -licudata"
> ......
>
> so they shouldn't be set to ${STAGING_DIR}, use
> ${STAGING_DIR_TARGET}${prefix} instead.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> index b848b06..64ac747 100644
> --- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> +++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> @@ -16,8 +16,8 @@ SRC_URI[sha256sum] = "9408f12c1628ecf80730bedbe8b2ca
> ad810edd01bb4c66f77b60c873e8
>  inherit autotools
>
>  PACKAGECONFIG ??= "curl icu"
> -PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR},--with-curl=no,curl"
> -PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR},--with-icu=no,icu"
> +PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR_
> TARGET}${prefix},--with-curl=no,curl"
> +PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR_
> TARGET}${prefix},--with-icu=no,icu"
>
>  do_install_prepend () {
>      sed -i -e 's:-L${STAGING_DIR}/lib:-L\$\{libdir\}:g' ${B}/xerces-c.pc
> --
> 2.7.4
>
>


Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B0D2371ACC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 10:59:17 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g23so4971310wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 02:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m08ExRlvN9sXkbp1/AAbpFN3Kb7Pw+rtMu/0CPod7NY=;
	b=hzIFPHcq1KcPIr9pVnpqb8hdoueWT2S6qKOLf3PSB6v1vv5MwtXNM82i88LR7vMNHM
	97wsTC5DiNgIY4b6lnvSIBBbd8xECmTI3d/NfATeSzjGw0EpyVqjAByjOlVvGbxpJs7N
	PwOocfbctdCIkJvEV/2w1DEpgw7Wyw04VwofHy2ZEB8UdT4hPfXLcGOeX/58uvboV/9o
	3xZ9zythja3IY/Oo1McaQ7Iukm4sk5CUG7SuZTWvAv4OhNL9G6k57bpKsZEun5MxJI6L
	28XVMixKTmiKY/zbUP/0XtkPU+spbX/tHTiMserFwNJGNsrFHHGJGNjAIrayl8ODDJNO
	v6ZA==
X-Gm-Message-State: AKaTC01tXBDq5TlUMMW6d6lEvkE299vvgFZDFWYophrgqXxeaXPJDqJCz/x1c4pPZCx9cA==
X-Received: by 10.28.18.129 with SMTP id 123mr9210447wms.2.1479466758943;
	Fri, 18 Nov 2016 02:59:18 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g10sm8201153wjw.18.2016.11.18.02.59.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Nov 2016 02:59:18 -0800 (PST)
Message-ID: <1479466757.27546.9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Nov 2016 10:59:17 +0000
In-Reply-To: <1479464791-28098-1-git-send-email-koen.kooi@linaro.org>
References: <1479464791-28098-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH] android-tools: fix do_install
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
X-List-Received-Date: Fri, 18 Nov 2016 10:59:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-11-18 at 11:26 +0100, Koen Kooi wrote:
> The previous patch introduced 2 bugs that made packaging fail:
> 
> 1) Always failing grep
> 2) Conditionally install systemd files
> 
> Systemd.bbclass doesn't handle conditional installation and will throw an
> error.
> 
> Tested with -native and regular cross builds.
> 
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  .../android-tools/android-tools_5.1.1.r37.bb          | 19 ++++++++++++
> -------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/android-tools/android-
> tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-
> tools_5.1.1.r37.bb
> index 1769b6a..5041465 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> @@ -108,7 +108,10 @@ do_compile() {
>  }
>  
>  do_install() {
> -    if [ grep -q "ext4_utils" "${TOOLS}" ] ; then
> +    export TOOLSFILE="${WORKDIR}/tools.txt"
> +    echo ${TOOLS} > ${TOOLSFILE}
> +
> +    if grep -q "ext4_utils" ${TOOLSFILE} ; then

Why not simply echo instead of doing file i/o:
if echo ${TOOLS} | grep ....


>          install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py
> ${D}${bindir}/simg_dump
>          install -D -p -m0755 ${S}/system/extras/ext4_utils/mkuserimg.sh
> ${D}${bindir}/mkuserimg

BTW, if ext4_utils is not in TOOLS, then none of the following TOOLS will
install correctly, because ${D}${bindir} is created only in this block here.

>  
> @@ -120,21 +123,23 @@ do_install() {
>          install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
>      fi
>  
> -    if [ grep -q "adb " "${TOOLS}" ] ; then
> +    if grep -q "adb " ${TOOLSFILE} ; then
>          install -m0755 ${B}/adb/adb ${D}${bindir}i
                                                    ^

This doesn't look right.


>      fi
>  
> -    if [ grep -q "adbd" "${TOOLS}" ] ; then
> +    if grep -q "adbd" ${TOOLSFILE} ; then
>          install -m0755 ${B}/adbd/adbd ${D}${bindir}
> -        install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
> -          ${D}${systemd_unitdir}/system/android-tools-adbd.service
>      fi
>  
> -    if [ grep -q "fastboot" "${TOOLS}" ] ; then
> +    # Outside the if statement to avoid errors during do_package
> +    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
> +      ${D}${systemd_unitdir}/system/android-tools-adbd.service
> +
> +    if grep -q "fastboot" ${TOOLSFILE} ; then
>          install -m0755 ${B}/fastboot/fastboot ${D}${bindir}
>      fi
>  
> -    if [ grep -q "mkbootimg" "${TOOLS}" ] ; then
> +    if grep -q "mkbootimg" ${TOOLSFILE} ; then
>           install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
>      fi
>  }
> -- 
> 2.4.11
> 


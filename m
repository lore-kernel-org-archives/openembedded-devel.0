Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 83BA16BDE3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jan 2019 20:06:44 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id y20so27156900edw.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2019 12:06:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=b0jxkbtjP0mMLa4+pih7o8PojLpaUIhjQrBCWzg7So0=;
	b=KlFnTjmeqRqOW2gJqrzmEE/l7k4iU+wpTopzC/6iyyh4d4faYO14AAo0sXDqD6Msbu
	vT2LiaEp7DcITCrbZFyZTlj8hVL+ZDHt837UnowYGA9zorsm0MLfiQAZ+wu6Ick3JWUv
	afg4idLAhZaHFiwSxLJT/MG+MUPqWVyDg5VwcB53wLjI4ZhWG+1Fg3gqO8KJVtaO8SHn
	3+qVXVXxaZ/l0G9HhYSsbZuJ2ncVzw32J1rzl05JG9NLYSx/egMakdaF06Ksi1Q3Kvos
	5jDzbEVPaCW4tsbsYl0Vv6KQXsRUHHaDVUuDiGxuvapIwF5XFuvPdp8vm7myt/kG5X3X
	OqGQ==
X-Gm-Message-State: AA+aEWaaMi+DsmsBuow8UhyFI6NFuNXoUmb1n+/tDfQkyVMKocheB6/z
	lgbMzuemPhX0DQjQ5DlkOzJaw6/x
X-Google-Smtp-Source: AFSGD/W8Jf9BNA79CjWEjn006gC8foI6MkXDQGe0rieF0YeMXym2Yt315mbY++gMaa6uHRtk1anSgg==
X-Received: by 2002:a50:c408:: with SMTP id v8mr40197649edf.144.1546459604936; 
	Wed, 02 Jan 2019 12:06:44 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	c38sm22808781edb.15.2019.01.02.12.06.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 12:06:44 -0800 (PST)
Message-ID: <d174a2d09c754593507de4135c8a056d6eab1e7f.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 02 Jan 2019 20:06:42 +0000
In-Reply-To: <1543488504-15595-2-git-send-email-fang.jia@windriver.com>
References: <1543488504-15595-1-git-send-email-fang.jia@windriver.com>
	<1543488504-15595-2-git-send-email-fang.jia@windriver.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH 2/2] openjdk-common: Define JAVA_HOME by default
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
X-List-Received-Date: Wed, 02 Jan 2019 20:06:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-29 at 18:48 +0800, Fang Jia wrote:
> Use postinst script to set the JAVA_HOME by default.
> 
> Signed-off-by: Fang Jia <fang.jia@windriver.com>
> ---
>  recipes-core/openjdk/openjdk-common.inc | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-
> core/openjdk/openjdk-common.inc
> index 01a0a2a..aaf81f6 100644
> --- a/recipes-core/openjdk/openjdk-common.inc
> +++ b/recipes-core/openjdk/openjdk-common.inc
> @@ -5,3 +5,17 @@ JDK_ARCH = "${@openjdk_build_helper_get_jdk_arch(d)}"
>  
>  # Provides the target architecture to the configure script.
>  export LLVM_CONFIGURE_ARCH="${@openjdk_build_helper_get_llvm_configure_ar
> ch(d)}"
> +
> +pkg_postinst_${PN}() {
> +	cat >> $D${sysconfdir}/profile << EOT
> +JAVA_HOME=""
> +for dir in ${libdir}/jvm/*; do
> +        if [ -x "\${dir}/bin/java" ]; then
> +                [ -z "\${JAVA_HOME}" ] && JAVA_HOME="\${dir}"
> +        fi
> +done
> +if [ -n "\${JAVA_HOME}" ]; then
> +        export JAVA_HOME=\${JAVA_HOME}
> +fi
> +EOT
> +}

I'd say this should be done via adding a file to ${sysconfdir}/profile.d/
instead. Have a look at e.g. the DistCC recipe
 poky.git/meta/recipes-devtools/devel-config/distcc-config.bb


Cheers,
Andre'




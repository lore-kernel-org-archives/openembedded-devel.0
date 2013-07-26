Return-Path: <riku.voipio@linaro.org>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE4F6A960
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2013 08:30:34 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id hu14so281315qab.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2013 01:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=t6Qnlw29oCUfzW64ESRoSeT5/qER2S0YGCOv8XWcBdA=;
	b=ixPxsNqBrRRfcPAvYIrJdLZdhRYPr4+GdZpuGWlr+rZQjYwbZMj3XW7Sb3YqqVBOHe
	5y6s8Lbgxk7BH3koBGAcgK6XMs1wJrctHhnpqsTaOgnp2+J+TaAQqZbEnX7sZnp+FzkR
	7/VY9MRQuB6BbAl3wECkaSW2le0Nhssv72vdaB8JXG7pLTSTck71uQZEfnCUkGDiNIZy
	Oml3AgLtakA04jJ91L1qXaglS4AWVydAarY21vvb99CVO+/0McyJ8Jx3qgQ5Vwq94YhP
	JIKvKlQOvcReQveKt0tKmEcNa9zJ5EwDbVlnOXG3RTuJPlmgUQ2Ezn7lmvRQwMoAbjHC
	M+3w==
MIME-Version: 1.0
X-Received: by 10.224.80.3 with SMTP id r3mr48340024qak.22.1374827434544; Fri,
	26 Jul 2013 01:30:34 -0700 (PDT)
Received: by 10.49.95.74 with HTTP; Fri, 26 Jul 2013 01:30:34 -0700 (PDT)
In-Reply-To: <1374501894-17068-1-git-send-email-riku.voipio@linaro.org>
References: <1374501894-17068-1-git-send-email-riku.voipio@linaro.org>
Date: Fri, 26 Jul 2013 11:30:34 +0300
Message-ID: <CAAqcGH=k63ut9rtK0RFwqOLZk5CVyEE2JQXx-Yt96+=RN6etEA@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnaDIzLzPdol+LysM/42MbTMwayxpgbt4rfud54vNu1Ux8aRS5sXR9yQn/kLPytzeFIbjTe
Cc: paul.eggleton@linux.intel.com
Subject: Re: [meta-webserver][PATCH] apache2: move pidfile to run
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
X-List-Received-Date: Fri, 26 Jul 2013 08:30:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

ping?

On 22 July 2013 17:04, Riku Voipio <riku.voipio@linaro.org> wrote:
> pidile was stored in /var/apache2/log which is saved over boots.
> This might prevent startup of apache2 on boots. Move it to /run
> where pidfiles in general belong.
> ---
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb | 2 ++
>  meta-webserver/recipes-httpd/apache2/files/init       | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
> index cf1e469..8c9416a 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
> @@ -68,6 +68,8 @@ do_install_append() {
>      # Ensure configuration file pulls in conf.d and modules.d
>      printf "\nIncludeOptional ${sysconfdir}/${BPN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
>      printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
> +    # match with that is in init script
> +    printf "\nPidFile /run/httpd.pid" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
>  }
>
>  SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
> diff --git a/meta-webserver/recipes-httpd/apache2/files/init b/meta-webserver/recipes-httpd/apache2/files/init
> index 346dc0d..a1adbd7 100755
> --- a/meta-webserver/recipes-httpd/apache2/files/init
> +++ b/meta-webserver/recipes-httpd/apache2/files/init
> @@ -14,7 +14,7 @@ NAME=apache2
>  PATH=/bin:/usr/bin:/sbin:/usr/sbin
>  DAEMON=/usr/sbin/httpd
>  SUEXEC=/usr/lib/apache/suexec
> -PIDFILE=/var/apache2/logs/httpd.pid
> +PIDFILE=/run/httpd.pid
>  CONF=/etc/apache2/httpd.conf
>  APACHECTL=/usr/sbin/apachectl
>
> --
> 1.8.3.1
>


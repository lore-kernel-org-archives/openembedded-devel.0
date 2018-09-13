Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id 89953798A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 11:07:54 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id j9-v6so846092otl.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CCOhbqaUeE7QuobBxm0ay45lQ3oNcoqykn4rCHpwwUM=;
	b=as3ggkx15shlZgEsncA+FItjW8fLN4bB79BYK1ia4LU+UA84IUhn57YUEaE428jDdP
	woLQZRvUaeVDoYcG92uq0u/FMV5h3BUQ9u3lgUtod9mrRGGgmNxW1CLIttOnoJE00iAb
	yh1hzot+FCZ0gEZ6DrtkGSK/5T4W64NmwhDz3x6Ax1pwcIb1Q6qISDKNGMr07idsodfQ
	tBxTzkWTcJeBfWWi85ye5YBiyfxe+gS99YyZgEn1SwUy6SDJPGJumEn6QgZDQWxGaCQ7
	IGcfI4hWoDcPJCi8Fff/FY8wtl5uohusLfJMrdoA5IX2ubkkrEapZSJRKyz7DpF7zuny
	8dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CCOhbqaUeE7QuobBxm0ay45lQ3oNcoqykn4rCHpwwUM=;
	b=tiFOYl7lDHIpikbi2zQkgOLZNDgSAxKs1oyHMm7hMc50vX80VeXlgeOOG3DYfc5VrF
	TDDa6Bes4jtvsMuWUCMV9LkY1pDbsh9nl3qj977TwEXRWVpecyJNHFLDDEK9bAAaUYIt
	vpXF3QdCCNvzNx3Iw2I1HBVeda3aa3FewIpKECEy22U1BNy4RJR+UzEhgz0SGjbb1yGQ
	m4xrCD8alGKmy/JjAcxn1lINtGuFhLLtOr4N/af+a7av8vxeBqZebFVejtrlQOqjb78+
	yTvdwJX5pAwY+Vb7ni9Vt0sJaecAmyj5Z81F7fYGA0lDKecPqzFeEQ6mfO1BrGIzvLDL
	twgQ==
X-Gm-Message-State: APzg51BCsysDGfQGH3jj2NN2coFqm47+1BK4LPlk2fqMGePYMvvwLSzO
	rAx+rSEMBeLx5WyKNrP+0cQewOi40HoxX8WizV4=
X-Google-Smtp-Source: ANB0Vda9/A8XdpD2I9BjiLhpwoebgCUenRuUGEQoLV+VYZ51xGL69eMxQoWmHFm4b6z5FJH6y8kyF4PBfJ3Sdhy2Bmc=
X-Received: by 2002:a9d:2811:: with SMTP id
	m17-v6mr815275otb.254.1536836875456; 
	Thu, 13 Sep 2018 04:07:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Thu, 13 Sep 2018 04:07:54
	-0700 (PDT)
In-Reply-To: <20180913093452.357414-1-mingli.yu@windriver.com>
References: <fbed68fd-3ec8-6058-e43b-329232c1e960@windriver.com>
	<20180913093452.357414-1-mingli.yu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Sep 2018 13:07:54 +0200
Message-ID: <CANNYZj9-NzKB+P0OyVfd2tk_8cMUFT11-y8t28xNoAV1R6C2yA@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] postfix: fix pkg_postinst_${PN}
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
X-List-Received-Date: Thu, 13 Sep 2018 11:07:54 -0000
Content-Type: text/plain; charset="UTF-8"

I might not be understanding this. Why is the original fragment
incorrect and the new one correct?

Original:

        # This can fail depending on host setup
        if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
            $INTERCEPT_DIR/postinst_intercept delay_to_first_boot
${PKG} mlprefix=${MLPREFIX}
            exit 0
        fi
        touch $D/etc/postfix/virtual_alias
        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias

    fi
}


Patched:

         if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
             $INTERCEPT_DIR/postinst_intercept delay_to_first_boot
${PKG} mlprefix=${MLPREFIX}
         else
            touch $D/etc/postfix/virtual_alias
            postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
         fi

    fi
}



What problem is being fixed here?

Alex

2018-09-13 11:34 GMT+02:00  <mingli.yu@windriver.com>:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> "exit 0" will break the postinst logic
> below the line "exit 0" such as:
> ===
> update-alternatives --install /usr/sbin/sendmail sendmail /usr/sbin/sendmail.postfix 120
> update-alternatives --install /usr/bin/mailq mailq /usr/bin/mailq.postfix 120
> update-alternatives --install /usr/bin/newaliases newaliases /usr/bin/newaliases.postfix 120
> ===
>
> It's enough to call "$INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}"
> , so remove it to guarantee the postinstall logic is correct
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta-networking/recipes-daemons/postfix/postfix.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
> index 49f9f7b1f..882b27b6e 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -246,10 +246,10 @@ pkg_postinst_${PN} () {
>          # This can fail depending on host setup
>          if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
>              $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
> -            exit 0
> +        else
> +            touch $D/etc/postfix/virtual_alias
> +            postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
>          fi
> -        touch $D/etc/postfix/virtual_alias
> -        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
>
>      fi
>  }
> --
> 2.13.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


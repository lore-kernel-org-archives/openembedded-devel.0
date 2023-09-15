Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857C8EE6432
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 07:44:01 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.15802.1694763839214973349
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Sep 2023 00:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=guhpTC6H;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99357737980so239725066b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 00:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694763837; x=1695368637; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4jvQzz1oPl4EXheu9yQ46m8UL2eiL0qdjE20cs9AS6g=;
        b=guhpTC6HHo6uQBSWEU+IxxmZGtNiBKcAZhAX2AR3v7qNUGpHJ1mpRb4ozKr9dOWiF6
         9XM+Utkv4OMrym3dWwDIMt18OoHcqgZnA+JDGA/Y16LpmXT3Om7bLuUvw6tPBObtr3T4
         6Dt/bYgk+q94i19oRY7tFIUsjWk4set2Qx7BD0AnjZhEjSr3MwEpvvkTlfE1Y7h4C1BZ
         zRWlFtO/Umx3rd7np9M5HgAP14dVy/kD1CpBvdlRFlFatocA5WoeE1VVxqE7sDq8IeD4
         X+Qm/UVCroc6jiKO+WYzQIIicqWiF6ZweOFajyEkU1eC5Dm6dUzILNf6f63f2bbNOuhl
         Kl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694763837; x=1695368637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jvQzz1oPl4EXheu9yQ46m8UL2eiL0qdjE20cs9AS6g=;
        b=OtWeYKabFSAJhNergxtW+0sayIZBiiP93vdClyASmYE4CrqjIQwi607JavqDJCN8XH
         NOiofw8uMDwAvN7ZNQeuu9zFCNvSVEU/fdKF8EzjhswASeDdVvo2suSvIssc6/cL2LjJ
         NYMcZiJzaDa9Gz/I9mHkEnMC8RhDCwhQY8N0g+qkr3MQFj/Qh9ZSOf8R5xZUTr4ZnaYB
         3gY7JCQWEe8nBgxudslw6xTZjFP9N02a6RWyuY837em9+ndvj4cXK7gV2yEhsHurpgwa
         5qpkANpUba0P5uSPZiERC0axv36SFcCCYrcjFY2JQLmAd5+k8qFt6zniFtDwAAuFQ2im
         k7wQ==
X-Gm-Message-State: AOJu0Yysm7CrYWDzFNr8W3cYHOx/tyOejAODZ4B+zQNcZNqLcc0L/jBk
	pYuLMguksySgcNwnuCtsLXbgZg+YvQ==
X-Google-Smtp-Source: AGHT+IEHmeuWQAtZ4X7t//Zy4z3efeZL6WgLs8582FQ3vDQdowY3ymLusGOaURxsUvYe7+PN3rmUFw==
X-Received: by 2002:a17:907:b1c:b0:9a5:cbb2:3fab with SMTP id h28-20020a1709070b1c00b009a5cbb23fabmr609316ejl.2.1694763837184;
        Fri, 15 Sep 2023 00:43:57 -0700 (PDT)
Received: from OP01518NB.oip.local (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id rl20-20020a1709076c1400b009adc81c0c7esm870189ejc.107.2023.09.15.00.43.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:43:56 -0700 (PDT)
Date: Fri, 15 Sep 2023 09:43:55 +0200
From: Sam Van Den Berge <sam.van.den.berge@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-flask-jwt-extended: add
 recipe
Message-ID: <20230915074355.GA4093@OP01518NB.oip.local>
References: <178500BE84107A6B.14273@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178500BE84107A6B.14273@lists.openembedded.org>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 07:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104891

On Fri, Sep 15, 2023 at 09:07:22AM +0200, Sam Van Den Berge via lists.openembedded.org wrote:
> From: Sam Van Den Berge <sam.van.den.berge@gmail.com>
> 
> Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
> ---
>  .../python/python3-flask-jwt-extended_4.5.2.bb   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb
> new file mode 100644
> index 000000000..f55d77174
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Extended JWT integration with Flask"
> +HOMEPAGE = "https://github.com/vimalloc/flask-jwt-extended"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9166295d7c482b9440bbb2b5c0fa43ac"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "Flask-JWT-Extended"
> +
> +SRC_URI[sha256sum] = "ba56245ba43b71c8ae936784b867625dce8b9956faeedec2953222e57942fb0b"
> +
> +RDEPENDS:${PN} += "\
> +    python3-werkzeug \
> +    python3-flask \
> +    python3-pyjwt \
> +    "
> -- 
> 2.34.1
> 

Sorry, please ignore this patch since I already sent this one yesterday.

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104885): https://lists.openembedded.org/g/openembedded-devel/message/104885
> Mute This Topic: https://lists.openembedded.org/mt/101375100/5865176
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [sam.van.den.berge@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



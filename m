Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 78A5E7F03B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 20:59:57 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d23so5911612qto.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 13:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OiNCR1ssNdfrumD861yqpUSLfR0osw83yXZGfFJVbSI=;
	b=a8T9/Zs4vEaDAHrQ/Nybv72y4g8kCf0TDsWtsdgRrbNtzFqD07VlJ+TYMsDweXOLEK
	2gW7UdgGUYnWblNR+MBAzNXfGBfPgDwmVD77hi0wgQ4sJJpfuy5xBYKlLsAHQS0A+uYX
	WGiy42T8Ixoavj5PsPcojGMglVZfyxGy2u8xwiGkxjmxpAhvQV5g1S/Uph50YjXi4QyN
	l3GDtj5Iav9pJF4Uoct4DdrDHZWgZRVwlJ6+smo6cF+5y/d34fSjepaZYoDmRFBfyaBZ
	p+C0JgnC3CNSksS1TthovshwmL1zwGUlBD2kjSBkOdJf1awcQC1xWhWLEctJoipN6Yc6
	cbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OiNCR1ssNdfrumD861yqpUSLfR0osw83yXZGfFJVbSI=;
	b=VBf19Eyf52rIBRiUkIO/tE8eld+ouTiOyiN78dS15nkhYFXJOdWVqgftqmSHfgxW88
	Fjff9YwcHAIYuYLJzD8mK5xYk/J9xxQoz+sa5j5TzQKSdWraVQ2Z3+tLg6XR0G/n3FLi
	AcCdzlZzgMWnZFhQiJxhZ0gshwsDHJo6ptxRwhENRfNr/Wd2PvlOlYft3SBXRKyxiTiU
	BZWoK5EqeaJYJcmGnJXC5d94qfY9pNdCtCNTfNbZQ61g3Vtaw+j1zqjLnQ32mnyfMvka
	Fhsbv8frHR8ISIhzE413aHiuCbUDfseYitFhfWsJQmmaFVm5yyy0d0DZhtGWxfrNfVfB
	x9Eg==
X-Gm-Message-State: APjAAAULa7B8i0o1yLP1oeqJsg0l7HWImfMxxElf4MIeSs3q0ceA9TsZ
	N2duNFjx+grSV6fOvWLT1wNCWG6v2aFEemoabB8=
X-Google-Smtp-Source: APXvYqzRV4cLG1UQ/SVaRNrgFu8PoQroDDtOAmLnKucXunpTY35ZpKf0F36Yrb3pFOdK1BE/QOaV77RKpRhMQZC+Wts=
X-Received: by 2002:a0c:ae5a:: with SMTP id z26mr3559266qvc.65.1562878798105; 
	Thu, 11 Jul 2019 13:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190711141000.3115-1-jason.wessel@windriver.com>
In-Reply-To: <20190711141000.3115-1-jason.wessel@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jul 2019 13:59:32 -0700
Message-ID: <CAMKF1soGEOUVMtE6VohwgEaB=XuWMr3epP6NWT_P8tgGEaF9Zg@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libbtyesize: Add depends for gettext-native
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
X-List-Received-Date: Thu, 11 Jul 2019 20:59:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 11, 2019 at 7:10 AM Jason Wessel <jason.wessel@windriver.com> wrote:
>
> If the local.conf has set 'USE_NLS = "no"' the build of libbytesize
> will fail with the following message:
>
> | configure: error: in `/build/tmp/work/core2-64-poky-linux/libbytesize/1.4-r0/build':
> | configure: error: gettext not found
> | See `config.log' for more details
> | NOTE: The following config.log files may provide further information.
> | NOTE: /build/tmp/work/core2-64-poky-linux/libbytesize/1.4-r0/build/config.log
> | ERROR: configure failed
>
> The issue is that libbtyesize needs to full version of gettext in
> order to configure properly, and not the minimal version which is
> provided by default when building with 'USE_NLS = "no"'.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb b/meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb
> index 863ce428f..cd67ab1b2 100644
> --- a/meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb
> +++ b/meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb
> @@ -19,6 +19,7 @@ DEPENDS += " \
>      libpcre \
>      gmp \
>      mpfr \
> +    gettext-native \

change is fine but please rebase it on latest master and also the
recipe name has typo in subject.

>  "
>
>  FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/bytesize"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


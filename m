Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 23E396FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 09:29:32 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id c82so8442710vkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=laeYxnpWEOf450yaiJI7iqbwKiAB9SgSXm/uGIW0CdU=;
	b=a5ZbWToPmf8B53CTj9O+LGVRBSYkM9AEM9XMfEHbM5h+pwhl2E6k8IF3NWDnx8rygJ
	cHrhHsUkYKWz6warZToiqnlmVkIierj7qyQ/aFqzHZzpBuIrGuqf+/ZWy7//WkEFBHj8
	4ogLrwjwB7NaSmmw/faOU+7ndlkFDDg1Xmrgvc600Y3SBI0KYtOnt7DAaj+RzR/jN0No
	SLSWokS9+REiPRSI3H22l8fSQ6OOEyvcjzH7pLtiaPh/GeF5bnorgiJLmeQQHgEg3D7o
	THhBM5+8e3hYJ7nwAUitTSvXvovBKXwQKM3a4sDJ2noXJi56jr0YMx7PzZotezrbgxg9
	oubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=laeYxnpWEOf450yaiJI7iqbwKiAB9SgSXm/uGIW0CdU=;
	b=LlUoUJme9+Wbu1k6u7Gc3BzW5fKlwD6iv3bfncM91/Pf7PWzPwbCNwZBmqgeLlpShu
	oJVcVf1UFUvIEsQZmssQjGJcU6spEauu0hphDtdjK4EEW2oEgi2ny8f8XzHaFroUHSrN
	MSVXc7XP3xn//47E/bXS6aFCJ4ZUypns+81pHenK4yIjSjM1JMpRpe/6y5D0HCci/IMX
	UpuSfi5QJU8vVcgSQFL9CWcUWtt+9I8YVVN4DrsCpOU+sUpWQqqmDUInEMXzPx1GwaFo
	QhcTX+Y5N/gy5tV+w7PIr3Ha3ILk5F/cSbE4p6jvOExUJvrXFrsZ6hICV5q8nUSVRI6H
	VoDQ==
X-Gm-Message-State: AHPjjUjU4xQ+uVNM+dpaEfEduR2T4WuURz2nFARLpNZeE/TvWTjO3GsW
	5h92zSSqH58znsopjictGHWi17qY0w==
X-Google-Smtp-Source: ADKCNb5p/6Q1wNuVMzF6AM5LWhITLRwjr1wnzE41i60oZy+A76ML3PDqtGVnErhv2NcEZn/aYCT3BP8hdCUJCjzU3PE=
X-Received: by 10.31.89.193 with SMTP id n184mr1145128vkb.19.1504776574097;
	Thu, 07 Sep 2017 02:29:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Thu, 7 Sep 2017 02:29:33 -0700 (PDT)
In-Reply-To: <1504725809-12825-20-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-20-git-send-email-mark.hatle@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 7 Sep 2017 11:29:33 +0200
Message-ID: <CALbNGRS8S=vdceyyRV2fuTyJnZFM0MsK=JWdVoWn_KAxu_SRsw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 19/31] glade3: Move PACKAGECONFIG setting to enable_gnome.conf
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
X-List-Received-Date: Thu, 07 Sep 2017 09:29:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 6, 2017 at 9:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> This resolves a failure of the yocto-compat-layer.py script.  Changing the
> PACKAGECONFIG setting by just including a layer can cause problems.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta-gnome/conf/enable_gnome.conf                   | 2 ++
>  meta-gnome/recipes-devtools/glade/glade3_%.bbappend | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  delete mode 100644 meta-gnome/recipes-devtools/glade/glade3_%.bbappend
>
> diff --git a/meta-gnome/conf/enable_gnome.conf b/meta-gnome/conf/enable_gnome.conf
> index 883a6f5..7e711ee 100644
> --- a/meta-gnome/conf/enable_gnome.conf
> +++ b/meta-gnome/conf/enable_gnome.conf
> @@ -1 +1,3 @@
>  AVAHI_GTK_pn-avahi-ui = "gtk gtk3"
> +
> +PACKAGECONFIG_pn-glade3 = "gnome"
> diff --git a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend b/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
> deleted file mode 100644
> index 3abacfb..0000000
> --- a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -PACKAGECONFIG ??= "gnome"
> --
> 1.8.3.1
>
Yet another stupid question (yes I need gnome support for working with
glade3): How is enable_gnome.conf supposed to be activated?

For the record: This is yet another patch kicking things off for the
sake of yocto-compat-layer script. Is meta-gnome supposed to be yocto
compatible? Was this decided by 'community'?

But I am sure I missed another point...

Andreas


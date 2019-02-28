Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 74A6C7C67E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 12:54:03 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id z13so11975623qki.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 04:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s+RKBZhkwX6nXshMxI+yebHm60DlgMODPP3bb7god7w=;
	b=GKULRFKnFGvsjw3nsw2m1B0hXO12qkrIAHWdAzEYuJGwiAN3+ljhXX0SdBEuKTskeN
	XEM5HyoTcbBQ0q6j88qIy0PpDwdq4LMek3uUPnQM3W6Ds41MDen+lLxKNAmElN3gxFu1
	07oeH2KSR0M8eKGSOGk1XNt/TGSnzBtOBqqkmW0Vto2Oqsqo430NVJY4cvddLOSxjv5i
	FGv2YJ1c6tzNhJ2R9AGTNwUzQ/yyqJ0lZvpXSEMGuCoKdDJgpRGKgjmPyc3VzU8dh+n6
	3d7G/F8so2verCAcmLFe1Tn9t4PQXDVHMYsFTV8eHh5qf11hdBP4C28mICvmpg56xSdh
	T1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s+RKBZhkwX6nXshMxI+yebHm60DlgMODPP3bb7god7w=;
	b=KyRcJaFFkcXFFQX6QnqtV10eyAot3b0OaXLgVq9jWv5zt+jZJg+TKaccWX6V5aR7tU
	MDeeNb8CJdVLpx5HxpDYnOr4QZUXsGRlHlI02DNX0WDfauQP+VaOhiMDGwz/Z85ncLCi
	WbuDfcmke84g29SbmQZoT8ojpwuspI7XUPCek4k39Sdcl3PhKRGaU81Qi0FQvOR4BvKs
	f9JAsuLEdiXDq+iap39RHiSv4MZSJajUMljeuitknIHbrblswLNRWKvhridLUJjxI2ca
	k6w2qFw9c+DOlZHhSUJySzK1bKZdnBVuvE1Wqi941wfDAzpkYcUTg5Dlf1IBjL+8wQfY
	VPSQ==
X-Gm-Message-State: AHQUAub4tqMIAHOCua7K2Nh8M2yfctv040YMQBg6/fe/jSMUz6WpVily
	JbJl2wYYfHr5DbzF+ooMvMD2PkUkrdE9LImzshzzcw==
X-Google-Smtp-Source: APXvYqxHog9k9ZGkK4aNxShbIW9EBjgJQLyKU/e1j7TBuZHE4xSSbu5p+NFnr78vdRwjpY+hrd4F4am8BPdxpam8zoc=
X-Received: by 2002:a37:3d6:: with SMTP id 205mr6181483qkd.223.1551358443758; 
	Thu, 28 Feb 2019 04:54:03 -0800 (PST)
MIME-Version: 1.0
References: <1551332535-158589-1-git-send-email-changqing.li@windriver.com>
	<1551341828-451293-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1551341828-451293-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2019 04:53:37 -0800
Message-ID: <CAMKF1spcyPcCXVLNwLjV7j8L0f8y+coz=VPa=7L1f4i+-whKoA@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 3/4 V2] net-snmp: Add PACKAGECONFIG des
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
X-List-Received-Date: Thu, 28 Feb 2019 12:54:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 28, 2019 at 12:18 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
> index e1c780b..f6ab73a 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
> @@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
>             file://net-snmp-fix-for-disable-des.patch \
>             file://reproducibility-have-printcap.patch \
>             file://reproducibility-accept-configure-options-from-env.patch \
> +           file://0001-net-snmp-fix-compile-error-disable-des.patch \
>             "

this patch is missing. Please rebase on master-next and resend

>  SRC_URI[md5sum] = "6aae5948df7efde626613d6a4b3cd9d4"
>  SRC_URI[sha256sum] = "c6291385b8ed84f05890fe4197005daf7e7ee7b082c2e390fa114a9477a56042"
> @@ -42,15 +43,16 @@ CCACHE = ""
>
>  TARGET_CC_ARCH += "${LDFLAGS}"
>
> -PACKAGECONFIG ??= ""
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}, des"
>  PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
>  PACKAGECONFIG[libnl] = "--with-nl, --without-nl, libnl"
>
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
>
>  PACKAGECONFIG[perl] = "--enable-embedded-perl --with-perl-modules=yes, --disable-embedded-perl --with-perl-modules=no,\
>                         perl, perl perl-lib"
> +PACKAGECONFIG[des] = "--enable-des,--disable-des"
>
>  EXTRA_OECONF = "--enable-shared \
>                  --disable-manuals \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


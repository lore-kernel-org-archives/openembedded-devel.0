Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1568878DA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 08:18:28 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id z8-v6so1347039qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Aug 2018 01:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0WVDK7ztNjcKQv5+I5h7slu2+RyAQ6xPSErO8ANPdjk=;
	b=lVX+mAmwy68R7JZjytDcqsMUnf7GC1YhARAQ6gFRVoCkB86OawRczpJXzTfQdp+UvN
	5X71bIptneuiWTNzE6fASdYEckWZhsKAb4+A9EYsinDbVdauznI+QFarQW/F8h+d1Xyo
	gE/5A9JLTjaXCmezAeEcvPZtQd/y/7ay2DRAPaR5xZgImpTBMDGIHBqjyz+EUDh9VWFP
	t6W/I04KYj3hh8C3g3VJm0xA9GUagaLH2bU5nzwP4uk6zmFE7X2lve0nSsOLktTzILB2
	HpWFlIjhFkypUA7ulX/MiAmYjMsdJjRezINQtsWWpAio/XJ1vV9pKK/4hSFo6GCfc2r/
	OWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0WVDK7ztNjcKQv5+I5h7slu2+RyAQ6xPSErO8ANPdjk=;
	b=YP7L13UtJmE7t3hSeqrsZmpOjwLk/uWF8aaiHuNaglJqcwxJ7MipxQud0MIXGRyK75
	PcmhX/uE88QVESmvEhMh1jqOyegZWJNXDIHCHNBcNJ/2eSh7q5oukDERskX5uIIOrRC7
	ewaUQcD7PH1yyHCjJUUa8n+lZ2oStnz2L5A35q1lvknyZWbCUxnRbeNFlqNPlcBW1O5n
	j9cvJbU50gRwPTsgiCvmskJq1ecyCktCCoMGWOnMN0u00K5Kdc6zlnwMo82ocrTJqyTR
	A7kgTTdAOmGatWxm9HnY7+U8oDDqyQjcb4bRDV7TQsIMsbBMMbR4IgM/BsGp1yKYgnnS
	CFLw==
X-Gm-Message-State: AOUpUlEdPKk2kURPBFrIVsIj7594iz9dENDO189guGBZAFSWQsJZ5VMK
	7KRNxVaXzlED/YFUNfSAwWi36ZHqQ+rjnpryDiU=
X-Google-Smtp-Source: AAOMgpes65+O4TJDFqMhJ/AyZMUx/iU4D4pPhP1H63Wv8MCxu27edhSouee0BHymNtqd9o/Et/adH8WVC/uihlgBuus=
X-Received: by 2002:a0c:e0c8:: with SMTP id x8-v6mr1591622qvk.74.1533197909732;
	Thu, 02 Aug 2018 01:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <1533033627-32108-1-git-send-email-ovidiu.panait@windriver.com>
In-Reply-To: <1533033627-32108-1-git-send-email-ovidiu.panait@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Aug 2018 01:18:03 -0700
Message-ID: <CAMKF1spjw32cWX=xHEXro_4zipRn7S+SrL1d4UVUHsNgFYz7Kg@mail.gmail.com>
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] lvm2-udevrules: Add ALLOW_EMPTY
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
X-List-Received-Date: Thu, 02 Aug 2018 08:18:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 31, 2018 at 3:50 AM Ovidiu Panait
<ovidiu.panait@windriver.com> wrote:
>
> When lvm2 is configured without udev feature, the lvm2-udevrules package
> is empty, so do_rootfs will fail to install any other packages that
> rdepend on it. (e.g. cryptsetup with meta-secure-core layer since commit
> https://github.com/jiazhang0/meta-secure-core/commit/afc3939):
>
> ..
> Problem: conflicting requests
>  - nothing provides lvm2-udevrules needed by cryptsetup
> ..
>

I think this is a good thing to get this error during build, since
package depends on it at runtime, having
empty content will just defer the error until the system is booted and
then its harder to debug the failures

> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
> index 1d9de3d94..388e89117 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
> @@ -46,6 +46,7 @@ FILES_${PN}-scripts = " \
>  # Specified explicitly for the udev rules, just in case that it does not get picked
>  # up automatically:
>  FILES_${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
> +ALLOW_EMPTY_${PN}-udevrules = "1"
>  RDEPENDS_${PN}_append_class-target = " libdevmapper"
>  RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


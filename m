Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC957839B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 17:43:16 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id u96so1452774wrb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 10:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+3c4auqDOiXdoOUcmlXQ+B6AAUJ2iT8cUcRf53oFa98=;
	b=bX58IDrnDqVMNpXrJKpnk9gVDnmof1tufgjXUA8uiSjwjU7R6uBpUhDgftRz28ZIeq
	KJoeN0Nz2iZa2ijrZ3BFacKRv7MWJAqRDH6j9shWQec00yKIixpcN7d43MHrz/wZPuNL
	zT7YPuuHEhRVXY+whlT2cBW/u2xyCqPf6UvUH8XzqJrYtARZRGorCPMx9CLHCUIUrnx+
	dMIYHhfnS0nF52raxY2stKn4AAD5LGvbAWKcbUqo4MkIPBw56BTx7I2SqUZ5eYv/CBSM
	MlB18i2ZAJhnqnjQ/lG6YhYzk/+xga345oyg3e2NKhccFT+qK9SuJ998lF44Z2rxsQUi
	SNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+3c4auqDOiXdoOUcmlXQ+B6AAUJ2iT8cUcRf53oFa98=;
	b=eXw+rvypD6WhOScpBX8gMnvRrSPASns4TsPlGYaaDmeTZCiJBPBTrs8xYWOItr2she
	iNIJOKMjvkfM3m6OB6xXDHccteiA3HD3L72+hrTmXp++ay8LJkeGEcZPpjwy+x93HXhv
	mlLWrwcZuG4KU0qoipS3aDe8af7PyyBwrj/viYHyX1z6dGUytZCon88czxKKJJmAQicf
	u8EXSL9aV5YiL456PBbIoyXsRZwJfFuPDx1T/QtI4BJy61HE7p0KWAFP3wCkbX2da8uE
	wZrbX55HRL7U5FBlKLhRqe0p9GN9rteoUfL6sMVaDWzEAsPPMUzvKbMXMx/RwfSMs1C3
	uQ0g==
X-Gm-Message-State: AHPjjUgNI/hcMqWwPVgTqdk+cqXVMaZ7XI9DUiJMiUux7pGncuCq14la
	c8Rk2PPsKcTOyo0nqQzWsDbrRFhB+9Q7fsWrEq4=
X-Google-Smtp-Source: AOwi7QDm5HXwcUW9grEcdeyhZ0BdspFmGQeI+c52IyD4/OT/PMO8UF/fM5ygMUUya5QeUlIy26LDt1t4UPejcAVPq2E=
X-Received: by 10.223.142.6 with SMTP id n6mr4982900wrb.140.1506102197912;
	Fri, 22 Sep 2017 10:43:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Fri, 22 Sep 2017 10:43:17 -0700 (PDT)
In-Reply-To: <20170922032316.18616-4-raj.khem@gmail.com>
References: <20170922032316.18616-1-raj.khem@gmail.com>
	<20170922032316.18616-4-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 22 Sep 2017 10:43:17 -0700
Message-ID: <CAJ86T=Uvpi34oriQe4CNY7hS0t0WXU8o4RNMo4+b1M278fp-rQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/7] toybox: Upgrade to 0.7.4
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
X-List-Received-Date: Fri, 22 Sep 2017 17:43:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 21, 2017 at 8:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
> enable parallel build
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-core/toybox/{toybox_0.7.3.bb => toybox_0.7.4.bb}   | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-core/toybox/{toybox_0.7.3.bb => toybox_0.7.4.bb} (87%)
>
> diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.3.bb b/meta-oe/recipes-core/toybox/toybox_0.7.4.bb
> similarity index 87%
> rename from meta-oe/recipes-core/toybox/toybox_0.7.3.bb
> rename to meta-oe/recipes-core/toybox/toybox_0.7.4.bb
> index 0cd44ff64..76a7af459 100644
> --- a/meta-oe/recipes-core/toybox/toybox_0.7.3.bb
> +++ b/meta-oe/recipes-core/toybox/toybox_0.7.4.bb
> @@ -2,12 +2,10 @@ SUMMARY = "Toybox combines common utilities together into a single executable."
>  HOMEPAGE = "http://www.landley.net/toybox/"
>  DEPENDS = "attr"
>
> -SRC_URI = " \
> -    http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
> +SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
>  "
> -
> -SRC_URI[md5sum] = "6fa2a001402cb067ba541e0d8948da50"
> -SRC_URI[sha256sum] = "e6469b508224e0d2e4564dda05c4bb47aef5c28bf29d6c983bcdc6e3a0cd29d6"
> +SRC_URI[md5sum] = "55ea59a31c7da9510c8fabe70f4bc561"
> +SRC_URI[sha256sum] = "49d74ca897501e5c981516719870fe08581726f5c018abe35ef52c6f0de113e7"
>
>  LICENSE = "BSD-0-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
> @@ -16,7 +14,7 @@ SECTION = "base"
>
>  TOYBOX_BIN = "generated/unstripped/toybox"
>
> -EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
> +EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC}" CPUS=${@oe.utils.cpu_count()}'

Is dropping ${BUILD_CFLAGS} and ${BUILD_LDFLAGS} from HOSTCC intentional?

>  do_configure() {
>      oe_runmake defconfig
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5A37E605C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 15:04:26 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id j23so2451783qtr.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 07:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CmmiabwfnNF/NfuYkylbZHRRMX9hpKa/OF+uafcneGw=;
	b=bYioQykZViXP+YVkEv4PoCAu2SSC28vkVhBlbkfahNNQsVVrf1K9z6jZkauA1/BruX
	TuWI2DMvGaCDB8I49b+SKtgRr0vhV5rlvoi57CVM/I9xbqLfCzy3+wphXRrxcwaFt7t4
	U6QMRUYPqLuCZYHZO2yvi452BHPEYioJMUQFUuGlgKhIj41juikVSjhlLL1GxZnUkNWJ
	VLmP98ze6AAV3yAStzEOATzr+B5JfzK8JeOmg1cJc0rtQoqgwROMpJrz99EeUBiKuqcV
	PnrkomVQ4jC0mUa4EAhDBcMl7DB5FrfmKJg17uyWwHTHsbIpf/JRYFnde5KMZPy+WIGW
	Xmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CmmiabwfnNF/NfuYkylbZHRRMX9hpKa/OF+uafcneGw=;
	b=VgNYEWXhK182Dm8ff727Yawtv6gOoienN+gVX1VbZ2uEaxAFjEI+WBiHb/6qAD1emF
	rdtjIA948kUgSeXClP98g3f8r3g8lWLVCFcMf1GRlEIEs2TYidWAoaF+1oQjkjWTWJG1
	NMGwGgRcJcM+qLhaK5uncFem2z6uBK1aq8a5mxuo+tqWakXx4W3yKKxPfxYCLsqDFY3n
	7tOYSG1p9dZxrScTTTxDLa2miLKgJXh9uDWjR+GxyWq8sS8eF9I+GYynHYu7qFkB8bdM
	aVHhZjTAxYGfQVggFcavYjJy7lrhFo1+tsO79Va3iL6n2ZzwTnXVqTa9B4L1mYhLwgim
	bATA==
X-Gm-Message-State: APjAAAUS51XBRvH2ST1QVixX6Vhzq7d5AmAfQbKXUYviuRR5FSRa1sN/
	soTyqKCVjq3kVrAmzULuGX6dO1rJrvU4qwF6YxFX6p2Y1BI=
X-Google-Smtp-Source: APXvYqw3ZcqkwA4BjgsClTV9LeixVsEMjEno2uicHpanEWewDDC0VLDJGLERPTP6FIha37b4MYgUF6YPuv76LoR/tFM=
X-Received: by 2002:ac8:36dd:: with SMTP id b29mr5363834qtc.285.1582815867621; 
	Thu, 27 Feb 2020 07:04:27 -0800 (PST)
MIME-Version: 1.0
References: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
	<1582807398-13955-6-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1582807398-13955-6-git-send-email-wangmy@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Feb 2020 07:04:01 -0800
Message-ID: <CAMKF1sq3_BTRy3Jeke+mtOsSae1kZ3qWb5ULJjhvUhd_jXSejg@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] flashrom: upgrade 1.1 -> 1.2
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
X-List-Received-Date: Thu, 27 Feb 2020 15:04:27 -0000
Content-Type: text/plain; charset="UTF-8"

fails to build with clang
https://errors.yoctoproject.org/Errors/Details/392867/

On Wed, Feb 26, 2020 at 10:01 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../recipes-bsp/flashrom/{flashrom_1.1.bb => flashrom_1.2.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-bsp/flashrom/{flashrom_1.1.bb => flashrom_1.2.bb} (77%)
>
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
> similarity index 77%
> rename from meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb
> rename to meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
> index 074a1a5f6..17445ac2d 100644
> --- a/meta-oe/recipes-bsp/flashrom/flashrom_1.1.bb
> +++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
> @@ -7,8 +7,8 @@ DEPENDS = "pciutils libusb libusb-compat"
>
>  SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
>             "
> -SRC_URI[md5sum] = "91bab6c072e38a493bb4eb673e4fe0d6"
> -SRC_URI[sha256sum] = "aeada9c70c22421217c669356180c0deddd0b60876e63d2224e3260b90c14e19"
> +SRC_URI[md5sum] = "7f8e4b87087eb12ecee0fcc5445b4956"
> +SRC_URI[sha256sum] = "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b"
>
>  S = "${WORKDIR}/flashrom-v${PV}"
>
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


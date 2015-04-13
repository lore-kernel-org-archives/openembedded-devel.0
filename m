Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2293473D73
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 20:35:09 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so54545207igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 13:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0l+Byf6dBJ0g2xzgc8jP43BDVeG0CyUEzoUWZ0ABwKY=;
	b=DQj/XZ9zbYqXw1MGNcV42Bgefz32qLBvu0w42BUG4/U+/GtOTkLQsfCSenIjUMmpGw
	ezJpgMoJuOHNJU95to5aN801S7ALXGtr+V+fDU/5EA0J4j/4cwmy7eWjI7Rgy3HoMGKo
	MMQkT/6BafA8BwJed9Dq+7DMhOye4dfWoT23yFsPywaVQ/HFjN7Z12/hybxL8AvFFWtS
	itiW7xYIv4I558kTC3HrcOp0M3ChVHxWC2fSg/63pl++IWGVJV4qhqkf7LTdgisM6IrQ
	TWHK1v4dUya8PaQrrcJ6WjgBd0bwYgFFjqapM0Hcln7Mzsi0O3ADpAYPYXP57atK+ARr
	eTRw==
MIME-Version: 1.0
X-Received: by 10.107.18.170 with SMTP id 42mr24705869ios.38.1428957310967;
	Mon, 13 Apr 2015 13:35:10 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Mon, 13 Apr 2015 13:35:10 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Mon, 13 Apr 2015 13:35:10 -0700 (PDT)
In-Reply-To: <1428910057-23647-7-git-send-email-sven.ebenfeld@gmail.com>
References: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-2-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-3-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-4-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-5-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-6-git-send-email-sven.ebenfeld@gmail.com>
	<1428910057-23647-7-git-send-email-sven.ebenfeld@gmail.com>
Date: Mon, 13 Apr 2015 13:35:10 -0700
Message-ID: <CAMKF1sqApQR=XJtxKO-CWgK8O9xPTQUi909KEB5Lto8igtqzvQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java][PATCH v2 6/7] java-test-image: Add openjdk-7 ZeroVM and remove busybox-hwclock
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
X-List-Received-Date: Mon, 13 Apr 2015 20:35:14 -0000
Content-Type: text/plain; charset=UTF-8

On Apr 13, 2015 12:29 AM, "Sven Ebenfeld" <sven.ebenfeld@gmail.com> wrote:
>
> busybox-hwclock could not be installed for me and I guess we don't really
need it.
> I wanted to test OpenJDK 7 ZeroVM so we need to install it.

May they should be two separate commits. They seem quite unrelated

>
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---
>  recipes-images/images/java-test-image.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-images/images/java-test-image.bb
b/recipes-images/images/java-test-image.bb
> index 4807858..22c7bdf 100644
> --- a/recipes-images/images/java-test-image.bb
> +++ b/recipes-images/images/java-test-image.bb
> @@ -5,9 +5,9 @@ inherit core-image
>  IMAGE_LINGUAS = " "
>
>
> -IMAGE_INSTALL = "busybox modutils-initscripts initscripts opkg udev
sysvinit netbase base-files base-passwd busybox-hwclock \
> +IMAGE_INSTALL = "busybox modutils-initscripts initscripts opkg udev
sysvinit netbase base-files base-passwd \
>                   ${ROOTFS_PKGMANAGE_BOOTSTRAP}
${CORE_IMAGE_EXTRA_INSTALL} \
> -                 openjdk-7-jre openjdk-7-vm-jamvm openjdk-7-vm-cacao \
> +                 openjdk-7-jre openjdk-7-vm-zero openjdk-7-vm-jamvm
openjdk-7-vm-cacao \
>                   openjdk-6-jre openjdk-6-vm-zero openjdk-6-vm-jamvm
openjdk-6-vm-cacao \
>                   strace dropbear binutils \
>                   classpath \
> --
> 1.8.1.rc3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


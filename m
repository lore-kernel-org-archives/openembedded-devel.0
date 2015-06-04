Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 775EE734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 20:15:39 +0000 (UTC)
Received: by wibut5 with SMTP id ut5so587341wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 13:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pUUw5+DHKIj7YRlEeB0FyGDPTcbttOD/gt5zOO7K2Yg=;
	b=oLSXNmGplW0lu4pXJRWGmfXq0oTZBFsdb3I4vcUjwnwoTqPWVrF5N6uvgMXDdW6dju
	UCww/Tjr67nCrg+MLz3JSRQI7ZGsFto8FUAsjPuhv7mccBfs90HoZRQzcMBHVNMI3NgB
	yjNJf66GDej7WUGI88DywQW3QCksokcqNZ8k/ewoQgIn+fBwsRNpx7IlZLnqo7Eurs/L
	ppCb9/CLg5I98FZcT7QTpgyYjGesNNvrSz7GGIgA+Mgow/ijaxGfsUNVJ0UaiMZSRmoJ
	P/9opCI9f/Bw3LkxbDpgz3raQ8kJM/6zSGnKiT/8Im8AHfudycAvnvM51ns+BAg5isTk
	eWRA==
MIME-Version: 1.0
X-Received: by 10.180.99.2 with SMTP id em2mr55600730wib.59.1433448940468;
	Thu, 04 Jun 2015 13:15:40 -0700 (PDT)
Received: by 10.28.167.73 with HTTP; Thu, 4 Jun 2015 13:15:40 -0700 (PDT)
In-Reply-To: <1433444982-25590-1-git-send-email-raj.khem@gmail.com>
References: <1433444982-25590-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 4 Jun 2015 22:15:40 +0200
Message-ID: <CA+chaQe=V5grchwHfUVNQVqVXUCQ3okdLsCB1V9FnJK7hC_uHQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] qtwayland: Bump QT_VERSION to "5.4.3"
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
X-List-Received-Date: Thu, 04 Jun 2015 20:15:40 -0000
Content-Type: text/plain; charset=UTF-8

UPS, I'll double check how this could be missed in my tests (I know that in
my world builds there is bbappend with qtwayland SRCREV+SRC_URI
modification from meta-luneui), but my local builds were without
meta-luneui).

On Thu, Jun 4, 2015 at 9:09 PM, Khem Raj <raj.khem@gmail.com> wrote:

> We pin the recipe at 182488129c3f6a67a7e781fdb7c0147777191991
> and upstream changed the MODULE_VERSION = 5.4.3 in that commit
>
> Fixes
> | install: cannot stat
>
> '/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/q
>
> twayland/5.4.2+gitAUTOINC+182488129c-r0/build/include/QtCompositor/5.4.2/QtCompositor/private/qwayland-server-*.h':
> No such fil
> e or directory
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-qt/qt5/qtwayland_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/
> qtwayland_git.bb
> index 065bc3c..0be7afe 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -37,7 +37,7 @@ SRC_URI += " \
>
>  file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
>  "
>
> -QT_VERSION ?= "5.4.2"
> +QT_VERSION ?= "5.4.3"
>
>  do_install_append() {
>      # do install files created by qtwaylandscanner
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


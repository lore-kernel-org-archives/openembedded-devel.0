Return-Path: <ashcharles@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 78DAE65DB4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 16:42:46 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id id10so6449082vcb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 09:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=haJ3bt4TDeRDM72h553MTBbZ8OQbj5ykT7GfiVGO+nQ=;
	b=AWW2TydBJLSPRN4/7E2BiT68O51TbT7rpCsao7RpdVblJcYFyccad4rQd5EDUKBMrm
	W5VUdfG5NY+6/pq+zMsLXKcTZRwW0rXmkaOZuTVzWtwaDnTJyAByPjY6ODfONrSNUVTg
	bYLnUbS3vFCXhCgExH7X2scHdaxd2LBCo2lAx6zH1ELO0y5hYWAk9Bw4TGIVrXqLgSi0
	2tTBW3KNB6Beg0xj9gLBVEJ8AAbsA1FXKd5fBsbl1YyDcS5KVcJNucCplBewJsNEeNvL
	c3DiKr47nAbKwV2skrbt7ZTN0soUXwjGL1qlclZ6ZkLpxz58DzSHB0E1hpuuRR91ECTL
	kB9w==
X-Received: by 10.52.135.208 with SMTP id pu16mr8828752vdb.8.1402418567594;
	Tue, 10 Jun 2014 09:42:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.198.163 with HTTP; Tue, 10 Jun 2014 09:42:17 -0700 (PDT)
In-Reply-To: <1402418201-4389-1-git-send-email-ashcharles@gmail.com>
References: <20140610112139.GD2433@jama>
	<1402418201-4389-1-git-send-email-ashcharles@gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 10 Jun 2014 09:42:17 -0700
Message-ID: <CAK8F28nWie5hLac3mFiB739BRfw=MQQ8q=39rZoV3i39vuvvcw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [Patch v2] xfce4-screenshooter: Ensure lib directory exists.
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
X-List-Received-Date: Tue, 10 Jun 2014 16:42:47 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Newbie question:
I sent this correction as a v2 on the patch as committed on
master-next (which, unintentionally meant that I carried over Martin's
SOB).  Is this the correct approach or
1. would you rather a completely new patch to resolve just the issue
as the original has already been committed to master-next
2. would you rather a v2 on the original patch I sent to the list?

thanks,
--Ash

On Tue, Jun 10, 2014 at 9:36 AM, Ash Charles <ashcharles@gmail.com> wrote:
> Screenshooter autogenerates screenshooter-marshal.[ch] in lib/ during
> compilation.  The source directory contains a lib/ but this directory
> doesn't exist in a build directory by default so we add one manually.
> Really, this should be corrected in the upstream package.
>
> v2: only make lib/ if it doesn't exist
>
> Upstream-Status: pending
>
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb     | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
> index 4cda352..0e2e327 100644
> --- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
> +++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.8.1.bb
> @@ -11,5 +11,9 @@ SRC_URI += "file://0001-Fix-panel-plugin-build.patch"
>  SRC_URI[md5sum] = "d0ffea2052a8e70154cf13789070711f"
>  SRC_URI[sha256sum] = "40419892bd28989315eed053c159bba0f4264ed8c6c6738806024e481eab9492"
>
> +do_compile_prepend() {
> +       mkdir -p lib
> +}
> +
>  FILES_${PN} += "${datadir}/xfce4/panel/plugins \
>          ${libdir}/xfce4/panel/plugins"
> --
> 1.8.3.2
>


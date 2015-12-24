Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 23B1473170
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 02:41:23 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id ph11so92316032igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 18:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=PgIGe5Qr9GDoYQ94FW5THKCCGF4OIpStgw3F2PHMJxM=;
	b=YioKNJq414fhUUTskEC7PYaSlWiJDGjQ2p21TWu9Cb2ne9xDsCGmc3pNirPdV71mAm
	KFQef3wiJ728gaD0oq5/xZTVtZTrQO0jvqe0G9xjnEIgBOoQI+j2GQl7y4L6JqmrLMo5
	6Ttg/IO+bJ2w762YvCC7iKHhm3MxhwjE+CVnO+o57LZyZd/TG1mxvLoDFh+72S9yAjjH
	pOTJkr/D8I55oYEvfDMjeFHBv4yLvSDuJOYA/FBB2IcH4zBrCfho9VehVE8aAr7EJiWs
	NXz+LDJtUt7OsHsQGuZ85AznTTFSCJfbvTs9/p8ru1XbAs1DfmZzeapKO8w9cle8X7Nx
	lMQw==
X-Received: by 10.51.17.38 with SMTP id gb6mr12424249igd.75.1450924884464;
	Wed, 23 Dec 2015 18:41:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 23 Dec 2015 18:40:55 -0800 (PST)
In-Reply-To: <1450850365-33335-1-git-send-email-fupan.li@windriver.com>
References: <1450850365-33335-1-git-send-email-fupan.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Dec 2015 18:40:55 -0800
Message-ID: <CAMKF1so9OOd6Ka4kzzZexCD2Lyn0Ca8C1SdTR4uBVmFHQvYFNw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] oe-core:package_manager extract target arch from TARGET_SYS and add it into package_archs
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
X-List-Received-Date: Thu, 24 Dec 2015 02:41:24 -0000
Content-Type: text/plain; charset=UTF-8

re-send this patch to oe-core ml please.

On Tue, Dec 22, 2015 at 9:59 PM,  <fupan.li@windriver.com> wrote:
> From: fli <fupan.li@windriver.com>
>
> Since the rpmbuild on the target will use TARGET_SYS as the
> 'target' to build the source rpm packages, which will extracted
> the target arch from TARGET_SYS, such as if TARGET_SYS values
> 'arm-poky-linux-gnueabi', the target arch will be 'arm'.
>
> In order to make the rpm pkgs built out on the target compatilbe
> with target, extract the arch from TARGET_SYS and add it into
> package archs which will be write into the rootfs's /etc/rpm/platform.
>
> Signed-off-by: fli <fupan.li@windriver.com>
> ---
>  meta/lib/oe/package_manager.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 04812d2..e4b53a0 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -55,6 +55,16 @@ class RpmIndexer(Indexer):
>              target_os['default'] = self.d.getVar(os_var, True).strip()
>          else:
>              package_archs['default'] = self.d.getVar("PACKAGE_ARCHS", True).split()
> +
> +            #add the compatible arch extracted from TARGET_SYS.
> +            #TARGET_SYS usually values as "arm-poky-linux-gnueabi",
> +            #so the arch is 'arm'
> +            target_sys = self.d.getVar("TARGET_SYS", True)
> +            if target_sys:
> +                target_arch = target_sys.split('-')[0]
> +            if target_arch not in package_archs['default']:
> +                package_archs['default'].append(target_arch)
> +
>              # arch order is reversed.  This ensures the -best- match is
>              # listed first!
>              package_archs['default'].reverse()
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


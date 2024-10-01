Return-Path: <lsorense@csclub.uwaterloo.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62FECF3186
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 21:04:42 +0000 (UTC)
Received: from caffeine.csclub.uwaterloo.ca (caffeine.csclub.uwaterloo.ca [129.97.134.17])
 by mx.groups.io with SMTP id smtpd.web11.93441.1727816672588529530
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Oct 2024 14:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: csclub.uwaterloo.ca, ip: 129.97.134.17, mailfrom: lsorense@csclub.uwaterloo.ca)
Received: by caffeine.csclub.uwaterloo.ca (Postfix, from userid 20367)
	id 3EFD6460C28; Tue,  1 Oct 2024 17:04:31 -0400 (EDT)
Date: Tue, 1 Oct 2024 17:04:31 -0400
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Yi Zhao <yi.zhao@windriver.com>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 3/5] samba: upgrade 4.19.6 ->
 4.19.7
Message-ID: <Zvxj379qqn8aM9uF@csclub.uwaterloo.ca>
References: <20240915163040.189190-1-akuster808@gmail.com>
 <20240915163040.189190-3-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240915163040.189190-3-akuster808@gmail.com>
From: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 21:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112638

On Sun, Sep 15, 2024 at 12:30:38PM -0400, Armin Kuster wrote:
> From: Yi Zhao <yi.zhao@windriver.com>
> 
> ChangeLog:
> https://www.samba.org/samba/history/samba-4.19.7.html
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 41df431b91f1d81070c1f0e8633995d7afba52e4)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../samba/{samba_4.19.6.bb => samba_4.19.7.bb}                  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-connectivity/samba/{samba_4.19.6.bb => samba_4.19.7.bb} (99%)
> 
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.6.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
> similarity index 99%
> rename from meta-networking/recipes-connectivity/samba/samba_4.19.6.bb
> rename to meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
> index bd0309934b..dddf594515 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.19.6.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
> @@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
>             file://samba-4.3.9-remove-getpwent_r.patch \
>             "
>  
> -SRC_URI[sha256sum] = "653b52095554dbc223c63b96af5cdf9e98c3e048549c5f56143d3b33dce1cef1"
> +SRC_URI[sha256sum] = "2bbb800af2d6bc7b9c23e708cd58d008da3bfa6ef7e621d9ec8b53387efee445"
>  
>  UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"

This broke the build for me.  Seems it now requires ldb 2.8.1 but the
version in 5.0 is 2.8.0 so configure fails.

The update to 4.19.8 has the same complaint.

The commit right before this one builds fine of course so I temporarily
jumped to back to that one for now.

-- 
Len Sorensen


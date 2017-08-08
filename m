Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 611D877756
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 20:04:03 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t138so8858171wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 13:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3ygquv+u9kBXSWSY+F6J+Wx1w+ii9scuGKIHk/FcoVs=;
	b=UGlDq/Qepjl/u2VUb5vnuVFQDBCbHR/7RO3k0WrKTb7Wf0wcfy2y8w+d777NTBChJg
	ZQCnNGkbr3M0zrf99jP+bOWMgWVeU11oh933mic4N39AGOaZxfxPUN9GL7Ktp0PLCWkS
	SqdpOuyCQnD8DmrWaaSi5YgrxYeHtQC5eLL6hdXEFWt7fsbrbaBkUEeH+aI/auBBBzli
	LpwdMgfBIN6YiHeAyLFprKzgPvRGvYgiE/5D8uUFnbFJ+WGMNCpGXlCrFP2pKNB3lxFV
	ZmrPteqETxpVx0aPKyzOA4GCwDn2wfRHh25xqO2BLMHIppcsDKouwUKB6qqSCGpMFSST
	KorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3ygquv+u9kBXSWSY+F6J+Wx1w+ii9scuGKIHk/FcoVs=;
	b=JTbpNWCxxgfVZKFyriYgNmSr5jYT9Z744x9GYzMCd1OctUixejUYIcKok+2Tgor5IL
	U0h0vdZFXsgt4+ygzCNiE8whdY+MawMjzlDXvl/YESQ5HeTKH//6MIkryk1fZLUZ84uU
	dGqTzPOqMK9+nBUwocLjKCD9T6EM1ybnAw9aGhDMHupTxt7b99yvhGRaNnN/uUj66jva
	6RN9WFrtu7sVBBoxGe6v6HInig+7DH9Isj7p91lNhKfjT6sRYXvwTE1ejfiwDiFjobmb
	pCSwJ81BD9EAqrZ5+paCnloKAuq7m6GUlGJFnzHrrAMfDWE7FJ0u5Vqu9YefRcVkpyMP
	SZvQ==
X-Gm-Message-State: AHYfb5hogTlOSzXDBxtki5/t5ktd3SKnFbfosT5RF/PEH1f3EC8LJ9td
	zVAzURqdmdUvqetPb8tv2m+EaH1wdw==
X-Received: by 10.80.164.18 with SMTP id u18mr5300014edb.250.1502216790984;
	Tue, 08 Aug 2017 11:26:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 8 Aug 2017 11:26:00 -0700 (PDT)
In-Reply-To: <1502212606-19666-1-git-send-email-derek@asterius.io>
References: <1502212606-19666-1-git-send-email-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Aug 2017 11:26:00 -0700
Message-ID: <CAMKF1spYSbHUEm43XPjDHmfryLz7Us8K9rR_jBgjtXSLR5rh-A@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH] nginx: update stable version to 1.12.1
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
X-List-Received-Date: Tue, 08 Aug 2017 20:04:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 8, 2017 at 10:16 AM, Derek Straka <derek@asterius.io> wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb | 6 ------
>  meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb
> deleted file mode 100644
> index d3e15a8..0000000
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb
> +++ /dev/null

you should configure git to detect copies a bit harder. Its easlier to
review moves/renamed files then delete/add

> @@ -1,6 +0,0 @@
> -require nginx.inc
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
> -
> -SRC_URI[md5sum] = "995eb0a140455cf0cfc497e5bd7f94b3"
> -SRC_URI[sha256sum] = "b4222e26fdb620a8d3c3a3a8b955e08b713672e1bc5198d1e4f462308a795b30"
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb
> new file mode 100644
> index 0000000..7f0e3ad
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb
> @@ -0,0 +1,6 @@
> +require nginx.inc
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
> +
> +SRC_URI[md5sum] = "a307e74aca95403e5ee00f153807ce58"
> +SRC_URI[sha256sum] = "8793bf426485a30f91021b6b945a9fd8a84d87d17b566562c3797aba8fac76fb"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Return-Path: <koen.kooi@linaro.org>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8E41265DA3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2015 12:50:54 +0000 (UTC)
Received: by iecrd18 with SMTP id rd18so57373893iec.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2015 04:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=+LScrJXQbIzXygtZYtdYVTsOHIGTKkk7+ylhyRT29Tg=;
	b=dHyQM869kn5iLL3LixvWyE4tk3de1xosMbSWYN/FyNwYunO7B+aM221IN1vfQ+PuoW
	1M7Y/obHLW1/TALk6JWwkrQA/VPxknEyqFihkZODiZviYj31+ZkATPyGIhMxU1eDUY6W
	7d03/ks0hIAMY09U0l3XqyrV+oOPG0Yrd5USbIHR2YNJ8PZQ4o495UYVeQEG8F4n3+UO
	P1XmdBT7nuxDEZr1IHPHAigapdA+qOtf+19wzXmiDJVfldLEMy0ffRcdgToeiNz4kNz8
	dwbuCcaRjEwmWCrdVQxVhyPvCLDFVueEXA/pwKSB9gt98rnbxeTVOhog/6qy210fOuxQ
	KCgg==
X-Gm-Message-State: ALoCoQngVMJKVn2KzVUcFfGO+viSAzRRQZ/3jR9HAaFNYT8wa7zZ9m3pnN1ZrosA+w6V5JU+XwBo
MIME-Version: 1.0
X-Received: by 10.107.155.13 with SMTP id d13mr1486664ioe.29.1425387055833;
	Tue, 03 Mar 2015 04:50:55 -0800 (PST)
Received: by 10.36.31.65 with HTTP; Tue, 3 Mar 2015 04:50:55 -0800 (PST)
In-Reply-To: <1425386072-16888-1-git-send-email-koen.kooi@linaro.org>
References: <1425386072-16888-1-git-send-email-koen.kooi@linaro.org>
Date: Tue, 3 Mar 2015 13:50:55 +0100
Message-ID: <CAP0W-RmFSh3g4-bnC6xJ-SUjFTUTe+hrQhM0axrm4+mQcR6b7A@mail.gmail.com>
From: Koen Kooi <koen.kooi@linaro.org>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH] mozjs 17.0.0: fix aarch64 and 64k page builds, generic cleanups
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
X-List-Received-Date: Tue, 03 Mar 2015 12:51:00 -0000
Content-Type: text/plain; charset=UTF-8

On 3 March 2015 at 13:34, Koen Kooi <koen.kooi@linaro.org> wrote:

> * Mozjs17 has problems with 64k page sizes (powerpc64, aarch64 and
> probably others) and lacks support for aarch64. Patches were lifted from
> the fedora src rpm and rediffed.
>
> * Regenerate configure with autoconf-2.13 to make the fixes mentioned
> above take effect.
>
> * Provide proper config.guess and config.sub files
>
> * Explicitly disable static builds and regroup configure options.
>
> * Also clean out the patches/ dir present in the tarball to avoid
> conflicts with the OE patcher.
>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  ...ozjs17.0.0-fix-the-compile-bug-of-powerpc.patch |   36 -
>  .../mozjs/mozjs/0001-regenerate-configure.patch    | 3238
> ++++++++++++++++++++
>  ...02-Move-JS_BYTES_PER_WORD-out-of-config.h.patch |   75 +
>  .../mozjs/mozjs/0003-Add-AArch64-support.patch     |   76 +
>  ...4-mozbug746112-no-decommit-on-large-pages.patch |  103 +
>  .../mozjs/mozjs/0005-aarch64-64k-page.patch        |   44 +
>  meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |   28 +-
>  7 files changed, 3561 insertions(+), 39 deletions(-)
>  delete mode 100644
> meta-oe/recipes-extended/mozjs/mozjs/0001-mozjs17.0.0-fix-the-compile-bug-of-powerpc.patch
>

That deletion shouldn't have happened, v2 on its way.


>
>


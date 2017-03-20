Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 917D0779D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 17:38:12 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 196so19958719wmm.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 10:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ADG/FP+daqLANZgeoZ4FIcBVi4eeIeRhhwZ07a4ItEU=;
	b=X6zfPniUsMKySetT2kFv/Ce5gc1p4BP1pUvGRGrZMeOYV8n69erjxD/4CQAUy26F3n
	iOZP/UMe+HrDw0uvLZBA09UmLiCPguHqDwtXNZid4c0xmRXZEcjzL14i3mRJXeo9G/We
	QjLv6zeX7zHzBhqlQ2r321mvsnrcQS6HbH/pRX+isha6VKCdyswP9h+c5E0abXJQwdq0
	qaaiKIcDqjyTkE2+WFNMFU9B4HWNbscXz3rrXv1MKLDWkGsxBL7qoY0Zel5V7na+YPbD
	YHUEyB1Wzki83FDNeHoEajDRmOW1mZnNYIRqYF/zLv9Y89C+8zfYlJjnnJYqyrTUuxnR
	CNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ADG/FP+daqLANZgeoZ4FIcBVi4eeIeRhhwZ07a4ItEU=;
	b=pcDDJVfwmtGOXk5FEoWpYuPfNSBuiNt8gD1uF5R/i0WZgCYAU4/3e3Na57samBAbZX
	WTsqgwBNVnXHcjnSZrO6tXvfdq2Z5HMdurYaGPWc46f2znQ3ezNouhyYHvP2wIUdh0IH
	HWYfnNQNnmGlY4Mp/Sl3+G8/dd7UDO0tsVK8RPuaXk2VD4olY2RqGlCLZbkFofGmrYEy
	+krVuy6/soKHq/Gblv5pCbMhIvfkrEIOgdsXUFcYN+zXpGagODD/XGL/rN/mHwllyH/n
	ImQXi9lsh2+vMwrhcnetDaQnVUaHKP6xSi3Uh1zNSDz1AVx4ZH5TLaWPj0rkYpZWdFbv
	74Lw==
X-Gm-Message-State: AFeK/H30IYifx+pwOjlcGtHhTFIeKrIfeMvbbW+7fPzsiLIBkUfcuiKgWqpEI6cuetlaw+fPbE494xq+IwAUKQ==
X-Received: by 10.28.45.212 with SMTP id t203mr10651233wmt.37.1490031493729;
	Mon, 20 Mar 2017 10:38:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Mon, 20 Mar 2017 10:37:43 -0700 (PDT)
In-Reply-To: <07459727-026a-2456-792f-a06dbef2a988@xevo.com>
References: <07459727-026a-2456-792f-a06dbef2a988@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Mar 2017 10:37:43 -0700
Message-ID: <CAMKF1srJC1vitok6sf1WLggHgSRga6eHYGm7JM324nP7b51ZSA@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-clang] llvm-config cross-compile improvements
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
X-List-Received-Date: Mon, 20 Mar 2017 17:38:14 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 18, 2017 at 8:29 PM, Martin Kelly <mkelly@xevo.com> wrote:
> Hi,
>
> This patch series fixes a number of issues I hit when trying to use the
> meta-clang llvm-config to cross-compile a project that uses CMake, calling
> into llvm-config, to determine compile flags. With the series applied, the
> cross compile successfully builds and runs. Please let me know if you have
> any concerns or if there is something I missed, and I will fix it up.
>
> The following changes since commit c9c74d269ba79abbc20919de96f1eb2b8a81edec:
>
>   clang/compiler-rt: Fix nativesdk builds break compiler-rt dep for clang
> (2017-03-16 22:54:02 -0700)
>
> are available in the git repository at:
>
>   https://github.com/surround-io/meta-clang
>
> for you to fetch changes up to 7d294bc2548ade23b7d25761d73769e712617c51:
>


can you send a simple gh pull request please ?

>   clang: build for only target and host (2017-03-18 18:01:50 -0700)
>
> ----------------------------------------------------------------
> Martin Kelly (5):
>       clang: correct spacing issue
>       clang: remove commented-out code
>       clang: fix the llvm-common wrapper
>       clang: build libLLVM.so
>       clang: build for only target and host
>
>  recipes-devtools/clang/clang.inc      |  5 ++++-
>
> recipes-devtools/clang/clang/0004-llvm-allow-env-override-of-exe-path.patch
> | 36 ++++++++++++++++++++++++++++++++++
>  recipes-devtools/clang/clang_git.bb      | 52
> ++++++++++++++++++++++----------------------------
>  recipes-devtools/clang/llvm-common/llvm-config      | 41
> +++++++++++++++++++++++++++++++--------
>  4 files changed, 96 insertions(+), 38 deletions(-)
>  create mode 100644
> recipes-devtools/clang/clang/0004-llvm-allow-env-override-of-exe-path.patch


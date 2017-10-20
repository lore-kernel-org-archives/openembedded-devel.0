Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 912AC78355
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 22:54:40 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id q124so460502wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 15:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rluq8iJS5RZQDzKI0FEV7IYDmT3y25iaUMYvF5JrkKM=;
	b=MKlJN+nJXNkCGRyfEKEmZNLiES6W+yl+I6YbM+3OcnoAm8mVp+EFDMlRxQEz/xB8B3
	kJzV+rsxBYnT6YplSPeiKKyC9uFTEzTK+sq3VNZj/QWKKX4yNfp46CppFLsEydz6rjLW
	fbtZG2oPUwNRMKPihdCsB+leqZyzUwDn6WSY5N3wUJ4HNwN2WwIeMC/ZeBclAyrw87Sb
	Rvl+uXxca3P5017hz/RTE4TucWhiPwxaI9pe5W2oE1KcKjGl3MH+mEvQLoTjkZta8IWC
	pLuIdJCeWPW7s2Air03pPMXaveXtGK2jbBbhnn16bHOiX7wOo6HN0pNfD0TFw3ZpRiHv
	JJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rluq8iJS5RZQDzKI0FEV7IYDmT3y25iaUMYvF5JrkKM=;
	b=kz4JnBu2zy1orIpiq2t4vehqdqRDFsDHqCslNULGRk/3ghHWn04KwXyRy/3SNBQsrV
	tb1LP/O+gi34ade4xhausP0U+0ihPUM8MJ76hWFV16+XJqxGyIMt4Ewg7HIJrs4x2wz9
	7Zp3sV8ZJjIqIdamgoov4oRfJ1ERqD1Z154JVQPztIphmtExxLYBqRaKUCOIVnF4JMfT
	a9dkoEuNq/gSi1umaych1vk/3xtbk6TAGEgfmpO0DS5L4SnuXtBrEGqQFG1DG9AfCua8
	1TGayc7xLIhfMmaKMKMVqRgILxUbQcdavvsJgKtvWQPkkimqmPPjewjB4SFZJ7BJNWlJ
	+qcA==
X-Gm-Message-State: AMCzsaX+jpezAsM+Cpz4eIIo+Uu5lKixDNsbo/1Q5C6j26UNCVUsSDUw
	79+Qy0SXHnIYOSJqtMkYwyJRPCZW470cQh8/Lnd7tA==
X-Google-Smtp-Source: ABhQp+Qo5YnNPTHsT2YXtP6iC2ZLBvlaNPQD2BfUw7XXJjb95cacE/me72pZrafE8aRiVhSUhFUOK0Z11GVQ9w88dE0=
X-Received: by 10.28.168.83 with SMTP id r80mr195267wme.59.1508540081609; Fri,
	20 Oct 2017 15:54:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Fri, 20 Oct 2017 15:54:41 -0700 (PDT)
In-Reply-To: <1508352164-79210-1-git-send-email-denis@denix.org>
References: <1508352164-79210-1-git-send-email-denis@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 21 Oct 2017 00:54:41 +0200
Message-ID: <CA+chaQf0XPuueHsgsMA10kURjf0ZHVbX1Ms9bbhmdi79LeWS1Q@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH v2] qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call
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
X-List-Received-Date: Fri, 20 Oct 2017 22:54:41 -0000
Content-Type: text/plain; charset="UTF-8"

Either this or the objcopy change seems to cause:
http://errors.yoctoproject.org/Errors/Details/157417/

On Wed, Oct 18, 2017 at 8:42 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> ptest.bbclass provides a set of standard do_*_ptest_base tasks. Each of
> them calls a corresponding regular do_*_ptest task, that components are
> supposed to override for own implementation. When PTEST_ENABLED is not
> set, an anonymous python function removes all do_*_ptest_base tasks from
> the queue. qt5-ptest.inc adds a special case for do_populate_sysroot and
> re-arranges the order or ptest tasks due to that. But, unfortunately,
> do_install_ptest was added directly, not do_install_ptest_base, hence when
> "ptest" is disabled and all other do_*_ptest_base tasks are removed, this
> one do_install_ptest task is left w/o dependencies and gets scheduled for
> execution very early on, even before pseudo-native gets built and stages
> "fakeroot" functionality. The fix is to add do_install_ptest_base task,
> which calls do_install_ptest only when "ptest" is enabled.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - fix circular dependencies, delete default do_install_ptest_base
>
>  recipes-qt/qt5/qt5-ptest.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-qt/qt5/qt5-ptest.inc b/recipes-qt/qt5/qt5-ptest.inc
> index 4844878..97bce88 100644
> --- a/recipes-qt/qt5/qt5-ptest.inc
> +++ b/recipes-qt/qt5/qt5-ptest.inc
> @@ -4,8 +4,9 @@ inherit ptest
>
>  addtask do_populate_sysroot after do_install before do_compile_ptest_base
>  deltask do_compile_ptest_base
> -addtask do_compile_ptest_base after do_populate_sysroot before
> do_install_ptest
> -addtask do_install_ptest after do_compile_ptest_base before do_package
> +addtask do_compile_ptest_base after do_populate_sysroot before
> do_install_ptest_base
> +deltask do_install_ptest_base
> +addtask do_install_ptest_base after do_compile_ptest_base before
> do_package
>
>  do_compile_ptest() {
>      cd ${S}/tests
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


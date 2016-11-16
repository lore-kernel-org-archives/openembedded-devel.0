Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 627B46E64F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 00:11:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so5501117wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 16:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RPqVzb16P5wcUkexFhwBwnh/S/RKWzEIrBio+E5PXf8=;
	b=lpirI9SxjEvpdgDgMsCSF968BbV2UHAGdWn1NggKGzTVpeh7+S0UzXQLNU6Uqx91s6
	/6sa8ZznEck/iH0+uZoM4U+/U9Qm81UzoBrhS2SV2AcMp1gzyh7fYZs/s7xHSEjHETg+
	sDPCXD63C/zLrf6jU0yrmmrtfg+SLpaWbz85ReOFkHYgzxjaQB6LbCrFlczIe5d4fpW6
	oyyylnFuGOvL05PzfEXIbMW/LR3ul0vh9LwZkYvAYRtnkTMPEo3GUiWLg6vtVyz3/gKH
	4vBhT3SZatGzmtIJ4ln00Zb9ti/B7WZtXx6YauzLMWRWprzQhYUAEjNAEAc999O5ZdvV
	8UEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RPqVzb16P5wcUkexFhwBwnh/S/RKWzEIrBio+E5PXf8=;
	b=NevMZ1WjzIVu4g96R0C8zOTg48tegktGKwrZbShkb5mj1mIviBsTHaio6P4/JCdOzF
	v5In0GCsKvz7yQjB4kGCVla7n0nSc5/oCAgekc6q4ei5qgnVIBbJW9N/+v5klXLZREE1
	pIXFMEj1DlBKlre0SZrsO/1SCMF+LN5hHzT7YHVznKGNuNS8mDi14jIY0nde/GCuJ2yw
	Rv0/qMndy9lCV3s8QrDJT//lGO2Of1DCmmXAfjDIAisXeKg448gArmHFPCY7OH48Wg6W
	s5Qlq4N5VSfZuCe/yVCQEY/Nr7epLdDWGYjrK6C3Lwmrb8jO9+kU4GKNjtYSJMcbgf74
	+UeQ==
X-Gm-Message-State: ABUngvewuJkfVReOuuDuxtY5CEflcpWPgsZYK0MqVD83wHpcR6TaO5AEnNXO48PON7jWknD8ry/vPBb8criWzw==
X-Received: by 10.28.69.130 with SMTP id l2mr6552050wmi.123.1479255114165;
	Tue, 15 Nov 2016 16:11:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.195.9.34 with HTTP; Tue, 15 Nov 2016 16:11:33 -0800 (PST)
In-Reply-To: <20161031103434.932-1-ricardo.ribalda@gmail.com>
References: <20161031103434.932-1-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 16 Nov 2016 01:11:33 +0100
Message-ID: <CAPybu_0jotuGgKE5GWnwvGrmrR_LPB0FPRNAcu+_T-SzdrGjMw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	erkka.kaaria@intel.com, Kyle Russell <bkylerussell@gmail.com>,
	Dan McGregor <daniel.mcgregor@vecima.com>, 
	"Maxin B . John" <maxin.john@intel.com>
Subject: Re: [meta-java][PATCH 1/2] icedtea7-native: Fix segmentation fault
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
X-List-Received-Date: Wed, 16 Nov 2016 00:11:53 -0000
Content-Type: text/plain; charset=UTF-8

ping?

On Mon, Oct 31, 2016 at 11:34 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Without this patch the generated icedtea produces segmentation faults.
> This is probably due to a race condition during cleanout.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  recipes-core/icedtea/icedtea7-native.inc           |  2 ++
>  .../icedtea/openjdk-7-03b147/sigsegv.patch         | 42 ++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 recipes-core/icedtea/openjdk-7-03b147/sigsegv.patch
>
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index 00756888b62c..0ecf620cd279 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -42,6 +42,7 @@ SRC_URI = " \
>    file://allow-headless-build.patch;striplevel=0 \
>    file://jaxws_fix_NullPointerException.patch;apply=no \
>    file://timezoneszip.patch \
> +  file://sigsegv.patch;apply=no \
>    "
>
>  S = "${WORKDIR}/${ICEDTEA}"
> @@ -153,6 +154,7 @@ do_configure_append() {
>         oe_runmake patch-boot
>
>         patch -p1 < ${WORKDIR}/jaxws_fix_NullPointerException.patch
> +       patch -p1 < ${WORKDIR}/sigsegv.patch
>  }
>
>  EXTRA_OEMAKE = ' \
> diff --git a/recipes-core/icedtea/openjdk-7-03b147/sigsegv.patch b/recipes-core/icedtea/openjdk-7-03b147/sigsegv.patch
> new file mode 100644
> index 000000000000..0c3e44eff826
> --- /dev/null
> +++ b/recipes-core/icedtea/openjdk-7-03b147/sigsegv.patch
> @@ -0,0 +1,42 @@
> +diff --git a/openjdk-boot/hotspot/src/share/vm/runtime/thread.cpp b/openjdk-boot/hotspot/src/share/vm/runtime/thread.cpp
> +index 8b7059c8389f..67e9e7bd4bce 100644
> +--- a/openjdk-boot/hotspot/src/share/vm/runtime/thread.cpp
> ++++ b/openjdk-boot/hotspot/src/share/vm/runtime/thread.cpp
> +@@ -764,10 +764,13 @@ bool Thread::claim_oops_do_par_case(int strong_roots_parity) {
> + }
> +
> + void Thread::oops_do(OopClosure* f, CodeBlobClosure* cf) {
> +-  active_handles()->oops_do(f);
> ++  if (f && active_handles())
> ++        active_handles()->oops_do(f);
> +   // Do oop for ThreadShadow
> +-  f->do_oop((oop*)&_pending_exception);
> +-  handle_area()->oops_do(f);
> ++  if (f)
> ++        f->do_oop((oop*)&_pending_exception);
> ++  if (f && handle_area())
> ++        handle_area()->oops_do(f);
> + }
> +
> + void Thread::nmethods_do(CodeBlobClosure* cf) {
> +diff --git a/openjdk/hotspot/src/share/vm/runtime/thread.cpp b/openjdk/hotspot/src/share/vm/runtime/thread.cpp
> +index 8b7059c8389f..67e9e7bd4bce 100644
> +--- a/openjdk/hotspot/src/share/vm/runtime/thread.cpp
> ++++ b/openjdk/hotspot/src/share/vm/runtime/thread.cpp
> +@@ -764,10 +764,13 @@ bool Thread::claim_oops_do_par_case(int strong_roots_parity) {
> + }
> +
> + void Thread::oops_do(OopClosure* f, CodeBlobClosure* cf) {
> +-  active_handles()->oops_do(f);
> ++  if (f && active_handles())
> ++        active_handles()->oops_do(f);
> +   // Do oop for ThreadShadow
> +-  f->do_oop((oop*)&_pending_exception);
> +-  handle_area()->oops_do(f);
> ++  if (f)
> ++        f->do_oop((oop*)&_pending_exception);
> ++  if (f && handle_area())
> ++        handle_area()->oops_do(f);
> + }
> +
> + void Thread::nmethods_do(CodeBlobClosure* cf) {
> --
> 2.10.1
>



-- 
Ricardo Ribalda


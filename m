Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8E7BF601F6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 01:35:49 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id j46-v6so28218242qtc.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 18:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TrYsp0XBeRbLMReW2kyT7zMb2MMEv35VyV0jG/FFJ1Q=;
	b=A87I1bg4YK2jTrC8NCHVMXrg24EeEsbl+5Arl3Yp1akYvg3xKYNge0Ggw21kUcDw6E
	dlfEslHQ9FutRXLpbnr0let7NF8cYw1TmPAOIJx0QJ4HkoCbtW+F0FmFUSLDtcLr7T1z
	BVHMLSa8mrEOEG7hjfJDGA1SPn2GMrYAIQJYvAiyj36dVbBZaVoxi/lLQDSGUun1oCTp
	cJFkpF0BjoPEZ4Hfb2QYd2WlwfsMyWbXSxXZsgyffchshPZD9f0hLqWO4ec7QwXiL4vD
	g4NvpD0rXAR53Tov3ZYGfivbBlD6RrUPeMggaUbXerB7f7MjdHIuq+xInYAoXKlz/jOj
	A4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TrYsp0XBeRbLMReW2kyT7zMb2MMEv35VyV0jG/FFJ1Q=;
	b=BBzOPzkLQ7QOn88oS5u2WlFvBetNlOqdsbJj6eK9YZFUOz+FP6xBBkjyd6QnJMA/3Y
	zDwtH+sIaWT43toisudrcceWw6fsI3lKuBYqZH3uEsaikv59ut13E8nPaCx2/bhVgDpG
	nICIwOv9zzvA/XTnNj+TDGPqaLLBog+I4/lPWZzW0nvwrcP0WM4jom49TpvQ4CIsZbwu
	jVazw6A9QMw2KIYeMS6d5oQ76cgXMa1kaP/xcdqEkEPcSQ7CCEZ/846I8Oij3LWunEtZ
	qFeQW3cME1C0EHGkO6XQm/HksdObPR30gwOgbNuWGX1mk3ZQOtxE4X+xZoaKgbnRUCli
	nrcQ==
X-Gm-Message-State: ABuFfoiX2EQqIPeBcJBtG2SN26UWY8PW2z2zeHo23IZMscnVbguVdsi/
	r9MTUgnF2k4giPMP2FhQNN5cqMY3UlB2wjeW9CZWxtVN
X-Google-Smtp-Source: ACcGV63zcenGuZOq5gwT2qB2yHKpc7kR1TnJNoM8hrTeYEn46m7u8+HqRONjTVmNM0bCCHZVlOSYZmTRtIT59TCyhmg=
X-Received: by 2002:a0c:8b4d:: with SMTP id d13mr20414527qvc.194.1539740150340;
	Tue, 16 Oct 2018 18:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <1539739424-287548-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1539739424-287548-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Oct 2018 18:35:24 -0700
Message-ID: <CAMKF1srdHVMSTErXSys8nbw69vJykHuTPRhkt9ZqocekJLWXsg@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] gnulib: Security fix for CVE-2018-17942
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
X-List-Received-Date: Wed, 17 Oct 2018 01:35:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 16, 2018 at 6:24 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../gnulib/gnulib/CVE-2018-17942.patch             | 88 ++++++++++++++++++++++
>  .../recipes-support/gnulib/gnulib_2017-08-20.18.bb |  9 ++-
>  2 files changed, 93 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-support/gnulib/gnulib/CVE-2018-17942.patch
>
> diff --git a/meta-oe/recipes-support/gnulib/gnulib/CVE-2018-17942.patch b/meta-oe/recipes-support/gnulib/gnulib/CVE-2018-17942.patch
> new file mode 100644
> index 0000000..77e82b1
> --- /dev/null
> +++ b/meta-oe/recipes-support/gnulib/gnulib/CVE-2018-17942.patch
> @@ -0,0 +1,88 @@
> +From e91600a7aae3bafbefbe13abf771e61badd16286 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 16 Oct 2018 14:26:11 +0800
> +Subject: [PATCH] vasnprintf: Fix heap memory overrun bug.
> +
> +Reported by Ben Pfaff <blp@cs.stanford.edu> in
> +<https://lists.gnu.org/archive/html/bug-gnulib/2018-09/msg00107.html>.
> +
> +* lib/vasnprintf.c (convert_to_decimal): Allocate one more byte of
> +memory.
> +* tests/test-vasnprintf.c (test_function): Add another test.
> +
> +Upstream-Status: Backport [http://git.savannah.gnu.org/gitweb/?p=gnulib.git;
> +a=commitdiff;h=278b4175c9d7dd47c1a3071554aac02add3b3c35]
> +
> +CVE: CVE-2018-17942
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + ChangeLog               |  8 ++++++++
> + lib/vasnprintf.c        |  4 +++-
> + tests/test-vasnprintf.c | 19 ++++++++++++++++++-
> + 3 files changed, 29 insertions(+), 2 deletions(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 9864353..5ff76a3 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,11 @@
> ++2018-09-23  Bruno Haible  <bruno@clisp.org>
> ++      vasnprintf: Fix heap memory overrun bug.
> ++      Reported by Ben Pfaff <blp@cs.stanford.edu> in
> ++      <https://lists.gnu.org/archive/html/bug-gnulib/2018-09/msg00107.html>.
> ++      * lib/vasnprintf.c (convert_to_decimal): Allocate one more byte of
> ++      memory.
> ++      * tests/test-vasnprintf.c (test_function): Add another test.
> ++
> + 2017-08-21  Paul Eggert  <eggert@cs.ucla.edu>
> +
> +       vc-list-files: port to Solaris 10
> +diff --git a/lib/vasnprintf.c b/lib/vasnprintf.c
> +index 2e4eb19..45de49f 100644
> +--- a/lib/vasnprintf.c
> ++++ b/lib/vasnprintf.c
> +@@ -860,7 +860,9 @@ convert_to_decimal (mpn_t a, size_t extra_zeroes)
> +   size_t a_len = a.nlimbs;
> +   /* 0.03345 is slightly larger than log(2)/(9*log(10)).  */
> +   size_t c_len = 9 * ((size_t)(a_len * (GMP_LIMB_BITS * 0.03345f)) + 1);
> +-  char *c_ptr = (char *) malloc (xsum (c_len, extra_zeroes));
> ++  /* We need extra_zeroes bytes for zeroes, followed by c_len bytes for the
> ++     digits of a, followed by 1 byte for the terminating NUL.  */
> ++  char *c_ptr = (char *) malloc (xsum (xsum (extra_zeroes, c_len), 1));
> +   if (c_ptr != NULL)
> +     {
> +       char *d_ptr = c_ptr;
> +diff --git a/tests/test-vasnprintf.c b/tests/test-vasnprintf.c
> +index 2dd869f..ff68d5c 100644
> +--- a/tests/test-vasnprintf.c
> ++++ b/tests/test-vasnprintf.c
> +@@ -53,7 +53,24 @@ test_function (char * (*my_asnprintf) (char *, size_t *, const char *, ...))
> +       ASSERT (result != NULL);
> +       ASSERT (strcmp (result, "12345") == 0);
> +       ASSERT (length == 5);
> +-      if (size < 6)
> ++      if (size < 5 + 1)
> ++        ASSERT (result != buf);
> ++      ASSERT (memcmp (buf + size, &"DEADBEEF"[size], 8 - size) == 0);
> ++      if (result != buf)
> ++        free (result);
> ++    }
> ++   /* Note: This test assumes IEEE 754 representation of 'double' floats.  */
> ++  for (size = 0; size <= 8; size++)
> ++    {
> ++      size_t length;
> ++      char *result;
> ++       memcpy (buf, "DEADBEEF", 8);
> ++      length = size;
> ++      result = my_asnprintf (buf, &length, "%2.0f", 1.6314159265358979e+125);
> ++      ASSERT (result != NULL);
> ++      ASSERT (strcmp (result, "163141592653589790215729350939528493057529598899734151772468186268423257777068536614838678161083520756952076273094236944990208") == 0);
> ++      ASSERT (length == 126);
> ++      if (size < 126 + 1)
> +         ASSERT (result != buf);
> +       ASSERT (memcmp (buf + size, &"DEADBEEF"[size], 8 - size) == 0);
> +       if (result != buf)
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb b/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
> index 4a7d84a..1de6c42 100644
> --- a/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
> +++ b/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
> @@ -14,17 +14,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=56a22a6e5bcce45e2c8ac184f81412b5"
>  SRCREV = "b23000de1e47c7d580e0e220966dd1ee42a5e5bc"
>
>  SRC_URI = "git://git.sv.gnu.org/gnulib;protocol=git \
> +           file://CVE-2018-17942.patch \
>  "
>
>  S = "${WORKDIR}/git"
>
>  do_install () {
> -    cd ${S}
> -    git checkout master
> -    git clone ${S} ${D}/${datadir}/gnulib
> +    install -d ${D}/${datadir}/gnulib/
> +    cp -rf ${S}/* ${D}/${datadir}/gnulib/

Can we use install cmd here and supply correct mode ?

> +    rm -rf ${D}/${datadir}/gnulib/.pc
> +    rm -rf ${D}/${datadir}/gnulib/patches
>  }
>
> -do_patch[noexec] = "1"
>  do_configure[noexec] = "1"
>  do_compile[noexec] = "1"
>  do_package[noexec] = "1"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


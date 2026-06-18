Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549FDCD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 15:32:54 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22401.1781796764771340241
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 08:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bE16Pen8;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-662bcc30fafso1241631d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 08:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781796728; cv=none;
        d=google.com; s=arc-20240605;
        b=bB2qelNxOM/EfXBp1F0UNytYF3j36L71Ip2MiXsRq8qrNDavxLMBubvFrNFpV+NQBD
         H5NkEyb89tDt4iKzEnrRJJBMLX3Sh6ZlRzzxWGYnp/6MssF1WH0kaSSAI9bYmfgLiOBj
         ybmV83idt6V7bd59zugIHO81G29QMM041+pTAUzFUCqfjIQMMl5QsAOoTjqoWD+MzxpU
         MzFbJFCeMfgx8WNrzRahiN9jrvepoHXG3pbEPLDxBUMpTCjr26fs7nPVmpBxvgJrurJi
         KYfDHg8hqiv5RWsoLfxSMpouRoiHFfWoARt2Ro2C7kxyrO9c0rroDOeIp46r8jbuf5zN
         erPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KUKftg8d8pHcaQi/SEJDpGGZ5YpVJ+ApL3xsN8dJqkQ=;
        fh=EqFFGVnRn0qz4znwnmk0n+hFhLaJvAVW0pujP36Ql9U=;
        b=Yr6mWAVgkg/Dyzem4oUqsU5aqccNykoV072KPVT4iNtEBjjMz2wz0g7WOPB81XYqkh
         Omu+BLuR4ovbreARoR/RnGZpG62oMAFQZQiGKj3AZ6IoDOeo9g6L99wHtdyXC/9Hu3pi
         diwH0rFzVxrxQ4S9l4uTGWwAk/O6AxsRD9+j3MEHVG9gznMfDJeWPHH2AQl8eLhFaohC
         w9G5eNoEhwwBB0pFLXBBt9VxktvXBOc9yjzXQ7IQ/xyxoh/TxqIljh5Yz+EyXovAmjk9
         EGLdd+Ve18Jbzxae8LHZ+ddfJM09SA/vTY36Zrr97WQIs0vX0EhWV2Dy6IStV6+Nv/OL
         wazQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781796728; x=1782401528; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KUKftg8d8pHcaQi/SEJDpGGZ5YpVJ+ApL3xsN8dJqkQ=;
        b=bE16Pen8UF2IIJFFDxp1wBWQ1P3uoziO89Tr2wwhXTmcc3+xY8o5d2KwfLBeTVAML4
         5/wwmQeF6G4HjkwK1AzIyPCzY4HgNEWIfXKAIlwsu10Rc+kWa7gdxVAv5mWDKwHB/IOg
         hIk91nG2gYsKRj++j8bupZSCNFmJwgCNKwsRLdfrjIvnK7ijlUq2Xw/i/xOFRE7zwyiH
         wHzmQc5SCx9Z61t6qcFiO0/CELPzxXWUOXYb8n/vKf+5z6EorwLCxSR7wyZZxxhnw0Ep
         di2Bh8i+4ekJtR3wCUo0UKsEN/ZyTC3/N2Zr1XKY8BMmHwJklWcGJhClrhdu8miq3zEI
         36fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781796728; x=1782401528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUKftg8d8pHcaQi/SEJDpGGZ5YpVJ+ApL3xsN8dJqkQ=;
        b=KprKBbnDFkFnOLyGKsTXsGW+iGdjeIK21YHS/oGD0zNEiNQvnOJq9hsm9iDZRmkpDY
         Ra3JwXl0fpK3Fql+LSRTB+lD/WdXqSFaLpmspwQyhI3RHshq0FbiYz4usGJjToY7cTCG
         b/kGKFXqN+uDPPosDWgc8Ldou2jjtL5Yfou9HurROtmrHP6goby9tsyP2yPon62kSg/F
         sxz7qL62tFmUOlwEQk4rMLveyoXQ5LvAPIAjXrJAZzh7oBzms5SHEn1X2N2x2raUVpK4
         MKD/QW+4FFnlI0IxJZiOP0oIwSE7r0dM+F8NrWjObHMyDn9BcsTUF1szkeVlWFcTw942
         smXw==
X-Gm-Message-State: AOJu0YxY3+cHhLpe5OIwNAzZ1kCmNEZOlKJPADaDmbrYh+WbFgnjox+D
	v0GLRk+rHdv5wd8Y0xn4+nzGyrS0otmwauSIKWkHDv3VhtLfUG831bcqy+nNJKeF7LYOyC5WSfN
	IlAs+K2ccZZ00f5cnOh0/uSWrGVvZCoA=
X-Gm-Gg: AfdE7ckdbXQqcFxouXp8VLZ/Jtv8HECB+rXYc9EkdTyoFG4wIqeeS3aCK7rBZCKT3m/
	d6W2jzLbgHojyvDAY0wHetbea9uQGePcZ22HHZbkrGmoKtb9mbHfvEMFFr8PPaipDMHuEg0yyMD
	zfXUHqz4cdI+qdp/s6IaDsC3svJMWd4M3oeXN/2Vn4+aGUJeXYPTDMtEaZRqEDHABiLvJ5XrgGA
	Le3SOQGw0M76Y7litayngeVgjRrWR+UdJjw1MS2kSDtgJSn2anHw11TKLqzo4BA0mrPM1UQvWtw
	ofnUcYM8Kly6WmPCfIVhFPX0YIee0WyHbR2ofc6GVeOwR+vmIyYfWlW8VQiXEJKfqLQG+tMsMkJ
	59Rc/prreVO7X19osWlEMgAiRCwglv/hCa4+Wqe+rdqGEV5TTWgMPoWQjCr5Em/kTilX8mRlL0O
	2o+XeQxiw=
X-Received: by 2002:a05:690e:488c:10b0:660:74f5:7e09 with SMTP id
 956f58d0204a3-662fce1a7c4mr35006d50.61.1781796727804; Thu, 18 Jun 2026
 08:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260618113029.1051020-1-peter.marko@siemens.com>
In-Reply-To: <20260618113029.1051020-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Jun 2026 08:31:41 -0700
X-Gm-Features: AVVi8CflUTqa_GO7b6XMR5YYUgpP2-7tobAiRq_9BeWnZ4ns7wJrbSLpT_Pp5LU
Message-ID: <CAMKF1sox1_5DZEy5XKrwa=m=2A0Hn+b-3o6JZ-fPrm_YwrrpOg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libpcre: move recipe from oe-core
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000005d599065488e1b5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 15:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127663

--00000000000005d599065488e1b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

how many recipes in meta-oe need it? how many of them really need it and
not use libpcre2? I would like to not have it in meta-oe if possible.

On Thu, Jun 18, 2026 at 4:30=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> This recipe was removed in oe-core as obsolete (replaced by libpcre2).
> Since some recipes in meta-oe still depend on it, moe it here.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../include/ptest-packagelists-meta-oe.inc    |   1 +
>  .../recipes-support/libpcre/libpcre/Makefile  | 183 ++++++++++++++++++
>  .../recipes-support/libpcre/libpcre/run-ptest |   3 +
>  .../recipes-support/libpcre/libpcre_8.45.bb   |  74 +++++++
>  4 files changed, 261 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libpcre/libpcre/Makefile
>  create mode 100644 meta-oe/recipes-support/libpcre/libpcre/run-ptest
>  create mode 100644 meta-oe/recipes-support/libpcre/libpcre_8.45.bb
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> index 0467d1f424..46cf9254df 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -36,6 +36,7 @@ PTESTS_FAST_META_OE =3D "\
>      libjcat \
>      libio-pty-perl \
>      libmanette \
> +    libpcre \
>      libplist \
>      librelp \
>      libssh \
> diff --git a/meta-oe/recipes-support/libpcre/libpcre/Makefile
> b/meta-oe/recipes-support/libpcre/libpcre/Makefile
> new file mode 100644
> index 0000000000..708d807d08
> --- /dev/null
> +++ b/meta-oe/recipes-support/libpcre/libpcre/Makefile
> @@ -0,0 +1,183 @@
> +TESTS =3D pcre_stringpiece_unittest RunTest RunGrepTest
> +subdir =3D .
> +am__vpath_adj_setup =3D srcdirstrip=3D`echo "$(srcdir)" | sed 's|.|.|g'`=
;
> +am__vpath_adj =3D case $$p in \
> +    $(srcdir)/*) f=3D`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
> +    *) f=3D$$p;; \
> +  esac;
> +am__tty_colors_dummy =3D \
> +  mgn=3D red=3D grn=3D lgn=3D blu=3D brg=3D std=3D; \
> +  am__color_tests=3Dno
> +am__tty_colors =3D { \
> +  $(am__tty_colors_dummy); \
> +  if test "X$(AM_COLOR_TESTS)" =3D Xno; then \
> +    am__color_tests=3Dno; \
> +  elif test "X$(AM_COLOR_TESTS)" =3D Xalways; then \
> +    am__color_tests=3Dyes; \
> +  elif test "X$$TERM" !=3D Xdumb && { test -t 1; } 2>/dev/null; then \
> +    am__color_tests=3Dyes; \
> +  fi; \
> +  if test $$am__color_tests =3D yes; then \
> +    red=3D' [0;31m'; \
> +    grn=3D' [0;32m'; \
> +    lgn=3D' [1;32m'; \
> +    blu=3D' [1;34m'; \
> +    mgn=3D' [0;35m'; \
> +    brg=3D' [1m'; \
> +    std=3D' [m'; \
> +  fi; \
> +}
> +am__rst_title =3D { sed 's/.*/   &   /;h;s/./=3D/g;p;x;s/ *$$//;p;g' && =
echo;
> }
> +am__sh_e_setup =3D case $$- in *e*) set +e;; esac
> +am__common_driver_flags =3D \
> +  --color-tests "$$am__color_tests" \
> +  --enable-hard-errors "$$am__enable_hard_errors" \
> +  --expect-failure "$$am__expect_failure"
> +am__check_pre =3D \
> +$(am__sh_e_setup); \
> +$(am__vpath_adj_setup) $(am__vpath_adj) \
> +$(am__tty_colors); \
> +srcdir=3D$(srcdir); export srcdir; \
> +case "$@" in \
> +  */*) am__odir=3D`echo "./$@" | sed 's|/[^/]*$$||'`;; \
> +    *) am__odir=3D.;; \
> +esac; \
> +test "x$$am__odir" =3D x"." || test -d "$$am__odir" \
> +  || $(MKDIR_P) "$$am__odir" || exit $$?; \
> +if test -f "./$$f"; then dir=3D./; \
> +elif test -f "$$f"; then dir=3D; \
> +else dir=3D"$(srcdir)/"; fi; \
> +tst=3D$$dir$$f; log=3D'$@'; \
> +if test -n '$(DISABLE_HARD_ERRORS)'; then \
> +  am__enable_hard_errors=3Dno; \
> +else \
> +  am__enable_hard_errors=3Dyes; \
> +fi;
> +am__set_TESTS_bases =3D \
> +  bases=3D'$(TEST_LOGS)'; \
> +  bases=3D`for i in $$bases; do echo $$i; done | sed 's/\.log$$//'`; \
> +  bases=3D`echo $$bases`
> +RECHECK_LOGS =3D $(TEST_LOGS)
> +TEST_SUITE_LOG =3D test-suite.log
> +TEST_EXTENSIONS =3D  .test
> +LOG_DRIVER =3D $(SHELL) $(top_srcdir)/test-driver
> +am__test_logs1 =3D $(TESTS:=3D.log)
> +am__test_logs2 =3D $(am__test_logs1:.log=3D.log)
> +TEST_LOGS =3D $(am__test_logs2:.test.log=3D.log)
> +MKDIR_P =3D /bin/mkdir -p
> +PACKAGE_STRING =3D PCRE 8.36
> +SHELL =3D /bin/sh
> +srcdir =3D .
> +top_srcdir =3D .
> +$(TEST_SUITE_LOG): $(TEST_LOGS)
> +       @$(am__set_TESTS_bases); \
> +       am__f_ok () { test -f "$$1" && test -r "$$1"; }; \
> +       redo_bases=3D`for i in $$bases; do \
> +                     am__f_ok $$i.trs && am__f_ok $$i.log || echo $$i; \
> +                   done`; \
> +       st=3D0;  \
> +       errmsg=3D"fatal: making $(TEST_SUITE_LOG): failed to create"; \
> +       for i in $$redo_bases; do \
> +         test -f $$i.trs && test -r $$i.trs \
> +           || { echo "$$errmsg $$i.trs" >&2; st=3D1; }; \
> +         test -f $$i.log && test -r $$i.log \
> +           || { echo "$$errmsg $$i.log" >&2; st=3D1; }; \
> +       done; \
> +       test $$st -eq 0 || exit 1;
> +       @$(am__sh_e_setup); $(am__tty_colors); $(am__set_TESTS_bases); \
> +       ws=3D'[   ]'; \
> +       results=3D`for b in $$bases; do echo $$b.trs; done`; \
> +       test -n "$$results" || results=3D/dev/null; \
> +       all=3D`  grep "^$$ws*:test-result:"           $$results | wc -l`;=
 \
> +       pass=3D` grep "^$$ws*:test-result:$$ws*PASS"  $$results | wc -l`;=
 \
> +       fail=3D` grep "^$$ws*:test-result:$$ws*FAIL"  $$results | wc -l`;=
 \
> +       skip=3D` grep "^$$ws*:test-result:$$ws*SKIP"  $$results | wc -l`;=
 \
> +       xfail=3D`grep "^$$ws*:test-result:$$ws*XFAIL" $$results | wc -l`;=
 \
> +       xpass=3D`grep "^$$ws*:test-result:$$ws*XPASS" $$results | wc -l`;=
 \
> +       error=3D`grep "^$$ws*:test-result:$$ws*ERROR" $$results | wc -l`;=
 \
> +       if test `expr $$fail + $$xpass + $$error` -eq 0; then \
> +         success=3Dtrue; \
> +       else \
> +         success=3Dfalse; \
> +       fi; \
> +       br=3D'=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D';=
 br=3D$$br$$br$$br$$br; \
> +       result_count () \
> +       { \
> +           if test x"$$1" =3D x"--maybe-color"; then \
> +             maybe_colorize=3Dyes; \
> +           elif test x"$$1" =3D x"--no-color"; then \
> +             maybe_colorize=3Dno; \
> +           else \
> +             echo "$@: invalid 'result_count' usage" >&2; exit 4; \
> +           fi; \
> +           shift; \
> +           desc=3D$$1 count=3D$$2; \
> +           if test $$maybe_colorize =3D yes && test $$count -gt 0; then =
\
> +             color_start=3D$$3 color_end=3D$$std; \
> +           else \
> +             color_start=3D color_end=3D; \
> +           fi; \
> +           echo "$${color_start}# $$desc $$count$${color_end}"; \
> +       }; \
> +       create_testsuite_report () \
> +       { \
> +         result_count $$1 "TOTAL:" $$all   "$$brg"; \
> +         result_count $$1 "PASS: " $$pass  "$$grn"; \
> +         result_count $$1 "SKIP: " $$skip  "$$blu"; \
> +         result_count $$1 "XFAIL:" $$xfail "$$lgn"; \
> +         result_count $$1 "FAIL: " $$fail  "$$red"; \
> +         result_count $$1 "XPASS:" $$xpass "$$red"; \
> +         result_count $$1 "ERROR:" $$error "$$mgn"; \
> +       }; \
> +       {                                                               \
> +         echo "$(PACKAGE_STRING): $(subdir)/$(TEST_SUITE_LOG)" |       \
> +           $(am__rst_title);                                           \
> +         create_testsuite_report --no-color;                           \
> +         echo;                                                         \
> +         echo ".. contents:: :depth: 2";                               \
> +         echo;                                                         \
> +         for b in $$bases; do echo $$b; done;                          \
> +       } >$(TEST_SUITE_LOG).tmp || exit 1;                             \
> +       mv $(TEST_SUITE_LOG).tmp $(TEST_SUITE_LOG);                     \
> +       if $$success; then                                              \
> +         col=3D"$$grn";                                                 =
 \
> +        else                                                           \
> +         col=3D"$$red";                                                 =
 \
> +         test x"$$VERBOSE" =3D x || cat $(TEST_SUITE_LOG);              =
 \
> +       fi;                                                             \
> +       echo "$${col}$$br$${std}";                                      \
> +       echo "$${col}Testsuite summary for $(PACKAGE_STRING)$${std}";   \
> +       echo "$${col}$$br$${std}";                                      \
> +       create_testsuite_report --maybe-color;                          \
> +       echo "$$col$$br$$std";                                          \
> +       if $$success; then :; else                                      \
> +         echo "$${col}See $(subdir)/$(TEST_SUITE_LOG)$${std}";         \
> +         echo "$$col$$br$$std";                                        \
> +       fi;                                                             \
> +       $$success || exit 1
> +check-TESTS:
> +       @list=3D'$(RECHECK_LOGS)';           test -z "$$list" || rm -f $$=
list
> +       @test -z "$(TEST_SUITE_LOG)" || rm -f $(TEST_SUITE_LOG)
> +       @set +e; $(am__set_TESTS_bases); \
> +       log_list=3D`for i in $$bases; do echo $$i.log; done`; \
> +       log_list=3D`echo $$log_list`; \
> +       $(MAKE) $(AM_MAKEFLAGS) $(TEST_SUITE_LOG) TEST_LOGS=3D"$$log_list=
"; \
> +       exit $$?;
> +pcre_stringpiece_unittest.log: pcre_stringpiece_unittest$(EXEEXT)
> +       @p=3D'pcre_stringpiece_unittest$(EXEEXT)'; \
> +       b=3D'pcre_stringpiece_unittest'; \
> +       $(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +       --log-file $$b.log --trs-file $$b.trs \
> +       $(am__common_driver_flags) -- "$$tst"
> +RunTest.log: RunTest
> +       @p=3D'RunTest'; \
> +       b=3D'RunTest'; \
> +       $(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +       --log-file $$b.log --trs-file $$b.trs \
> +       $(am__common_driver_flags) -- "$$tst"
> +RunGrepTest.log: RunGrepTest
> +       @p=3D'RunGrepTest'; \
> +       b=3D'RunGrepTest'; \
> +       $(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
> +       --log-file $$b.log --trs-file $$b.trs \
> +       $(am__common_driver_flags) -- "$$tst"
> diff --git a/meta-oe/recipes-support/libpcre/libpcre/run-ptest
> b/meta-oe/recipes-support/libpcre/libpcre/run-ptest
> new file mode 100644
> index 0000000000..990d4a12ad
> --- /dev/null
> +++ b/meta-oe/recipes-support/libpcre/libpcre/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +make check-TESTS
> diff --git a/meta-oe/recipes-support/libpcre/libpcre_8.45.bb
> b/meta-oe/recipes-support/libpcre/libpcre_8.45.bb
> new file mode 100644
> index 0000000000..c5ecbd8cf2
> --- /dev/null
> +++ b/meta-oe/recipes-support/libpcre/libpcre_8.45.bb
> @@ -0,0 +1,74 @@
> +DESCRIPTION =3D "The PCRE library is a set of functions that implement
> regular \
> +expression pattern matching using the same syntax and semantics as Perl
> 5. PCRE \
> +has its own native API, as well as a set of wrapper functions that
> correspond \
> +to the POSIX regular expression API."
> +SUMMARY =3D "Perl Compatible Regular Expressions"
> +HOMEPAGE =3D "http://www.pcre.org"
> +SECTION =3D "devel"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Db5d5d1a69a24ea2718263f1ff85a1=
c58"
> +SOURCEFORGE_PROJECT =3D "pcre"
> +SRC_URI =3D
> "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/pcre-${PV}.tar.bz2 \
> +           file://run-ptest \
> +           file://Makefile \
> +           "
> +
> +SRC_URI[sha256sum] =3D
> "4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8"
> +
> +CVE_PRODUCT =3D "pcre"
> +
> +S =3D "${UNPACKDIR}/pcre-${PV}"
> +
> +PROVIDES +=3D "pcre"
> +DEPENDS +=3D "bzip2 zlib"
> +
> +PACKAGECONFIG ??=3D "pcre8 unicode-properties jit"
> +
> +PACKAGECONFIG[pcre8] =3D "--enable-pcre8,--disable-pcre8"
> +PACKAGECONFIG[pcre16] =3D "--enable-pcre16,--disable-pcre16"
> +PACKAGECONFIG[pcre32] =3D "--enable-pcre32,--disable-pcre32"
> +PACKAGECONFIG[pcretest-readline] =3D
> "--enable-pcretest-libreadline,--disable-pcretest-libreadline,readline,"
> +PACKAGECONFIG[unicode-properties] =3D
> "--enable-unicode-properties,--disable-unicode-properties"
> +PACKAGECONFIG[jit] =3D "--enable-jit=3Dauto,--disable-jit"
> +
> +BINCONFIG =3D "${bindir}/pcre-config"
> +
> +inherit autotools binconfig-disabled ptest sourceforge-releases
> +
> +EXTRA_OECONF =3D "--enable-utf"
> +
> +PACKAGES =3D+ "libpcrecpp libpcreposix pcregrep pcregrep-doc pcretest
> pcretest-doc"
> +
> +SUMMARY:libpcrecpp =3D "${SUMMARY} - C++ wrapper functions"
> +SUMMARY:libpcreposix =3D "${SUMMARY} - C wrapper functions based on the
> POSIX regex API"
> +SUMMARY:pcregrep =3D "grep utility that uses perl 5 compatible regexes"
> +SUMMARY:pcregrep-doc =3D "grep utility that uses perl 5 compatible regex=
es
> - docs"
> +SUMMARY:pcretest =3D "program for testing Perl-comatible regular
> expressions"
> +SUMMARY:pcretest-doc =3D "program for testing Perl-comatible regular
> expressions - docs"
> +
> +FILES:libpcrecpp =3D "${libdir}/libpcrecpp.so.*"
> +FILES:libpcreposix =3D "${libdir}/libpcreposix.so.*"
> +FILES:pcregrep =3D "${bindir}/pcregrep"
> +FILES:pcregrep-doc =3D "${mandir}/man1/pcregrep.1"
> +FILES:pcretest =3D "${bindir}/pcretest"
> +FILES:pcretest-doc =3D "${mandir}/man1/pcretest.1"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +do_install_ptest() {
> +       t=3D${D}${PTEST_PATH}
> +       cp ${UNPACKDIR}/Makefile $t
> +       cp -r ${S}/testdata $t
> +       for i in pcre_stringpiece_unittest pcregrep pcretest; do
> +               ${B}/libtool --mode=3Dinstall install ${B}/$i $t/
> +       done
> +       for i in RunTest RunGrepTest test-driver; do
> +               install ${S}/$i $t
> +       done
> +       # Skip the fr_FR locale test. If the locale fr_FR is found, it is
> tested.
> +       # If not found, the test is skipped. The test program assumes
> fr_FR is non-UTF-8
> +       # locale so the test fails if fr_FR is UTF-8 locale.
> +       sed -i -e 's:do3=3Dyes:do3=3Dno:g' ${D}${PTEST_PATH}/RunTest
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "make"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127662):
> https://lists.openembedded.org/g/openembedded-devel/message/127662
> Mute This Topic: https://lists.openembedded.org/mt/119865283/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000005d599065488e1b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">how many recipes in meta-oe need it? how many of them real=
ly need it and not use libpcre2? I would like to not have it in meta-oe if =
possible.</div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Jun 18, 2026 at 4:30=E2=80=AFAM Pete=
r Marko via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.or=
g">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">From: Peter Marko &lt;<a href=3D"mailt=
o:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt=
;<br>
<br>
This recipe was removed in oe-core as obsolete (replaced by libpcre2).<br>
Since some recipes in meta-oe still depend on it, moe it here.<br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../include/ptest-packagelists-meta-oe.inc=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0.../recipes-support/libpcre/libpcre/Makefile=C2=A0 | 183 ++++++++++++=
++++++<br>
=C2=A0.../recipes-support/libpcre/libpcre/run-ptest |=C2=A0 =C2=A03 +<br>
=C2=A0.../recipes-support/libpcre/<a href=3D"http://libpcre_8.45.bb" rel=3D=
"noreferrer" target=3D"_blank">libpcre_8.45.bb</a>=C2=A0 =C2=A0|=C2=A0 74 +=
++++++<br>
=C2=A04 files changed, 261 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libpcre/libpcre/Makefile<b=
r>
=C2=A0create mode 100644 meta-oe/recipes-support/libpcre/libpcre/run-ptest<=
br>
=C2=A0create mode 100644 meta-oe/recipes-support/libpcre/<a href=3D"http://=
libpcre_8.45.bb" rel=3D"noreferrer" target=3D"_blank">libpcre_8.45.bb</a><b=
r>
<br>
diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/=
conf/include/ptest-packagelists-meta-oe.inc<br>
index 0467d1f424..46cf9254df 100644<br>
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
@@ -36,6 +36,7 @@ PTESTS_FAST_META_OE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0libjcat \<br>
=C2=A0 =C2=A0 =C2=A0libio-pty-perl \<br>
=C2=A0 =C2=A0 =C2=A0libmanette \<br>
+=C2=A0 =C2=A0 libpcre \<br>
=C2=A0 =C2=A0 =C2=A0libplist \<br>
=C2=A0 =C2=A0 =C2=A0librelp \<br>
=C2=A0 =C2=A0 =C2=A0libssh \<br>
diff --git a/meta-oe/recipes-support/libpcre/libpcre/Makefile b/meta-oe/rec=
ipes-support/libpcre/libpcre/Makefile<br>
new file mode 100644<br>
index 0000000000..708d807d08<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/libpcre/libpcre/Makefile<br>
@@ -0,0 +1,183 @@<br>
+TESTS =3D pcre_stringpiece_unittest RunTest RunGrepTest<br>
+subdir =3D .<br>
+am__vpath_adj_setup =3D srcdirstrip=3D`echo &quot;$(srcdir)&quot; | sed &#=
39;s|.|.|g&#39;`;<br>
+am__vpath_adj =3D case $$p in \<br>
+=C2=A0 =C2=A0 $(srcdir)/*) f=3D`echo &quot;$$p&quot; | sed &quot;s|^$$srcd=
irstrip/||&quot;`;; \<br>
+=C2=A0 =C2=A0 *) f=3D$$p;; \<br>
+=C2=A0 esac;<br>
+am__tty_colors_dummy =3D \<br>
+=C2=A0 mgn=3D red=3D grn=3D lgn=3D blu=3D brg=3D std=3D; \<br>
+=C2=A0 am__color_tests=3Dno<br>
+am__tty_colors =3D { \<br>
+=C2=A0 $(am__tty_colors_dummy); \<br>
+=C2=A0 if test &quot;X$(AM_COLOR_TESTS)&quot; =3D Xno; then \<br>
+=C2=A0 =C2=A0 am__color_tests=3Dno; \<br>
+=C2=A0 elif test &quot;X$(AM_COLOR_TESTS)&quot; =3D Xalways; then \<br>
+=C2=A0 =C2=A0 am__color_tests=3Dyes; \<br>
+=C2=A0 elif test &quot;X$$TERM&quot; !=3D Xdumb &amp;&amp; { test -t 1; } =
2&gt;/dev/null; then \<br>
+=C2=A0 =C2=A0 am__color_tests=3Dyes; \<br>
+=C2=A0 fi; \<br>
+=C2=A0 if test $$am__color_tests =3D yes; then \<br>
+=C2=A0 =C2=A0 red=3D&#39; [0;31m&#39;; \<br>
+=C2=A0 =C2=A0 grn=3D&#39; [0;32m&#39;; \<br>
+=C2=A0 =C2=A0 lgn=3D&#39; [1;32m&#39;; \<br>
+=C2=A0 =C2=A0 blu=3D&#39; [1;34m&#39;; \<br>
+=C2=A0 =C2=A0 mgn=3D&#39; [0;35m&#39;; \<br>
+=C2=A0 =C2=A0 brg=3D&#39; [1m&#39;; \<br>
+=C2=A0 =C2=A0 std=3D&#39; [m&#39;; \<br>
+=C2=A0 fi; \<br>
+}<br>
+am__rst_title =3D { sed &#39;s/.*/=C2=A0 =C2=A0&amp;=C2=A0 =C2=A0/;h;s/./=
=3D/g;p;x;s/ *$$//;p;g&#39; &amp;&amp; echo; }<br>
+am__sh_e_setup =3D case $$- in *e*) set +e;; esac<br>
+am__common_driver_flags =3D \<br>
+=C2=A0 --color-tests &quot;$$am__color_tests&quot; \<br>
+=C2=A0 --enable-hard-errors &quot;$$am__enable_hard_errors&quot; \<br>
+=C2=A0 --expect-failure &quot;$$am__expect_failure&quot;<br>
+am__check_pre =3D \<br>
+$(am__sh_e_setup); \<br>
+$(am__vpath_adj_setup) $(am__vpath_adj) \<br>
+$(am__tty_colors); \<br>
+srcdir=3D$(srcdir); export srcdir; \<br>
+case &quot;$@&quot; in \<br>
+=C2=A0 */*) am__odir=3D`echo &quot;./$@&quot; | sed &#39;s|/[^/]*$$||&#39;=
`;; \<br>
+=C2=A0 =C2=A0 *) am__odir=3D.;; \<br>
+esac; \<br>
+test &quot;x$$am__odir&quot; =3D x&quot;.&quot; || test -d &quot;$$am__odi=
r&quot; \<br>
+=C2=A0 || $(MKDIR_P) &quot;$$am__odir&quot; || exit $$?; \<br>
+if test -f &quot;./$$f&quot;; then dir=3D./; \<br>
+elif test -f &quot;$$f&quot;; then dir=3D; \<br>
+else dir=3D&quot;$(srcdir)/&quot;; fi; \<br>
+tst=3D$$dir$$f; log=3D&#39;$@&#39;; \<br>
+if test -n &#39;$(DISABLE_HARD_ERRORS)&#39;; then \<br>
+=C2=A0 am__enable_hard_errors=3Dno; \<br>
+else \<br>
+=C2=A0 am__enable_hard_errors=3Dyes; \<br>
+fi;<br>
+am__set_TESTS_bases =3D \<br>
+=C2=A0 bases=3D&#39;$(TEST_LOGS)&#39;; \<br>
+=C2=A0 bases=3D`for i in $$bases; do echo $$i; done | sed &#39;s/\.log$$//=
&#39;`; \<br>
+=C2=A0 bases=3D`echo $$bases`<br>
+RECHECK_LOGS =3D $(TEST_LOGS)<br>
+TEST_SUITE_LOG =3D test-suite.log<br>
+TEST_EXTENSIONS =3D=C2=A0 .test<br>
+LOG_DRIVER =3D $(SHELL) $(top_srcdir)/test-driver<br>
+am__test_logs1 =3D $(TESTS:=3D.log)<br>
+am__test_logs2 =3D $(am__test_logs1:.log=3D.log)<br>
+TEST_LOGS =3D $(am__test_logs2:.test.log=3D.log)<br>
+MKDIR_P =3D /bin/mkdir -p<br>
+PACKAGE_STRING =3D PCRE 8.36<br>
+SHELL =3D /bin/sh<br>
+srcdir =3D .<br>
+top_srcdir =3D .<br>
+$(TEST_SUITE_LOG): $(TEST_LOGS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(am__set_TESTS_bases); \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0am__f_ok () { test -f &quot;$$1&quot; &amp;&amp=
; test -r &quot;$$1&quot;; }; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0redo_bases=3D`for i in $$bases; do \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0am__f_ok $$i.trs &amp;&amp; am__f_ok $$i.log || echo $$i; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done`=
; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0st=3D0;=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0errmsg=3D&quot;fatal: making $(TEST_SUITE_LOG):=
 failed to create&quot;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in $$redo_bases; do \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test -f $$i.trs &amp;&amp; test -r $$i.t=
rs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| { echo &quot;$$errmsg $$i.trs&=
quot; &gt;&amp;2; st=3D1; }; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test -f $$i.log &amp;&amp; test -r $$i.l=
og \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| { echo &quot;$$errmsg $$i.log&=
quot; &gt;&amp;2; st=3D1; }; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test $$st -eq 0 || exit 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(am__sh_e_setup); $(am__tty_colors); $(am__se=
t_TESTS_bases); \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ws=3D&#39;[=C2=A0 =C2=A0]&#39;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0results=3D`for b in $$bases; do echo $$b.trs; d=
one`; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test -n &quot;$$results&quot; || results=3D/dev=
/null; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0all=3D`=C2=A0 grep &quot;^$$ws*:test-result:&qu=
ot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$$results | wc -l`; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pass=3D` grep &quot;^$$ws*:test-result:$$ws*PAS=
S&quot;=C2=A0 $$results | wc -l`; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fail=3D` grep &quot;^$$ws*:test-result:$$ws*FAI=
L&quot;=C2=A0 $$results | wc -l`; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0skip=3D` grep &quot;^$$ws*:test-result:$$ws*SKI=
P&quot;=C2=A0 $$results | wc -l`; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xfail=3D`grep &quot;^$$ws*:test-result:$$ws*XFA=
IL&quot; $$results | wc -l`; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xpass=3D`grep &quot;^$$ws*:test-result:$$ws*XPA=
SS&quot; $$results | wc -l`; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0error=3D`grep &quot;^$$ws*:test-result:$$ws*ERR=
OR&quot; $$results | wc -l`; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test `expr $$fail + $$xpass + $$error` -eq 0=
; then \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0success=3Dtrue; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0success=3Dfalse; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0br=3D&#39;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D&#39;; br=3D$$br$$br$$br$$br; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0result_count () \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test x&quot;$$1&quot; =3D x&qu=
ot;--maybe-color&quot;; then \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maybe_colorize=3Dyes; \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif test x&quot;$$1&quot; =3D x&=
quot;--no-color&quot;; then \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maybe_colorize=3Dno; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$@: invalid &#3=
9;result_count&#39; usage&quot; &gt;&amp;2; exit 4; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shift; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc=3D$$1 count=3D$$2; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test $$maybe_colorize =3D yes =
&amp;&amp; test $$count -gt 0; then \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0color_start=3D$$3 color_en=
d=3D$$std; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0color_start=3D color_end=
=3D; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$${color_start}# $$des=
c $$count$${color_end}&quot;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0create_testsuite_report () \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result_count $$1 &quot;TOTAL:&quot; $$al=
l=C2=A0 =C2=A0&quot;$$brg&quot;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result_count $$1 &quot;PASS: &quot; $$pa=
ss=C2=A0 &quot;$$grn&quot;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result_count $$1 &quot;SKIP: &quot; $$sk=
ip=C2=A0 &quot;$$blu&quot;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result_count $$1 &quot;XFAIL:&quot; $$xf=
ail &quot;$$lgn&quot;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result_count $$1 &quot;FAIL: &quot; $$fa=
il=C2=A0 &quot;$$red&quot;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result_count $$1 &quot;XPASS:&quot; $$xp=
ass &quot;$$red&quot;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result_count $$1 &quot;ERROR:&quot; $$er=
ror &quot;$$mgn&quot;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$(PACKAGE_STRING): $(subdir)/=
$(TEST_SUITE_LOG)&quot; |=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__rst_title);=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_testsuite_report --no-color;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;.. contents:: :depth: 2&quot;=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for b in $$bases; do echo $$b; done;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} &gt;$(TEST_SUITE_LOG).tmp || exit 1;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mv $(TEST_SUITE_LOG).tmp $(TEST_SUITE_LOG);=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if $$success; then=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0col=3D&quot;$$grn&quot;;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0col=3D&quot;$$red&quot;;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test x&quot;$$VERBOSE&quot; =3D x || cat=
 $(TEST_SUITE_LOG);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$${col}$$br$${std}&quot;;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$${col}Testsuite summary for $(PACKA=
GE_STRING)$${std}&quot;;=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$${col}$$br$${std}&quot;;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0create_testsuite_report --maybe-color;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$$col$$br$$std&quot;;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if $$success; then :; else=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$${col}See $(subdir)/$(TEST_S=
UITE_LOG)$${std}&quot;;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$$col$$br$$std&quot;;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$$success || exit 1<br>
+check-TESTS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@list=3D&#39;$(RECHECK_LOGS)&#39;;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0test -z &quot;$$list&quot; || rm -f $$list<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@test -z &quot;$(TEST_SUITE_LOG)&quot; || rm -f=
 $(TEST_SUITE_LOG)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@set +e; $(am__set_TESTS_bases); \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0log_list=3D`for i in $$bases; do echo $$i.log; =
done`; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0log_list=3D`echo $$log_list`; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) $(AM_MAKEFLAGS) $(TEST_SUITE_LOG) TEST_=
LOGS=3D&quot;$$log_list&quot;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit $$?;<br>
+pcre_stringpiece_unittest.log: pcre_stringpiece_unittest$(EXEEXT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@p=3D&#39;pcre_stringpiece_unittest$(EXEEXT)&#3=
9;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b=3D&#39;pcre_stringpiece_unittest&#39;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__check_pre) $(LOG_DRIVER) --test-name &quo=
t;$$f&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--log-file $$b.log --trs-file $$b.trs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__common_driver_flags) -- &quot;$$tst&quot;=
<br>
+RunTest.log: RunTest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@p=3D&#39;RunTest&#39;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b=3D&#39;RunTest&#39;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__check_pre) $(LOG_DRIVER) --test-name &quo=
t;$$f&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--log-file $$b.log --trs-file $$b.trs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__common_driver_flags) -- &quot;$$tst&quot;=
<br>
+RunGrepTest.log: RunGrepTest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@p=3D&#39;RunGrepTest&#39;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b=3D&#39;RunGrepTest&#39;; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__check_pre) $(LOG_DRIVER) --test-name &quo=
t;$$f&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--log-file $$b.log --trs-file $$b.trs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__common_driver_flags) -- &quot;$$tst&quot;=
<br>
diff --git a/meta-oe/recipes-support/libpcre/libpcre/run-ptest b/meta-oe/re=
cipes-support/libpcre/libpcre/run-ptest<br>
new file mode 100644<br>
index 0000000000..990d4a12ad<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/libpcre/libpcre/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+make check-TESTS<br>
diff --git a/meta-oe/recipes-support/libpcre/<a href=3D"http://libpcre_8.45=
.bb" rel=3D"noreferrer" target=3D"_blank">libpcre_8.45.bb</a> b/meta-oe/rec=
ipes-support/libpcre/<a href=3D"http://libpcre_8.45.bb" rel=3D"noreferrer" =
target=3D"_blank">libpcre_8.45.bb</a><br>
new file mode 100644<br>
index 0000000000..c5ecbd8cf2<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/libpcre/<a href=3D"http://libpcre_8.45.bb" re=
l=3D"noreferrer" target=3D"_blank">libpcre_8.45.bb</a><br>
@@ -0,0 +1,74 @@<br>
+DESCRIPTION =3D &quot;The PCRE library is a set of functions that implemen=
t regular \<br>
+expression pattern matching using the same syntax and semantics as Perl 5.=
 PCRE \<br>
+has its own native API, as well as a set of wrapper functions that corresp=
ond \<br>
+to the POSIX regular expression API.&quot;<br>
+SUMMARY =3D &quot;Perl Compatible Regular Expressions&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.pcre.org" rel=3D"noreferrer" targ=
et=3D"_blank">http://www.pcre.org</a>&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENCE;md5=3Db5d5d1a69a24ea2718263f1ff8=
5a1c58&quot;<br>
+SOURCEFORGE_PROJECT =3D &quot;pcre&quot;<br>
+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/pcre-${PV}.=
tar.bz2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefile \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369=
cddac3546e3218bffb8&quot;<br>
+<br>
+CVE_PRODUCT =3D &quot;pcre&quot;<br>
+<br>
+S =3D &quot;${UNPACKDIR}/pcre-${PV}&quot;<br>
+<br>
+PROVIDES +=3D &quot;pcre&quot;<br>
+DEPENDS +=3D &quot;bzip2 zlib&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;pcre8 unicode-properties jit&quot;<br>
+<br>
+PACKAGECONFIG[pcre8] =3D &quot;--enable-pcre8,--disable-pcre8&quot;<br>
+PACKAGECONFIG[pcre16] =3D &quot;--enable-pcre16,--disable-pcre16&quot;<br>
+PACKAGECONFIG[pcre32] =3D &quot;--enable-pcre32,--disable-pcre32&quot;<br>
+PACKAGECONFIG[pcretest-readline] =3D &quot;--enable-pcretest-libreadline,-=
-disable-pcretest-libreadline,readline,&quot;<br>
+PACKAGECONFIG[unicode-properties] =3D &quot;--enable-unicode-properties,--=
disable-unicode-properties&quot;<br>
+PACKAGECONFIG[jit] =3D &quot;--enable-jit=3Dauto,--disable-jit&quot;<br>
+<br>
+BINCONFIG =3D &quot;${bindir}/pcre-config&quot;<br>
+<br>
+inherit autotools binconfig-disabled ptest sourceforge-releases<br>
+<br>
+EXTRA_OECONF =3D &quot;--enable-utf&quot;<br>
+<br>
+PACKAGES =3D+ &quot;libpcrecpp libpcreposix pcregrep pcregrep-doc pcretest=
 pcretest-doc&quot;<br>
+<br>
+SUMMARY:libpcrecpp =3D &quot;${SUMMARY} - C++ wrapper functions&quot;<br>
+SUMMARY:libpcreposix =3D &quot;${SUMMARY} - C wrapper functions based on t=
he POSIX regex API&quot;<br>
+SUMMARY:pcregrep =3D &quot;grep utility that uses perl 5 compatible regexe=
s&quot;<br>
+SUMMARY:pcregrep-doc =3D &quot;grep utility that uses perl 5 compatible re=
gexes - docs&quot;<br>
+SUMMARY:pcretest =3D &quot;program for testing Perl-comatible regular expr=
essions&quot;<br>
+SUMMARY:pcretest-doc =3D &quot;program for testing Perl-comatible regular =
expressions - docs&quot;<br>
+<br>
+FILES:libpcrecpp =3D &quot;${libdir}/libpcrecpp.so.*&quot;<br>
+FILES:libpcreposix =3D &quot;${libdir}/libpcreposix.so.*&quot;<br>
+FILES:pcregrep =3D &quot;${bindir}/pcregrep&quot;<br>
+FILES:pcregrep-doc =3D &quot;${mandir}/man1/pcregrep.1&quot;<br>
+FILES:pcretest =3D &quot;${bindir}/pcretest&quot;<br>
+FILES:pcretest-doc =3D &quot;${mandir}/man1/pcretest.1&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t=3D${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${UNPACKDIR}/Makefile $t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/testdata $t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in pcre_stringpiece_unittest pcregrep pcr=
etest; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${B}/libtool --mode=
=3Dinstall install ${B}/$i $t/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in RunTest RunGrepTest test-driver; do<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/$i $t<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Skip the fr_FR locale test. If the locale fr_=
FR is found, it is tested.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# If not found, the test is skipped. The test p=
rogram assumes fr_FR is non-UTF-8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# locale so the test fails if fr_FR is UTF-8 lo=
cale.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s:do3=3Dyes:do3=3Dno:g&#39; ${D}=
${PTEST_PATH}/RunTest <br>
+}<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot;make&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127662): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127662" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127662</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119865283/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119865283/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000005d599065488e1b5--


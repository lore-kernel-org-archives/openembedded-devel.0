Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13673CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 16:55:58 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24145.1781801752829886321
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 09:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PUvMFFAP;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8de2adc59d8so1042236d6.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 09:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781801752; cv=none;
        d=google.com; s=arc-20240605;
        b=F/GQfEmPBz9xSKyOZye1OMJMFuCUdF9ZTwdIE2c1giPEpUqmH/IjA0wVv8SJNy/lo9
         r6w/v8krzWno3OIX6TAyCLFtKHEiUrSOY8zo/zWIM0KN7mcX4sTHSKDOytsp/zvXraUD
         lTjvSFWFpLbA5nAV4XUGqITnaE9Xy1aMTxtBIXgt5NKonqdGQesBE3qeBf3L4WRWe0GJ
         Te1cNYQhS6OrD+He/vbuknw6/Q3KieVn5/p+qZ4dJlV1OU6HS1FUO5aDUspIH6jSCg8c
         Utktj5DnCikaun/LnuRaV6HZ0u3q+NpqYpvDKev3qYJMPdAFkGrj3TVBZd/gYByrSo0w
         YT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WvV/OFRxK1VnkrlQcA4O84NmtvEQwt4ZCF2jVeAezEQ=;
        fh=Dvh9lNg/qg6kQ5taOvLoibcNCDo5RMXzCHCf8rlD1xk=;
        b=fTT/ol+7QPa2VzGUqPUCEJSL3jCoZjy+MjSbZJD7lhpI19aqk/SmrM9/1VrZCrDG+m
         WgL8crqza9SQij3LwX4lDql0n13biajDt0pxQSvRBF8cNuhl3ZPf114WuUc4gYmln0Qu
         g5/NwgCiY5tXxtwD48VBO86AeSTFk36xKzhBhAlessyW+2P/vBabWxME7wJU15bdo68H
         xSAGLbUHMOWYAdBZjMIob3dGhvx4zD53UMMgt7Hr1DLKrVQKCo2ySmJymsNR0AUHrnSs
         ZPQmPROnZtgisYW4iXH0cZaWNqQG/L2egfF8yP74doQnP+YWz6JSS/2x0yHGJsYbRO0G
         dpMQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781801752; x=1782406552; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvV/OFRxK1VnkrlQcA4O84NmtvEQwt4ZCF2jVeAezEQ=;
        b=PUvMFFAPXG4O4wS+cxAYyVv2sWeWpKg5H2yD4m0qOQ8vQKWdH5l3OhlaQaWRa0RAVM
         IrFsg9byNv/XoNpeBgT8c70z0nT6tpce8OJ1PyMV1JBlCuGNmFjuT+Ti4PRO1pCx8BMK
         4ytjHaH+0ELM1j6+6Io4qIxwM9zRk9qPLcNpvuwtjJ3fu8fgX7uP0cNXcXYJtam9u5O3
         QDo5jBz2ynlQZOLOHtOEvFlf3jFcQTVvnrwPULuziqbILxz9YKD0Cbu30RQzerBqu1GE
         URZbGpOr2Bwec/o/XactcOMjF8lr72RDrMig9ACuq6UI10H2NOLjdsrFnzPY8tDRZfzk
         /iNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781801752; x=1782406552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvV/OFRxK1VnkrlQcA4O84NmtvEQwt4ZCF2jVeAezEQ=;
        b=BIchvWsY3QMsz2Et/QxHMuBwG6ejJlStyJW2pf2SQyy9nXuGoOQ9RqraUlByUtt4bP
         EptniByiRR+AgpVVNpW/alKE7d2MAA8QIPhA+Yl7x35smvQLlaAmY80AkiXfZ1cRfZje
         q/owdypAquxqKqW4P1X3X1tbVnFiQVvxMeyotSKVBzfFFRiTu0fmGfjrV8eJnryoz9kC
         kncsgR8XXAPCu6tjv1wJM+CXeRMk7gPklwP2KqRAkEEdVuRpPwCnsfzXj57XLe9DbHxk
         Kxry9uvXZrssKkq6qtip7mMKqvz2/MjZiovtN6Tkki9RSrtOr0M46FjTPEyzdS0iStZw
         nJKA==
X-Forwarded-Encrypted: i=1; AFNElJ/PT0CPp+xolBD9gILHbXV4nYIVM11KubuCR3D3gAhcB34qV6cP0fDpvRJB3FfM79GS9Cs3uvHBTMh0/baAICtAl8Q=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyh6zyE/XItdWoUlBWA4EroPNoCOaSR46fpcvyTlqHzJji+G+bA
	Gt0Srh0Ki1bSc7Khn3r647QlRgE2tbt3/R2cOkD6CCC+3cbv3vKFh0oFb8b0Bwfs7vqWWcqxLqq
	L9rhCVX7/ypv+6vXf/Qmb5Pyre3GV53I=
X-Gm-Gg: AfdE7cneICUSKVRW1K5sZTwamesb9MQ+jDZ+Akje4nAcLiwEcUUU6r9mtxl+jdoxGbk
	rdh316u3k7CTtbviRiP0cKBGqm96GF4S8iDoyHZJ71Qyxbcmh+PtCNnhtwvUrGJJd36I2DPWZT8
	BrwWVbM1T/tvZ7TOyS0UPfInWQxWgv2Xd0FFPynyO39FBtSPOuUdfanDv04wBVZsUAl4qu+D+Vb
	Tl/1w9aYtImPwUFWBHnWxyHetioXhUZgo3ZVv19E3FhezzcJqXpiDSyhgZfoTsxXrjwOnGn8iw5
	ktTANi8OCIJ1E89MGyZTvIS109G2Rsk=
X-Received: by 2002:a05:6214:e6f:b0:8db:5500:a8d8 with SMTP id
 6a1803df08f44-8dcc832cad0mr66038266d6.0.1781801751498; Thu, 18 Jun 2026
 09:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260618113029.1051020-1-peter.marko@siemens.com>
 <CAMKF1sox1_5DZEy5XKrwa=m=2A0Hn+b-3o6JZ-fPrm_YwrrpOg@mail.gmail.com> <AS8PR10MB5073D5089D0649F4C3377015FDE32@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB5073D5089D0649F4C3377015FDE32@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Jun 2026 18:55:40 +0200
X-Gm-Features: AVVi8Cf3LMbftFhdabjJLIF6Z8cpMROsRSBKQ14NZIMG25Qh7_oEtDA5Xnm2Ae4
Message-ID: <CANNYZj_QemUg6BXzNVN=P58kL=ujO-R49fuGKcnXM_O14OU-Hw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libpcre: move recipe from oe-core
To: peter.marko@siemens.com
Cc: Khem Raj <raj.khem@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 16:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127665

pcre removal was merged in oe-core, so we'll find out what fails pretty soo=
n :)

Alex

On Thu, 18 Jun 2026 at 18:54, Peter Marko via lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> The list is rather long=E2=80=A6
>
>
>
> grep -rI --exclude=3D*.patch --exclude-dir=3D.git 'pcre\($\|[^2]\)'
>
> apache2
>
> sngrep
>
> ettercap
>
> daq
>
> snort
>
> snort3
>
> freeradius
>
> proftpd
>
> atftp
>
> ncmpc
>
> projucer
>
> x265
>
> xfce4-verve-plugin
>
> thunar
>
> mongodb
>
> nmap
>
> fwts
>
> libdbus-c++
>
> liboop
>
> octave
>
> android-tools
>
> zabbix
>
>
>
> There are also other layers like meta-security which have some dependenci=
es=E2=80=A6
>
>
>
> Some could be easy, but I think many of those components don=E2=80=99t su=
pport pcre2 yet.
>
>
>
> Peter
>
>
>
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Thursday, June 18, 2026 5:32 PM
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] libpcre: move recipe from oe-core
>
>
>
> how many recipes in meta-oe need it? how many of them really need it and =
not use libpcre2? I would like to not have it in meta-oe if possible.
>
>
>
> On Thu, Jun 18, 2026 at 4:30=E2=80=AFAM Peter Marko via lists.openembedde=
d.org <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
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
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-o=
e/conf/include/ptest-packagelists-meta-oe.inc
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
> diff --git a/meta-oe/recipes-support/libpcre/libpcre/Makefile b/meta-oe/r=
ecipes-support/libpcre/libpcre/Makefile
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
echo; }
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
> diff --git a/meta-oe/recipes-support/libpcre/libpcre/run-ptest b/meta-oe/=
recipes-support/libpcre/libpcre/run-ptest
> new file mode 100644
> index 0000000000..990d4a12ad
> --- /dev/null
> +++ b/meta-oe/recipes-support/libpcre/libpcre/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +make check-TESTS
> diff --git a/meta-oe/recipes-support/libpcre/libpcre_8.45.bb b/meta-oe/re=
cipes-support/libpcre/libpcre_8.45.bb
> new file mode 100644
> index 0000000000..c5ecbd8cf2
> --- /dev/null
> +++ b/meta-oe/recipes-support/libpcre/libpcre_8.45.bb
> @@ -0,0 +1,74 @@
> +DESCRIPTION =3D "The PCRE library is a set of functions that implement r=
egular \
> +expression pattern matching using the same syntax and semantics as Perl =
5. PCRE \
> +has its own native API, as well as a set of wrapper functions that corre=
spond \
> +to the POSIX regular expression API."
> +SUMMARY =3D "Perl Compatible Regular Expressions"
> +HOMEPAGE =3D "http://www.pcre.org"
> +SECTION =3D "devel"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Db5d5d1a69a24ea2718263f1ff85a1=
c58"
> +SOURCEFORGE_PROJECT =3D "pcre"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/pcre-${PV}.tar=
.bz2 \
> +           file://run-ptest \
> +           file://Makefile \
> +           "
> +
> +SRC_URI[sha256sum] =3D "4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cdd=
ac3546e3218bffb8"
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
> +PACKAGECONFIG[pcretest-readline] =3D "--enable-pcretest-libreadline,--di=
sable-pcretest-libreadline,readline,"
> +PACKAGECONFIG[unicode-properties] =3D "--enable-unicode-properties,--dis=
able-unicode-properties"
> +PACKAGECONFIG[jit] =3D "--enable-jit=3Dauto,--disable-jit"
> +
> +BINCONFIG =3D "${bindir}/pcre-config"
> +
> +inherit autotools binconfig-disabled ptest sourceforge-releases
> +
> +EXTRA_OECONF =3D "--enable-utf"
> +
> +PACKAGES =3D+ "libpcrecpp libpcreposix pcregrep pcregrep-doc pcretest pc=
retest-doc"
> +
> +SUMMARY:libpcrecpp =3D "${SUMMARY} - C++ wrapper functions"
> +SUMMARY:libpcreposix =3D "${SUMMARY} - C wrapper functions based on the =
POSIX regex API"
> +SUMMARY:pcregrep =3D "grep utility that uses perl 5 compatible regexes"
> +SUMMARY:pcregrep-doc =3D "grep utility that uses perl 5 compatible regex=
es - docs"
> +SUMMARY:pcretest =3D "program for testing Perl-comatible regular express=
ions"
> +SUMMARY:pcretest-doc =3D "program for testing Perl-comatible regular exp=
ressions - docs"
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
> +       # Skip the fr_FR locale test. If the locale fr_FR is found, it is=
 tested.
> +       # If not found, the test is skipped. The test program assumes fr_=
FR is non-UTF-8
> +       # locale so the test fails if fr_FR is UTF-8 locale.
> +       sed -i -e 's:do3=3Dyes:do3=3Dno:g' ${D}${PTEST_PATH}/RunTest
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "make"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127664): https://lists.openembedded.org/g/openembedde=
d-devel/message/127664
> Mute This Topic: https://lists.openembedded.org/mt/119865283/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1DFCD98F0
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 21:27:36 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29720.1781818055637988396
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jb00Iwcu;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-662bf1dab83so1829931d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 14:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781818055; cv=none;
        d=google.com; s=arc-20240605;
        b=i01tozM0UfY8kROvolhtWiO3HgFuwg1YhVFmarSJlEesCse0ZsRCqukK8S+b+tCbYG
         F+23bxoCb2iDqFo5UVAsr6T3b/T+xB/U+kPmULXmaGu+po3T4/QW4pVlUTvGBwWmmVCm
         70LbxFEn5cmFVsChxu6pPw4gUgqqdtu2ih9lw9o4CY9QNWaL5byid7r61NgCovInSnJv
         B64t41+COV2o+vFjkphgYlMJotslh7RKEVK0e3LKliE5kSOS+1aITcQP9cuhtm6iq5RM
         6IgBHvP9TTkJeuu9KmCoa2c863bsTS7Pa93iQ9IGkwEjCgXnw2tE7+qiTkreZKWGqhPD
         DdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wp+1vQKs9JHimWNKx7ZA2iAwWjxVFCHfLZnpev1iNtw=;
        fh=YJKeWC5hLMycXN3GzRs5bodxslvKqS7ZBldByQRONhA=;
        b=JBCbCZfgMBkNC0unrMKJeqMddttQ35RZkG6M9fp4YW32X84Aja4BuF5MougXKCM8pe
         dar3PqzkLoRAsf/1tAEKHViQO5GpeJXt/XIobcGB72fvF8neGiy4b9/XuYDlGR3HzI+q
         q+SHZ5bgBv/JtILa5AZy75m80m7CtgGj74kuFFE9hZRAM4AFRNHMbnPyk1LltIQGMQMI
         R67QIR+a2yBrozf6MWZpDPm4BmPN1u73CvMlm0fkHuUqJgSczIbRa1iq56DiwlHpV9Vq
         0GOawjwE5JRQpeuVDJHCqLvcCaib+dXgaxIA3dl+wAluHUehpZ/uQLM12FH2JcqnLZ4X
         aDZA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781818055; x=1782422855; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wp+1vQKs9JHimWNKx7ZA2iAwWjxVFCHfLZnpev1iNtw=;
        b=jb00IwcuhMLFNLn4b6LQaNUMWHqTkCS4bnhiMZ0mFeilTEXe9ibQd0VnVsSh7ch03K
         9mqWX0iUUxqHlT0sL8dFwAMBFU7Lohb7ObZIZ0trgg6Rlpj1UwvAjnfFt5lHj17lvP1n
         QThU6RgK1pVscEw2qkcd83dcYMqcdNi2Yju19e+ijjlgPBaEzn81Ql28YG68bG/C79+6
         Ieo5VaHPUdqzRNgRmcnDBJRUuknGSi7Oxteta+4C1NRrwcO4C21eH0kJC5X4xlGZOq9G
         jyWapuOg80w7++W8ip+82a/1k26n9lrBiNX3CDSCt0Iyy0BSZZeU0FmT+kmjaCxmKoRt
         9UgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781818055; x=1782422855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp+1vQKs9JHimWNKx7ZA2iAwWjxVFCHfLZnpev1iNtw=;
        b=FvgB5BILCFNhRoZ0dq+xrvPEVPaBCYbHqXriCkZ4/oaCVjx4o1bCxm2+CKAbpQ3FSl
         9XTfJ7b7+TA2bHJ3XI4LSOus9yBFiT6bnpUBt4FUpcMjUFc/6sHvOMvX1qhPlvoNw4cz
         E1SGAzw6Q77iwZKtN3X3KGGEJGkL/INjph/O8Wp2u00TF0i2TswdZQGAcvyg4HvcXijq
         NNax6pmj0DorU2Uaruzs/PaUVCl6WiY4TTV+bna31Eqb+seeubZG/5efGAQ9pl824CJP
         bpPEdG/xp7ecEodi88bEEi2/MJ9yvX7ndZfNHSW8lKPdttGczeTMTYl6ftY9mCZVmlml
         gm0g==
X-Gm-Message-State: AOJu0Yymhzyn6InKawGcyA35RKUxfYzO0edVlu9wQxFnTz3N+PPW+Ydo
	miansY2+c0I34NgptW7zN1+zJMvt3If0AKM4oQcthIcT+gVkDgE2HgByBPvjIdyoXCmLRoffQXA
	FUrl2FwtAyyW4cVOxiC8WuKDsWnhF+NHcOE8Epynmdw==
X-Gm-Gg: AfdE7cmsdPN3ogxfOWTeoX9Jmo51ZGJ+dfcEmfxGEZvbGNWu58YDuwwMjNVVL18YOZG
	Oo+wcTh5WIStiHt4s/HLKJHJcDolf9hicbm3JTG6zo5NHUUzA307Mb1q0Vu0eeVWhzViRnLr/AP
	hIMg0M/DvLY3quJBNgmDTd67ggwfNbSwj1skP1edwMEbXxg8o+XG/xYw1wiLIUd8LVKPvnvsGlW
	VgaC32oc3noVoOjUImroECMsUDXBopqK7CFh0dgucQMIKOO/f4GjkZMG4cMDvlic3N/Z1i49Qy0
	O3g5jR0WSfaY6/3sl561895rBJA8TAwSeWv53bYut+Cfamhxyf9XLsyjWcNTduqXIiAjrsPs54B
	A8LSG0AIfZou5D4q9g3jmebC5Zx7x8rQqH1VEOlDVUw0lkM6NqD1UjF4qFxAcK1BVbujMPDBcv7
	Z/R3Y0vjQ=
X-Received: by 2002:a05:690e:bcf:b0:660:877f:a5bb with SMTP id
 956f58d0204a3-662fcb7a796mr1563034d50.51.1781818054508; Thu, 18 Jun 2026
 14:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260618113029.1051020-1-peter.marko@siemens.com>
 <CAMKF1sox1_5DZEy5XKrwa=m=2A0Hn+b-3o6JZ-fPrm_YwrrpOg@mail.gmail.com> <AS8PR10MB5073D5089D0649F4C3377015FDE32@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB5073D5089D0649F4C3377015FDE32@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Jun 2026 14:27:23 -0700
X-Gm-Features: AVVi8CdgFqeTd-WtA67-ZHEvDI2FELX8vWwgRBlppEi4jlJgvqPT216cbUq1XY8
Message-ID: <CAMKF1spvu=bpAG6WzJF82Up8H-=knZma_f5oNm8s9vApApSzLg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libpcre: move recipe from oe-core
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003183f106548dd81d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 21:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127671

--0000000000003183f106548dd81d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm this is not a small list. I guess we have to carry it for
meta-openembedded layers. Thanks for digging

On Thu, Jun 18, 2026, 9:53=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.com=
> wrote:

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
> There are also other layers like meta-security which have some
> dependencies=E2=80=A6
>
>
>
> Some could be easy, but I think many of those components don=E2=80=99t su=
pport
> pcre2 yet.
>
>
>
> Peter
>
>
>
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Thursday, June 18, 2026 5:32 PM
> *To:* Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> *Cc:* openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [meta-oe][PATCH] libpcre: move recipe from oe-core
>
>
>
> how many recipes in meta-oe need it? how many of them really need it and
> not use libpcre2? I would like to not have it in meta-oe if possible.
>
>
>
> On Thu, Jun 18, 2026 at 4:30=E2=80=AFAM Peter Marko via lists.openembedde=
d.org
> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
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

--0000000000003183f106548dd81d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hmm this is not a small list. I guess we have to carry it=
 for meta-openembedded layers. Thanks for digging=C2=A0</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Jun 18, 2026, 9:53=E2=80=AFAM Marko, Peter &lt;<a href=3D"mailto:=
Peter.Marko@siemens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"overflow-wrap: =
break-word;">
<div class=3D"m_-1369260629240136145WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">The list is rather long=E2=80=A6<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">grep -rI --exclude=3D*.patch --exclude-dir=3D.git &#39;pcre\($\|[^2=
]\)&#39;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">apache2<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">sngrep<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">ettercap<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">daq<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">snort<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">snort3<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">freeradius<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">proftpd<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">atftp<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">ncmpc<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">projucer<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">x265<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">xfce4-verve-plugin<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">thunar<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">mongodb<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">nmap<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">fwts<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">libdbus-c++<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">liboop<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">octave<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">android-tools<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">zabbix<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">There are also other layers like meta-security which have some depe=
ndencies=E2=80=A6<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Some could be easy, but I think many of those components don=E2=80=
=99t support pcre2 yet.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-width:medium medium medium 1.5pt;border-style:none non=
e none solid;border-color:currentcolor currentcolor currentcolor blue;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:Calibri=
,sans-serif">From:</span></b><span style=3D"font-size:11pt;font-family:Cali=
bri,sans-serif"> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;
<br>
<b>Sent:</b> Thursday, June 18, 2026 5:32 PM<br>
<b>To:</b> Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko=
@siemens.com" target=3D"_blank" rel=3D"noreferrer">Peter.Marko@siemens.com<=
/a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org=
</a><br>
<b>Subject:</b> Re: [oe] [meta-oe][PATCH] libpcre: move recipe from oe-core=
<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">how many recipes in meta-oe need it? how many of the=
m really need it and not use libpcre2? I would like to not have it in meta-=
oe if possible.<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Jun 18, 2026 at 4:30<span style=3D"font-fami=
ly:Arial,sans-serif">=E2=80=AF</span>AM Peter Marko via
<a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"noreferr=
er">lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.=
com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">siemens.co=
m@lists.openembedded.org</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">From: Peter Marko &lt;<=
a href=3D"mailto:peter.marko@siemens.com" target=3D"_blank" rel=3D"noreferr=
er">peter.marko@siemens.com</a>&gt;<br>
<br>
This recipe was removed in oe-core as obsolete (replaced by libpcre2).<br>
Since some recipes in meta-oe still depend on it, moe it here.<br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank" rel=3D"noreferrer">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../include/ptest-packagelists-meta-oe.inc=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0.../recipes-support/libpcre/libpcre/Makefile=C2=A0 | 183 ++++++++++++=
++++++<br>
=C2=A0.../recipes-support/libpcre/libpcre/run-ptest |=C2=A0 =C2=A03 +<br>
=C2=A0.../recipes-support/libpcre/<a href=3D"http://libpcre_8.45.bb" target=
=3D"_blank" rel=3D"noreferrer">libpcre_8.45.bb</a>=C2=A0 =C2=A0|=C2=A0 74 +=
++++++<br>
=C2=A04 files changed, 261 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libpcre/libpcre/Makefile<b=
r>
=C2=A0create mode 100644 meta-oe/recipes-support/libpcre/libpcre/run-ptest<=
br>
=C2=A0create mode 100644 meta-oe/recipes-support/libpcre/<a href=3D"http://=
libpcre_8.45.bb" target=3D"_blank" rel=3D"noreferrer">libpcre_8.45.bb</a><b=
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
.bb" target=3D"_blank" rel=3D"noreferrer">libpcre_8.45.bb</a> b/meta-oe/rec=
ipes-support/libpcre/<a href=3D"http://libpcre_8.45.bb" target=3D"_blank" r=
el=3D"noreferrer">libpcre_8.45.bb</a><br>
new file mode 100644<br>
index 0000000000..c5ecbd8cf2<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/libpcre/<a href=3D"http://libpcre_8.45.bb" ta=
rget=3D"_blank" rel=3D"noreferrer">libpcre_8.45.bb</a><br>
@@ -0,0 +1,74 @@<br>
+DESCRIPTION =3D &quot;The PCRE library is a set of functions that implemen=
t regular \<br>
+expression pattern matching using the same syntax and semantics as Perl 5.=
 PCRE \<br>
+has its own native API, as well as a set of wrapper functions that corresp=
ond \<br>
+to the POSIX regular expression API.&quot;<br>
+SUMMARY =3D &quot;Perl Compatible Regular Expressions&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.pcre.org" target=3D"_blank" rel=
=3D"noreferrer">http://www.pcre.org</a>&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;<a rel=3D"noreferrer">file://LICENCE;md5=3Db5d5=
d1a69a24ea2718263f1ff85a1c58</a>&quot;<br>
+SOURCEFORGE_PROJECT =3D &quot;pcre&quot;<br>
+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/pcre-${PV}.=
tar.bz2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a rel=3D"noreferrer">file://run-=
ptest</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a rel=3D"noreferrer">file://Make=
file</a> \<br>
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
enembedded-devel/message/127662" target=3D"_blank" rel=3D"noreferrer">
https://lists.openembedded.org/g/openembedded-devel/message/127662</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119865283/199=
7914" target=3D"_blank" rel=3D"noreferrer">
https://lists.openembedded.org/mt/119865283/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" target=3D"_blank" rel=3D"noreferrer">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gma=
il.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>

--0000000000003183f106548dd81d--


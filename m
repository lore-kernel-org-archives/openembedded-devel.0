Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.15397.1600232613538628816
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 22:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uugCOu8o;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id q5so6972932qkc.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 22:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=padmqGbxGEp42AxuYhZnz5eryFsmrEb9zEYWgfOEyhY=;
        b=uugCOu8oRm05jYsbN2317GNkFE+AIlkuRP1ZeChuPjYLreFt6kB+1rD43sAOWDL3Si
         t3Hl+mTOAUNaJSrHW97voMhgy4pWajtnf72kyXojXjYfoI9SIgc9HBCIC7hk2W77X2KJ
         RWTBgeBsrKPwvfPr/0fXQWqnvvFve+1SvpgO7u7k6nqAdPXZg/FsbSfEDLybqYLaelBi
         vJZiu2I2tmXyhbHZ4vdtlDJ9hwrGifc1sEk6XPJCZyZs3CnhquzYxYSAjpRjXiNhMTAr
         fByMG5kIhnfHGcXxG8e7ET9Z0CoES/0NHvY3wZHqb94FU1HDIAdKFlg6PFwt7/+ra6na
         PNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=padmqGbxGEp42AxuYhZnz5eryFsmrEb9zEYWgfOEyhY=;
        b=CnphxmDuMuBSi2bNQyUXu4Y9jd6c0/IN1pIXQaS4hRWAv7wK+0YDUTQ5ber7vJtKOW
         5QZl/sXnJmrNGzskcaAPhPaEfnfTYXTF90ZcKtgDKpy/4OzO5nmYFVaSeKM2Y42RYgTi
         5F+KmYIbboxZaQ70CBKpZj5kH9xTooqG3wl5BFcjGz+KTYKUT+1d69feBS6TkMU29GjY
         9fWi8jNMMq9FoejygghnmmfvobUHMf4BnuTHN1rLRb4+Lt8U5rndaFVcApadREufVsYu
         5HtMkqwKrJYyicJ84CKJelu8JEqC64iQkkgYJC7vXFGYVbeJeMQAB4uv50VqP/CVmzVZ
         S7eg==
X-Gm-Message-State: AOAM532WNmc2c05B/+p3NL6ffSfY70uoyP2abHIf3kruS0369kkExcz+
	42qhQZQmPstXMJ3mkXg+l1QeICUd2Wt55Jbheqo=
X-Google-Smtp-Source: ABdhPJyDbI0aktwKEIu+07bEw1hUZTNZetVFe6lcUC87AggfoEOHF6+gDsOK1sRndj89FWscQ8v8soeBLEKVMgThHDA=
X-Received: by 2002:a05:620a:13f6:: with SMTP id h22mr22482908qkl.9.1600232612490;
 Tue, 15 Sep 2020 22:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200915091850.215655-1-Haiqing.Bai@windriver.com>
 <28f8f9cc-985e-f457-8d2e-99c62147f264@gmail.com> <BN7PR11MB2561A0CDB61F1AA97419E519EE210@BN7PR11MB2561.namprd11.prod.outlook.com>
In-Reply-To: <BN7PR11MB2561A0CDB61F1AA97419E519EE210@BN7PR11MB2561.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 15 Sep 2020 22:03:06 -0700
Message-ID: <CAMKF1soP8Nw3dnxeTbJvjRVj-kWFrJqnfEHzNHxgGYrpRi-fEg@mail.gmail.com>
Subject: Re: [oe][meta-oe][zeus][PATCH] rsyslog: fix wrong option of PACKAGECONFIG[valgrind]
To: "Bai, Haiqing" <Haiqing.Bai@windriver.com>, Armin Kuster <akuster808@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 7:25 PM Bai, Haiqing <Haiqing.Bai@windriver.com> wrote:
>
> Yes,  master also need this and the patch can be applied on master.  Thanks.
>

I have staged it for master. I think it will be needed on dunfell too Armin.

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: Wednesday, September 16, 2020 12:15 AM
> To: Bai, Haiqing <Haiqing.Bai@windriver.com>; openembedded-devel@lists.openembedded.org
> Subject: Re: [oe][meta-oe][zeus][PATCH] rsyslog: fix wrong option of PACKAGECONFIG[valgrind]
>
> this seems to be applicable on master as well. Can you check if we need it on master.
>
> On 9/15/20 2:18 AM, haiqing wrote:
> > The source configure.ac shows:
> > --enable-valgrind: Enable somes special code that rsyslog core developers
> >                     consider useful for testing.Do NOT use if you don't
> >                     exactly know what you are doing, except if told so
> >                     by rsyslog developers.
> >                     NOT to be used by distro maintainers for building regular
> >                     packages.
> >
> > --without-valgrind-testbench:
> >                     Don't use valgrind in testbench
> >
> > PACKAGECONFIG[valgrind] should use '--without-valgrind-testbench'
> > And after this fix, the code which removes the valgrind depended ptest
> > cases for arm,mips is no longer needed.
> >
> > Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> > ---
> >   meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb | 8 +-------
> >   1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> > b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> > index 8287d2b7f..5b8af8d37 100644
> > --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> > +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> > @@ -74,7 +74,7 @@ PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
> >   PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
> >   PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
> >   PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
> > -PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
> > +PACKAGECONFIG[valgrind] = ",--without-valgrind-testbench,valgrind,"
> >
> >   TESTDIR = "tests"
> >   do_compile_ptest() {
> > @@ -98,12 +98,6 @@ do_install_ptest() {
> >       # fix the abs_top_builddir
> >       sed -i 's,^\(abs_top_builddir = \).*,\1${PTEST_PATH}/,'
> > ${D}${PTEST_PATH}/${TESTDIR}/Makefile
> >
> > -    # valgrind is not compatible with arm and mips,
> > -    # so remove related test cases if there is no valgrind.
> > -    if [ x${VALGRIND} = x ]; then
> > -        sed -i '/udp-msgreduc-/d' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
> > -    fi
> > -
> >       # install test-driver
> >       install -m 644 ${S}/test-driver ${D}${PTEST_PATH}
> >
> >
> >
> >
> >

Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id E40EB7C933
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 04:48:15 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id s1so22114097qte.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 20:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v5et9hDb0h8oPXf9TXFvB91CUTQ5fJqhjUeFSX24he4=;
	b=ov1a9mg7QZYjjEomsQ4ecx8+/4u8m7VhdwFzG+B/YMRY69PxuIs33BNDrzkObPtdpk
	dbsjWLKTw21Jrnqd7SGzfBsRZ5iPgbMVenJ5iJf7vzqSow76keHJLDcjVvsX14X8a5JU
	PN6WUMxQOlpcPWrbOQ9WWfr0cqq16It/oITmKZawtHVmG6L10TdksrYO2BMaeJmAfn55
	syKSCEc09/PLE3GX5ggLx6aJfFFyHLLu9WlRtiRI1VVI7c9TepttCKRL2bRssMAaRXBV
	ivs4rtU59T6EFqOvS4E8TnN/pa7iYAXzHwdUBbE4DjX126GACnUO3sMtWF4mt5C/PQpm
	nn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v5et9hDb0h8oPXf9TXFvB91CUTQ5fJqhjUeFSX24he4=;
	b=Q62Dw4oJVEQ7wlNyDAAv6va+m06ISLqKwlS8tgP1dTOAZa0f/KJ5S7nnMrr98I6ubz
	6TJxl20X5wTCr/tqJSdCfiKtmIPDsBZzp0NMCN+t74QRiy/lcmLVzYjFUWXPK3uJuF/v
	zvzB2VQk0sOEOzvAmZr8BiN3pqG3gzWbkwkcjYGVE75N6tUczQocb0hkz6I3DIQj6n9B
	EMr97/3+0Uv3xsM4+JnbesOyOSsMOsM1BsYeVhfGEZrfpIbViwy41R9MohBiJIsDJ5Zp
	A1BvueV/G43oeQBhuVSHeaDkeCE2OopIaNJO9ZvbfzsqppW/cv+q0akAnVXJ//5ofHVn
	U/MQ==
X-Gm-Message-State: APjAAAU3QDbhNrsErL9VawEn7VA3KI0siYpKwFgZD5IKPlovd7Qqff9X
	JF/5bi97yjUYYRPZsXvJZRMeFc3aTc3MmnrqfM27yg==
X-Google-Smtp-Source: APXvYqwJYO8T1di1pFwZYTUJJgw5+0/7Nmav/Ik/rCuuw9tra8C5Qf+Nc/3I5Y++pfEpl6Ib5pmdaZ//GMnUcDqA+W4=
X-Received: by 2002:a0c:8971:: with SMTP id 46mr4798757qvq.224.1551329296640; 
	Wed, 27 Feb 2019 20:48:16 -0800 (PST)
MIME-Version: 1.0
References: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
	<1551256910-119653-5-git-send-email-changqing.li@windriver.com>
	<20190227163511.GR12046@bill-the-cat>
	<e98a80c6-e1ab-1aef-6613-489d1b233358@windriver.com>
In-Reply-To: <e98a80c6-e1ab-1aef-6613-489d1b233358@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2019 20:47:50 -0800
Message-ID: <CAMKF1srJuJQ8UHr1AAGgNYXi24MrfgTZA3KOfnoOjbWXVVq2JA@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: Tom Rini <trini@konsulko.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][PATCH 4/4] freeradius: add PACKAGECONFIGs
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
X-List-Received-Date: Thu, 28 Feb 2019 04:48:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 27, 2019 at 6:57 PM Changqing Li <changqing.li@windriver.com> wrote:
>
>
> On 2/28/19 12:35 AM, Tom Rini wrote:
> > On Wed, Feb 27, 2019 at 04:41:50PM +0800, changqing.li@windriver.com wrote:
> >
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> add 3 PACKAGECONFIG
> >>
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
> >> index c17d56d..cee3b47 100644
> >> --- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
> >> +++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
> >> @@ -83,6 +83,9 @@ PACKAGECONFIG[perl] = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl --w
> >>   PACKAGECONFIG[python] = "--with-rlm_python --with-rlm-python-bin=${STAGING_BINDIR_NATIVE}/python-native/python --with-rlm-python-include-dir=${STAGING_INCDIR}/${PYTHON_DIR},--without-rlm_python,python-native python"
> >>   PACKAGECONFIG[rest] = "--with-rlm_rest,--without-rlm_rest,curl json-c"
> >>   PACKAGECONFIG[ruby] = "--with-rlm_ruby,--without-rlm_ruby,ruby"
> >> +PACKAGECONFIG[no-ssl] = "--without-openssl,--with-openssl"
> > This is commonly done with 'openssl' as the PACKAGECONFIG flag.
> >
> >> +PACKAGECONFIG[no-rlm-eap-fast] = "--without-rlm_eap_fast,--with-rlm_eap_fast"
> >> +PACKAGECONFIG[no-rlm-eap-pwd] = "--without-rlm_eap_pwd,--with-rlm_eap_pwd"
> > We also don't have any other examples of "no-xxx".  What is the behavior
> > we have here today?  If "enabled" we should put them in the default
> > PACKAGECONFIG instead, imho.
> >
> Hi, Khem
>
> My original idea is default option is enable,  add
> PACKAGECONFIG[disable-xxx] is for
>
> someone who want to disable it by append PACKAGECONFIG.  but if we have the
>
> traditional way  like tom and Adrian said,  I am ok with that way.
>
>

yes please address the review comments, they are valid concerns in this case.

> I noticed that this patch is now on master-next,  so I will send a
> !fixup  of these patches based on master-next
>

master-next is just a CI branch, its meant to collect patches so
people can try and report issues
along with what I do, I drop patches from master-next when there are
issues reported by reviewers or
system.

> branch in case we need to keep the traditional way.   Sorry for the
> inconvenient.
>
>
> --
> BRs
>
> Sandy(Li Changqing)
>


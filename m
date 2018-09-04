Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1787974D73
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 23:52:53 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id t39-v6so6114689qtc.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 16:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FhSump5y3f4qEYXi8eBAHB4O0Z3xmNOBNhLAWh7gLo0=;
	b=J4Nn7m10yOfQv1lcLEjqTN/sE8RQ0o3gBBPVzLiylEPtIGY4cN6OviXx5P0YdLvpv/
	idpy5+25TCczxz8Jt2aKg3gkOJwsPAElne7vSfxSWsR/KJuKuU1XOpGhmz52f/pvMMGc
	cmg1RjRlIdDWfUEVnpT+yZP9pnniEha2ppa/PdqXzjiR1wWSNMhzmZlQpanH5UmAQ21N
	6Le4V4FUjomln8L0v8KBf4YtCOjquT+4FJscokAExgatme8FuUt/Kqn2mqodyzLEcSEZ
	Izm6VIccv7DWocytsRBQDxyYwgmuKJ0ocmuauoNmpZscEPY87Pb3vbKtStVNLSmMtnUS
	f/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FhSump5y3f4qEYXi8eBAHB4O0Z3xmNOBNhLAWh7gLo0=;
	b=e05vsl+iYaSHCa4GqkYULuxs2BC11H/Xn8OBSXkFJMfG0ahjsO/fYqW0UaOhxqoE8W
	Oip38Fmdm53v1qrtTjVqP3R3yix7in2e5oWXpeyLyJ+T2/riSTh5TUPxDz2CvYeYyEJx
	uHg5Z+Qx/9MYcsbdindgN7KpsByZsPN8d5uRcbQ9cfb4x6I0Jbnjv6xCo0o3nKolc5qi
	TVbtOzlIdUa3tA0LTZpkxwc9Rrv/Uvi3LzgDvv7r6nkT38am2n9if85NRoiEOWCLXApr
	OnTizsC19qJsmngh/CwfYOymo6aag8u9J6GBhSIZW5YHOPNuPvH5D8XiOSxJu8NtcKd3
	Y7OQ==
X-Gm-Message-State: APzg51AbJzqz/UKtgOVLlcst1/VbxMNI5xwzM+RkLBL1Y21jcI3/Gc6E
	CuZHcT5Bf5Q4cPt3gq7NOU3PEvM4duVzY7qg+YE=
X-Google-Smtp-Source: ANB0VdZaq20aDih7+ulIsmhClrc2lTQz4NHcZul12T7xA2Gp4o888yPgTgSKe6F9xigO83e3bFcoJWEo4stwx24zWbA=
X-Received: by 2002:a0c:f94e:: with SMTP id
	i14-v6mr1601467qvo.50.1536105174772; 
	Tue, 04 Sep 2018 16:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20180703092018.5018-1-ross.burton@intel.com>
	<20180703092018.5018-3-ross.burton@intel.com>
	<09682179-6edc-c225-a2c8-2532c4776fd7@gmail.com>
	<CAJ86T=XfnK1wbsRAnSbHeqTXGykXjvDPQKb1a13qWFRthuQzjg@mail.gmail.com>
In-Reply-To: <CAJ86T=XfnK1wbsRAnSbHeqTXGykXjvDPQKb1a13qWFRthuQzjg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Sep 2018 16:52:28 -0700
Message-ID: <CAMKF1soNNbXNbTPWbusJhaekYFWQswB-V6R60uWuA5X6ZCbn7A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/4] php: actually enable openssl
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
X-List-Received-Date: Tue, 04 Sep 2018 23:52:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018 at 2:13 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Jul 3, 2018 at 2:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On 7/3/18 2:20 AM, Ross Burton wrote:
> >> The PHP recipe depends on OpenSSL but support is disabled unless you pass
> >> --with-openssl.
> >
> > perhaps its better to turn it into a PACKAGECONFIG option while you are
> > at it
>
> It looks like both versions of this patch got merged... so there's
> currently an unconditional --with-openssl in EXTRA_OECONF and a
> PACKAGECONFIG option too.

yikes. got lost in v1 and v2, thanks for pointing out. I have reverted it
in kraj/master

>
> >>
> >> Signed-off-by: Ross Burton <ross.burton@intel.com>
> >> ---
> >>  meta-oe/recipes-devtools/php/php.inc | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> >> index f262d60d15..258b20e68c 100644
> >> --- a/meta-oe/recipes-devtools/php/php.inc
> >> +++ b/meta-oe/recipes-devtools/php/php.inc
> >> @@ -57,7 +57,7 @@ EXTRA_OECONF = "--enable-mbstring \
> >>                  --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
> >>                  ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
> >>                  ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
> >> -                ${COMMON_EXTRA_OECONF} \
> >> +                ${COMMON_EXTRA_OECONF} --with-openssl \
> >>  "
> >>
> >>  CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=yes ac_cv_lib_dl_dlopen=yes"
> >>
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >


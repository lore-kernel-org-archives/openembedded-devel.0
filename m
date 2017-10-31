Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 353536AC00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 19:08:09 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n14so6272pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 12:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P1WrJuOwTyWpjI8VkjSZsk7SkQKQ6Z1GVnZ7/iuZmx4=;
	b=L/FfJs9X1XRgL8xqCg3KPV0M9RvpofutBHWh9IU6c8RwV5m7U1R4waPrV67xprk9SR
	xSt7/MGOgGvWJOYVzK+mamT7YY9AvexA84yq1jBMiu/uFadDyu+7deB5w7q2JHmF8fiW
	VD6tijp8IdztmkR3ETIjxU8fGXyszHldMlCZKSDhqzgiPrZvwF3WNeodKp3Dwmd7crBm
	gUsvbeM/6fMvg44joyXHoSff/S646SUdB/LleoenuVeoh1P4gycc8/SNBGPNBQOCgL3+
	96ANT+FESwty1+/ENI/ZtNGummwZjaW4mBavQ+VR8iyMhDnBTHfRLBiqXHYK/4h752pZ
	M5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P1WrJuOwTyWpjI8VkjSZsk7SkQKQ6Z1GVnZ7/iuZmx4=;
	b=TCllxaE1USdC/XFfFVkdcNynuABGMpYFbnCaivdXwVhhiyKkM14CYVUEfR65hM+K+h
	dupX7+sUnZ5+1infvGobAIy2XPsWod+GAPgCZMq8qTSzpBuhnxs9AEgrrfDs9XRL0qRC
	Aaul5KwAA9GS0qxAR3asClTuFeQz6sSPmgxQMRbWAaJynVApCGV3kAoA7SI6s2UmsAaI
	ys7zMpiU8C2KkE4pO0yX4Xg8Vt+GLMYRNjmJPbxw79iIvfL8dfy9sQXJWHaW/MWafZqf
	uM9oi0mEIECDHuAJ0RBZqfM0sZx0XikWkqvA/IK5tniaKgiR6iwnqi2XPTiNk0SiW8uX
	vVzw==
X-Gm-Message-State: AMCzsaWtvmWaiYaFvbE+MpfOFpzjIW1sYrUecFfjNKAqCu0ysbHS+sb2
	17750jCZax/3k6o2PbT33nQLaPoRaV4uqd2r8uU=
X-Google-Smtp-Source: ABhQp+TRKrr9qC5npSx/oLRpndbApbdLXhPklMYPeBpYeZubQ0171x6z3D8lE+a+b54voY0Wj/vMNmh0m3I4r2pMxDw=
X-Received: by 10.98.150.149 with SMTP id s21mr3052139pfk.151.1509476891191;
	Tue, 31 Oct 2017 12:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20171030173213.16752-1-fabio.berton@ossystems.com.br>
	<CAMKF1spzjAV6Qd6MDa7M5a=-rse+2nOZoHWoaAp=3ORhQHPrzA@mail.gmail.com>
	<CAAPZna2QXiR0NiTkpA-2of4jEa+P6OrQ06W6MzVsFgvv_3iyQA@mail.gmail.com>
In-Reply-To: <CAAPZna2QXiR0NiTkpA-2of4jEa+P6OrQ06W6MzVsFgvv_3iyQA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Oct 2017 19:07:59 +0000
Message-ID: <CAMKF1sp09fUtdT4Wn=CjJ2s4cRs2+38zKQNxkh=XupboXKiy8w@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] arptables: Fix do_install task
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
X-List-Received-Date: Tue, 31 Oct 2017 19:08:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 31, 2017 at 4:24 AM Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> Hi Khem,
>
> do_compile task uses these EXTRA_OEMAKE variables too.
>

Yes, however the question is do we use DESTDIR when compiling

>
> On Mon, Oct 30, 2017 at 9:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mon, Oct 30, 2017 at 10:32 AM, Fabio Berton
>> <fabio.berton@ossystems.com.br> wrote:
>> > We need to set DESTDIR variable and run eo_runmake install to install
>> all
>>                                                                         ^^
>> typo
>>
>> > arptables files. Without this the only file installed in package is
>> > systemd unit.
>> >
>> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> > ---
>> >  meta-networking/recipes-support/arptables/arptables_git.bb | 5 +++--
>> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb
>> b/meta-networking/recipes-support/arptables/arptables_git.bb
>> > index 274a55d91..55903e450 100644
>> > --- a/meta-networking/recipes-support/arptables/arptables_git.bb
>> > +++ b/meta-networking/recipes-support/arptables/arptables_git.bb
>> > @@ -21,9 +21,10 @@ SYSTEMD_SERVICE_${PN} = "arptables.service"
>> >
>> >  inherit systemd
>> >
>> > -EXTRA_OEMAKE = "'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
>> > +EXTRA_OEMAKE += "'DESTDIR=${D}' 'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
>> >
>>
>> if its needed just during install then we could pass it directly in
>> oe_runmake in do_install below
>>
>> > -do_install_append() {
>> > +do_install() {
>> > +    oe_runmake install
>> >      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
>> 'false', d)}; then
>> >          install -d ${D}${systemd_unitdir}/system
>> >          install -m 644 ${WORKDIR}/arptables.service
>> ${D}${systemd_unitdir}/system
>> > --
>> > 2.14.2
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>


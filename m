Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id D534C6003C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2018 18:37:38 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id w6so5827403pgl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2018 10:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kwbjCZnb9J1T6B0thWO+C3bOmNguzV5iqgc7PMp2gkg=;
	b=E8V7ByskKl+jvUsq9qKDog0j0fwMeRdG6ghkygCVmJHFXqZTJmcR9dR1yG4gSqST2k
	xbzA7ZE7txzmx9P7xRig2hshfEpugF7nyu/7vPs6RqqoiB2KB9YsRSTKe/gJ8CGXnd7f
	4LBng9VCcF1nEAeMpkQeEeqJwGriw/Qbw33uPwgBdQuppGEDM4NlVrBzG64407tQYzff
	ZggwRARFbxr4wNj4D6KurQQAhHfWQ+w5GAt4Lhsp88/FzSsTYW4zbQup0byCY/xgqWnW
	dqcQJKnbISWK/WAg3+O6BSM+VS0a48jVsSz1Nz8sFBIM4OIYGqUAIXi/CKmSXgVk2SGH
	KL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kwbjCZnb9J1T6B0thWO+C3bOmNguzV5iqgc7PMp2gkg=;
	b=JTPTNx1FVwqGcj9s/89aqykn6l68rXSZCtl4dgyTxv8OPQq14LzyUJoLvRAFCqUkPE
	xFZ9JI9e3JmRNkkzE94Yjm9Q6jZ9M7Dv4C9jjrp7pN+WFosU0GtZek3gYzYfhBFqbpKn
	3r7VhFyIf5krvc8n6ov20Kr0VgfBCfnoxcRy3sU47OTOltE4/i1Tn3+N03TRaeTAQt82
	i2e1x/xJmqcMaPgm0hnvzteHlwzZqSkUgltTmVmhQjdV2OabnapnOZxf7oj2wOEEqZMj
	wfm7MYvPGPN2buKRhgkaKM/DUeJIEcJ09Q+Qz0G7jcdcTV1vGSLzhUiT4QIE+XlQRpwy
	IVJg==
X-Gm-Message-State: AJcUukfBMj6R7Gd3L4kSEkJMuoDrUBCFFfBZHlLWXxVSpi5Sz8xLH1jq
	EtQaxsyvA1UDeKQf/qbe0gV0iF620qn+wL9taxcB1A==
X-Google-Smtp-Source: AFSGD/WcfapNil7LBTofBR8mOze+uH1VZ8ai3NqLj85kNA7P8XmRA6AYaX3C10IJ/Z3viSCHqM+4vy+Ee0s/3Q5pvp4=
X-Received: by 2002:a62:13c3:: with SMTP id 64mr14003329pft.93.1545676659740; 
	Mon, 24 Dec 2018 10:37:39 -0800 (PST)
MIME-Version: 1.0
References: <1545553483-17422-1-git-send-email-ankit.tarot@gmail.com>
	<2ae1112d-2917-dca0-4656-aa692dce6e27@reto-schneider.ch>
	<CAM_RqkNmUh=9cf7WYPFZ1n0kOkLqpgXOfUeAK0haQ9WzsVBEbA@mail.gmail.com>
In-Reply-To: <CAM_RqkNmUh=9cf7WYPFZ1n0kOkLqpgXOfUeAK0haQ9WzsVBEbA@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Tue, 25 Dec 2018 00:07:28 +0530
Message-ID: <CAM_RqkPFVdvn31T-FCmrXH0KtRNxxUqYVDp74T05=qkgsr-n3A@mail.gmail.com>
To: Reto Schneider <code@reto-schneider.ch>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] wifi-test-suite: Initial recipe for wifi test suite.
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
X-List-Received-Date: Mon, 24 Dec 2018 18:37:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 24, 2018 at 10:31 PM Ankit Navik <ankit.tarot@gmail.com> wrote:

> Hi Schneider,
> Thank you for your valuable feedback.
>
> On Sun, Dec 23, 2018 at 9:52 PM Reto Schneider <code@reto-schneider.ch>
> wrote:
>
>> On 12/23/18 9:24 AM, Ankit Navik wrote:
>> > Add generic recipe for wifi test suite from wifi alliance.
>> > Suite is to support certification program development and device
>> certification.
>>
>> I did pretty much the same a few weeks ago [1] for a MIPS/musl based IoT
>> gateway [2] (DUT).
>>
>> What I learned:
>>  - You will need some patches for the makefiles [3]
>>
>
> You patch got failed when I tried to compile using
> bitbake wifi-test-suite -c compile -f
> CC ?= gcc --> I think, this is not required.
> It is better to use as implicit variable itself.
>

Sorry my bad, your patch is working. It was my mistake.

>
>  - When using musl, you will need something like this (parts of it) [4] too
>>  - If you are using the Busybox utils, those scripts will not work an
>> need to be adapted. Our Testhouse did do this for us, so I do not know
>> exactly what changes where needed.
>>
>> Let me check this and other comments as well.
>
> Regards, Ankit
>
>
>> > +do_compile () {
>> > +     oe_runmake
>> > +}
>>
>> Pretty sure this is not needed. My recipe at least does have this.
>>
>> > +do_install () {
>> > +     install -d ${D}${libdir}
>> > +     install -m 0644 ${S}/lib/libwfa.a ${D}${libdir}
>> > +     install -m 0644 ${S}/lib/libwfa_ca.a ${D}${libdir}
>> > +     install -m 0644 ${S}/lib/libwfa_dut.a ${D}${libdir}
>>
>> I do not think that you need the static libraries.
>>
>> > +     install -d ${D}${sbindir}
>> > +     install -m 0755 ${S}/dut/wfa_dut ${D}${sbindir}
>> > +     install -m 0755 ${S}/ca/wfa_ca ${D}${sbindir}
>> > +     install -m 0755 ${S}/WTGService/WTG ${D}${sbindir}
>> > +     install -m 0755 ${S}/console_src/wfa_con ${D}${sbindir}
>> > +# Test scripts
>> > +     install -m 0644 ${S}/scripts/getipconfig.sh ${D}${sbindir} # Must
>> copy
>>
>> They have hard coded the path to this script [5][6]. You will need to
>> fix the installation location or their C code.
>>
>> > +     install -m 0644 ${S}/scripts/arp_neigh_loop ${D}${sbindir}
>> > +     install -m 0644 ${S}/scripts/dev_send_frame ${D}${sbindir}
>> > +     install -m 0644 ${S}/scripts/findprocess.sh ${D}${sbindir}
>> > +     install -m 0644 ${S}/scripts/getpid.sh ${D}${sbindir}
>> > +     install -m 0644 ${S}/scripts/getpstats.sh ${D}${sbindir}
>> > +     install -m 0644 ${S}/scripts/gpstats.sh ${D}${sbindir}
>> > +     install -m 0644 ${S}/scripts/sta_reset_parm ${D}${sbindir}
>> > +     install -m 0644 ${S}/scripts/stoping.sh ${D}${sbindir}
>> > +     install -m 0644 ${S}/scripts/updatepid.sh ${D}${sbindir}
>> > +     install -m 0644 ${S}/scripts/wfaping6.sh ${D}${sbindir}
>> > +     install -m 0644 ${S}/scripts/wfaping.sh ${D}${sbindir}
>> > +     install -m 0644 ${S}/scripts/wfa_test_cli.sh ${D}${sbindir}
>> > +}
>>
>> How about "install -m 0755 -D ${S}/scripts/*.sh ${D}${bindir}" for the
>> scripts?
>>
>> [1]
>>
>> https://github.com/husqvarnagroup/smart-garden-gateway-yocto-meta-gardena/blob/master/recipes-wifi-alliance/wifi-testsuite/wifi-testsuite_git.bb
>> [2] https://github.com/husqvarnagroup/smart-garden-gateway-public
>> [3] https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/pull/42
>> [4]
>>
>> https://github.com/husqvarnagroup/smart-garden-gateway-wifi-alliance-test-suite/compare/eb2799fbc28a2e5b309e2e85d0fa0b8e9cd0d100...master
>> [5]
>>
>> https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/blob/master/lib/wfa_cs.c#L322
>> [6]
>>
>> https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/blob/master/lib/wfa_cs.c#L2118
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>


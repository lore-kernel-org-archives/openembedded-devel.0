Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 62EB27F385
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 09:27:30 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id i11so1570761edq.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 02:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m0UM+o7SqfTWv8/jS4Pe4EtE/3guEFut1XIrdlEgar8=;
	b=da05l6K7zqC4iRMO4Dnw2YX4snWVp4MV+Tn/jFW1CzBOcGcAjqJEHT5bIPL0AQfjC7
	d4RTKT8t+8QIgC1hutPTI0M8MlVplsNlljH36Qvl/0QguWG4Pj4LG/0BqX5VjJdLquhF
	W06IkZPEKKPikUenrQc/25ln+ZLk3BQdbIu9vo4dYP/26T9OFa9L5FOSC/IErmWOWH58
	bNVlhLD7w7d90kitydPxJ11OKkCDQOKPNPluUYCv1zGPQBq3ui1j79dydiGjw1h/Oc3O
	cY0jEHhgfbSz036rzRFZKhUr4IyYHgTCYQZDhRXJCf+XI5I84OQxPPVt/TWhv6CqlKpN
	SyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m0UM+o7SqfTWv8/jS4Pe4EtE/3guEFut1XIrdlEgar8=;
	b=D8UUbaFgSjP5vVhTRoEF4/Q/7Tbkf5PdgUg0/gqgOS9Z73FQvhpBYH7GSDWxNcDJER
	355s+/CB6j7G++NhDXNlqKk9apCHYAVY9c0VB6QZp4yuqKPMDqaUFjpUlYCvdg1GTKD6
	UjLz3YP9u+MQgiRyHXjW3N/RMjRP/UDq3Xob4KAzJqFeXgGGWccrqX56bjzWXXkFUgD5
	ALph7bRd3eH+jOcmXoRAUAqvQHYuWaNBDP3/7+zUIhRubpSN2O5tyATUCRbn5rSl95cB
	FEPa5X84vBD6q+R/i/0MruWXpknY7xlBFwfwWThWszuwZSHMrJLEr9oXqHbizgQFsUmE
	p70w==
X-Gm-Message-State: APjAAAVQUhJUTNZbzDvDvvQxOEc1ue+mQG7ZfgYAMVhG+JULBONP48mN
	RViyXligRuReQ43DIQvYy3Us/4rmSpjMT+U3zNA=
X-Google-Smtp-Source: APXvYqyjHU5ZkG6gy7xHv0nDtuAaW78S6o2rGcUWjQHb+8FbAZKuxaOs0UpoYTh99phFCM+VnbJSgyea33VhhIMEdTw=
X-Received: by 2002:a17:906:6a87:: with SMTP id
	p7mr22011864ejr.277.1564565249852; 
	Wed, 31 Jul 2019 02:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190730185545.20310-1-Martin.Jansa@gmail.com>
	<CANx9H-AjC3VrqsDj3m1KAOOChaHhYFVDvd7K_6QudYujXfP5+Q@mail.gmail.com>
In-Reply-To: <CANx9H-AjC3VrqsDj3m1KAOOChaHhYFVDvd7K_6QudYujXfP5+Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 31 Jul 2019 11:27:20 +0200
Message-ID: <CA+chaQf4FU8dztgEPAZF4cm70XimtTwVpC8eF3tmZAPxcR9c1w@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libdbi-perl: prevent native libdbi-perl depending on target perl
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
X-List-Received-Date: Wed, 31 Jul 2019 09:27:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is the only one with this behavior in the layers I have in LuneOS
builds, see:
http://jenkins.nas-admin.org/job/LuneOS/view/unstable/job/luneos-unstable_w=
orkspace-compare-signatures/56/console

I don't remember seeing it before perl-cross change, but there were quite a
few issues before so it's possible I've overlooked it before, it's not in
this jenkins job for warrior:
http://jenkins.nas-admin.org/job/LuneOS/view/testing/job/luneos-testing_wor=
kspace-compare-signatures/144/console
but that's because my fix was merged in warrior and your revert wasn't.


On Wed, Jul 31, 2019 at 5:40 AM Tim Orling <ticotimo@gmail.com> wrote:

> Sorry for clobbering this change previously. I hadn=E2=80=99t seen the co=
mmit
> message about the error and I meant to send an email to open up discussio=
n
> once I saw it (randomly)...we discussed it in the bug triage meeting and =
a
> weekly engineering sync meeting.
>
> I do wonder why this is needed (which is why I naively dropped it), or
> better said why other Perl modules are not affected. This feels like a fi=
x
> for an underlying problem. I would expect ALL libfoo-perl recipes to have
> the same behavior. Bitbake is supposed to be smart enough to handle
> RDEPENDS properly for native recipes.
>
> Have you only seen it on this package because of usage, or is it special
> in some way? Did it affect releases before the perl-cross change when we
> moved to perl 5.28.0? Trying to sleuth out the underlying cause...otherwi=
se
> we need a sweeping change for all other native perl module recipes...
>
> On Tue, Jul 30, 2019 at 11:56 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> From: Martin Jansa <martin.jansa@gmail.com>
>>
>> * detected with:
>>   openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=3Dtmp-glibc
>> --machines=3D"qemux86 qemux86copy qemuarm" --targets=3D"libdbi-perl-nati=
ve"
>> --analyze
>>   ...
>>   ERROR: libdbi-perl-native different signature for task
>> do_populate_sysroot.sigdata between qemux86 and qemuarm
>>   Hash for dependent task perl-sanity/perl_5.28.2.bb.do_populate_sysroot
>> changed from
>> 00c0f30e40a144255fc3054e9a71ce73170a89832318774bd2a8fc5e8dcd20ad to
>> e22ff8375c4ee6bda646dae8a1d6b1ddeb6d373678fc036fdc406e91a026b497
>>
>> * it was already merged in:
>>
>> http://git.openembedded.org/meta-openembedded/commit/?id=3Dd98e62e64219b=
365063fdb299d35f2af999d8f6e
>>   and then silently reverted in:
>>
>> http://git.openembedded.org/meta-openembedded/commit/?id=3D784285981b1ce=
9825575981f2b60e2b286251283
>>   see:
>>
>> http://lists.openembedded.org/pipermail/openembedded-devel/2019-July/200=
676.html
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
>> b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
>> index 77991bd158..91f94a1aa0 100644
>> --- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
>> +++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
>> @@ -27,7 +27,7 @@ do_install_prepend() {
>>         rm -rf ${B}/t/z*.t
>>  }
>>
>> -RDEPENDS_${PN} =3D " \
>> +RDEPENDS_${PN}_class-target =3D " \
>>      perl-module-carp \
>>      perl-module-exporter \
>>      perl-module-exporter-heavy \
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>


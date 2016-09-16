Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0AC6FFFB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 12:10:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b187so3446259wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 05:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JVMmOp1Yy2CtF1lW/c1u9BvIV0xor039BRGuEIwJyWQ=;
	b=VpM9KlE4AqWEIITjPr2Ew00TtjLq+MFlDzmwY8m8xztvEkwmw7+SLhygeUpqPN5OpB
	kPTHYSqyEUWifzmCBFu0bBHJQNL48d1k1dVrwNIBRYQ7wdFSpN6cpyPsCelMkI9BlM8A
	SWhSU3Fj5h5Ao80wP5IfMnUI1+G8TH9S5Xebk9k9wG2HhlLZh0s1yTKDTt8bbyH39yly
	Ll9o8MYg7Pwp+9oxYZbd58Qse9KqYYIvfpCtZ5bDSvot+hZs3nbr5h5y+v/yA7jWpuux
	klBrnGH4mWSun/gAQ0TfqpS8hJvt339Hb476iQm3syp19a8Am+Sv3GEBzl2o5aSwcgnv
	baTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JVMmOp1Yy2CtF1lW/c1u9BvIV0xor039BRGuEIwJyWQ=;
	b=HaWx63YbJC4UcUaevDjANG8I4mIW/3xg5fkIGUN2ALfZwiKIKEREdXb7txwUfZzSos
	uda4jrinxXH0BJEPZouZ3G2O/VhrZzkfm2pbnMyExMb/2Nvav4EmOSgWmV3RDChySOxk
	GeHCvsP1JfdQU/PAq/7q/3xpeoVliZOnfTSZRQ2l//v0ChFzESqdlavyKspOCUt/Q/Rb
	q2kBO2TqLThqZHxhjQiI05boWqy9LXJZpbEmpK6Z6U+0zX0uddrbtHKkqM4LnWyMAaoN
	CICWGUnhlxVgehfXb4h1bdO9Fqun+f+jTNdpybfQLI+jqL/Ro4Szh846bqCVevGv4V3y
	abyA==
X-Gm-Message-State: AE9vXwPt47lDsKtFR7PhdlKE7/9+7Hy4Yhvj2OS2zuNaL+l0K4ps4ut/dkEEce0r6mr4V1nlGrIRpWYZ/V6mvQ==
X-Received: by 10.28.173.205 with SMTP id w196mr8030786wme.86.1474027821094;
	Fri, 16 Sep 2016 05:10:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.140.2 with HTTP; Fri, 16 Sep 2016 05:10:20 -0700 (PDT)
In-Reply-To: <20160916085050.GA27969@mbabyjoh-desk.ger.corp.intel.com>
References: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
	<1472730043-31245-5-git-send-email-maxin.john@intel.com>
	<12285709.EfYBoYq9CT@peggleto-mobl.ger.corp.intel.com>
	<1649463.EYVuLskMBZ@peggleto-mobl.ger.corp.intel.com>
	<20160916085050.GA27969@mbabyjoh-desk.ger.corp.intel.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 16 Sep 2016 14:10:20 +0200
Message-ID: <CAAQYJAtf4ixqfk+0Xk2z7jSHE8=b3GWW1m=Viw8Qnu_1ZMCFSQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 4/4] tslib: move recipe from oe-core
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
X-List-Received-Date: Fri, 16 Sep 2016 12:10:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 16, 2016 at 10:50 AM, Maxin B. John <maxin.john@intel.com> wrote:
> Hi Paul,
>
> On Fri, Sep 16, 2016 at 10:19:50AM +1200, Paul Eggleton wrote:
>> On Fri, 16 Sep 2016 10:17:11 Paul Eggleton wrote:
>> > On Thu, 01 Sep 2016 14:40:43 Maxin B. John wrote:
>> > > Move tslib recipe from oe-core layer.
>> > >
>> > > Signed-off-by: Maxin B. John <maxin.john@intel.com>
>> > > ---
>> > >
>> > >  meta-gpe/recipes-graphics/tslib/tslib/ts.conf  | 25 ++++++++++++
>> > >  meta-gpe/recipes-graphics/tslib/tslib/tslib.sh |  8 ++++
>> > >  meta-gpe/recipes-graphics/tslib/tslib_1.1.bb   | 53
>> > >
>
> Apparently I missed to notice some replies to these patches (recently
> my inbox has been behaving a bit strangely - missing or delaying some mails
> for a day or two). Sorry for that!
>
>> Also, is meta-gpe really an appropriate place for this?
>>
> I am open to suggestions. xtscal had HOMEPAGE set as "http://gpe.linuxtogo.org".
> Since other packages were logically connected to that, moved them to meta-gpe
> as well.

Hi,

meta-gpe is almost empty..time to merge it down in one other
generic/middleware layer?
Plus there are other recipes depending on tslib as for example zaurusd
(meta-handheld).

Now, where to put stuff like this tslib?
To avoid the creation of another one I'd say we could start putting
things in meta-oe.
Well, there is still one drawback...the 'custom' xserver-nodm-init is
still present but there are patches on the ML for its removal.

Opinions?

Cheers
Andrea

>
>> Cheers,
>> Paul
>
> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


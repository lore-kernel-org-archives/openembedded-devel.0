Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id E106A6C510
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 14:18:31 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id k198so5960848wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 06:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Eq0kgTqYHK33YAJ6Ebch8cmF5ojV05GFEPgEF1U1sBg=;
	b=FrbhuWDyGJljQb2pkHfUgRIRjJyELgyXa25Yu6rcQKZNLsemYVjBvKsQKhgp2Z10uv
	c0L56BLGopk54DswZR5HqFC3Bpo7nO0UECWRGrh4f8G/XWC6iIrNN1bVPDsg+TwlDFxO
	M0y3rQLl2pcyTQ/FFBNO0cBwOq5Z+HBTtwdrRFTjStOrbQXNN14RnO/K39vnHaKU7upH
	Cu52M0nzWuhu4JmeJRiA2pLM2KQEJgrwrBSC3dJln4ixk2xMQmt1PEXGhBW3XTBM1hEq
	7f6VW+GfBDxQonLWrsqmRvEeJNNpr6yozPEH4wtWv2IcFyALu+BAsuPwGF5Sz56O0fPq
	zqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Eq0kgTqYHK33YAJ6Ebch8cmF5ojV05GFEPgEF1U1sBg=;
	b=b9PRTcaPvM4BQW7wMTi/beiImXPepZzYCzkvWRBbdDIfqDkSWmBwJyQeNGnwCNufYq
	Oob9Do9rFysyl/kNFWME0sSlkyYZckAZcdyfGvb03QyNWmgkEYDoyCzpieh+bh3Sv4JV
	IaBEVSamsmXo8OmovUJOjOCK9YQ2f3doJmYLa9EL06yqa8rKiRXkcDm7bmmKxYsUSI2u
	FPNZiUeyZjFmbFoNvCbFvlrvkdkfR2odHmpuinmkycpg0KEr7HKkiQiQAsCMdrv/lWh1
	l63Mv21Cs3KCw/Cz3N5Xa+dplKEYab0HoE2+w4QQl0/vks1RWVaGNtmIf28+iWd2tz8T
	aQcw==
X-Gm-Message-State: AA+aEWbhQACsVigUrx72k1agxN7+cJ+AwqohwNxQvyIalyy+aZpmUczd
	LP6JtFC9Uhe5eMykeUhm8ndutas6O8eGkCq3Xfw=
X-Google-Smtp-Source: AFSGD/U06O1m+hSH4klv4sINxxkHuZBKKog0ny4RITrEelBg0MwMV3jTWEuV6430MLqf1kZbmYwSNvMtCIJ00ZVIDsI=
X-Received: by 2002:a1c:4485:: with SMTP id r127mr6248049wma.50.1542809911413; 
	Wed, 21 Nov 2018 06:18:31 -0800 (PST)
MIME-Version: 1.0
References: <1542148831-30197-1-git-send-email-akuster808@gmail.com>
	<CA+chaQfCoBFsOzLj6Vdf2tFX4hebD4bpqdXOMU4JstMScnJrBQ@mail.gmail.com>
	<9c0a4188-2393-aa18-6139-d6600d2507f7@gmail.com>
	<20181114151723.GA1417@jama>
	<e9b230a1-7544-f54c-c74c-02900bd15ac3@gmail.com>
	<CADfgfoZt=B2-3JMCdUvNvQdGvtOQYsPvypNB4TU0VXPxQ6sSaQ@mail.gmail.com>
	<CAMKF1srPp_W_e6ospFUzjNN1d5L6OKUExCZtxV07hU1jqO=7Vw@mail.gmail.com>
	<CA+chaQd_7P1utSGnhP6VPDSaZ_DP9gNhNx6x6TvzVVWakwXL4w@mail.gmail.com>
In-Reply-To: <CA+chaQd_7P1utSGnhP6VPDSaZ_DP9gNhNx6x6TvzVVWakwXL4w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Nov 2018 15:18:22 +0100
Message-ID: <CA+chaQcWFxnFZDUpxS1zsi7RCRwXecZBqCvxqj6G2tThSpZfxg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meta-oe: add selftest for sources.oe.org
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
X-List-Received-Date: Wed, 21 Nov 2018 14:18:32 -0000
Content-Type: text/plain; charset="UTF-8"

I've fixed known_hosts on abaco and some archives were finally rsynced:
http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-rsync/481/console

but it doesn't seem to cover all found issues, please re-run the test to
see what's left.


On Tue, Nov 20, 2018 at 9:07 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> The jenkins job which does the rsync (or at least how I was doing it), is
> still failing as reported before:
>
> http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-rsync/480/console
>
> Either you're using something else now, or it still won't work.
>
> Regards,
>
> On Mon, Nov 19, 2018 at 9:18 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> Thanks Michael for taking care of it
>>
>> On Mon, Nov 19, 2018 at 12:02 PM Michael Halstead <
>> mhalstead@linuxfoundation.org> wrote:
>>
>> > The rsync target on on the world build machine was offline following a
>> > reboot causing the sync to sources.oe.org to fail. The rsync target is
>> now
>> > configured to be available following reboots and the sync has run.
>> Please
>> > let me know if this test still fails.
>> >
>> > On Wed, Nov 14, 2018 at 8:19 AM akuster808 <akuster808@gmail.com>
>> wrote:
>> >
>> > > --
>> > > _______________________________________________
>> > > Openembedded-devel mailing list
>> > > Openembedded-devel@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>


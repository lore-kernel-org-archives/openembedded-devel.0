Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 418 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Jul 2017 09:27:42 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.194])
	by mail.openembedded.org (Postfix) with ESMTP id ED5717199A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 09:27:42 +0000 (UTC)
Received: from [216.82.242.35] by server-2.bemta-8.messagelabs.com id
	D8/0A-02004-9E643695; Mon, 10 Jul 2017 09:20:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRWlGSWpSXmKPExsXi5LtOQPelW3K
	kwaelShYXDy9ltmi7PovRgclj56y77B7nNq5gDGCKYs3MS8qvSGDNOHn1EVvBK8aKBfeusDQw
	HmLsYuTiEBJYxSjR/m0uC4SzmFFi34G1QBlODmGBdInbl0+wgdgiAn4Sq3/uYgWxhQSSJGY/7
	AerYRPQk5h86QkziM0rYC1x6v8UFhCbRUBVYt++fiYQW1QgXKL3QD8bRI2gxMmZT8BqOAXMJa
	Z3HAKzmQUsJGbOP88IYYtL3HoynwnClpfY/nYOM8ReFYmDSy+D1UgAxTdtPssOYZtIXLy6mw3
	CNpT4PusbC4QtLbG3byHzBEbhWUhWz0KybhaSdbOQrFvAyLKKUaM4tagstUjX0FQvqSgzPaMk
	NzEzR9fQwEIvN7W4ODE9NScxqVgvOT93EyMwKuoZGBh3MB547n6IUZKDSUmUV6w3IVKILyk/p
	TIjsTgjvqg0J7X4EKMMB4eSBG+Ta3KkkGBRanpqRVpmDjA+YdISHDxKIryhYkBp3uKCxNzizH
	SI1ClGXY6mD1u+MAmx5OXnpUqJ814AmSEAUpRRmgc3ApYqLjHKSgnzMjIwMAjxFKQW5WaWoMq
	/YhTnYFQS5r0NMoUnM68EbtMroCOYgI5gq0sAOaIkESEl1cCYvefm5aiE15P2+K98lp/zZ3Ug
	b5/Hl+5+Nun5POrPs1N8tv5JZWS2SDSIynj84GfdAw5lyQhxI6GPfqU+W+c+LnFKEvC6KjyHq
	epV56yf9YZ7LkVL16yYLMliVXv4/nyhq1vWPVTY0cL+Qu/F940Rmz9xz3qxN79OvuGEjHOAxY
	bAzg3/PmxUYinOSDTUYi4qTgQAraepVhADAAA=
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-7.tower-75.messagelabs.com!1499678441!48621930!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 131281 invoked from network); 10 Jul 2017 09:20:41 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-7.tower-75.messagelabs.com with SMTP;
	10 Jul 2017 09:20:41 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.351.0;
	Mon, 10 Jul 2017 04:20:38 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.351.0;
	Mon, 10 Jul 2017 11:20:35 +0200
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20170322184533.6501-1-raj.khem@gmail.com>
	<20170322184533.6501-6-raj.khem@gmail.com>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <f8b92a86-be2b-0501-8311-292fc521fa22@digi.com>
Date: Mon, 10 Jul 2017 11:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170322184533.6501-6-raj.khem@gmail.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: Re: [meta-oe][PATCH 06/10] libndp: Include sys/select.h in ndptool.c (backport to Morty)
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
X-List-Received-Date: Mon, 10 Jul 2017 09:27:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is also failing in Yocto 2.2 Morty.

And the fix is just a cherry-pick away:

git cherry-pick 9cd2b3fe97b2b041d293941207c54909f0206f3d

Could someone with the proper rights, do the backport to Morty?

-- 
Thanks,

Javier Viguera


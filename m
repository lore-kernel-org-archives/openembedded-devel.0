Return-Path: <armccurdy@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1B06F0E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 05:33:10 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id x13so24709389qcv.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 21:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=lW5X1M0Ubz4SK+I8GuDuEYBzRAeqCep4VF1riova7IA=;
	b=BcbIhUpKtydHTHodYD8ZNPV3ae2lOoq7QstRDa8WJbkRDUhS5CSmIdq2GO4u+e7HFu
	ETsUvZT8RGmFjbaMWAOW8efG6o8djvrp62cO8njGGKKFaZtrBLEWv7KzabW2kXv/ZHxD
	UmXnRZExf3EU0IDLmWq/pn/Gc1Tw+TSHPHc1z/omHEY6YyZNKm1BtMi7LUVcvftLpAOv
	DyRq+9KWyVP83vHgrfNoTieQRf781mrslfCMapFRgVGpDUUSSaPZxsro1PNyEOfkNlz/
	5f5qHvGvu9B7qE4uA1Ny5TF/4CE7b3XT93Fkl0+jqI8EBlPZZMOXBnk52q4UOL2P9FgX
	hlKw==
MIME-Version: 1.0
X-Received: by 10.229.119.73 with SMTP id y9mr7800233qcq.18.1392701591023;
	Mon, 17 Feb 2014 21:33:11 -0800 (PST)
Received: by 10.96.5.70 with HTTP; Mon, 17 Feb 2014 21:33:10 -0800 (PST)
In-Reply-To: <20140217230307.GE4067@jama>
References: <CAP71Wjy4dxnDZFb3x_5zPg5HV-VOakeYtFz+8o0h2xk08R1=zQ@mail.gmail.com>
	<20140217214623.GU22890@denix.org> <20140217230307.GE4067@jama>
Date: Mon, 17 Feb 2014 21:33:10 -0800
Message-ID: <CAJ86T=XEkEEMn-Tu=Ja4-1C5o=Ur7LdnsoN-RYskz_W_V0t2Rw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] why does Qt5 build with ARM_INSTRUCTION_SET = "arm"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Feb 2014 05:33:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 17, 2014 at 3:03 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Feb 17, 2014 at 04:46:23PM -0500, Denys Dmytriyenko wrote:
>> On Mon, Feb 17, 2014 at 02:27:51PM -0700, Nicolas Dechesne wrote:
>> > hi,
>> >
>> > does anybody know why in Qt5/qtbase.inc, we have:
>> >
>> > ARM_INSTRUCTION_SET = "arm"
>> >
>> > Could it be an a low hanging fruit from the past? e.g. before
>> > https://bugreports.qt-project.org/browse/QTBUG-16402 or
>> > https://qt.gitorious.org/qt/qtbase/commit/a3bd9d4c0f3d9e80dbe35bd88649b245dca5f410?
>>
>> Hmm, I would assume that's here from 4.8 days, although I haven't tried
>> dropping that line for latest Qt5... Would make sense to do some more testing.
>>
>> > as a matter of fact, for our project Qt5 (and QtWebkit) are building
>> > (and working fine) when built with Thumb2, outside of OE. Also using
>> > ARM instruction set instead of Thumb2 enforces Webkit to use the ARM
>> > version of the javascript JIT, while the Thumb2 JIT engine seems to
>> > work a lot better in our testing...
>>
>> Seems like worth the effort to re-test the need for that setting. Unless
>> someone else has tried it already and found out the issue is still there
>
> IIRC it was failing to build for armv4t (at least with 5.0.0) if someone
> tests that armv4t builds with 5.2.*, I'll accept the patch.

With ARM_INSTRUCTION_SET forced to thumb I'm able to build qtbase
5.1.1 and 5.2.1 tuned for both armv4t and cortexa9thf-neon.

Andre
--


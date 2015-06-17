Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id C1BEA65C63
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 14:36:16 +0000 (UTC)
Received: by padev16 with SMTP id ev16so37482582pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=FeU02V1s2haOHtRhDXWuEv8thi8gpyINTXvGWRDdRTQ=;
	b=ED1byAsqjy65o0qeZbc+gWgG/puPTMKHvyt6sSUPBDWy4lAOHQUfjUa5Ae9N0NYFbP
	ptIS7R8uU9BKvjqm4Wv3Atad1lcZ1oSS/LNum/quk5NmE5c9P+Y4kL/ZE0rfuh35Z47X
	q2/TiQ16EQgK2G+att8ppeAP+LCdR++ipTkFpVfe+cApUo0aBXSKcr54zqnLDkmHrdjI
	wyZOzjaA+GO/KwxZf/ofmA8MEvm/RB46ltahd+wR6vKeVtAgqHtHI3x3NwPJgEhUHOE+
	Ev2v6ytZK27OjC8sc5FanmBl7IRqD5Zmr20FNkX74f2qtkDOpXRkjPs0tMOhagOKu8ye
	dMKQ==
MIME-Version: 1.0
X-Received: by 10.70.127.140 with SMTP id ng12mr11659930pdb.94.1434551777554; 
	Wed, 17 Jun 2015 07:36:17 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Wed, 17 Jun 2015 07:36:17 -0700 (PDT)
Date: Wed, 17 Jun 2015 16:36:17 +0200
Message-ID: <CALbNGRSo5g0ndeQTmrKYppX6g6-KTB2CrnDjJCs=d84PxnpQPQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	Gary Thomas <gary@mlbassoc.com>
Subject: [meta-browser] firefox not working for me (only)
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
X-List-Received-Date: Wed, 17 Jun 2015 14:36:21 -0000
Content-Type: text/plain; charset=UTF-8

Hi Gary,

Turned off-topic so I opened a new thread. For those who missed the
old thread [1] in short:

for me

* firefox fails with illeagal ARM instruction
* chromium fails during start - details I can't reproduce currently


On Wed, Jun 17, 2015 at 3:32 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> Hmm - I was wondering why nobody took care.
>>
>> All my plattforms fail:
>> * i.MX6 base
>> * gumstix
>> * raspberry Pi2
>>
>> I'll put this browser issue on my TODO currently I have no further
>> time to take care.
>
>
> BTW, I just tested both chromium and firefox on the i.MX6Q and RPi2
> and they worked just fine.  Built from meta-browser:0cc0419a
>
Thanks for information. Let's focus on firefox's illegal ARM
instruction crasher:

* Last time I felt the only one facing a specific error it was caused
by angstrom enabling thumb(2) for ARM (long story @meta-fsl-arm).
Gary: I assume, you don't have thumb enabled - right?
* firefox doesn't crash with "--safe-mode"

Looking into meta-browser I saw that firefox pins ARM_INSTRUCTION_SET
= "arm" but firefox-l10n does not. When having some time left over
(=never) I will test with thumb disabled for firefox-l10n and
chromium.

Andreas

[1] http://lists.openembedded.org/pipermail/openembedded-core/2015-June/106229.html


Return-Path: <net147@gmail.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id C5CBB6014F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 12:44:52 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id x131so100279685ite.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BoHH/kuCsn+0Hz3lRaRuJOsiDlOGIaShm/j6ChfKOuw=;
	b=K7vojLM0QVzomav01i7noeSFh86uwOSPDKfgY1bj+TwQ/nA21/qGJ1Optb7D50VVO+
	kJnt/ihwnRZ+u55vDGL38yt5Bi+eqNdYBh0t9JDODxO7ZOV6LY6wZb3DPso7cUq+KhuP
	mWlJ6zKhJO7LpLDqXAK88XFcXTB6bUwEfXNilKFokrAr02qVyrloS7/KUBI3Gjc1lHc1
	98as+nj81HVuYwfiFUagaZ4WMo83Pb6IvYfcv+UKi1KzCI0sp9OcSOqkMV+vfjwBuEI8
	1i2htSR0aJkdGnSm4M2bRH8UQjVveq9xQ9XYJHqWH0Vuc5FaKTApA+a0lKnX/urijpN/
	XOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BoHH/kuCsn+0Hz3lRaRuJOsiDlOGIaShm/j6ChfKOuw=;
	b=RLmuZDcFb42Loorn+nGEZ+xFSsTNDMyRQEQURWsyv2zKHRnvr2/2surh83EqHe1dn0
	rx36Cd1ID2nILjg03KHQlZ8zSLd6bvC7EZzK/1ZimQqqBc9a5FUp+bWq9K8bieIuZaT4
	oqPXHJosXGej8pIGTp2GYzNuCc1Pot2x3OAyqssCUeTBnR6kee87wphYjHF04BD1l5yO
	xb1RO5tey/hCs00YRwHvYsftTPR97ar4dS/DUwLpT5t/U4n5z2oDxR01HYUgYxn0iqZT
	WOQekHKiy8QTWGdpLozYnYL4cFpnsvD9GiHqo6BQpyUgBIEpyGwEDe6vBPARt8TNnbvg
	hzIA==
X-Gm-Message-State: AE9vXwPSt2LiVTN6GvZCGf7svF92D7YmqOHOFpM077NxV7E9ensK+zHX6K2Ws6fIRKdyneYbQG1A7zOuqpMB7Q==
X-Received: by 10.36.236.193 with SMTP id g184mr15953632ith.20.1472474693316; 
	Mon, 29 Aug 2016 05:44:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.60.73 with HTTP; Mon, 29 Aug 2016 05:44:52 -0700 (PDT)
In-Reply-To: <6715E3FE-34D2-4C89-B54E-76B481EAAF06@gmail.com>
References: <CADwFkYehX7aM8Oqiu+jv85iOe54J6wUFbKUs7OdENoUsF_rUfA@mail.gmail.com>
	<6715E3FE-34D2-4C89-B54E-76B481EAAF06@gmail.com>
From: Jonathan Liu <net147@gmail.com>
Date: Mon, 29 Aug 2016 22:44:52 +1000
Message-ID: <CANwerB1VkihmuBt5cd47NZEQ9wKPJ_Qoqx-7qgQPDprKu-6FEQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Yi Qingliang <niqingliang2003@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] the QV4 engine will crash result in SIGSEGV
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
X-List-Received-Date: Mon, 29 Aug 2016 12:44:54 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 26 August 2016 at 03:00, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Aug 25, 2016, at 12:45 AM, Yi Qingliang <niqingliang2003@gmail.com> wrote:
>>
>> bug detail:
>> https://bugs.archlinux.org/task/49723
>>
>> patch:
>> https://git.archlinux.org/svntogit/packages.git/tree/trunk/qt5-declarative-gcc6.patch?h=packages/qt5-declarative
>>
>
> Thanks for report. Would it be possible for you to cook up a patch for meta-qt5 layer for this ?

I have fixed this in Qt 5 upstream and submitted a patch for meta-qt5
to the mailing list.

Regards,
Jonathan


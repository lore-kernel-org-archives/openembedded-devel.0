Received: from mail-vw0-f50.google.com ([209.85.212.50])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PJy4g-0006Zr-LI
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 01:46:35 +0100
Received: by vws1 with SMTP id 1so2970780vws.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 16:45:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.202.135 with SMTP id fe7mr1054364vcb.69.1290300323376;
	Sat, 20 Nov 2010 16:45:23 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.95.74 with HTTP; Sat, 20 Nov 2010 16:45:23 -0800 (PST)
X-Originating-IP: [95.29.187.131]
In-Reply-To: <4CE86872.6010905@balister.org>
References: <4CE6FA0C.2090801@balister.org>
	<4CE86872.6010905@balister.org>
Date: Sun, 21 Nov 2010 03:45:23 +0300
X-Google-Sender-Auth: PMEVzpNcSCWGBzGU_Nx-LLqT2cQ
Message-ID: <AANLkTi=SJ1J=oZnaWUgZzd_yOJ7+xzFbCix55ivrQHBv@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.50
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Nov 2010 00:46:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/21 Philip Balister <philip@balister.org>:
> On 11/19/2010 02:28 PM, Philip Balister wrote:
>>
>> I'd like to revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8. With
>> this commit my build that includes angstrom-task-gnome.bb fails in a
>> peculiar way. Basically, my process table is filled with a task. Looks
>> like it is trying to run a pkg-config gtk+ operation. This is with
>> angstrom-2010.x and a custom machine very similar to an overo.
>>
>> I realize this is a vague description, but I do not have time to isolate
>> better at this time.
>>
>> Can we go ahead and revert this for now?
>
> This has been tracked to the xmms package. Anyone have any ideas how we can
> fix the problem?

I've affected by this problem with angstrom-2008.1 first time when
tried to build angstrom-gnome-image, second time when tried to build
just xmms.

-- 
Yury Bushmelev



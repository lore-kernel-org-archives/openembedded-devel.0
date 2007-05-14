Received: from [66.249.82.237] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1HnbIQ-0002jb-Td
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2007 16:13:07 +0200
Received: by wx-out-0506.google.com with SMTP id s14so1559944wxc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2007 07:13:00 -0700 (PDT)
Received: by 10.90.105.20 with SMTP id d20mr4777946agc.1179151980527;
	Mon, 14 May 2007 07:13:00 -0700 (PDT)
Received: from cube ( [77.122.190.213])
	by mx.google.com with ESMTP id 23sm12798953nzn.2007.05.14.07.12.59;
	Mon, 14 May 2007 07:13:00 -0700 (PDT)
Date: Mon, 14 May 2007 17:13:06 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <783750430.20070514171306@gmail.com>
To: =?utf-8?Q?Alberto_Garc=D0=BDa_Hierro?= <skyhusker@rm-fr.net>
In-Reply-To: <200705141546.02470.skyhusker@rm-fr.net>
References: <07a101c7962b$e0db5860$0200a8c0@atmel.com>
	<200705141546.02470.skyhusker@rm-fr.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: qemu-native failure on Angstrom
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2007 14:13:08 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hello Alberto,

Monday, May 14, 2007, 4:46:02 PM, you wrote:

> El Monday 14 May 2007 15:14:03 Ulf Samuelsson escribió:
>> Tried building OpenEmbedded for the first time, DISTRO=Ångström,
>> with an at91sam9263 target (made my own file) but it seems that
>> qemu.native is not compilable on my OpenSuSE 10.1 system using gcc-4.1.2.
>> The error message says that qemu has only been tested on gcc-4.x.x for arm
>> and that other architectures need gcc-3.x
>>
>> Tried to update the bb files to allow gcc-4.1.2 but that resulted in
>> qemu-arm not beeing built, causing the build to terminate later.
>>
>> Is there any way to have open embedded build a gcc-3.4.4 cross compiler
>> as part of the normal build.

>         Check the patch at
> http://bugs.openembedded.org/show_bug.cgi?id=1144. It's 
> for amd64, but with little editing you can adapt it to your system.

        Not sure this is anyhow good patch to suggest.
http://bugs.openembedded.org/show_bug.cgi?id=2157 is what promises to
solve gcc4 issues, but that still waits for the confirmation that
it actually cooks locales well.

> Regards,
>         Alberto





-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com




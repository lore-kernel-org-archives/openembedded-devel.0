Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N8fO0-0007ne-Sc for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 20:31:20 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 0CB7DAC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 19:29:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id A++KhlANwfBY
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 20:29:56 +0100 (CET)
Received: from [192.168.0.100] (109-81.echostar.pl [213.156.109.81])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id DD4D2A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 20:29:55 +0100 (CET)
Message-ID: <4AFC6233.6090504@cs.put.poznan.pl>
Date: Thu, 12 Nov 2009 20:29:55 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AF353C8.80904@cs.put.poznan.pl>	<c384c5ea0911100806r7b163600l9adb62a23f1877a4@mail.gmail.com>	<be7a9f3d0911100905i791157e1lfd73c3cdb7f58f51@mail.gmail.com>
	<c384c5ea0911120715j12181ff2oe93d0b68c4b3fa92@mail.gmail.com>
In-Reply-To: <c384c5ea0911120715j12181ff2oe93d0b68c4b3fa92@mail.gmail.com>
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: menuconfig task for kernels
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
X-List-Received-Date: Thu, 12 Nov 2009 19:31:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> Hello Otavio,
> 
> On Tue, Nov 10, 2009 at 6:05 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> Hello,
>>
>> On Tue, Nov 10, 2009 at 2:06 PM, Leon Woestenberg
>> <leon.woestenberg@gmail.com> wrote:
>>> Look in classes/kernel.bbclass, line ~221:
>>>
>>> addtask menuconfig after do_patch
>>> change it to:
>>> addtask menuconfig after do_configure
>>>
>>> I wonder if this can go upstream.
> Any response to this idea?

I support it. This is expected behavior from the casual user point of view.

Przemek




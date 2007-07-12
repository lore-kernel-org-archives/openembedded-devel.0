Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I90Fm-0005OE-G0
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2007 17:06:50 +0200
Received: by ug-out-1314.google.com with SMTP id i24so369068ugd
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2007 08:00:57 -0700 (PDT)
Received: by 10.86.26.11 with SMTP id 11mr524587fgz.1184252457883;
	Thu, 12 Jul 2007 08:00:57 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id i5sm59369128mue.2007.07.12.08.00.56
	(version=SSLv3 cipher=OTHER); Thu, 12 Jul 2007 08:00:57 -0700 (PDT)
Date: Thu, 12 Jul 2007 18:00:37 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <1787781246.20070712180037@gmail.com>
To: Henning Heinold <openembedded-devel@lists.openembedded.org>
In-Reply-To: <20070710114840.GA16604@mi.fu-berlin.de>
References: <200707091724.32860.torsten.sadowski@tu-berlin.de>
	<20070710091946.GA14041@mi.fu-berlin.de>
	<20070710114840.GA16604@mi.fu-berlin.de>
MIME-Version: 1.0
Subject: Re: Conflicting qte patches for Simpad
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
X-List-Received-Date: Thu, 12 Jul 2007 15:06:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Henning,

Tuesday, July 10, 2007, 2:48:40 PM, you wrote:

> On Tue, Jul 10, 2007 at 11:19:46AM +0200, Henning Heinold wrote:
>> On Mon, Jul 09, 2007 at 05:24:32PM +0200, Torsten Sadowski wrote:
>> > Hi,
>> > 
>> > after some time I tried to build a Simpad opie-image again (from the devel 
>> > branch) but I encountered conflicting patches for libqte (normal, static and 
>> > mt).
>> > 
>> > It seems, that 
>> > QWSTtyKeyboardHandler::QWSTtyKeyboardHandler
>> > moved to:
>> > kernelkeyboard.cpp
>> > 
>> > which is not accounted for in the devfs.patch.
>> > 
>> > Cheers, Torsten
>> > 
>> 
>> Because linux 2.4 is unmaintained and linux 2.6 is the future devfs.patch is gone.
>> 
>> Please do mtn pull and mtn up.
>> 
>> Bye Henning

> Sorry,

> I am wrong, I thougt Mr. psokolovsky delete it with his last commit for
> qte-common_2.3.10.inc. So please delete the line
> SRC_URI_append_simpad       = "file://devfs.patch;patch=1 " alone
> and try again.

  Ok, now removed in OE too.

> Bye Henning



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com




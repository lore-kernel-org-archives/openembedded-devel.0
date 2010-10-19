Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P86rB-0005KA-Mb
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 09:43:38 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 3F9C0275CE22; Tue, 19 Oct 2010 09:43:05 +0200 (CEST)
Received: from [127.0.0.1] (gravedo.de [85.214.79.159])
	by gravedo.de (Postfix) with ESMTPSA id 97AFC275CBA2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 09:43:04 +0200 (CEST)
Message-ID: <4CBD4C02.6070002@gravedo.de>
Date: Tue, 19 Oct 2010 09:42:58 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12pre) Gecko/20101011 Shredder/3.1.6pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>	<1287427884-1517-15-git-send-email-morphis@gravedo.de>
	<i9id6u$jcd$2@dough.gmane.org>
In-Reply-To: <i9id6u$jcd$2@dough.gmane.org>
X-Enigmail-Version: 1.1.2
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 14/15] xserver-xorg-conf: switch from plain tslib access to evdev for touchscreen on palmpre machine
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
X-List-Received-Date: Tue, 19 Oct 2010 07:43:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 18.10.2010 23:11, Koen Kooi wrote:
>>  Section "InputDevice"
>>      Identifier  "Touchscreen"
>> -    Driver      "tslib"
>> -    Option      "Device"                "/dev/touchscreen"
>> +    Driver      "evdev"
>> +    Option      "Device"                "/dev/input/event6"
> 
> You're better of using /dev/input/touchscreen0 for that since event
> numbers are pretty much random.

No, thats not possible as the /dev/input/event6 is an uinput device and
not provided by any kernel driver. On the palmpre machine we have a
special situation with the touchscreen. The kernel gives you access on
the touchscreen through /dev/touchscreen. It can be opened only once. So
we have written a touchscreen management daemon called tsmd. It opens
/dev/touchscreen, creates a new uinput device, processes all touchscreen
events via tslib and reports them to the user via the uinput node. So
there is no /dev/input/touchscreen0 ever available.

regards,
morphis



Received: from [81.228.8.164] (helo=pne-smtpout2-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MTYaD-0001rW-Gd
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jul 2009 11:57:57 +0200
Received: from [10.175.196.247] (213.66.88.59) by
	pne-smtpout2-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A5BC8BE0009140E for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jul 2009 11:43:48 +0200
Message-ID: <4A66DF13.2030907@atmel.com>
Date: Wed, 22 Jul 2009 11:42:43 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <f96d234e0907210900t23a05722v7b37c78b0ea3ceed@mail.gmail.com>	<4A6627C9.9090801@atmel.com>
	<h46ds3$etn$1@ger.gmane.org>
In-Reply-To: <h46ds3$etn$1@ger.gmane.org>
Subject: Re: OE weekly changelog 2009-07-13 to 2009-07-20 - Bluetooth still not working
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
X-List-Received-Date: Wed, 22 Jul 2009 09:57:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi skrev:
> On 21-07-09 22:40, Ulf Samuelsson wrote:
>> Cliff Brake skrev:
[snip]
>> ERROR: Required build target 'gpe-image' has no buildable providers.
>> Missing or unbuildable dependency chain was: ['gpe-image',
>> 'task-gpe-base', 'bluez-utils-dbus', 'bluez-libs-3.36']
>> -----------------------------
>>
>> Do we want to disable bluetooth in Angstrom, until this is fixed,
>> or is it just gpe-image that has a problem with bluetooth?
>
> A few things:
>
> 1) don't use gpe-image with angstrom, but x11-image or x11-gpe-image

OK, The Wiki gives "gpe-image" and "opie-image" as examples.
I changed "gpe-image" to "x11-gpe-image" and added "x11-image"

> 2)
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=165ddf1987723725ab49189a3533b8ae65100bfa
>
> 3) No, don't disable bluetooth in angstrom when some crufty old recipe
> depends on stuff we removed years ago from OE.
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson





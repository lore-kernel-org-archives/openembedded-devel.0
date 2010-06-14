Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henri.bragge@dcombus.com>) id 1OOCdr-0007D9-SO
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jun 2010 18:36:08 +0200
Received: from webmail3.nebula.fi (webmail3.nebula.fi [83.145.246.137])
	by smtp-68.nebula.fi (Postfix) with ESMTP id 6751343F091F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jun 2010 19:31:39 +0300 (EEST)
Received: from 195.148.62.38 (SquirrelMail authenticated user dcombuscom18)
	by webmail3.nebula.fi with HTTP;
	Mon, 14 Jun 2010 19:31:39 +0300 (EEST)
Message-ID: <61003.195.148.62.38.1276533099.squirrel@webmail3.nebula.fi>
In-Reply-To: <4C164AAE.3060100@dresearch.de>
References: <1276246443-11931-1-git-send-email-sledz@dresearch.de>
	<4C1643F9.7080705@dcombus.com> <4C164AAE.3060100@dresearch.de>
Date: Mon, 14 Jun 2010 19:31:39 +0300 (EEST)
From: henri.bragge@dcombus.com
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.10a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: henri.bragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox-1.11.3/busybox-1.13.2: enable backgrounding for udhcpc
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
X-List-Received-Date: Mon, 14 Jun 2010 16:36:08 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> Am 14.06.2010 17:00, Henri Bragge wrote:
>>> * The former default behaviour was to exit with failure if lease is n=
ot
>>>   immediately obtained. This results in permanent network disconnect
>>>   if DHCP
>>>   server is (accidentally) not available at boot time. :(
>
>> Did not do the trick for me. I found out that there was another
>> definition for udhcpc command in ifupdown.c (at least in busybox
>> 1.13.2), that still had the -n parameter. I think that is the reason?
>
> Can't find "another definition for udhcpc" in ifupdown.c.
>
> Can you please check your build. Best would be a clean build.
>
> Which distro and which machine you build for?
>

Line 529 in ifupdown.c, in pristine bb 1.13.2. And it's angstrom
console-image for armv5.




Received: from mailrelay04.sunrise.ch ([194.158.229.47]
	helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1OcgHN-0003Uj-30
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 17:04:53 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	o6OF4KCY027229; Sat, 24 Jul 2010 17:04:24 +0200
Message-ID: <4C4B0125.1040304@vollmann.ch>
Date: Sat, 24 Jul 2010 17:05:09 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com>	<4C4AE42C.5000306@welchs.me.uk>
	<AANLkTimG_U4Gsc9LuK6oKDJO2rE=xB7cDQzGf6dsh2GM@mail.gmail.com>
In-Reply-To: <AANLkTimG_U4Gsc9LuK6oKDJO2rE=xB7cDQzGf6dsh2GM@mail.gmail.com>
X-SA-Exim-Connect-IP: 194.158.229.47
X-SA-Exim-Mail-From: dv@vollmann.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] get rid of legacy staging
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
X-List-Received-Date: Sat, 24 Jul 2010 15:04:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/10 16:35, Frans Meulenbroeks wrote:
> 2010/7/24 Martyn Welch <martyn@welchs.me.uk>
> 
>> Can anyone point me to any documentation that describes what legacy staging
>> is and roughly what needs to be done to remove it?

> 
> There was a post half a year or so ago from Koen, but I can't find it.
> Basically it boils down to removing do_stage from a recipe in which case
> do_install is used to install things in staging
> in some cases do_install need to be modified to deal with peculiarities that
> were done in do_stage
> 
> For native recipes NATIVE_INSTALL_WORKS = "1" may need to be added.
That's not really much of an explanation.
Let's take an example.  I have two out of tree kernel modules A and B.
B depends on A.
With "legacy" staging, in A_1.0.bb I have a do_install, that copies
the kernel object, and a do_stage, that copies the header file at
a place where B_1.0.bb can find it.

How do I do that with non-"legacy" staging?

   Detlef



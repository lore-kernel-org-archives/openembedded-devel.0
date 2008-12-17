Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1LCxip-0000Yv-85
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 15:49:59 +0100
Received: (qmail 9050 invoked by uid 107); 17 Dec 2008 14:45:26 -0000
Received: from mailav2.epfl.ch (128.178.50.191)
	by smtp0.epfl.ch with SMTP; 17 Dec 2008 14:45:26 -0000
Received: from (unknown [128.178.224.219]) by mailav2.epfl.ch with smtp
	id 31ea_570070ca_cc49_11dd_8a01_00114337c797;
	Wed, 17 Dec 2008 15:45:24 +0100
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Wed, 17 Dec 2008 15:45:25 +0100
Message-ID: <49491085.1080405@epfl.ch>
Date: Wed, 17 Dec 2008 15:45:25 +0100
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.18 (X11/20081125)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <494907CC.2020009@epfl.ch> <gib2hb$nk2$1@ger.gmane.org>
In-Reply-To: <gib2hb$nk2$1@ger.gmane.org>
Cc: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Subject: Re: Best way to tune a distro and to build a toolchain for it
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
X-List-Received-Date: Wed, 17 Dec 2008 14:49:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for your answer Koen.

Koen Kooi wrote:
> On 17-12-08 15:08, Valentin Longchamp wrote:
>> We have designed a processor board in our laboratory that we are going
>> to use to control our robots for experiments. The board is now supported
>> in OE (mx31moboard machine) and I am very happy to be able to build a
>> Linux distro for our board thank to OE.
>>
>> Until now I have used the Angstrom distro with success. Now since my use
>> is mostly going to be for a robot with no screen (and of course no
>> PIM/agenda, games and these kinds of things) I have always built a
>> console-image. However now I would like to add some packages by default
>> in the images that I want to build for our robot (for instance hal is
>> needed by one of our softs, I would like it to be included by default).
>>
>> I could do this by adding these packages in the MACHINE_EXTRA_RDEPENDS
>> variable in the machine config file, but I think this is more a distro
>> question.
> 
> No, it's image question. Stuff that goes into an image is an image 
> question. I have multiple devices without a screen and use angstrom on 
> it without troubles. There's absolutely no need for yet another distro.

OK. Sorry, there are still some concepts in OE that are a little bit 
opaque to me. But I agree, it's definitely an image question. I want an 
image that would fit my needs.

> 
>> To summarize: what would be the best way to create a "robotic version"
>> of angstrom in OE ?
> 
> Create tasks and images for it. There's absolutely no need for yet 
> another distro.
> 

Of course I don't want to create yet another distro. That's what I meant 
by "tuning". But the correct concepts were tasks and an image for for 
this task.

-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne



Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OwbRr-0000BB-D9
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 15:57:56 +0200
Received: (qmail 9683 invoked by uid 503); 17 Sep 2010 14:09:50 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 17 Sep 2010 14:09:49 -0000
Received: (qmail 20438 invoked by uid 503); 17 Sep 2010 13:40:18 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 17 Sep 2010 13:40:17 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 17 Sep 2010 15:57:05 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 17 Sep 2010 15:57:03 +0200
Message-ID: <4C9373AE.3070302@eukrea.com>
Date: Fri, 17 Sep 2010 15:57:02 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1284493173-27463-1-git-send-email-eric@eukrea.com>
	<4C8FE671.9030205@mentor.com>
In-Reply-To: <4C8FE671.9030205@mentor.com>
X-Ovh-Tracer-Id: 8335881435337764169
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python-native: configure unicode to ucs4
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
X-List-Received-Date: Fri, 17 Sep 2010 13:57:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 14/09/2010 23:17, Tom Rini a écrit :
> Eric Bénard wrote:
>> * while trying to run gdb from an SDK created by OE, I got the following
>> errors: /usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-gdb:
>> undefined symbol:
>> PyUnicodeUCS2_FromEncodedObject
>>
>> * the reason is that the workstation (ubuntu 10.04 or 9.01)'s Python
>> is compiled using ucs4
>> and the python-native used to create arm-angstrom-linux-gnueabi-gdb is
>> using ucs2, the
>> problem is detailed here :
>> http://docs.python.org/faq/extending#when-importing-module-x-why-do-i-get-undefined-symbol-pyunicodeucs2
>>
>>
>> * configuring python-native with ucs=4 solves this problem.
>>
>> Signed-off-by: Eric Bénard <eric@eukrea.com>
>
> Can you test this out on some form of Red Hat? Thanks!
>
generated SDK tested on Fedora Core 10 : it works.

As discussed on IRC, I RedHat is compiling it's python wuth ucs=4 at 
least since RedHat 7 from what I saw in the SRPMS.

Eric



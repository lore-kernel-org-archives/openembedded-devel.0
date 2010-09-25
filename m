Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OzQ8Q-0001yb-Aq
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 10:29:30 +0200
Received: (qmail 27993 invoked by uid 503); 25 Sep 2010 08:54:04 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 25 Sep 2010 08:54:04 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Sep 2010 10:29:23 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 25 Sep 2010 10:29:21 +0200
Message-ID: <4C9DB2E0.9050004@eukrea.com>
Date: Sat, 25 Sep 2010 10:29:20 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C9D1136.2070507@freyther.de>
	<i7j7n6$u68$1@dough.gmane.org>	<AANLkTikLp83F_dsDzD7fqL4LLm+Kgh75KFri++OBmHxf@mail.gmail.com>
	<AANLkTimWTmhU6Kh65wLGpLzbOmAQKb3BKfRnH+tBKa0k@mail.gmail.com>
In-Reply-To: <AANLkTimWTmhU6Kh65wLGpLzbOmAQKb3BKfRnH+tBKa0k@mail.gmail.com>
X-Ovh-Tracer-Id: 12889583609632894281
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Qt and detecting iWMMXT
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
X-List-Received-Date: Sat, 25 Sep 2010 08:29:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 25/09/2010 10:18, Frans Meulenbroeks a écrit :
> 2010/9/25 Frans Meulenbroeks<fransmeulenbroeks@gmail.com>:
>> 2010/9/25 Koen Kooi<k.kooi@student.utwente.nl>:
>>> #build with support for the iwmmxt instruction (pxa270 and up)
>>> MY_ARCH := "${PACKAGE_ARCH}"
>>> PACKAGE_ARCH = "${@base_contains('MACHINE_FEATURES', 'iwmmxt', 'iwmmxt',
>>> '${MY_ARCH}',d)}"
>>>
>>> QT_CONFIG_FLAGS_append = " ${@base_contains('MACHINE_FEATURES',
>>> 'iwmmxt', ' -iwmmxt', '',d)} "
>>>
>>> regards,
>>>
>>> Koen
>>
>> Nice solution.
>> Guess it would be useful to have a list of all possible
>> MACHINE_FEATURES and DISTRO_FEATURES somewhere (e.g. wiki)
>>
>> Frans
>>
> Rethinking the issue: assuming we *do* want SOC_FAMILY would it not be
> more appropriate to use that here?
>
you can have a SOC which supports iwmmx and wish not using it so 
MACHINE_FEATURES seems sane here.

Eric



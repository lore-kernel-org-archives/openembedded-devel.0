Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <ossy1980@gmx.net>) id 1OdSh1-0004dI-Ra
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 20:46:32 +0200
Received: (qmail invoked by alias); 26 Jul 2010 18:39:31 -0000
Received: from p4FDD232D.dip.t-dialin.net (EHLO [192.168.1.104]) [79.221.35.45]
	by mail.gmx.net (mp010) with SMTP; 26 Jul 2010 20:39:31 +0200
X-Authenticated: #2644563
X-Provags-ID: V01U2FsdGVkX1/UmY0A3m/U8SFmiiPRIsFxzhZ2U7ewiYIQRC2A+z
	W5WEpkxg1QVPn+
Message-ID: <4C4DD663.1070902@gmx.net>
Date: Mon, 26 Jul 2010 20:39:31 +0200
From: Ossy <ossy1980@gmx.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; de;
	rv:1.9.1.11) Gecko/20100711 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C4C9AD7.7010603@gmx.net>
	<AANLkTinQG5SA2sGRj1xapuhfDCxQF4Sss7BHeS=nLesA@mail.gmail.com>
In-Reply-To: <AANLkTinQG5SA2sGRj1xapuhfDCxQF4Sss7BHeS=nLesA@mail.gmail.com>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: ossy1980@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: could not include bb file even though it exists and	directory included in BBPATH
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
X-List-Received-Date: Mon, 26 Jul 2010 18:46:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 25.07.2010 22:26, schrieb Frans Meulenbroeks:
> 2010/7/25 Ossy<ossy1980@gmx.net>
>
>> I used kom to setup a new overlay project. Since listing the images gives
>> all images in oe, I'm sure that bitbake has access to those bb-files. The
>> conf/bbplayers.conf includes BBFILES to oe, too.
>>
>> Where may I misconfigured the setup?
>>
>> ossy@debian-virtual:~/buildroot/kom-dockstar$ echo $BBPATH
>>
>> /home/ossy/kom/openembedded/:/home/ossy/buildroot/kom-dockstar/build:/home/ossy/buildroot/kom-dockstar
>>
>
> Why do you have the last two paths ?
I used kom to setup an overlay. My current understanding is, that I can 
start up with an "empty" overlay which initially links to oe. In the 
future I will overwrite some settings and package defintions with 
"local" (user defined overlay) definitions.

Correct me if I'm completly wrong. After reading some tutorials and 
discovering the mailinglist. I thought, defining 
OE_BBDIR+MYSPECIAL_BBDIR is a valid way.

>> ossy@debian-virtual:~/buildroot/kom-dockstar$ bitbake minimal-image
>> NOTE: Handling BitBake files: \ (8414/8416) [99 %]ERROR: Could not include
>> required file console-base-image.bb while parsing
>> /home/ossy/buildroot/kom-dockstar/build/tmp/deploy/glibc/sources/MIT/console-image/
>> console-image.bb
>>
>
> This suggests hat it is parsing a console-image.bb file which resides in
> your tmp/deploy dir.
> (and not the one in recipes/images).
> No idea how it ended up there. I suggest to clean at least that file, but
> preferably the whole tmp dir and build from scratch
Yepp. That helped: rm -r build/tmp


Unfortunatly I'm still not able to create a minimal-image:
ERROR: Task 306 
(/home/ossy/kom/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb, 
do_unpack) failed

I guess the stagemanager is an essential tool and should be well tested. 
So were can I find some output which action went wrong?
(unpacking seems not that difficult to fail...)

Thanks for the help anyway!

Kind regards,
Marcus





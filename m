Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OsE8Q-0004C3-LY
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Sep 2010 14:15:51 +0200
Received: from [192.168.1.2] (e180151223.adsl.alicedsl.de [85.180.151.223])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 765F3584117
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Sep 2010 14:20:16 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikC4v+QEpYsos2=f4wtEUUCt8Q=VK9ByT56pn-L@mail.gmail.com>
References: <AANLkTikC4v+QEpYsos2=f4wtEUUCt8Q=VK9ByT56pn-L@mail.gmail.com>
Organization: Vanille-Media
Date: Sun, 05 Sep 2010 14:14:49 +0200
Message-ID: <1283688889.25525.1.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: pulseaudio issue
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
X-List-Received-Date: Sun, 05 Sep 2010 12:15:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Sonntag, den 05.09.2010, 11:10 +0200 schrieb Frans Meulenbroeks:
> I have an issue with pulseaudio:
> 
> |   CC     libpulsecore_0.9.21_la-svolume_arm.lo
> | pulsecore/svolume_arm.c: In function 'pa_volume_s16ne_arm':
> | pulsecore/svolume_arm.c:53: error: can't find a register in class
> 'LO_REGS' while reloading 'asm'
> | pulsecore/svolume_arm.c:53: error: 'asm' operand has impossible constraints
> | make[3]: *** [libpulsecore_0.9.21_la-svolume_arm.lo] Error 1
> 
> From searching the irc log this is a longer standing issue.
> Is there any suggested solution for this.
> If I understand corrrectly it affects all our armv4 and armv5 machines.

Indeed. Pulseaudio has broken armv4 and armv5 support since a couple of
versions. We should probably add some COMPATIBLE_ARCH (do we have that?)
as a duct tape until someone knowledgable can fix the ARM ASM portions
for good.

Cheers,

:M:





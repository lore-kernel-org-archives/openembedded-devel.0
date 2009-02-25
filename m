Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LcFmI-0006Ur-5H
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 10:10:08 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LcFjG-0001dA-18
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 09:06:58 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 09:06:58 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 09:06:58 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 25 Feb 2009 10:06:50 +0100
Message-ID: <go31na$n9l$1@ger.gmane.org>
References: <20090224211929.77E79E8037@amethyst.openembedded.net>	<1235513110.2621.7.camel@andromeda>
	<go2tek$akt$1@ger.gmane.org> <1235549128.2621.20.camel@andromeda>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <1235549128.2621.20.camel@andromeda>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : gstreamer-ti: bump to r126 to make gstreamer autoplug and playbin work
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
X-List-Received-Date: Wed, 25 Feb 2009 09:10:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-02-09 09:05, Michael 'Mickey' Lauer wrote:
> Am Mittwoch, den 25.02.2009, 08:53 +0100 schrieb Koen Kooi:
>> On 24-02-09 23:05, Michael 'Mickey' Lauer wrote:
>>> Hi Koen,
>>>
>>>> -SRCREV = "121"
>>>> +SRCREV = "126"
>>> Is there any specific reason you're not using sane-srcrevs.inc for that?
>> The 5 minute reparse time everytime someone touches sane-srcrevs.
>
> Aha. I don't think that's a good reason, but YMMV. So we should get rid
> of sane-srcrevs.inc and put it all into the files?

It would make overriding revs a lot easier and handle things like 
multiple git kernels (e.g. linux-omap) and recipes with both svn and git 
versions (ffmpeg).
I have no strong opinions on dumping sane-srcrevs, but lately people 
have been willy-nilly updating revs that things are hardly 'sane' anymore.

regards,

Koen





Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NDHpi-0006LJ-Vj for openembedded-devel@lists.openembedded.org;
	Wed, 25 Nov 2009 14:23:02 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NDHoI-000478-NL
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Nov 2009 14:21:30 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 14:21:30 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 14:21:30 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 25 Nov 2009 14:21:11 +0100
Message-ID: <hejb07$qpm$1@ger.gmane.org>
References: <4B0D2724.3070709@SSpaeth.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <4B0D2724.3070709@SSpaeth.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: pkgconfig bbclass: also sed out bogus includes
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
X-List-Received-Date: Wed, 25 Nov 2009 13:23:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-11-09 13:46, Sebastian Spaeth wrote:
>> author	Koen Kooi<koen@openembedded.org>
>> commit	2c8134baa56ad047f5c37069379c0e560dd6477e
>>
>> RP says: In theory the recipes themselves should be patched to stop
>> this nonesense getting in there in the first place but that is
>> appropriate for pkgconfig.bbclass
>
> Nice one. Should we add a warning when we find such a bogus include so
> recipes can be fixed up over time?

Before this commit insane.bbclass aborted the build during 
do_qa_staging, so I don't think there are a lot of such recipes around :)

Feel free to add such a warning to this class.

I ran into this issue with eet.pc when trying to build a newer e-wm.

regards,

Koen




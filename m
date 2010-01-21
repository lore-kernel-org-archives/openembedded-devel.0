Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NY5UR-0007Qe-VS for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 23:27:04 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NY5SE-0006v1-Ik
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 23:24:42 +0100
Received: from s207-6-220-230.bc.hsia.telus.net ([207.6.220.230])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:24:42 +0100
Received: from dfoley by s207-6-220-230.bc.hsia.telus.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:24:42 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dallas Foley <dfoley@techsol.ca>
Date: Thu, 21 Jan 2010 14:24:16 -0800
Message-ID: <4B58D410.2020100@techsol.ca>
References: <op.u6vw72i1mn1qzu@guohr-laptop-ubuntu>
	<19c1b8a91001211410y19908564h7fe9aca3f81317ab@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s207-6-220-230.bc.hsia.telus.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <19c1b8a91001211410y19908564h7fe9aca3f81317ab@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: I realy think we should upgrade PREFERRED_VERSION_glibc to 2.9 in conf/distro/include/sane-toolchain.inc
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
X-List-Received-Date: Thu, 21 Jan 2010 22:27:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Thu, Jan 21, 2010 at 5:32 AM, Guo Hongruan <camelguo@gmail.com> wrote:
>> Hi guys,
>>  I think we should upgrade PREFERRED_VERSION_glibc from 2.6 to 2.9 in
>> conf/distro/include/sane-toolchain.inc. The reasons are:

Although I haven't tried a build from scratch in a few weeks or so, I 
have one known problem with glibc 2.9. I wonder if it's just me or not. 
glibc 2.6.1 always works. On my armv4t board gpe-mini-browser2 always 
seg faults. I've tried different gcc and binutils combinations. However, 
glibc 2.9 on armv5te (imx) or armv7a (omap) work fine for me.

>>
>> 1. Most of distributions have upgraded their preferred glibc to 2.9 long
>> time ago.
>> conf/distro/angstrom-2008.1.conf:PREFERRED_VERSION_glibc                ?=
>> "2.9"
>> conf/distro/angstrom-2008.1.conf:PREFERRED_VERSION_glibc-initial        ?=
>> "2.9"
>> conf/distro/jlime-2009.1.conf:PREFERRED_VERSION_glibc-initial = "2.9"
>> conf/distro/jlime-2009.1.conf:PREFERRED_VERSION_glibc = "2.9"
>> conf/distro/kaeilos.conf:PREFERRED_VERSION_glibc                ?= "2.9"
>> conf/distro/kaeilos.conf:PREFERRED_VERSION_glibc-initial        ?= "2.9"
>>
>> from the above, you can get to know that most distributions have upgraded
>> their preferred glibc to 2.9 from 2008 ago.
>>
>> Of course, there are still some distributions which uses old glibc. The only
>> reason I guess is that we have not updated them for a long time. (for from
>> tinderbox, you can get to know that these distributions have not been built
>> for a long time)
>>
>>
>> 2. from tinderbox, you can see that the glibc-2.9 is well-tested, no
>> glibc-2.6
>> http://tinderbox.openembedded.net/packages/?name=glibc&page=1
>>
>> from the above link, you can get to know that the glibc-2.9 not glibc-2.6.1
>> has had most testing.
>>
>> 3. the last reason is that I have built some projects with glibc-2.6, unless
>> with the old binutils, the glibc-2.6 always failed to build.
>>
>> So, I think it is the time to upgrade PREFERRED_VERSION_glibc to 2.9 in
>> sane-toolchian.inc
> 
> Yes I am ok with this. Infact you could even use 2.10.1 now you are at it
> and micro already did the change.
> 
>> --
>> Guo Hongruan, Embedded Linux Consultant
>> Skype: camelguo
>> Twitter: camelguo
>> http://www.gulessoft.com
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>




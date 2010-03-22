Received: from mail-yx0-f194.google.com ([209.85.210.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nte2i-00066M-Cb
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:35:33 +0100
Received: by yxe32 with SMTP id 32so2682095yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 02:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=kvhl5EJIuaas074LwBfFwy3yk5GEx20mCv3dnJeWOag=;
	b=Z5OKBfShvJKN25XMSeSgRgsP1GQUDqH56snhkM7de/hTXT0fM9GvoeG1Wya66IU37V
	YHCYIHdgzNlFDsnMLCezFgVz0xuERGoGjIlRrveE22PbsrlqAzQs73H4crRTJjPnAlnw
	tSA9SQIQLfkqCZqJm7i+ZBiksEm2wD/42oZdM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=X1URGyMdktnnyV/ijK8mj1lgqM798Tr6UtdWUYVEtUqVPrTVpSzNXbZqv5nN8CxMqO
	5tcxKFqLoLETfvgQ9uWfWtYWlHXEQyxJK+mb92WV9hF7XDfwc/Lx29hfOOWWhI4ZkB9C
	Ypc8v4sKdfK+7Q3MXD+jxGAc6fmGM3KKL8V0M=
MIME-Version: 1.0
Received: by 10.101.180.14 with SMTP id h14mr1598982anp.34.1269250339366; Mon, 
	22 Mar 2010 02:32:19 -0700 (PDT)
In-Reply-To: <ac9c93b11003220229q6fdd21dfx82c6a5074c02394b@mail.gmail.com>
References: <ac9c93b11003210557u1fcbcc21jb0dafb9fa16ccc96@mail.gmail.com>
	<ho5b8b$oao$1@dough.gmane.org>
	<ac9c93b11003211238p38d25065p73841962f1ce2789@mail.gmail.com>
	<ho7a3v$6v8$1@dough.gmane.org>
	<ac9c93b11003220229q6fdd21dfx82c6a5074c02394b@mail.gmail.com>
Date: Mon, 22 Mar 2010 10:32:19 +0100
Message-ID: <ac9c93b11003220232q6419d8a6ob74bdcf9f90a614e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.194
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: hawkboard at 456 Mhz?
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
X-List-Received-Date: Mon, 22 Mar 2010 09:35:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/22 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/3/22 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 21-03-10 20:38, Frans Meulenbroeks wrote:
>>> 2010/3/21 Koen Kooi <k.kooi@student.utwente.nl>:
>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>> Hash: SHA1
>>>>
>>>> On 21-03-10 13:57, Frans Meulenbroeks wrote:
>>>>> Hi,
>>>>>
>>>>> In the openembedded repository I saw the following patch:
>>>>> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux-davinci/da850_omapl138_opp456mhz.patch
>>>>> This seems to suggest that it is possible to run the hawkboard at 456
>>>>> Mhz (and yeah: I know it is out of spec and out of warranty, but for
>>>>> an experiment it would be quite helpful for me).
>>>>> I've build the kernel with openembedded, the patch is applied,
>>>>> CONF_CPU_FREQ is defined, but the control hook in /sys is not there.
>>>>> I've also tried tweaking the file with the settings (ds850.c) but to no avail.
>>>>>
>>>>> Anyone a suggestion on how to get this done?
>>>>
>>>> You need a newer kernel that doesn't rely on the TPS part for cpufreq
>>>> (hawkboard lacks a PMIC, the evm uses the TPS). You can build from the
>>>> ti/staging[1] branch to get such a kernel.
>>>>
>>>> Or wait a week for that branch to get merge, internal testing is finally
>>>> wrapping up.
>>>>
>>>> [1] http://gitorious.org/angstrom/openembedded/commits/ti/staging
>>>
>>>
>>> Koen,
>>>
>>> Thanks alot!
>>> As patience is something that I don't have an overdose of, I decided
>>> not to waste any on this issue.
>>> So I checked out the git and rebuild the kernel. Works like a charm.
>>>
>>> For those who want to reproduce this:
>>> Be sure to adapt defconfig (CONFIG_DA8XX_MAX_SPEED_456=y)
>>>
>>> I changed the speed setting with cpuspeed, this one is not on the
>>> angstrom feed, so you need to build it yourself too.
>>
>> I use cpufrequtils, is cpuspeed a better option?
>
> I was unaware of cpufrequtils and bumped into cpuspeed, so I used that.
> I just quickly browsed the manpage of cpufreq-set and it would have
> served me better (as cupfreq-set has a -f option to force the speed
> and cpuspeed is controlled to signals.
> Here is the manpage for cpuspeed: http://linux.die.net/man/8/cpuspeed
>
> Btw I would have expected that I could also directly poke in /sys to
> change the speed but the one attempt I did gave an error. Might be
> that I just used the wrong var
> (actually i probably had to use scaling_set_speed and I probably used
> something like actual_speed or current_speed).
>
> Frans.
>
> PS: i've briefly peeked at the processor doc: would it be possible to
> push things even further (e.g. to 600 Mhz). Of course I know this is
> out of warranty, but that is 456 too :-) I'm still missing some info
> on how to play with what to do an educated attempt (it is manly the
> voltage related settings I feel unsure about).
>
Forgot to mention: google yesterday gave me also a gtk variant:
gtk-cpuspeedy and a kde one: klaptopdaemon
didn't try these.

FM



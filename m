Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kk1uc-0000VF-36
	for openembedded-devel@openembedded.org; Sun, 28 Sep 2008 21:26:34 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kk1qo-0002H0-Sq
	for openembedded-devel@openembedded.org; Sun, 28 Sep 2008 19:22:38 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 28 Sep 2008 19:22:38 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 28 Sep 2008 19:22:38 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 28 Sep 2008 21:22:29 +0200
Message-ID: <gbolhm$4bj$1@ger.gmane.org>
References: <87abdtcpvp.fsf@neumann.lab.ossystems.com.br>	<gbo38l$9sr$1@ger.gmane.org>
	<20080928161320.GA5665@rhein.zuhause.netz>
	<1222628033.4426.6.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <1222628033.4426.6.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: fennec fails to build when host system lacks autoconf2.13
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
X-List-Received-Date: Sun, 28 Sep 2008 19:26:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28-09-2008 20:53, Phil Blundell wrote:
> On Sun, 2008-09-28 at 18:13 +0200, Henning Heinold wrote:
>> On Sun, Sep 28, 2008 at 04:10:29PM +0200, Koen Kooi wrote:
>>> On 27-09-2008 22:09, Otavio Salvador wrote:
>>>> Hello,
>>>>
>>>> It takes a while until I found the reason fennec was failing to build;
>>>> it needs autoconf2.13 but OE doesn't has it anymore.
>>>>
>>>> Does someone feels like fixing it?
>>> I've asked the mozilla people to fix their crappy autotools code, but
>>> they say that the mozilla code isn't buggy, but that all autoconf>2.13
>>> versions are buggy.....
>> Args,
>>
>> I looked at this autotools abuse too and this is really crap. Seems
>> no easy fixing for us.
>
> Is it that hard to put autoconf 2.13 back in OE?

Actually we would only need autoconfig-native2.13 (no, not a typo) and 
install it as 'autoconf2.13' to make packaged-staging happy.
Simply resurrecting auto-native-2.13 will not work in this case.

regards,

Koen




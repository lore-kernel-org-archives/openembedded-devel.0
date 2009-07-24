Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MUELl-0006WN-K6
	for openembedded-devel@openembedded.org; Fri, 24 Jul 2009 08:33:49 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MUE7t-0006wO-7k
	for openembedded-devel@openembedded.org; Fri, 24 Jul 2009 06:19:29 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 24 Jul 2009 06:19:29 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Jul 2009 06:19:29 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 24 Jul 2009 08:19:20 +0200
Message-ID: <h4bjp8$6va$1@ger.gmane.org>
References: <200907231733.14601.holger+oe@freyther.de>	<h4a435$9sd$1@ger.gmane.org>
	<200907240517.58524.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <200907240517.58524.holger+oe@freyther.de>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Fix qt4-embedded compilation
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
X-List-Received-Date: Fri, 24 Jul 2009 06:33:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-07-09 05:17, Holger Hans Peter Freyther wrote:
> On Thursday 23 July 2009 18:45:24 Koen Kooi wrote:
>> On 23-07-09 17:33, Holger Hans Peter Freyther wrote:
>>> Hey,
>>>
>>> I need the below patch to be able to compile qt4-embedded without trying
>>> to download a PowerVR sdk for the OMAP when building on x86...
>>
>> Can't you just bbmask it out?
>
> I would prefer if qt4-embedded is buildable out of the box. The problem is the
> following. qt4-embedded.inc is setting QT_BASE_NAME to qt4-embedded. This
> means that the various -dbg packages start to depend on qt4-embedded-gles.
>
> Is this wanted? maybe we should set QT_BASE_NAME to ${PN} in qt4-embedded?
>
> what do you think?

I've been bitten more than once by this problem (e.g. when it got 
renamed again), so if setting it to ${PN} works, go for it.

regards,

Koen




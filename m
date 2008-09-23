Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ki89C-0002ar-0b
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 15:41:46 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ki85l-0005yp-1M
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 13:38:13 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 13:38:13 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 13:38:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Sep 2008 15:38:04 +0200
Message-ID: <gbarfs$otc$1@ger.gmane.org>
References: <gbaldf$39s$2@ger.gmane.org>
	<20080923122259.GA32730@mi.fu-berlin.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080912030722 Shredder/3.0b1pre
In-Reply-To: <20080923122259.GA32730@mi.fu-berlin.de>
Sender: news <news@ger.gmane.org>
Subject: Re: pkgconfig.bbclass changes
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
X-List-Received-Date: Tue, 23 Sep 2008 13:41:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Henning Heinold wrote:
> On Tue, Sep 23, 2008 at 01:54:23PM +0200, Koen Kooi wrote:
>> Hi,
>>
>> Henning fixed up pkgconfig.bbclass (which should die, since
>> autotools.bbclass does a much better job), but I think this:
>>
>> -       for pc in `find ${S} -name '*.pc' -type f | grep -v --
>> '-uninstalled.pc$'`; do
>> +       for pc in `find ${D} -name '*.pc' -type f | grep -v --
>> '-uninstalled.pc$'`; do
>>
>> breaks -native recipes.
>>
>> regards,
>>
>> Koen
>
> Hi,
>
> sorry you are right. This indeed breaks native packages I didnt
> thought of it, while fixing the pc file of xine.

I've been there myself: fixing bugs and then hearing people about 
-native being broken.

> I think we can not let die pkgconfig.bbclass, because not all features are
> in autotools.class and there are cases where staging or install
> do not depend on the autotools install routines.

You are completely right about that, but we should move over autotools 
based recipes to the autotools code and only use pkgconfig.bbclass for 
non-autotooled recipes.

regards,

Koen




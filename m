Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KiCa0-0005dx-7U
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 20:25:44 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KiCWY-0002Ct-Ip
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 18:22:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 18:22:10 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 18:22:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Sep 2008 20:21:55 +0200
Message-ID: <gbbc43$o4h$1@ger.gmane.org>
References: <gbaldf$39s$2@ger.gmane.org>	<20080923122259.GA32730@mi.fu-berlin.de>
	<48D92CC2.7010300@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080912030722 Shredder/3.0b1pre
In-Reply-To: <48D92CC2.7010300@balister.org>
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
X-List-Received-Date: Tue, 23 Sep 2008 18:25:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> Henning Heinold wrote:
>> On Tue, Sep 23, 2008 at 01:54:23PM +0200, Koen Kooi wrote:
>>> Hi,
>>>
>>> Henning fixed up pkgconfig.bbclass (which should die, since
>>> autotools.bbclass does a much better job), but I think this:
>>>
>>> - for pc in `find ${S} -name '*.pc' -type f | grep -v --
>>> '-uninstalled.pc$'`; do
>>> + for pc in `find ${D} -name '*.pc' -type f | grep -v --
>>> '-uninstalled.pc$'`; do
>>>
>>> breaks -native recipes.
>>>
>>> regards,
>>>
>>> Koen
>>
>> Hi,
>>
>> sorry you are right. This indeed breaks native packages I didnt
>> thought of it, while fixing the pc file of xine.
>
> Does anyone know what the proper fix is? .dev does not build at the moment.

revert the above hunk, bump PR on affected packages.

regards,

Koen


>
> Philip
>
>
>
>> I think we can not let die pkgconfig.bbclass, because not all features
>> are
>> in autotools.class and there are cases where staging or install
>> do not depend on the autotools install routines.
>>
>> Bye Henning
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





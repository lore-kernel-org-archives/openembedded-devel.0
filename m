Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lx08V-0003vK-Jg
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 16:42:47 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lx03y-0007HR-T7
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 14:38:07 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 14:38:06 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 14:38:06 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 23 Apr 2009 16:37:54 +0200
Message-ID: <gspug2$bk9$1@ger.gmane.org>
References: <1240449461-26116-1-git-send-email-otavio@debian.org>	<1240449461-26116-2-git-send-email-otavio@debian.org>	<1240449461-26116-3-git-send-email-otavio@debian.org>	<1240449461-26116-4-git-send-email-otavio@debian.org>	<gsp1t1$9fq$1@ger.gmane.org>
	<873abzedet.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <873abzedet.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 3/6] machine/geode[gl]x: use more optimization while compiling
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
X-List-Received-Date: Thu, 23 Apr 2009 14:42:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-04-09 14:56, Otavio Salvador wrote:
> Koen Kooi<k.kooi@student.utwente.nl>  writes:
>
>> On 23-04-09 03:17, Otavio Salvador wrote:
>>
>>> -GLIBC_EXTRA_OECONF = "--with-tls"
>>> +GLIBC_EXTRA_OECONF = "--with-tls --with-cpu=geode"
>>> +SELECTED_OPTIMIZATION_glibc := "${@'${SELECTED_OPTIMIZATION}'.replace('-fomit-frame-pointer', '')}"
>>
>> shouldn't that be _pn-glibc?
>
> You mean the SELECT_OPTIMIZATION?

yes ${PN} is only in local overrides (scope: current recipe), pn-${PN} 
is in global overrides.

>> And shouldn't you make glibc geode specific after that?
>
> Sorry, didn't get what you mean.

You're changing the way glibc is built for a specific machine, so the 
resulting glibc package should technically machine specific. But it 
seems it's compatible with other builds, so there isn't a big impact. 
This does mean that you'll loose the optimization if you build another 
i586 arch first.

regards,

Koen




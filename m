Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N1F3x-00025S-2O for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 09:59:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N1F2y-0007Ld-L1
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 09:58:52 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 09:58:52 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 09:58:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 Oct 2009 09:58:28 +0200
Message-ID: <hbrnn4$1kd$1@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>	<hbrlkn$qt7$1@ger.gmane.org>
	<200910230930.00314.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <200910230930.00314.holger+oe@freyther.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Fri, 23 Oct 2009 07:59:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-10-09 09:30, Holger Hans Peter Freyther wrote:
> On Friday 23 October 2009 09:23:03 Koen Kooi wrote:
>
>>> I don't think we need to strip .a files as they will not end on the
>>> device
>>
>> They do actually
>>
>>> and people will link their binaries to them and we will strip the
>>> binaries.
>>
>> There was a discussion about that and I didn't see people objection, the
>> only point of contention was where to package the debug symbols. How do
>> you propropose to solve the problem that the .a files are huge?
>> Also, you don't mention any problems, you only say "I [..] think", which
>> usually isn't a good enough reason to revert stuff :)
>
> The above commits cause build problems and break the "toolchain" (native,
> cross-sdk) at runtime. The toolchain is broken as all symbols are stripped out
> of the libc_nonshared.a.

Ah, that's not nice

> Why do you need .a files on the device? Is this normal operation or only when
> installing -dev packages?

When installing -dev packages, yes. For example on the touchbook default 
image we ship a toolchain and -dev packages for clutter to allow people 
to build things on the target. By stripping the .a files we save about 
200MiB.

I can think of a few solutions:

* build toolchain packages with -ggdbN where N < 3
* use a safer stripping option in package.bbclass
* blacklist libc_nonshared.a

Do you have more solutions and which do you prefer? I really like to 
avoid blowing up -dev packages if we can safely strip (most of) them.

regards,

Koen




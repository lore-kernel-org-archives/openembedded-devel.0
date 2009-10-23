Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N1GkM-0004sS-U3 for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 11:47:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N1GjO-000084-A0
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 11:46:46 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 11:46:46 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 11:46:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 Oct 2009 11:46:22 +0200
Message-ID: <hbru1e$m80$1@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>	<1256286976.4529.117.camel@mill.internal.reciva.com>	<hbrs68$gbd$1@ger.gmane.org>
	<200910231133.11053.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <200910231133.11053.holger+oe@freyther.de>
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
X-List-Received-Date: Fri, 23 Oct 2009 09:47:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-10-09 11:33, Holger Hans Peter Freyther wrote:
> On Friday 23 October 2009 11:14:48 Koen Kooi wrote:
>> On 23-10-09 10:36, Phil Blundell wrote:
>
>>> An alternative (or an addition) to the -static packaging would be to
>>> arrange for .a files (and .o files, I guess) to be stripped with "strip
>>> --strip-debug" (or perhaps --strip-unneeded).  This should leave enough
>>> symbol data in the files for them to remain usable.
>>
>> Something like this (but without the mailer induced linewrapping)?
>>
>> diff --git a/classes/package.bbclass b/classes/package.bbclass
>> index 046351a..2bf55e3 100644
>> --- a/classes/package.bbclass
>> +++ b/classes/package.bbclass
>> @@ -183,6 +183,9 @@ def runstrip(file, d):
>>            extraflags = "--remove-section=.comment --remove-section=.note
>> --strip-unneeded"
>>        elif "shared" in result or "executable" in result:
>>            extraflags = "--remove-section=.comment --remove-section=.note"
>> +       elif file.endswith(".a")::
>
> one colon  please :)

Right :)

>> +                extraflags = "--remove-section=.comment --strip-debug"
>> +
>
> and I would prefer to have debug symbols in there. you can always strip them
> out of the final binary but you can not add them when they are gone.

Installing foo-dbg doesn't work?

> The last bit is that I would like to put /usr/lib/libc_nonshared.a into the
> libc-dev package

Glibc has its own custom packaging, which we'll probably need to tweaks 
as well.

Anyways, I'll start accumulating patches in 
http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=koen/static-libs-rework 
and change those to work in all your comments.

regards,

Koen




Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KyNP4-00041Y-D5
	for openembedded-devel@openembedded.org; Fri, 07 Nov 2008 10:13:18 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KyNNR-0006Tf-Vs
	for openembedded-devel@openembedded.org; Fri, 07 Nov 2008 09:11:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 07 Nov 2008 09:11:37 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 07 Nov 2008 09:11:37 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 07 Nov 2008 10:11:30 +0100
Message-ID: <gf10o2$hip$1@ger.gmane.org>
References: <20081104005512.GA12988@denix.org>	<200811041213.25205.zecke@selfish.org>	<20081104194812.GA18457@denix.org>
	<20081106231210.GB32229@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081025 Shredder/3.0b1pre
In-Reply-To: <20081106231210.GB32229@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: hal-0.5.11 fails with external toolchain/SDK
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
X-List-Received-Date: Fri, 07 Nov 2008 09:13:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-11-2008 00:12, Denys Dmytriyenko wrote:
> On Tue, Nov 04, 2008 at 02:48:12PM -0500, Denys Dmytriyenko wrote:
>> On Tue, Nov 04, 2008 at 12:13:24PM +0100, Holger Freyther wrote:
>>> On Tuesday 04 November 2008 01:55:12 Denys Dmytriyenko wrote:
>>>> Hi,
>>>>
>>>> New hal-0.5.11 from OpenMoko breaks builds with external-toolchain/SDK, as
>>>> it hardcodes linux/input.h like this:
>>> It is Openmoko, and I did add it.
>>>
>>> what about something among the lines of?
>>>
>>> echo "#include<linux/input.h>" | cpp | less | grep "linux\/input.h"
>> Thanks for the hint. I was able to fix it, so it finds the right linux/input.h
>> file even with external-toolchain/SDK.
>>
>> The patch is attached to the ticket #4799 and this email. I was not able to
>> call autoreconf, as it was giving too many problems. autotools_do_configure
>> worked fine, but unfortunately, it doesn't take parameters to pass to the
>> oe_runconf, so I had to call it again with the correct --with flag. Let me
>> know if it's Ok or not. Thanks.
>
> What about this patch? Does it look good? Any comments/suggestions?

I was about to propose somethine like:

do_configure_prepend() {
linux_input_h=$(echo "#include <linux/input.h>" | ${CPP} - | \
	grep "linux\/input.h" | head -n 1 | awk -F '"' '{print $2}')	
}
EXTRA_OECONF += "--with-linux-input-header=${linux_input_h}"

But I then I realized that probably won't work as I expect it to work :)

regards,

Koen




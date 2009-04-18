Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lv6xr-0003Yx-8y
	for openembedded-devel@openembedded.org; Sat, 18 Apr 2009 11:35:59 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lv6tu-0003yh-EV
	for openembedded-devel@openembedded.org; Sat, 18 Apr 2009 09:31:54 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 18 Apr 2009 09:31:54 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Apr 2009 09:31:54 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 18 Apr 2009 11:31:38 +0200
Message-ID: <gsc6lq$rsp$1@ger.gmane.org>
References: <20090414234609.GA27890@denix.org>	<1239752998-7677-1-git-send-email-denis@denix.org>
	<20090416163353.GG17629@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090413 Shredder/3.0b3pre
In-Reply-To: <20090416163353.GG17629@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] udev 124: add cache invalidation logic on kernel change or its bootargs/cmdline
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
X-List-Received-Date: Sat, 18 Apr 2009 09:35:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-04-09 18:33, Tom Rini wrote:
> On Tue, Apr 14, 2009 at 07:49:58PM -0400, Denys Dmytriyenko wrote:
>
>> Signed-off-by: Denys Dmytriyenko<denis@denix.org>
>> ---
>>   recipes/udev/udev-124/init |   10 +++++++++-
>>   1 files changed, 9 insertions(+), 1 deletions(-)
>
> So, for making it optional, how about adding something to /etc/default
> to enable / disable dev caching all together?  And, I believe
> /proc/atags would just be cp /proc/atags /tmp/atags || touch /tmp/atags.

Do we really want atags in there? As the name says, they are ARM TAGs, 
and only when kexec is enabled. Does it buy us anything over /proc/cmdline?

regards,

Koen





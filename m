Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MJEk2-0000pT-0W
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 00:45:26 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLP002F9QO7ZWU7@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	23 Jun 2009 17:33:48 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 28F1014AF5F; Tue,
	23 Jun 2009 18:33:43 -0400 (EDT)
Date: Tue, 23 Jun 2009 18:33:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623223343.GF32082@denix.org>
References: <200906230940.05121.marcin@juszkiewicz.com.pl>
	<1245747417-11163-5-git-send-email-marcin@juszkiewicz.com.pl>
	<h1qala$n3k$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h1qala$n3k$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 056/125] libsdl-ttf: GNU HASH QA fix.
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
X-List-Received-Date: Tue, 23 Jun 2009 22:45:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 23, 2009 at 12:26:50PM +0200, Koen Kooi wrote:
> On 23-06-09 10:56, Marcin Juszkiewicz wrote:
>> From: Stanislav Brabec<utx@penguin.cz>
>>
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   recipes/libsdl/libsdl-ttf_2.0.3.bb |    2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/libsdl/libsdl-ttf_2.0.3.bb 
>> b/recipes/libsdl/libsdl-ttf_2.0.3.bb
>> index 250fb69..b1da5b4 100644
>> --- a/recipes/libsdl/libsdl-ttf_2.0.3.bb
>> +++ b/recipes/libsdl/libsdl-ttf_2.0.3.bb
>> @@ -11,6 +11,8 @@ S = "${WORKDIR}/SDL_ttf-${PV}"
>>
>>   inherit autotools
>>
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>> +
>>   do_stage() {
>>   	autotools_stage_all
>>   }
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



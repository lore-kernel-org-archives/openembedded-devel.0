Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MJEjF-0000ou-W6
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 00:44:38 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLP007LYQNTCGF2@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	23 Jun 2009 17:33:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4898314AF5F; Tue,
	23 Jun 2009 18:33:29 -0400 (EDT)
Date: Tue, 23 Jun 2009 18:33:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623223329.GE32082@denix.org>
References: <200906230940.05121.marcin@juszkiewicz.com.pl>
	<1245747417-11163-4-git-send-email-marcin@juszkiewicz.com.pl>
	<h1qalf$n3k$2@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h1qalf$n3k$2@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 055/125] libsdl-gfx: GNU HASH QA fix.
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
X-List-Received-Date: Tue, 23 Jun 2009 22:44:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 23, 2009 at 12:26:55PM +0200, Koen Kooi wrote:
> On 23-06-09 10:56, Marcin Juszkiewicz wrote:
>> From: Stanislav Brabec<utx@penguin.cz>
>>
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   recipes/libsdl/libsdl-gfx_2.0.17.bb |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/libsdl/libsdl-gfx_2.0.17.bb 
>> b/recipes/libsdl/libsdl-gfx_2.0.17.bb
>> index 79af40a..b07be45 100644
>> --- a/recipes/libsdl/libsdl-gfx_2.0.17.bb
>> +++ b/recipes/libsdl/libsdl-gfx_2.0.17.bb
>> @@ -10,6 +10,7 @@ S = "${WORKDIR}/SDL_gfx-${PV}"
>>   inherit autotools
>>
>>   EXTRA_OECONF = "--disable-mmx"
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>>
>>   do_stage() {
>>   	autotools_stage_all
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



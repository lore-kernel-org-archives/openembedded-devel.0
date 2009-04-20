Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LvxQ9-0005tI-44
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 19:36:41 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIE00GKBU0T5DQ0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	20 Apr 2009 12:31:47 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4AEF16B83A8; Mon,
	20 Apr 2009 13:31:41 -0400 (EDT)
Date: Mon, 20 Apr 2009 13:31:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090420173141.GB6379@denix.org>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-6-git-send-email-marcin@juszkiewicz.com.pl>
	<gsi852$ec5$5@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <gsi852$ec5$5@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 1/1] e2fsprogs 1.41.4: depends on	gettext-native, due to the removal of do_configure
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
X-List-Received-Date: Mon, 20 Apr 2009 17:36:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 20, 2009 at 06:33:38PM +0200, Koen Kooi wrote:
> Acked-by: Koen Kooi <koen@openembedded.org>
>
>
> On 20-04-09 17:24, Marcin Juszkiewicz wrote:
>> From: Denys Dmytriyenko<denis@denix.org>
>>
>> ---
>>   recipes/e2fsprogs/e2fsprogs_1.41.4.bb |    4 +++-
>>   1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.4.bb 
>> b/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
>> index 177d9af..c2b9232 100644
>> --- a/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
>> +++ b/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
>> @@ -2,7 +2,9 @@ require e2fsprogs.inc
>>
>>   SRC_URI += "file://mkinstalldirs.patch;patch=1"
>>
>> -PR = "r2"
>> +DEPENDS += "gettext-native"

I was told inherit gettext is better than just DEPENDS += "gettext-native"
Should I fix it it .dev first?

>> +PR = "r3"
>>
>>   do_compile_prepend () {
>>   	find ./ -print|xargs chmod u=rwX
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



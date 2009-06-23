Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MIvbl-0003Cs-Rn
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 04:19:40 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLO0015G5Y3Z7E0@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Jun 2009 21:08:28 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B36D314AF5F; Mon,
	22 Jun 2009 22:08:27 -0400 (EDT)
Date: Mon, 22 Jun 2009 22:08:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623020827.GL14716@denix.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-9-git-send-email-marcin@juszkiewicz.com.pl>
	<h1nog5$af4$4@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h1nog5$af4$4@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 032/125] samba: 3.2.8 and newer is GPLv3
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
X-List-Received-Date: Tue, 23 Jun 2009 02:19:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jun 22, 2009 at 01:04:37PM +0200, Koen Kooi wrote:
> On 22-06-09 11:53, Marcin Juszkiewicz wrote:
>> From: Tom Rini<trini@embeddedalley.com>
>>
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   recipes/samba/samba-ads_3.2.8.bb |    1 +
>>   recipes/samba/samba-ads_3.3.0.bb |    1 +
>>   recipes/samba/samba_3.2.8.bb     |    1 +
>>   recipes/samba/samba_3.3.0.bb     |    1 +
>>   4 files changed, 4 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/samba/samba-ads_3.2.8.bb 
>> b/recipes/samba/samba-ads_3.2.8.bb
>> index 95f09c1..e643292 100644
>> --- a/recipes/samba/samba-ads_3.2.8.bb
>> +++ b/recipes/samba/samba-ads_3.2.8.bb
>> @@ -1,5 +1,6 @@
>>   require samba.inc
>>   require samba-ads.inc
>> +LICENSE = "GPLv3"
>>
>>   PR = "r2"
>>   SRC_URI += "file://config-lfs.patch;patch=1 \
>> diff --git a/recipes/samba/samba-ads_3.3.0.bb 
>> b/recipes/samba/samba-ads_3.3.0.bb
>> index 9fd4303..e5184cf 100644
>> --- a/recipes/samba/samba-ads_3.3.0.bb
>> +++ b/recipes/samba/samba-ads_3.3.0.bb
>> @@ -1,5 +1,6 @@
>>   require samba.inc
>>   require samba-ads.inc
>> +LICENSE = "GPLv3"
>>
>>   PR = "r3"
>>   SRC_URI += "file://config-lfs.patch;patch=1 \
>> diff --git a/recipes/samba/samba_3.2.8.bb b/recipes/samba/samba_3.2.8.bb
>> index 2e2cb95..16dcd31 100644
>> --- a/recipes/samba/samba_3.2.8.bb
>> +++ b/recipes/samba/samba_3.2.8.bb
>> @@ -1,5 +1,6 @@
>>   require samba.inc
>>   require samba-basic.inc
>> +LICENSE = "GPLv3"
>>
>>   SRC_URI += "file://configure-3.2.8.patch;patch=1 \
>>               file://config-h.patch;patch=1 \
>> diff --git a/recipes/samba/samba_3.3.0.bb b/recipes/samba/samba_3.3.0.bb
>> index 6270c8c..c561d95 100644
>> --- a/recipes/samba/samba_3.3.0.bb
>> +++ b/recipes/samba/samba_3.3.0.bb
>> @@ -1,5 +1,6 @@
>>   require samba.inc
>>   require samba-basic.inc
>> +LICENSE = "GPLv3"
>>
>>   # 3.3.0 and newer will upgrade your tdb database to a
>>   # new version that you can not downgrade to use with older
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



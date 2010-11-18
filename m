Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PIuA9-0007nS-DK
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 03:23:50 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PIu93-00054A-Oa from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 18:22:41 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 17 Nov 2010 18:22:41 -0800
Received: from [172.30.7.13] ([172.30.7.13]) by na2-mail.mgc.mentorg.com with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 17 Nov 2010 19:22:40 -0700
Message-ID: <4CE48DEC.1020900@mentor.com>
Date: Wed, 17 Nov 2010 19:22:36 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290041800-30146-1-git-send-email-tom_rini@mentor.com>
	<Pine.LNX.4.64.1011172054070.5082@juice.ott.cti.com>
In-Reply-To: <Pine.LNX.4.64.1011172054070.5082@juice.ott.cti.com>
X-OriginalArrivalTime: 18 Nov 2010 02:22:40.0916 (UTC)
	FILETIME=[79BBDD40:01CB86C7]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] help2man: Add native recipe, drop check for being provided.
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
X-List-Received-Date: Thu, 18 Nov 2010 02:23:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2010 07:02 PM, Michael Smith wrote:
> On Wed, 17 Nov 2010, Tom Rini wrote:
>
>> --- a/classes/autotools.bbclass
>> +++ b/classes/autotools.bbclass
>> -	deps += 'autoconf-native automake-native '
>> +	deps += 'autoconf-native automake-native help2man-native'
>
> Need a space before that closing quote.

Will go fix.

>
>> --- /dev/null
>> +++ b/recipes/help2man/help2man_1.37.1.bb
>> @@ -0,0 +1,21 @@
>> +SRC_URI = "${GNU_MIRROR}/help4man/help2man-${PV}.tar.gz"
>
> s/4/2/ :)
>
>> +do_configure() {
>> +	oe_runconf
>> +}
>
> Is this necessary? The old 1.36 recipe has it, too. Is it because auto*
> may not be built yet? Could you add a comment explaining why it's there?
>

The problem is that it gets mad about perl stuff not being around yet 
(since we use host perl here, like with automake/conf).  I'll add a 
comment as well.

-- 
Tom Rini
Mentor Graphics Corporation



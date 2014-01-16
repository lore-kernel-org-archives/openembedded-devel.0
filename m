Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 249E86D899
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 15:24:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0GFOTHw000072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Jan 2014 07:24:29 -0800 (PST)
Received: from [128.224.146.203] (128.224.146.203) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 16 Jan 2014 07:24:28 -0800
Message-ID: <52D7F9AB.5040108@windriver.com>
Date: Thu, 16 Jan 2014 10:24:27 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1389609476.git.paul.eggleton@linux.intel.com>
	<52D7ED40.3080505@windriver.com>
	<1857113.0unWlYmFcc@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1857113.0unWlYmFcc@peggleto-mobl5.ger.corp.intel.com>
X-Originating-IP: [128.224.146.203]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 0/3] Apache / PHP upgrades
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jan 2014 15:24:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-01-16 10:15 AM, Paul Eggleton wrote:
> Hi Randy,
>
> On Thursday 16 January 2014 09:31:28 Randy MacLeod wrote:
>> You asked me about dropping this patch and I've done a bit of digging.
>>
>> My conclusion is that the  patch is not integrated into 2.4.7 and
>> it would be "nice to have" since we've supported it so far.
>> It seems that apache2-2.6.x will include the patch.
>>
>> The intended use is primarily to support SPDY as described here:
>>      https://technotes.googlecode.com/git/nextprotoneg.html
>> and I skimmed though this:
>>
>> http://googledevelopers.blogspot.ca/2012/04/add-spdy-support-to-your-apache-> server.html
>>
>>
>> As for generating a new patch, the STATUS file in 2.4.7 says:
>> ...
>>      * mod_ssl: Add support for Next Protocol Negotiation.
>>        Trunk patch:
>>          http://svn.apache.org/viewvc?view=revision&revision=1332643
>>        2.4.x patch:
>>          Trunk patch works.
>>        +1: ben
>>        sf says: Needs r1345599, too.
>>             And wrowe's comment about the 2.2 patch is also valid for 2.4:
>>             http://svn.apache.org/viewvc?view=revision&revision=1354823
>>
>>
>> Does that help? Do you want someone @WR to work on the patch, the
>> mod_spdy module and testing? A few more comments and links given
>> below.
>>
>> ../Randy
>>
>> ---
>>
>> This patch has:
>>      Upstream-Status: Backport
>> and I do see the _reworked_ feature and our patch upstream
>> in the git-svn repo:
>>      https://github.com/apache/httpd.git
>> specifically, the re-worked commit here:
>>
>> https://github.com/apache/httpd/commit/afa9bc99edf96a8ff3a81786cc4ef52a9f3cf
>> 310
>>
>> and a commit with identical content to our patch here:
>>
>> https://github.com/apache/httpd/commit/79d4d4d3ce586bf526178ed6d05e1b0dca705
>> 1c4
>>
>> but they are both on the trunk branch (aka 2.5) so
>> they are not include in 2.4.7.
>>
>> The original defect is:
>>      https://issues.apache.org/bugzilla/show_bug.cgi?id=52210
>>
>>      OpenSSL 1.0.1 added support for TLS Next Protocol Negotiation (NPN)
>>      [1], a feature which allows client and server to negotiate what
>>      protocol should be used over the secure connection.  I propose
>>      adding hooks into mod_ssl to allow other modules to access
>>      this feature.
>
>
> Thanks for looking deeper into this. I'm not quite sure what they mean by
> "Trunk patch works" but I just retrieved the trunk patch and tried to apply it
> but there are conflicts; I also tried a cherry-pick on that git repository but
> that didn't work either.
>
> I suspect that it would be good to have someone else who knows more about this
> feature create and test a new patch, so if you have someone who could do that
> that would be great.

Will do. It may have to wait until after the Chinese Spring festival but
we'll get it on the "to do" list.

../Randy
>
> Cheers,
> Paul
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350


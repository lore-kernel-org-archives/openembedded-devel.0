Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80A486CC84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 06:09:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9A69qLj011006
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Oct 2013 23:09:52 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 9 Oct 2013 23:09:51 -0700
Message-ID: <525644C8.4010809@windriver.com>
Date: Thu, 10 Oct 2013 14:10:16 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1381310457-4961-1-git-send-email-Qi.Chen@windriver.com>
	<20131009122156.GA5541@deserted.net>
In-Reply-To: <20131009122156.GA5541@deserted.net>
X-Originating-IP: [128.224.162.213]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-selinux][PATCH] README: update the Dependencies area
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
X-List-Received-Date: Thu, 10 Oct 2013 06:09:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2013 08:21 PM, Joe MacDonald wrote:
> [[oe] [meta-selinux][PATCH] README: update the Dependencies area] On 13.10.09 (Wed 17:20) Qi.Chen@windriver.com wrote:
>
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Add meta-oe to the dependencies as some recipes in meta-selinux may
>> require it. Here's a dependency chain:
>>
>> ['policycoreutils', 'libselinux', 'swig-native']
>>
>> And swig is from meta-oe layer.
> I'll take a look at this.  It shouldn't be necessary, meta-selinux
> provides its own swig.
>
> meta-selinux/recipes-devtools/swig
> ??? swig
> ?   ??? 0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
> ??? swig_2.0.10.bb
> ??? swig.inc
>
> Might've crept in during the update last week.
>
> -J.

Thanks for pointing it out.
Yes. I checked again, meta-selinux has its own swig.
When I was verifying meta-selinux, I used wr-20130919 branch instead of 
the upstream-master branch.
On wr-20130919 branch, swig is not available. Is this intended? Do we 
need to update the README?

Best Regards,
Chen Qi

>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   README |    7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/README b/README
>> index 926d880..987f7ac 100644
>> --- a/README
>> +++ b/README
>> @@ -34,6 +34,13 @@ the Yocto Project website:
>>   
>>   http://www.yoctoproject.org
>>   
>> +For some recipes, the meta-oe layer is required:
>> +
>> +URI: git://github.com/openembedded/meta-oe.git
>> +subdirectory: meta-oe
>> +branch: master
>> +revision: HEAD
>> +
>>   
>>   Maintenance
>>   -----------
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



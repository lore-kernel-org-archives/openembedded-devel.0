Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 14F0F61222
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 07:40:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7C7eI7i009849
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Aug 2013 03:40:18 -0400 (EDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 12 Aug 2013 00:40:18 -0700
Message-ID: <5208915C.7000605@windriver.com>
Date: Mon, 12 Aug 2013 15:40:12 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1376281943.git.hongxu.jia@windriver.com>
	<b924f5411208349fcab702a887b1bfd30a182fd7.1376281943.git.hongxu.jia@windriver.com>
	<20130812070333.GI17945@jama> <52088E97.7000800@windriver.com>
	<20130812073530.GJ17945@jama>
In-Reply-To: <20130812073530.GJ17945@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-cpan 1/3] meta-cpan creation
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
X-List-Received-Date: Mon, 12 Aug 2013 07:40:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2013 03:35 PM, Martin Jansa wrote:
> On Mon, Aug 12, 2013 at 03:28:23PM +0800, Hongxu Jia wrote:
>> Thank you for pointing out, I have updated the branch to add this:
>>
>> +When sending single patches, please using something like:
>> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
>> --subject-prefix=meta-cpan][PATCH'
>> +
> What about the name question? cpan or perl?
'meta-perl' is ok, I will rename the layer and resend the pull request 
latter.

Thanks,
Hongxu
>>>> index 0000000..11da11f
>>>> --- /dev/null
>>>> +++ b/conf/layer.conf
>>>> @@ -0,0 +1,10 @@
>>>> +# We have a conf and classes directory, add to BBPATH
>>>> +BBPATH .= ":${LAYERDIR}"
>>>> +
>>>> +# We have recipes-* directories, add to BBFILES
>>>> +BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
>>>> +	${LAYERDIR}/recipes-*/*/*.bbappend"
>>>> +
>>>> +BBFILE_COLLECTIONS += "perl"
>>> I don't have strong opinion either way, but lets call this layer
>>> meta-perl or meta-cpan and use the same name in BBFILE_COLLECTIONS.
>>>
>>> meta-perl would be more generic (matching with meta-ruby) and maybe
>>> we'll need to add some perl related recipes which aren't from cpan?
>>>



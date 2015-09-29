Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 13D657680C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 10:03:44 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8TA3joR024903 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 05:03:45 -0500
Received: from [10.113.0.102] ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015092905034514-698992 ;
	Tue, 29 Sep 2015 05:03:45 -0500 
To: openembedded-devel@lists.openembedded.org
References: <1443440681-5009-1-git-send-email-adrian.ratiu@ni.com>
	<1E25FC86-FE6A-4FE0-850F-620603B9FC3D@gmail.com>
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <560A61FF.2070004@ni.com>
Date: Tue, 29 Sep 2015 13:03:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1E25FC86-FE6A-4FE0-850F-620603B9FC3D@gmail.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/29/2015 05:03:45 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/29/2015 05:03:45 AM,
	Serialize complete at 09/29/2015 05:03:45 AM
X-Proofpoint-Virus-Version: vendor=nai engine=5600 definitions=5800
	signatures=585085
Subject: Re: [meta-oe][PATCH] vim: Compile and provide xxd in package vim-xxd
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
X-List-Received-Date: Tue, 29 Sep 2015 10:03:47 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=windows-1252; format=flowed

On 28.09.2015 19:07, Khem Raj wrote:
>
>> On Sep 28, 2015, at 4:44 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>> meta-oe/recipes-support/vim/vim_7.4.481.bb | 10 +++++++++-
>> 1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
>> index 2ece53b..fcd036b 100644
>> --- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
>> +++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
>> @@ -59,6 +59,11 @@ EXTRA_OECONF = " \
>>      STRIP=/bin/true \
>> "
>>
>> +do_compile_append() {
>> +    cd "${S}/xxd"
>> +    make
>
> why not oe_runmake ?

I did some more research and indeed oe_runmake should be used and the 
default oe_runmake call already compiles xxd when calling the top level 
Makefile so there's no need for do_compile_append altogether.

The same goes for the install append.

The only thing needed to be done is simply package xxd. I'll rewrite and 
resubmit.

Thank you,
Adrian


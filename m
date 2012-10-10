Received: from ams-iport-3.cisco.com ([144.254.224.146])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TLpOB-0007mY-Ga
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2012 08:03:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=5624; q=dns/txt; s=iport;
	t=1349848221; x=1351057821;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to; bh=KnJyiXgCqzoGIFgl2DAVbMsS/1J749dBftUNzByd8sw=;
	b=EN2/ZxQpNmjWudnIm6EqTeOgmcPX5aYB973VBO2SD/jTSRBRxaSnAAuM
	TbB1LtyEC9YDl5lHtMTJxyehhxbzWdXk9GfoKQ+rnJoeQ2PbxKUcitHgM
	bcgZ2g+zhNQjD2RQ6USt2JFGz9yBQ3McyUqfj+zM+0Gkkz391yNQDPphR E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgwFANEKdVCQ/khR/2dsb2JhbABFi3GzQIEIgiABAQEEAQEBDwFbChELGAkWDwkDAgECARUBLxMGAgEBHodjC5oAoCWLRoYgA5M+gi2BFYRNiGOBa4Jv
X-IronPort-AV: E=Sophos;i="4.80,563,1344211200"; d="scan'208,217";a="8667611"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-3.cisco.com with ESMTP; 10 Oct 2012 05:50:18 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q9A5oIeY017114
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2012 05:50:18 GMT
Message-ID: <50750C9A.4000404@cisco.com>
Date: Wed, 10 Oct 2012 07:50:18 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.7) Gecko/20120911 Thunderbird/10.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1349784265-25901-1-git-send-email-mertsas@cisco.com>
	<20121009172718.GE4715@jama.jama.net>
In-Reply-To: <20121009172718.GE4715@jama.jama.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] libftdi: Change to use GPLv2 intead of GPLv2-REL
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
X-List-Received-Date: Wed, 10 Oct 2012 06:03:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/09/12 19:27, Martin Jansa wrote:
> On Tue, Oct 09, 2012 at 02:04:25PM +0200, Martin Ertsaas wrote:
>> According to http://www.intra2net.com/en/developer/libftdi/, libftdi itself is licensed under LGPLv2,
>> with some parts (eeprom programmer) is licensed under GPLv2. There doesn't seem to be any part licensed
>> under a GPLv2-REL variation of GPLv2, and so we should use GPLv2 instead of GPLv2-REL.
> Is it REL or RLE? Your subject and body says REL while LICENSE says RLE.
>
> Cheers,
Damn, didn't see that typo. I'll push a new one asap.

- Martin
>  
>> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
>> ---
>>  meta-oe/recipes-support/libftdi/libftdi_0.19.bb |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
>> index 2dba3f4..0842aaf 100644
>> --- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
>> +++ b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
>> @@ -4,7 +4,7 @@ including the popular bitbang mode."
>>  HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
>>  SECTION = "libs"
>>  
>> -LICENSE = "LGPLv2.1 GPLv2-RLE"
>> +LICENSE = "LGPLv2.1 GPLv2"
>>  LIC_FILES_CHKSUM= "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
>>                     file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \
>>                    "
>> -- 
>> 1.7.8.6
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



Return-Path: <raj.khem@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id D408571C9F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 18:08:59 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id f100so4371513otf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 10:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=CZHqcMGnYhbYFml4z13ZHeu9RwexplLCYI/BTCLG0Rw=;
	b=QbMKu/zKiefs0f1UzwsRmMxP8xuXwRjPIcgSssTaW3T6ROBJh5B0IpJoakED6nWxSs
	oHyMBlKAp3snYdFxs6L2m/jhd/QWDtSV6fxY2Qt3tMFh02agxe0pBHn7VC4AxDq9eZQD
	tiLo4FkuE7WT60eW6zSg3lUYXua/YErD2nAkLHnejgnM9moJUODgcDOTFpCVyBue1XhC
	rSQWUrvyeUluPd63O+Qi+u3PTjj15zGnIi1tUBqLJG6LdgUa0+fIdnFUxe3bPDPDBkW6
	MJUcMzD0Lm7H5gEtYCEzQwOLLwd0EqXzb3XnVgV9oH/vfi1k8hQQocd6m9XmQ18azF2w
	gNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CZHqcMGnYhbYFml4z13ZHeu9RwexplLCYI/BTCLG0Rw=;
	b=N++zSI7O4bAOgkZzAiiF0lbhigtw/S/hUIn3/Vqxe7gTLgrFhfDl0R8nOdYElzmkZG
	QGEmXoxak13fHe03ZsKGF3xMQ96gfXWlBezyOJMW5SxcGicC1sH2vM1OqPjhHyAmaksY
	Ob6RptUfnl5boXGochfZ1wzengQSdgQ/71oGlt5SU0ruYa/kD8DNFMOnroQoCnlukFSI
	UwtmfJopGbQE5Swwx9jCO68GMSaLfo2FDVvO1ZdRcy5CIf+FxSM9Wm0Zk9W0p3TBHBH0
	fGlXddij5GX8ggGbnSZIjrXMwKSLZWLv0kGj0ifzygtYvaBSS0RmjaTib2Z+krchPky5
	iZAg==
X-Gm-Message-State: AKwxytfBLVkVTapQuA3gxQYXXgXrN9yoEFpO5ci7PcYHvnTt2WTJrcuX
	kQWKmf2xc+Wu56h7RJ0WQGDXFWbF
X-Google-Smtp-Source: AH8x224/2v8Wpw0asgR3C7s2BJ5fQ0X22trdxmKw3iiUvp9b90U+VrukWxqBmFahuKzQM33DrcRGBQ==
X-Received: by 10.157.41.35 with SMTP id d32mr10681254otb.17.1516817340453;
	Wed, 24 Jan 2018 10:09:00 -0800 (PST)
Received: from [172.27.88.46] ([217.140.111.136])
	by smtp.gmail.com with ESMTPSA id
	r28sm1618826otc.68.2018.01.24.10.08.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jan 2018 10:08:59 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1513002095-5152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAMKF1srSpv3GbrkHrLej6uEB0ikyE77LV4h4w-c0BoWaCfM0Kg@mail.gmail.com>
	<20180124005848.208d7757@t460p>
	<e79fca87-a7ea-cd80-7fe1-b3815cdef0db@gmail.com>
	<20180124124440.38d77839@t460p>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <26f32ad3-ce9f-ba0c-6b22-16d61765feb7@gmail.com>
Date: Wed, 24 Jan 2018 12:08:58 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <20180124124440.38d77839@t460p>
Subject: Re: [meta-networking][PATCHv2] samba: Add packagegroup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jan 2018 18:09:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/24/18 5:44 AM, Andreas Oberritter wrote:
> On Tue, 23 Jan 2018 23:25:11 -0600
> Khem Raj <raj.khem@gmail.com> wrote:
> 
>> On 1/23/18 5:58 PM, Andreas Oberritter wrote:
>>> On Tue, 23 Jan 2018 09:48:14 -0600
>>> Khem Raj <raj.khem@gmail.com> wrote:
>>>   
>>>> On Mon, Dec 11, 2017 at 8:21 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:  
>>>>> Add packagegroup for samba, for there are too many rpms in samba and it's hard to manage.
>>>>>
>>>>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>>>>> ---
>>>>>  .../recipes-connectivity/samba/samba_4.6.7.bb         | 19 ++++++++++++++++++-
>>>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
>>>>> index 2b227c9..0bacb02 100644
>>>>> --- a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
>>>>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
>>>>> @@ -162,7 +162,7 @@ PACKAGES =+ "${PN}-python ${PN}-pidl \
>>>>>               ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
>>>>>               winbind \
>>>>>               ${PN}-common ${PN}-base ${PN}-ctdb-tests \
>>>>> -             smbclient"
>>>>> +             smbclient ${PN}-client ${PN}-test"
>>>>>
>>>>>  python samba_populate_packages() {
>>>>>      def module_hook(file, pkg, pattern, format, basename):
>>>>> @@ -254,3 +254,20 @@ FILES_smbclient = "${bindir}/cifsdd \
>>>>>
>>>>>  RDEPENDS_${PN}-pidl_append = " perl"
>>>>>  FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
>>>>> +
>>>>> +SUMMARY_${PN}-client = "samba client"
>>>>> +RDEPENDS_${PN}-client = "\
>>>>> +    smbclient \
>>>>> +    winbind \
>>>>> +    registry-tools \
>>>>> +    ${PN}-pidl \
>>>>> +    "
>>>>> +
>>>>> +ALLOW_EMPTY_${PN}-client = "1"
>>>>> +
>>>>> +RDEPENDS_${PN}-test = "\
>>>>> +    ${PN}-ctdb-tests \
>>>>> +    ${PN}-testsuite \
>>>>> +    "
>>>>> +
>>>>> +ALLOW_EMPTY_${PN}-test = "1"    
>>>>
>>>> perhaps better to add a packagegroup recipe explicitly  
>>>
>>> How would a packagegroup be useful for a single recipe? We discussed this
>>> back in December:  
>>
>> why does single recipe matter ?
> 
> Because the most simple form of a group of packages is a meta package in the
> recipe creating the packages. And simple, in case of doubt, wins against
> complicated.
> 

Yes thats correct and usually, meta packages are a bit rare, where as
packagegroups are more or less self explanatory. If we are defining a
meta package, perhaps the package granularity of samba should also be
looked at, it might be too granular to be useful. Either way, I think
its fine, I personally prefer packagegroups


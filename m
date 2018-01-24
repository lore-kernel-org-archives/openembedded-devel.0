Return-Path: <raj.khem@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id D096178741
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 05:25:11 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id r4so2569507oti.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 21:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=pdah65x0euCqqYj3CwnxAGCDGWtZNETFzbB5jbkI7wk=;
	b=nUKvB8PawXN//LAW7FNYuOYpAuBGTa4kY8u70vcdtXbwAc4J+WroLoFnDrNLbLNSXr
	vCZIeu2vGGkpLzzbfVsQaDtAk/Ssz4fDmwXuJXdhe+ZRUf8DqjZTLacl52fKYRRlhQLR
	yy22RkRMmcUd3UC001g0lVEtibr0Qb2JEDmbPb6b/ES8kh6fvKCgDuEYM1+0Q6k/+XNA
	G7TRZ9ORxP0jg8cqFGF2M4Xvl8w1Sl1Pa0E3ka6Sytzt6EYXUajcAnbPR8DC4rXTRU2W
	U8tUddaSR8Eiz0UOUGSQ2TfrPiGMN/O96qhw40NAxHT5LER2vGu1Q6b9ixhhhMpijm46
	T2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pdah65x0euCqqYj3CwnxAGCDGWtZNETFzbB5jbkI7wk=;
	b=Gs1w/7qMkQgdpXGsI+P3m5cYiOBqCtb3GT/yCY222bXac1k+5LesZjkppORnP7Xn0L
	c+0h6A2M5lxfl5NxWJtC6wsugCZ2A61bGWrFn1KK9X3xiJ001p3HtMp38YlMZ0sRC7E0
	g5y71OpHYE0kaDu1SyRpYJUdNVib+ZHXVVEDN5vShGnCB5imxq0S4VMw/gNiUpjaBp2h
	u2tcz/lvWxTFG3nzJjGxUkYoSo3CMI5yqdvAx37xncrbqA1M+4YxaV1so1auc9e5lZ8R
	K+k4UeDsqh/jYd/VAdJ7/EOFP6zjZ4wR8z85hr7OA3yEToBcZF/999cKIOhE3wl0ywt5
	WsOA==
X-Gm-Message-State: AKwxytdVfzYYalXZqyD372R4/8IvCF/h0gmqbfWJzLwbZY+lhAqv5nmp
	l6u7cpzcM6XkkkfohaS3BLAUu4is
X-Google-Smtp-Source: AH8x225OPXy/44uItFE7rNYNvMNstZYpzrEx5Z3hXZRD7PlrXWKpVssaFMln+VL9kXZFSg5rpoQ7tQ==
X-Received: by 10.157.50.5 with SMTP id t5mr8426133otc.172.1516771512612;
	Tue, 23 Jan 2018 21:25:12 -0800 (PST)
Received: from [172.20.1.220] (207-91-160-20.nstci.net. [207.91.160.20])
	by smtp.gmail.com with ESMTPSA id
	f193sm1944911oih.28.2018.01.23.21.25.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 21:25:11 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1513002095-5152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAMKF1srSpv3GbrkHrLej6uEB0ikyE77LV4h4w-c0BoWaCfM0Kg@mail.gmail.com>
	<20180124005848.208d7757@t460p>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <e79fca87-a7ea-cd80-7fe1-b3815cdef0db@gmail.com>
Date: Tue, 23 Jan 2018 23:25:11 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <20180124005848.208d7757@t460p>
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
X-List-Received-Date: Wed, 24 Jan 2018 05:25:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/23/18 5:58 PM, Andreas Oberritter wrote:
> On Tue, 23 Jan 2018 09:48:14 -0600
> Khem Raj <raj.khem@gmail.com> wrote:
> 
>> On Mon, Dec 11, 2017 at 8:21 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
>>> Add packagegroup for samba, for there are too many rpms in samba and it's hard to manage.
>>>
>>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>>> ---
>>>  .../recipes-connectivity/samba/samba_4.6.7.bb         | 19 ++++++++++++++++++-
>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
>>> index 2b227c9..0bacb02 100644
>>> --- a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
>>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
>>> @@ -162,7 +162,7 @@ PACKAGES =+ "${PN}-python ${PN}-pidl \
>>>               ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
>>>               winbind \
>>>               ${PN}-common ${PN}-base ${PN}-ctdb-tests \
>>> -             smbclient"
>>> +             smbclient ${PN}-client ${PN}-test"
>>>
>>>  python samba_populate_packages() {
>>>      def module_hook(file, pkg, pattern, format, basename):
>>> @@ -254,3 +254,20 @@ FILES_smbclient = "${bindir}/cifsdd \
>>>
>>>  RDEPENDS_${PN}-pidl_append = " perl"
>>>  FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
>>> +
>>> +SUMMARY_${PN}-client = "samba client"
>>> +RDEPENDS_${PN}-client = "\
>>> +    smbclient \
>>> +    winbind \
>>> +    registry-tools \
>>> +    ${PN}-pidl \
>>> +    "
>>> +
>>> +ALLOW_EMPTY_${PN}-client = "1"
>>> +
>>> +RDEPENDS_${PN}-test = "\
>>> +    ${PN}-ctdb-tests \
>>> +    ${PN}-testsuite \
>>> +    "
>>> +
>>> +ALLOW_EMPTY_${PN}-test = "1"  
>>
>> perhaps better to add a packagegroup recipe explicitly
> 
> How would a packagegroup be useful for a single recipe? We discussed this
> back in December:

why does single recipe matter ?

> 
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-December/115888.html
> 
> Regards,
> Andreas
> 



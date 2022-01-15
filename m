Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B7BC433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 15:46:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.8593.1642261558659664465
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 07:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=tNFBXtDU;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5BF6D8142D;
	Sat, 15 Jan 2022 16:45:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1642261555;
	bh=GcVuoVL/nS/r1CYapdUcGveZSAr827FFdvJPBcm2qkQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tNFBXtDUIuvvX1PqqNu9LRXd86v7vJPgf8IpCgeuANq7pkIABRV6a8A8iG4lnrHD6
	 PD3Gv0/mwqfYI4Rei9G3X6+VHVF0UCVaZnJcY9zZDgejKfaSK9eWjDRIdsP5+QcIDK
	 aZy3W0wmVcckPNVNS0UwpHGMPGrTSvUgkrrq9E0oGN6H/AXBO+fQsYsYWwZwHHq35l
	 0b+dXtZDpanLhEyOXUO8HMXoKx6wjlLpKhFQYtCyGkarTinCjwXj9OeBqkczZJ1FF9
	 zQSd8soypA8jlQ2ocvItDNA0D+IFfl5KEIBPoSunuUa3i5iLQi3f7dI1Xd7HdaEElY
	 eUkspV5fqkVIw==
Message-ID: <5e27977c-15aa-42ca-463a-744d1b36d306@denx.de>
Date: Sat, 15 Jan 2022 16:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [oe] [meta-oe][dunfell][PATCH 1/5] freerdp: Upgrade to 2.2.0
Content-Language: en-US
To: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20220111224714.1289840-1-marex@denx.de>
 <4d1f655b-23c4-7f6a-c4bd-259a890738f5@gmail.com>
 <c020d0e7-8702-c169-5812-5a8c06f19b7c@denx.de>
 <d2d5d5dc-c1db-700d-470c-42126bc394dc@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <d2d5d5dc-c1db-700d-470c-42126bc394dc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 15:46:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94871

On 1/15/22 14:43, akuster808 wrote:
> 
> 
> On 1/11/22 8:57 PM, Marek Vasut wrote:
>> On 1/12/22 05:42, akuster808 wrote:
>>>
>>>
>>> On 1/11/22 2:47 PM, Marek Vasut wrote:
>>>> From: Khem Raj <raj.khem@gmail.com>
>>>>
>>>> (cherry picked from commit f751dcf81a18fe817b40e755a2ba3f54a74d1e02)
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>
>>> And why should I allow this?
>>
>> This ... what ? The SoB line or the update ?
> 
> What is in the update from 2.2.0 to 2.4.1?

This patch updates freerdp from 2.0.0 to 2.2.0 , not from 2.2.0 to 2.4.1 
, that's a later patch. This one addresses quite a few old CVEs though, 
see below.

> I had to look at the release notes myself and found new features being
> added between those two. New features are not allowed per our process.

This should all be part of FreeRDP stable-2.0 branch
https://github.com/FreeRDP/FreeRDP/tree/stable-2.0

Their active development is happening toward 3.0 release, that's where 
features are being added.

Looking briefly at the debian changelog for the various CVEs this 
patchset addresses, here is a list:

https://metadata.ftp-master.debian.org/changelogs//main/f/freerdp2/freerdp2_2.4.1+dfsg1-1_changelog

freerdp2 (2.2.0+dfsg1-1) unstable; urgency=medium

   * New upstream release.
     + CVE-2020-15103: Integer overflow due to missing input sanitation in
...

freerdp2 (2.1.2+dfsg1-1) unstable; urgency=medium

   * New upstream release.
     - CVE-2020-4033: Out of bound read in RLEDECOMPRESS
     - CVE-2020-4031: Use-After-Free in gdi_SelectObject
     - CVE-2020-4032: Integer casting vulnerability in
       `update_recv_secondary_order`
     - CVE-2020-4030: OOB read in `TrioParse`
     - CVE-2020-11099: OOB Read in 
license_read_new_or_upgrade_license_packet
     - CVE-2020-11098: Out-of-bound read in glyph_cache_put
     - CVE-2020-11097: OOB read in ntlm_av_pair_get
     - CVE-2020-11095: Global OOB read in update_recv_primary_order
     - CVE-2020-11096: Global OOB read in update_read_cache_bitmap_v3_order
...

freerdp2 (2.4.1+dfsg1-1) unstable; urgency=medium

   * New upstream release. (Closes: #999727).
     - CVE-2021-41160: Fix improper region checks in all clients that 
allowed
       out of bound write to memory. (Closes: #1001062).
     - CVE-2021-41159: Fix improper client input validation for gateway
       connections that allowed one to overwrite memory. (Closes: #1001061).

> This patch set will not be included.

I see you've made your decision then.

How do you propose those CVEs be closed in dunfell then ?

[...]


Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99B5678213
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 22:29:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9GMTb4H022288
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 16 Oct 2017 15:29:38 -0700
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 16 Oct 2017 15:29:37 -0700
To: akuster808 <akuster808@gmail.com>, Denys Dmytriyenko <denis@denix.org>
References: <20171016164336.150658-1-mark.hatle@windriver.com>
	<20171016181421.GW9221@denix.org>
	<795c3189-db80-f81d-ce03-48bf93bed653@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <c7721e73-cd55-d5da-a1f2-4a730058ae5d@windriver.com>
Date: Mon, 16 Oct 2017 17:29:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <795c3189-db80-f81d-ce03-48bf93bed653@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] hostapd: fix WPA2 key replay security bug
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
X-List-Received-Date: Mon, 16 Oct 2017 22:29:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/16/17 3:57 PM, akuster808 wrote:
> 
> 
> On 10/16/2017 11:14 AM, Denys Dmytriyenko wrote:
>> Can we also prioritize backporting this to older releases as well - pyro, 
> This should apply directly to pyro as its the same version.
> I will wait for this to land in master.

Should apply to pyro as-is.

>> morty?
> They may apply to morty  as it is version 2.5 and this against 2.6.
>>
>> Armin, Martin,
>>
>> Do you need separate patches submitted? Please let me know if you need help.
> pyro no, don't know about morty.

The patches do not directly apply to 2.5 and older.. (but it's not difficult).
We have posted (for our customers) versions for Morty (2.2), Jethro (2.0) and
Dizzy (1.7).

See: https://knowledge.windriver.com/Content_Lookup?id=K-511283

[if you do need a login, just let me know and I'll send you the patches directly.]

(This shouldn't need a Wind River customer login to view.  Morty is WR 9, Jethro
WR 8, Dizzy WR 7.)

I'm out of time to work on the patches this minute, but maybe someone can use
this to prepare fixes.

--Mark

> - armin
>>
>> Thanks!
>>
> 
> 



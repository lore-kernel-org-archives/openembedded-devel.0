Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 81BB97FECE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 13:27:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBIDRV4K005002
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 18 Dec 2019 05:27:31 -0800 (PST)
Received: from [128.224.20.182] (128.224.20.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 18 Dec 2019 05:27:30 -0800
To: Khem Raj <raj.khem@gmail.com>, Adrian Bunk <bunk@stusta.de>
References: <20191218011113.4072000-1-trevor.gamblin@windriver.com>
	<20191218031409.GA1997@localhost>
	<CAMKF1sp3J1tKBSJT2ATzXmmTmmM0B6iLWTGVb241rSmWbsSTLA@mail.gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <0ea65c31-a5cd-bb57-f49d-7cefd2602978@windriver.com>
Date: Wed, 18 Dec 2019 08:27:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp3J1tKBSJT2ATzXmmTmmM0B6iLWTGVb241rSmWbsSTLA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] net-snmp: update default community string
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
X-List-Received-Date: Wed, 18 Dec 2019 13:27:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12/17/19 10:17 PM, Khem Raj wrote:
> On Tue, Dec 17, 2019 at 7:14 PM Adrian Bunk <bunk@stusta.de> wrote:
>> On Tue, Dec 17, 2019 at 08:11:13PM -0500, Trevor Gamblin wrote:
>>> snmpd.conf, by default, lists the string "public" as the community string. As
>>> a consequence, any build incorporating net-snmp implicitly enables a
>>> vulnerability (CVE-1999-0517) where an attacker could obtain information about
>>> (and potential control of) the device and its network. This issue is picked up
>>> by common security scan tools, and given the age of the vulnerability, some
>>> minimum mitigation steps should be taken. While the conf file itself
>>> recommends setting the community string to a value known only within the
>>> user's organization, changing this string's default value for Yocto builds is
>>> a minimum step to help mitigate this issue.
>>> ...
>>> -com2sec paranoid  default         public
>>> +com2sec paranoid  default         yocto-snmp-community
>>> ...
>> Instead of mitigation this might do more bad than good.
>>
>> Attackers and security scan tools will just start to also
>> scan for the known alternative "yocto-snmp-community".
>>
>> The problem is that attackers tend to be faster with that,
>> so the actual change would be that security scan tools might
>> no longer report a vulnerability attackers will still use.
>>
> I tend to agree. Perhaps describe mitigation in wiki and let users
> chose a string of their choice
> and let defaults be as they are.
Those are good points. Thanks for reviewing.
>
>> cu
>> Adrian
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


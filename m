Return-Path: <jaap.dejong@nedap.com>
Received: from smtp.nedap.com (smtp4.nedap.com [213.160.213.85])
	by mail.openembedded.org (Postfix) with ESMTP id AACC76E8E2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 07:12:28 +0000 (UTC)
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.279.5; Fri, 28 Mar 2014
	08:12:27 +0100
X-TM-IMSS-Message-ID: <49320db60006d1f8@nedap.com>
Received: from [10.2.24.45] ([10.2.24.45]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 49320db60006d1f8 ;
	Fri, 28 Mar 2014 08:12:33 +0100
Message-ID: <533520D0.5010306@nedap.com>
Date: Fri, 28 Mar 2014 08:12:16 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <5333F1AC.4060807@nedap.com> <20140327113339.GO3709@jama>
In-Reply-To: <20140327113339.GO3709@jama>
Subject: Re: transitional packages
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
X-List-Received-Date: Fri, 28 Mar 2014 07:12:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 27-03-14 12:33, Martin Jansa wrote:
> On Thu, Mar 27, 2014 at 10:38:52AM +0100, Jaap de Jong wrote:
>> Hi All,
>>
>> for one project I'm still using oe-classic.
>> Would like to upgrade that!
>> I know a simple update will not work because (among others?) package
>> names are changed.
>> Is there any effort made to create transitional packages?
> I don't know about any.
>
>> If not, would it be a tough job?
> Yes, maybe not so bad if you have exactly one starting point and one
> final, but to provide upgrade path from "some" state of binary feeds in
> oe-core to "some" state of binary feeds built with oe-core is very close
> to impossible (as you cannot test every combination).
Thanks for your explanation.
So then I would go for the one starting point (my oe-classic build) to 
one end point (my oe-core build).
The easiest approach then perhaps could be migrating oe-classic to 
oe-core. Then look at the differences between the two.
And finally write a transition package that would be able to upgrade.
Would that be possible at all?

> Some versions went backwards, you need to migrate LOCALCOUNTs to PRSERV
> db a lot of packages were renamed or removed without replacement
Is there perhaps some list for this?

> (so
> they will be stuck in your target image unless you explicitly RCONFLICT
> RREPLACE them from your transitional package),

> there are upgrade path
> issues even between oe-core revisions.
>
It would really be nice if there wouldn't be issues between revisions or 
transition packages available...




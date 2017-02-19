Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 0FED67199D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 09:13:03 +0000 (UTC)
Received: from [172.16.1.14] (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id BA46830F37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 10:13:02 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <ace37025-faef-4ffe-1e02-e3a1ad52ff03@pseudoterminal.org>
	<CA+chaQcSUf1T+tRgKUm=N=8R5jfTs7UZjxpp2vtBhELeOCADJg@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <916edbb8-487d-37ae-b45b-f6e22c918ff4@pseudoterminal.org>
Date: Sun, 19 Feb 2017 10:13:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcSUf1T+tRgKUm=N=8R5jfTs7UZjxpp2vtBhELeOCADJg@mail.gmail.com>
Subject: Re: [morty][meta-openembedded] Commit backport required
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
X-List-Received-Date: Sun, 19 Feb 2017 09:13:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Damn .. you are right. Poky was accidentally set to use the master 
branch instead of morty.

Nevermind my posting then.


On 2017-02-18 21:27, Martin Jansa wrote:
> Are you sure you're using right version of bitbake? I doubt that bb.data
> API changes was backported to release branch of bitbake.
>
> On Sat, Feb 18, 2017 at 9:08 PM, Carlos Rafael Giani <dv@pseudoterminal.org>
> wrote:
>
>> Hello,
>>
>> commit d361ef01a9a61cd8a83f7728f7d3e9f118233cb8 "nis, opencv: Update
>> getVar/setVar syntax" needs to be backported to meta-openembedded's morty
>> branch. Otherwise builds break, because the deprecated bb.data API was
>> removed also in morty.
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>



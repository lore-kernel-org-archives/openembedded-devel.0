Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id EB22F77D24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 09:15:56 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wRsHx1DSqz1qt0s;
	Tue, 16 May 2017 11:15:57 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wRsHx0G90z3hj2g;
	Tue, 16 May 2017 11:15:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id S8Ie31iavsy0; Tue, 16 May 2017 11:15:55 +0200 (CEST)
X-Auth-Info: 7eAQ53m8TM1dI8XVb65ETollwcPWGDX+Ot+vaxfQf3w=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 16 May 2017 11:15:55 +0200 (CEST)
To: Stefano Babic <sbabic@denx.de>, Martin Jansa <martin.jansa@gmail.com>
References: <1494605830-18765-1-git-send-email-sbabic@denx.de>
	<20170516075639.GC3088@jama>
	<2d867591-9f06-a260-2318-8751affebb4f@denx.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <d7680348-01fd-d764-933b-a78bd1062a67@denx.de>
Date: Tue, 16 May 2017 11:15:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <2d867591-9f06-a260-2318-8751affebb4f@denx.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Fix broken package fbida
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
X-List-Received-Date: Tue, 16 May 2017 09:15:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 05/16/2017 10:30 AM, Stefano Babic wrote:
> Hi Martin,

Hi,

> On 16/05/2017 09:56, Martin Jansa wrote:
>> On Fri, May 12, 2017 at 06:17:10PM +0200, Stefano Babic wrote:
>>> Missing pkgconfig does not let build the package.
>>
>> The summary should start with
>> fbida:
> 
> Sorry, noted for next time.
> 
>> I've updated the summary when adding it to master-next
>>
>> How does this relate to:
>> https://patchwork.openembedded.org/patch/138960/
>> ?
>>
>> Was Marek's change just a fix for the case when the pkgconfig wasn't
>> used because of missing inherit?
>>
> 
> IMHO the changes are unrelated - I have also changed as Marek did and
> after that I noted he has already sent a patch. Absolute path /usr/local
> is hard-coded in Makefile, and this is what Marek fixed. Marek, is it
> correct ?

Yeah. The inherit pkgconfig is needed too (since some time), I have a
patch in a tree but forgot to submit it. Clearly you were faster.

-- 
Best regards,
Marek Vasut


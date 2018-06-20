Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 7808075556
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 13:52:20 +0000 (UTC)
Received: from [IPv6:2001:16b8:461e:9000:fb3d:eda3:a041:c60f]
	(200116b8461e9000fb3deda3a041c60f.dip.versatel-1u1.de
	[IPv6:2001:16b8:461e:9000:fb3d:eda3:a041:c60f])
	by mail.bugwerft.de (Postfix) with ESMTPSA id E97B628A5B0;
	Wed, 20 Jun 2018 13:49:15 +0000 (UTC)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180529092556.25053-1-samuli.piippo@qt.io>
	<69a631ae-09ec-a7c0-5965-f5372ef463c7@zonque.org>
	<CA+chaQfXaWZvyUqWSE-Zq=nSW13Jwt=GVPhXTj0dVbzVGpebww@mail.gmail.com>
	<d2df5115-8f79-fb79-e761-919fed4cd50f@zonque.org>
	<20180620112953.GA3257@jama>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <67f7d601-e2e7-63c8-ac49-2cf27345853d@zonque.org>
Date: Wed, 20 Jun 2018 15:52:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180620112953.GA3257@jama>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
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
X-List-Received-Date: Wed, 20 Jun 2018 13:52:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On Wednesday, June 20, 2018 01:29 PM, Martin Jansa wrote:
> On Wed, Jun 20, 2018 at 12:50:52PM +0200, Daniel Mack wrote:
>> On Wednesday, June 20, 2018 12:36 PM, Martin Jansa wrote:
>>> It's already in meta-qt5/master with couple fixes on top of that.
>>
>> Ah, sorry. For some reason, I only looked into the -next branches.
> 
> Well, meta-qt5/master-next is exactly the same as meta-qt5/master :).
> 
>> Stupid. FWIW, I have a patch for 5.11.1 ready. Will send once the build
>> succeeded.
> 
> I've started rebasing the patches in meta-qt5 as well, but we cannot use
> 5.11.1 until downmerge to 5.11 is finished, because:
> 
> 1) we cannot use 5.11.1 branch, because they might delete this branch at
> any time (like with 5.10.1)

But there's also a v5.11.1 tag, which is unlikely to be deleted?

I might miss something and I haven't followed the discussions, but is 
your idea to drop the explicit SRCREVs in the recipes in favor of 
AUTOREV and a branch name?

FWIW, I've written a small shell script that retrieves the SHA1 for each 
of the qt projects and updates the .bb files automatically. That seems 
to work quite well, and I'm happy to share it. There's still the problem 
with downstream patches and other necessary changes in the recipes for 
new Qt versions, but that's an issue either way.


Thanks,
Daniel


Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id DC6EE736B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 13:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id BFFE81EE0875
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 15:13:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024) with ESMTP id 5xCm94k6Ud5N
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 15:13:10 +0200 (CEST)
Received: from [10.1.8.214] (gre92-5-82-237-199-7.fbx.proxad.net
	[82.237.199.7])
	by idris.smile.fr (Postfix) with ESMTPSA id A08CC1EE051D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 15:13:10 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1471343516-6946-1-git-send-email-jeremy.rosen@smile.fr>
	<CAJTo0LYKYph9e_JaLVbFbByCCwk9a2zmHVLAMEoed7h5rGeArQ@mail.gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <fa2fc853-b871-1ad1-a1cc-408fed9967bf@smile.fr>
Date: Tue, 16 Aug 2016 15:13:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYKYph9e_JaLVbFbByCCwk9a2zmHVLAMEoed7h5rGeArQ@mail.gmail.com>
Subject: Re: [PATCH] [jethro] fix gcc-cross when BUILD_* are set
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
X-List-Received-Date: Tue, 16 Aug 2016 13:13:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/08/2016 12:40, Burton, Ross wrote:
> On 16 August 2016 at 11:31, Jérémy Rosen <jeremy.rosen@smile.fr> wrote:
>
>> When building with a compiler which is not gcc the gcc-croos will still
>> use the $CC and $CXX variables
>>
>> These variables are not set properly to BUILD_CC and BUILD_CXX by the
>> recipe.
>>
>> This is problematic now for jethro because gcc-6 is the default compiler
>> for some distros (debian testing) which can't build jethro anymore
>>
> Needs to go to openembedded-core@, and needs to be for/tested with master
> before hitting the stable branches.
I'll try, but testing on master is tricky.
Master build correctly with gcc-6 and doesn't trigger the bug. i'll try 
to trick my debian to trigger the bug...

> Ross



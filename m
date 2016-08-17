Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 65AD26013D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 07:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 099AB1EE0854
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 09:33:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024) with ESMTP id 7poKQz8zhnFr
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 09:33:42 +0200 (CEST)
Received: from [10.9.18.224] (229.29.205.77.rev.sfr.net [77.205.29.229])
	by idris.smile.fr (Postfix) with ESMTPSA id C7B3F1EE0761
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 09:33:42 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1471343516-6946-1-git-send-email-jeremy.rosen@smile.fr>
	<CAJTo0LYKYph9e_JaLVbFbByCCwk9a2zmHVLAMEoed7h5rGeArQ@mail.gmail.com>
	<fa2fc853-b871-1ad1-a1cc-408fed9967bf@smile.fr>
	<CAJTo0LYFf-UaFB4VyCRv-0JPb+aBA_ZzVk+UCEB_GG65h3sqkw@mail.gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <5bbf16c7-38e1-0478-d0f4-e6457783e2a8@smile.fr>
Date: Wed, 17 Aug 2016 09:33:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYFf-UaFB4VyCRv-0JPb+aBA_ZzVk+UCEB_GG65h3sqkw@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Aug 2016 07:33:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

yeah, I added a directory at the beginning of my PATH and had a link 
gcc->/bin/false and mygcc -> /usr/bin/gcc there... that triggered some 
more cases that I hadn't seen

expect a patch serie at some point in the future


On 16/08/2016 18:40, Burton, Ross wrote:
> On 16 August 2016 at 14:13, Jérémy Rosen <jeremy.rosen@smile.fr> wrote:
>
>> Master build correctly with gcc-6 and doesn't trigger the bug. i'll try to
>> trick my debian to trigger the bug...
>>
> I almost did this on Friday but had some more important builds to run:
> basically chmod -x /usr/bin/gcc /usr/bin/g++ /usr/bin/cpp and anything that
> doesn't respect BUILD_* will fail fairly obviously. :)
>
> Ross



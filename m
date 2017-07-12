Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 97AFE780B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 14:50:00 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id f68so1307053vkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YIewBBjwQuDx3gCjwprSuAB3C+oGAaKZOXWO75wArDg=;
	b=VcrW+lutSEnFGAlBRgjMfq1Wg2Q6zbMAFojbTQRdh7bARZFBwv2/iG+r2ccRVN30YE
	WwKZrR2+Qp2Nh6XBMWd4dJsJBN27u4Mx7R03NhlFZlND/1vKEo0IJQQ5xOtuRP0AETHO
	J+MgBAbTeXBNopXUvvAbZi8Nzhta14uEK/XiKwDfCj5fdJvXFJFAwB8VLMOfuXbepI0G
	R27+anzlpZiCszlEtxm9KSYKKcBY0T/CNUbtkHROuWKpvUmBEC6uPMdVUHXa6QVFfN9X
	lN4DQJTYlhxvOuK11dudWfrx80yefpadJUY9pCFOkH9ZDLpXL5F7FBjmgkc6M0L9lpf1
	A6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YIewBBjwQuDx3gCjwprSuAB3C+oGAaKZOXWO75wArDg=;
	b=U9GPh7sEs23P01a60C0TlhjnZUZcV6gfkaKqC2ix/+cPCmXQMuq75mk8ZOr9VRdMa1
	ZE537IrFKW0a6Tg95hZ9aVwqOwB8fHisnHOzKn+C4POWoSc1tT2QN8XwvDzM7nZhkt70
	LuVnhfyCYl5dMK4p/dvx2qJ+J78PBxddnazAiaJEBuJHp0Dgo6Mvf8oXnGnTBg6ORrAI
	O6qQVR+TRX0zbvgVLGAolcM+Ew5U/aECjGOSDL27DMYLjyYhu0rtorJhEBo3Y5qb5nA4
	k9UI/CF4xEFwiKSHad1EDh7sZQpyNNkLck/AdWLrj7u4LpSVaSx9c31+CV1jD0TPP+Xj
	nDKA==
X-Gm-Message-State: AIVw112BugcTjcg6H145FJD0rA/GsdlnzW4PUAnRdk0S4jgo/Hf+0gs2
	jXCo58wNjf/CUFU2VvcHS4GHaW+mHA==
X-Received: by 10.31.58.206 with SMTP id h197mr1499471vka.23.1499871001251;
	Wed, 12 Jul 2017 07:50:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.77.72 with HTTP; Wed, 12 Jul 2017 07:50:00 -0700 (PDT)
In-Reply-To: <CAMKF1sq30C2Kr9JsFE1RqeGsJOSC-NvvZeCDb+dJgdf5R5FoAw@mail.gmail.com>
References: <20170711181353.4404-1-raj.khem@gmail.com>
	<a5e067ca-4cdf-df31-d106-de26b5637df9@xevo.com>
	<CA+chaQcKpDbFe=iq=BbKg4BiUrFfRHBHJePAEOxeMny9fUs8Bg@mail.gmail.com>
	<CAMKF1sq30C2Kr9JsFE1RqeGsJOSC-NvvZeCDb+dJgdf5R5FoAw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 12 Jul 2017 16:50:00 +0200
Message-ID: <CALbNGRRuQMSr8CB++M1aBC=PRzMQ5FqLs6w5i7StS_7maFG7Ow@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase-native: Fix qdbuscpp2xml segfault
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
X-List-Received-Date: Wed, 12 Jul 2017 14:50:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2017 at 3:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Jul 12, 2017 at 12:30 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> Is this meant to be applied only for 5.9 or are you seeing this issue wi=
th
>> 5.8 as well?
>>
>
> for 5.8, i havent tested 5.9
>
>> On Wed, Jul 12, 2017 at 1:13 AM, Martin Kelly <mkelly@xevo.com> wrote:
>>>
>>> Thanks! This bug has been bothering me for a while now, and the patch
>>> fixes the issue for me.
>>>
I think the patch does not cause trouble for Qt <=3D 5.8 installed on
build host. It seems that 5.9 for host is the crashing combination.

As the author of the patch:

* I am aware that removing this patch causes kde balloo build errors
for cross 5.8 (current)
* I hope moving cross 5.9 (future hopefully) will fix issues properly
* the patch seems to do the wrong thing: it causes dependencies on
build host's libraries

So

Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

Andreas


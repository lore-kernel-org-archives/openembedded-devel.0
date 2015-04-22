Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7C95060167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2015 14:51:32 +0000 (UTC)
Received: by wizk4 with SMTP id k4so181207266wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2015 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=uB3QXj+c2YXuh+SITII3psWE8Rn8QTLIt4CO4DNWvCo=;
	b=nHqEmIBBWyq70Os1FYRklZIgrX3ltsV72tLQAW6Cnn4F1RY4b47QbUur4w5tHl6Nt9
	isEecbbONY8aqG3xzxA/zdDAhDcBZqytiJ1/28DjIWETly69kmV4P5EQXWcl6WustURt
	RWrZTeOKfOb+nTch5MrVnfcYeMFKQFj9ysJltADv+E7vnAgLJAKrHhOvglqXdWzgi4+U
	vymrIlfAp0jZqqpZzELn0ZdP1eaSaXp0q+mTNYvrU9cox3Amy19BdElAVIGQebUH4NWw
	yY3d+GLAqIBT9y2zYMtLDqlKD4of0AmLitDTvKfsmojda4SpGU5e0OwBZBmxxpqtOkEh
	P0YQ==
X-Received: by 10.194.133.102 with SMTP id pb6mr50753536wjb.97.1429714293716; 
	Wed, 22 Apr 2015 07:51:33 -0700 (PDT)
Received: from [192.168.50.199] (ip-84-119-99-153.unity-media.net.
	[84.119.99.153])
	by mx.google.com with ESMTPSA id ln8sm7677577wjc.18.2015.04.22.07.51.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Apr 2015 07:51:32 -0700 (PDT)
Message-ID: <5537B57D.4090903@gmail.com>
Date: Wed, 22 Apr 2015 16:51:41 +0200
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
	<CAP9ODKoV+SZYEaSEYWL2=8Pz49VrUjaRbMHsAb0-Y8v3H_8+NQ@mail.gmail.com>
	<5535EF8A.4070100@gmail.com>
In-Reply-To: <5535EF8A.4070100@gmail.com>
Subject: Re: [meta-java][PATCH v2 0/7] Update OpenJDK7 to IcedTea 2.5.4 und OpenJDK 7u75b13
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
X-List-Received-Date: Wed, 22 Apr 2015 14:51:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Am 21.04.2015 um 08:34 schrieb Sven Ebenfeld:
> Hi Otavio,
> 
> Am 20.04.2015 um 16:58 schrieb Otavio Salvador:
>> Hello Sven,
>>
>> On Mon, Apr 13, 2015 at 4:27 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
>>> There were some mistakes in my former recipes. This version fixes them.
>>> OpenJDK-7 did not depend on krb5 but excluded it in OECONF. Now I changed to
>>> depending on krb5 and not excluding it. I've tested building and running it
>>> against dizzy and master branches of oe-core, bitbake and meta-openembedded.
>>> Built with qemux86 and qemuarm. This release switches the HotSpot-Release to a
>>> newer one because of a segfault bug in the ARM Thumb2 JIT.
>>
>> Did you see Khem comments about the patchset?
>>
> 
> Yes, I saw those comments. I was thinking, that there will come more
> comments, so I waited to create a new patchset.
> 
>> It would be interesting to get a new version addressing those so we
>> can merge it into master branch (currently it is hold in master-next).
>>
> 
> If you want to merge it, I will fix the issues and send a new patchset.
> 

I will create and send the new patchset within the next weekend.


Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 505297FC98
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 18:58:02 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id j17so9516496edp.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 10:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zDLoo5izlTyWIjIEkERl0KVT+bstTTmdNr1cNsj/E0w=;
	b=Okd802miA0MQia8kK0X2hkYaFG/v8sLOiZyVYrjcTBF3bqGB4EipV86tP99pxs7REa
	ApiK/wZb561Ub5vGqgVRjZ6A2cyMSICX9j7hJGuYbYRglnTdQIyoDZXJh6zKnvi+SoNC
	QTyjI3cHXuRBp9DSpF62TDJkjCrM41VsnktqkAIq7+ra6nCGGoaMRwi1PVS/hugu53j6
	c/2V/hDO/B8mcIFHSzm7iMdZQ8YfAdzTnBNwuzi+tNWAAprqJmSdEQmsRWtvMiNpd94q
	182SUEQG3PJBCD02h+PAqgSQ+nH/c5jageEdQzSP6JVUlUzEf7JXMW5EXbtfbdbzog4D
	W93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zDLoo5izlTyWIjIEkERl0KVT+bstTTmdNr1cNsj/E0w=;
	b=IbPR7LnGgp3Z8LwL8vIXvJe0z/iDHcafbJqxtsoywD8SCEMtLNjyoPyC28yaL+3Ih+
	1hfVEhJH9/PITJI9eqCazYbkJL2PrIis0UVMS3sS8dgcj7kqmaPtYwKmsZoL6X2PnhgL
	eIHWfqo/qtGUvhfzg3C2vIII1WnLmDFMaubgk+7JFHplEIp8+/8Ko8wX7iXGiGMEhxfE
	mFtzDnef5xpWRzab7v65xw3ye4IoxzqNIDEZnrMLIisj+HGS/cj3W9N1N4a9ObTWCX9Z
	POuYeOuM17VtTrtfMklKbr0VDwZiivXdWu0dRXy25mxilIUYakRKJLgD0IOkmTcDoTPg
	L2Vw==
X-Gm-Message-State: APjAAAXKp+Y79mjZ+KcpehcDdsQEAcBwQxUV6wld2lABeDnfnLteQsn9
	xH6lYfjNtVlOHG4tXzGMyCWByt0Z7WD0y3VL7cM=
X-Google-Smtp-Source: APXvYqxKZLYD47IC3X59HGCceTB8V6v/qD28gOrWZfCiUms9D/y3WZjjzDBGHxsyki5FcmPdmcC6D8zp8/L/ZzuA6wE=
X-Received: by 2002:a50:d5c9:: with SMTP id g9mr19062831edj.131.1578941883042; 
	Mon, 13 Jan 2020 10:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20200113170209.95601-1-alex.kanavin@gmail.com>
	<20200113170209.95601-3-alex.kanavin@gmail.com>
	<CA+chaQec=MyVT6a7FkmKPG5izt5UydqhSXqv6-POKh558Y4etA@mail.gmail.com>
	<CANNYZj-j42s83n9RsWoDpKyTpQUhWMGx9=82zVt0Doa=MDFy9g@mail.gmail.com>
In-Reply-To: <CANNYZj-j42s83n9RsWoDpKyTpQUhWMGx9=82zVt0Doa=MDFy9g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Jan 2020 19:57:51 +0100
Message-ID: <CA+chaQdXtycq=z3+2i2VK7+7TDQKjU3JCcE4nFxcav37z1cOwQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/3] sysprof: move from meta-oe to meta-gnome
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
X-List-Received-Date: Mon, 13 Jan 2020 18:58:02 -0000
Content-Type: text/plain; charset="UTF-8"

Doing "git mv" in interactive rebase of the first commit should be really
easy to do and if git doesn't figure out the 2/3 automatically, than you
can still check that the rebased 2/3 looks like the current 3/3 did (and if
doesn't then just squash git diff into it), I don't see how this is error
prone.

On Mon, Jan 13, 2020 at 7:52 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Because I already had the patches ready, and simply added the move between
> layers on top of them. Placing it to the right layer requires either a
> patchset do-over from scratch, or resolving a merge conflict with
> possibility for mistakes.
>
> Alex
>
> On Mon, 13 Jan 2020 at 19:15, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> Why don't you add it to the right layer in the 1/3 change?
>>
>> On Mon, Jan 13, 2020 at 6:03 PM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>> ---
>>>  .../files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch  | 0
>>>  {meta-oe => meta-gnome}/recipes-kernel/sysprof/sysprof_3.34.1.bb  | 0
>>>  2 files changed, 0 insertions(+), 0 deletions(-)
>>>  rename {meta-oe =>
>>> meta-gnome}/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>> (100%)
>>>  rename {meta-oe => meta-gnome}/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>> (100%)
>>>
>>> diff --git
>>> a/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>> b/meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>> similarity index 100%
>>> rename from
>>> meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>> rename to
>>> meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
>>> diff --git a/meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>> b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>> similarity index 100%
>>> rename from meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>> rename to meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>


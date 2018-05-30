Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5D95574AD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 15:29:05 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id a6-v6so16719587oia.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 08:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QmErWYeXCg408wzghGpE+W/ur0MycDj7ysIGdnBKyVM=;
	b=G0AvdRSMCGXy6TIJ9PrXDUgKSfV0cyv8aBswNNgTVgYpW38NrGReJ689RXG709cEnG
	E0Paf+LumHCiUF0CAW71DpJK8J8/Tl49DUCP1vNUCkkwCV8LdNPUMn7KUKYzIPCO5dEt
	5aJRSWqiPuyEHySy4WfmlHdqMMAbwLa3TCE3vcAFg6+ECqwCIbbINfo2WdqRS/fX55Ow
	uv/EGIr/+UnfMfJEEHqGgMPfvxCDsuwc9/No8m/BxniyXbdhKRWdApJ5+qGucziz5LQR
	jCMHiEJAewAqQFwHDxXPOZEG0XTqHhJ7w2QRoQTCo9dHUVgQrHEijqYPu7GGjvw/Y6xy
	lG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QmErWYeXCg408wzghGpE+W/ur0MycDj7ysIGdnBKyVM=;
	b=RnST7M+UiCKfKt8/+E4xReBJZGA5dvw/FKB42MU8nZLSkPWXktrjhgvHK/uKSlZ8AY
	8cb5p3vvCxez+ZyDycPNuX+54EtAfsmQq2BdNjMoYGkTYLwU8E/Cv+vUEpwDzqxqMzAR
	TNNfPzt6BvYwQ+cMbWA2+YbRTUdNeR1fdOCEb0ZW6QXKyjJs0ID2ycXQLv2p5JgZoa4W
	C0P1gFm334pOOQPtFmpFGdwJ8NqPB2jgfS2edCsytQ4NeJ0UAO5nDmEq+DTC1LamIi8T
	cyQBrdGCM3zk8B5q8ZjbG0t6mdLsRikZEWrKzVMkf79ZrM9qCj4zHUZ03Jut18M/m0rH
	f59Q==
X-Gm-Message-State: APt69E3sQmlR8CkJu6fpzr9V9SxRjbRyOhZWYgrs5BDr0xoiJODjSSdz
	bNkWGj08YETKMFyYh3nM2+PChkgzuqsO7zOSeA==
X-Google-Smtp-Source: ADUXVKKwfL+gbP09swzRLbs0hScTDQlJoF/zes5w5f3cS6cnDsLNfX58+Ry/91q8Jl54M4hArZeZKZBnFnq6Jdo76pY=
X-Received: by 2002:aca:c4c2:: with SMTP id
	u185-v6mr1884077oif.117.1527694145970; 
	Wed, 30 May 2018 08:29:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:4d02:0:0:0:0:0 with HTTP; Wed, 30 May 2018 08:29:05
	-0700 (PDT)
In-Reply-To: <CAMKF1sqgQSZE9K36c3MOAEd_HCMoQAL5in8eRXSBdbbSe-+zrg@mail.gmail.com>
References: <20180530134741.29397-1-george.mccollister@gmail.com>
	<CAMKF1sqgQSZE9K36c3MOAEd_HCMoQAL5in8eRXSBdbbSe-+zrg@mail.gmail.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Wed, 30 May 2018 10:29:05 -0500
Message-ID: <CAFSKS=NhF86xbrGtJAbfxhGMAsNGiaLxWVj-4oAjjk2R4zsFNQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	mans.zigher@gmail.com
Subject: Re: [meta-oe][rocko][PATCH v2] protobuf: fix SRC_URI by removing branch
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
X-List-Received-Date: Wed, 30 May 2018 15:29:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 30, 2018 at 10:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Can you try this patch with
>
> Bitbake -cleanall recipe
>
> And bake it again

bitbake -c cleanall protobuf
bitbake protobuf

Works fine for me with the patch applied. Did you run into a problem
or have a concern?

>
> On Wed, May 30, 2018 at 6:48 AM George McCollister
> <george.mccollister@gmail.com> wrote:
>>
>> The 3.4.x branch was removed upstream but the commit referenced in
>> SRC_REV is the 3.4.1 release and is still available:
>> https://github.com/google/protobuf/releases/tag/v3.4.1
>>
>> Drop branch=3.4.x from SRC_URI and use commit specified in SRC_REV from
>> the master branch.
>>
>> Signed-off-by: George McCollister <george.mccollister@gmail.com>
>> ---
>>
>> v2:
>>  - Correct commit message.
>>
>>  meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
>> b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
>> index fae7c18a1..fe28f475a 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
>> @@ -18,7 +18,7 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
>>
>>  PV = "3.4.1+git${SRCPV}"
>>
>> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
>> +SRC_URI = "git://github.com/google/protobuf.git"
>>
>>  EXTRA_OECONF += " --with-protoc=echo"
>>
>> --
>> 2.11.0
>>
>


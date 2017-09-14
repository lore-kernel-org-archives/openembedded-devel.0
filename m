Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 98E026067D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 15:03:54 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id v36so1208149ioi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 08:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nx96SC652YjeHFrI4pfl3VMDDpuVjl+0vukiEcCIMCc=;
	b=omnrkALwL6N78/jpTgwCNmIiZqdhwBh6mI979lZfYYRKzTGbVWR/RHOW/jVQ3Ji86b
	Y9rr7aQTYc6ZQ3uN8Py8TYbsCOid9WKnuisO/IkUtUNo38teABVOi5E33Sd89g69biOz
	Sl2bFQEW1s/h2F4mSflgnsAaPvjBTZEGG9qQ9taiTwuh4qcNd5AKHU2L1zPWOkwG4VdF
	wa/xW6u0BlJAfHdtxfyQqcovDGejnAhe/EcKLulmCa712cp55I/qnWSQToCv4ziSixX+
	MPmQlBZLm8IS13o2IsoODGA3R7/wFpkNG+mefgJp/Bp6pcRFtt0n2/sXvnQesupugvTv
	nTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nx96SC652YjeHFrI4pfl3VMDDpuVjl+0vukiEcCIMCc=;
	b=EGfUFSoCIPeT0khPVgf20ICgW8iiFLLPggs0wapGRXYSeP73O/WcJoMYO3EnHyVHSO
	L6ok3TrBYIIdfU5MmBbMz9NTMY7Q5nK+P2Tz4IPH53UmKo3rkZ591dCBTNCGvUctcdxC
	c2ZoX0potOgjblgge8JVvUpa/QpO9ALI23pL/EuESPL5c+qc1p1PjZLVKg2n+IR8VyZh
	ukWTYI8BXujfYY+Ah5NjQTwY/b5di8o1y9wVuccDy0gN6i8LGx/dvP3IZSYXZ6EpXJgV
	tjDS5Q9VCd8SHqmLZVRBtUJff3+oUKy5uMIzlS6ZW4oHqnIgPbAQsrgdiO5wXGZYBnP3
	6q6A==
X-Gm-Message-State: AHPjjUiLfVdbZw1RFAnBdzawG32SJwt6Pw48j0wDdg0Kc0fW68D7eFy4
	60vN6+MjhJPCcoFCjGbH9+BvPKYeGZGhfIUwMrVnmw==
X-Google-Smtp-Source: AOwi7QCPU2P4+1+wDtu1H0+Pk+VauiMHx4OSUmkNSUAhs2jGjFdr3nuTV9jh+/bJXPy6zU88/pYpH/A6vUN0oPpsgjU=
X-Received: by 10.107.32.70 with SMTP id g67mr3331101iog.77.1505401435580;
	Thu, 14 Sep 2017 08:03:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 14 Sep 2017 08:03:34 -0700 (PDT)
In-Reply-To: <a28c31a6-0635-6e7a-414c-beeef338ba45@linux.intel.com>
References: <20170913093821.12746-1-kai.kang@windriver.com>
	<CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
	<CAJTo0LYxnw1L2-HWwZq=Jqrjty8FvtLB-gjWsH8d3Ri7-H9Siw@mail.gmail.com>
	<CA+chaQdg=ty-=h4afPNoJ8KSK6yjxEzzrSOFTOFtQNtdqYEHwA@mail.gmail.com>
	<CAJTo0La57nRi7hraiCbNqyKXA6t7vvRw6=YXprWV5usReHMB4g@mail.gmail.com>
	<a28c31a6-0635-6e7a-414c-beeef338ba45@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Sep 2017 16:03:34 +0100
Message-ID: <CAJTo0LbR-ks7hgfg8L2cLXoThLZxa_PAY28ci-gt5XZtn29AOg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libpng12: add it back from oe-core
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
X-List-Received-Date: Thu, 14 Sep 2017 15:03:54 -0000
Content-Type: text/plain; charset="UTF-8"

On 14 September 2017 at 14:49, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 09/14/2017 04:42 PM, Burton, Ross wrote:
>
>> On 14 September 2017 at 11:33, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>> LSB compliance isn't a goal of meta-oe as well, otherwise we'd need to
>>> add Qt4 to meta-oe too.
>>>
>>>
>> Touche.
>>
>> It still needs to go somewhere though...
>>
>
> How about modifying the LSB tests to make the absence of libpng12 a
> warning rather than an error?
>

Then it won't be doing a LSB test...   The LSB is the LSB, we don't claim
to support it, but there's a need for a libpng12 recipe for people who want
to be close.  Currently it's just this one recipe that I'm aware of that
isn't already in a layer somewhere.

Ross


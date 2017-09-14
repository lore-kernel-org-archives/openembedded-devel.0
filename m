Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 802BF78614
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 15:58:44 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id k23so4020851uaf.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/zpqS2E7kbjHt5p46VputmshMGiawL8ffZ3P/TeNyLA=;
	b=OTzIpevbFx0tQfI+YMTa5LWTp0I6RlsODJQ+Z827wq/G2bqkjUVzrD5CdRUJ66OS4I
	as/yPayuPvwbhd51xyCCXr163f+h6iOx7zmfqtxBTvLdhbuzL+GkVOK59D3iwNzHxZdH
	X76RfAAi+zD6Qg64Pk8xX29ntMxHAvHBAVb3i+2U+71/0zCy/0gIxHjPBybjZy8dY5K2
	D7vUlnM+sZcwBvnkHnXasMXgo0ivxaJBkHM8M+PJGCaqMnDntVpIPrBrBPZaBKnAnkVw
	KV0hvUPKutn4/9bi+xAMH96snXcn4XlcN8n96yZHCvo7KHheTNcFUEkZf/daMykDdTvK
	VM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/zpqS2E7kbjHt5p46VputmshMGiawL8ffZ3P/TeNyLA=;
	b=SLAcm5MPbOGAZhGCasnO3zmjr6HWEAF8ZQ00xIFc4ppRdpMzYM2v4agxiNKCnxXMNN
	Wm/eHCmces9pqUqLjTHSEyQYCmzrukcJtVmcvDA0wRqMwbiWdm9hHE8oByT7rc26aXpc
	gtMt/HNDbhx2jyohcHPW6MhCzW6MVWHNaGYeypojB1x+pSeLyQjtXBNZKg9b/UcxXyvS
	C3wnRxz82Zu1nn9iYoJpDO7dsVfnbhm+tDbPc1SBGOycB6DL5dU9R3dXppwXDkUMO76p
	7C/mJv/G2MRiOokyNz9R70h75ewDjayr0ZTHzqq3gDq+DFxpZJ7K8QErIoR9OAMQ7OMU
	cDoQ==
X-Gm-Message-State: AHPjjUj9c09g9hZO40ZVFptpc9lPcxy6+uZrcKhweUZYjApJIoGMxBDV
	hPL4MKP/l2wd+w+pVmKeTgdWelkP45DQ27k42Ro=
X-Google-Smtp-Source: ADKCNb4mOn3HcF5HYQSk0UNjfMADhQg2VOmVE6K2930AfEdICQwLGvokQCBdmimWLncemO1mwQ4Kp+pf66D9q2kNc3U=
X-Received: by 10.159.51.236 with SMTP id y44mr16873471uab.2.1505404725349;
	Thu, 14 Sep 2017 08:58:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Thu, 14 Sep 2017 08:58:44 -0700 (PDT)
In-Reply-To: <CAJTo0LbR-ks7hgfg8L2cLXoThLZxa_PAY28ci-gt5XZtn29AOg@mail.gmail.com>
References: <20170913093821.12746-1-kai.kang@windriver.com>
	<CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
	<CAJTo0LYxnw1L2-HWwZq=Jqrjty8FvtLB-gjWsH8d3Ri7-H9Siw@mail.gmail.com>
	<CA+chaQdg=ty-=h4afPNoJ8KSK6yjxEzzrSOFTOFtQNtdqYEHwA@mail.gmail.com>
	<CAJTo0La57nRi7hraiCbNqyKXA6t7vvRw6=YXprWV5usReHMB4g@mail.gmail.com>
	<a28c31a6-0635-6e7a-414c-beeef338ba45@linux.intel.com>
	<CAJTo0LbR-ks7hgfg8L2cLXoThLZxa_PAY28ci-gt5XZtn29AOg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Sep 2017 17:58:44 +0200
Message-ID: <CA+chaQdS4NPaF=cqUGR12+Bxt1L2wzThxYZCQFEvK-DxrZ6Dww@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Thu, 14 Sep 2017 15:58:44 -0000
Content-Type: text/plain; charset="UTF-8"

If LSB isn't goal of oe-core, then why not move all this:

OE qemux86-64@ ~/build/oe-core/openembedded-core $ find meta -name \*lsb\*
meta/recipes-extended/images/core-image-lsb.bb
meta/recipes-extended/images/core-image-lsb-dev.bb
meta/recipes-extended/images/core-image-lsb-sdk.bb
meta/recipes-extended/lsb
meta/recipes-extended/lsb/lsb
meta/recipes-extended/lsb/lsb/lsb_pidofproc
meta/recipes-extended/lsb/lsb/lsb_start_daemon
meta/recipes-extended/lsb/lsb/lsb_log_message
meta/recipes-extended/lsb/lsb/0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch
meta/recipes-extended/lsb/lsb/lsb_killproc
meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
meta/recipes-extended/lsb/lsbinitscripts
meta/recipes-extended/lsb/lsbtest_1.0.bb
meta/recipes-extended/lsb/lsb_4.1.bb
meta/recipes-extended/lsb/lsbtest
meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
meta/lib/oe/__pycache__/lsb.cpython-35.pyc
meta/lib/oe/__pycache__/lsb.cpython-36.pyc
meta/lib/oe/lsb.pyc
meta/lib/oe/lsb.py

together with libpng12, to some new meta-lsb layer, preferably outside
meta-oe repository as I already have enough of this stuff.

On Thu, Sep 14, 2017 at 5:03 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 14 September 2017 at 14:49, Alexander Kanavin <alexander.kanavin@linux.
> intel.com> wrote:
>
>> On 09/14/2017 04:42 PM, Burton, Ross wrote:
>>
>>> On 14 September 2017 at 11:33, Martin Jansa <martin.jansa@gmail.com>
>>> wrote:
>>>
>>> LSB compliance isn't a goal of meta-oe as well, otherwise we'd need to
>>>> add Qt4 to meta-oe too.
>>>>
>>>>
>>> Touche.
>>>
>>> It still needs to go somewhere though...
>>>
>>
>> How about modifying the LSB tests to make the absence of libpng12 a
>> warning rather than an error?
>>
>
> Then it won't be doing a LSB test...   The LSB is the LSB, we don't claim
> to support it, but there's a need for a libpng12 recipe for people who want
> to be close.  Currently it's just this one recipe that I'm aware of that
> isn't already in a layer somewhere.
>
> Ross
>


Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id CF2E275CF1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 17:01:22 +0000 (UTC)
Received: by iofb144 with SMTP id b144so206533269iof.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 10:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=OyFEla1GtIheaWLw7DkJ9xKjIvNganJfN2g2YoEqe6Y=;
	b=Qhr5poxKTv9Fpe3pjXfdmKTuLCW3ULiHKmGEs9wcQfxTCpmbGxBHHHu5viBbpE5tz+
	pyDkZZohF3p7UlJiYoxdgh84CHb2vSOeNnvy3kFBLTH8wwOuUbWDwNIJePwD3zzG+TCF
	iucahz+HkW0vG1pFsF5VmIQA319HGuz2OfwsZS//icTAyDOEDI2iMTJCRb/JyQVgnlch
	o0rzRLfx0JRHqJ2QRc9O7nNvqVkGKbne4bCawVYCJVQGt8Fa6TGgO2B0ush4qfygq4xt
	j2i/eHD5vtuuifalcvcNAsTM7FwzNDpw5WlM5n3LgeJzEPaDsDGwfMz4qmqVEZqv2gK/
	MqBQ==
X-Received: by 10.107.137.106 with SMTP id l103mr30113977iod.112.1442336482375;
	Tue, 15 Sep 2015 10:01:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Tue, 15 Sep 2015 10:00:52 -0700 (PDT)
In-Reply-To: <55F8333A.9000007@gmail.com>
References: <1442321402-22469-1-git-send-email-clopez@igalia.com>
	<1442321402-22469-2-git-send-email-clopez@igalia.com>
	<55F8333A.9000007@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Sep 2015 10:00:52 -0700
Message-ID: <CAMKF1srGtU9VS9FHTRsKACHXwJSmTQGVjg25ORom7w=_GM=QWw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 1/3] chromium: Allow to build in Debug mode.
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
X-List-Received-Date: Tue, 15 Sep 2015 17:01:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 15, 2015 at 8:03 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> On 09/15/15 08:50, Carlos Alberto Lopez Perez wrote:
>>   * Add also a patch that workarounds a build error when building
>>     in Debug mode and using GCC. This patch has no effect when
>>     building in Release mode because is guarded within ifdef(debug)
>>     blocks.
>>
>> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
>> ---
>>  recipes-browser/chromium/chromium.inc              |  4 ++-
>>  .../fix-build-error-with-GCC-in-Debug-mode.patch   | 32 ++++++++++++++++++++++
>>  recipes-browser/chromium/chromium_40.0.2214.91.bb  |  1 +
>>  3 files changed, 36 insertions(+), 1 deletion(-)
>>  create mode 100644 recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch
>
> Does the above patch need an upstream-status tag?

Its not must for meta-broweser, but its good since it adds
information. We do not have any automatic tracking of patch status
so if one mentions url for source of patch or any information on where
patch's status can be asserted at later times is good.


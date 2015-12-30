Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id F372160088
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 15:55:05 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id ph11so182426965igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 07:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=svLWgi4v4GcGlJ1f2HMUfCC+EffdDBMNukhK+4OjDQU=;
	b=f66WgbsvQKoWHqsyhycg4Z5PprCqGiQPQ+0eCK/U/FCMCwoOM2FaC7H5SNY7WCWA1R
	FIk7jz8/kmM3zC7GySNFU7PLIAkLlWUUslHQntWj7D3lqH2V3vOYhswE1T6LM7rw85Pn
	3H4Z5jfHDCYEwTdsieuJHN0jldW/yOepUkcAc0jXk0fr47zpM73wfFP8jQYkSNF32O5Q
	kYIu1Y5P8xbzYi9OXY2goeKWGobUX9f2hOpcc7dvHG6eMIO1TlmUUifsxPZdJsMcRIcm
	+beZCTSu2Dpn38h3Zm+jT2y+RWLFscCZ3FeOQSdfDxx0mIc0KPab/hZ7/SphtoEI0CfB
	ioCQ==
X-Received: by 10.50.141.161 with SMTP id rp1mr62312121igb.28.1451490906528;
	Wed, 30 Dec 2015 07:55:06 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	f74sm27098748ioe.6.2015.12.30.07.55.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 07:55:05 -0800 (PST)
To: Max Krummenacher <max.oss.09@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <56837748.6020903@gmail.com> <1451489161.2176.12.camel@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <5683FE56.8080208@gmail.com>
Date: Wed, 30 Dec 2015 10:55:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1451489161.2176.12.camel@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: chromium 40.0.2214.91 doesn't like gcc5.3
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
X-List-Received-Date: Wed, 30 Dec 2015 15:55:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Max,

On 12/30/15 10:26, Max Krummenacher wrote:
> Hi Trevor
>
> Am Mittwoch, den 30.12.2015, 01:18 -0500 schrieb Trevor Woerner:
>> I noticed the recent gcc update from 5.2 to 5.3 in openembedded-core
>> seems to cause meta-browser's chromium build to fail with more
>> warnings being treated as errors.
> I tried to build master with GCC 5.3 for an armv7 target just now.
> The same error that you see pops up.

Thanks for trying this with a different MACHINE and confirming it's
there too.

> I propose to lower the strict-overflow to a warning again to get
> rid of this errors once and for all.
>
> The following made the build work for me:

Is there any way to set the flags per compilation unit, or
per-directory? According to the source layout, the problem is in a file
identified as "third party". In that case it's understandable that
someone else's code has an issue. But it would be nice to keep this flag
for the core chromium build (since that's what the chromium developers set).

Maybe a newer version already has a fix for this in the code (which
would be a better place to fix an issue such as this)?

Best regards,
    Trevor


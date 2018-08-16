Return-Path: <ashie@clear-code.com>
Received: from mail.clear-code.com (mail.clear-code.com [153.126.206.245])
	by mail.openembedded.org (Postfix) with ESMTP id 3CAB77926A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 06:25:09 +0000 (UTC)
Received: from [192.168.10.7] (212.42.138.58.dy.bbexcite.jp [58.138.42.212])
	by mail.clear-code.com (Postfix) with ESMTPSA id 9D5CED519B;
	Thu, 16 Aug 2018 15:25:08 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.clear-code.com 9D5CED519B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clear-code.com;
	s=default; t=1534400708;
	bh=AwMgpBa8pt2i9Mtt1s+Lq4e7PBQb9u5IFL3U+zKt824=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=uYFKhGY7gyxc6iRfZrdpIap9q6kFniFNY5LAJVvswPzyRTSrJVU7aMkac5YIAyf6m
	Pq5WG9AnwMOfxXbMm2esrQ45kPMkhOtGZIEcR3u3oHjZRcgWJ01YQSS5xqJfDxLPLW
	97cT2aeFh2DyacY2xGff3+RvQd+HESfA6sdHtHg8=
To: Anuj Mittal <anuj.mittal@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <20180816051257.4465-1-ashie@clear-code.com>
	<CAMKF1sqOZFf5rjWqX0fSRQ+X1S3v5T39JvfZE2OUCo=Z-jVyoQ@mail.gmail.com>
	<2ee375f8-c365-b311-3da4-8413bcb8cce4@intel.com>
From: Takuro Ashie <ashie@clear-code.com>
Message-ID: <8b63b108-dba4-c54c-063b-859e2d69814f@clear-code.com>
Date: Thu, 16 Aug 2018 15:25:08 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2ee375f8-c365-b311-3da4-8413bcb8cce4@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] uim: Fix SRC_URI
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
X-List-Received-Date: Thu, 16 Aug 2018 06:25:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年08月16日 15:05, Anuj Mittal wrote:
> But this one is a release tarball and not the archive one ... shouldn't
> those be okay?

Yes, It's not git archive, the tar ball is created manually by the 
maintainer.
(generated configure script is included, git archive doesn't include it 
though).
Just the download URL is changed.
So the md5sum & sha256sum aren't changed.

Regards,



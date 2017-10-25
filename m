Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2728A6FF78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 04:42:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Oct 2017 21:42:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,430,1503385200"; d="scan'208";a="913440506"
Received: from rmitura-mobl.ger.corp.intel.com (HELO [10.252.7.74])
	([10.252.7.74])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Oct 2017 21:42:52 -0700
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <20171017105132.GB4387@jama>
	<20171017115539.13778-1-mikko.ylinen@linux.intel.com>
	<20171017120705.GC4387@jama>
	<25ca8a10-6ade-4852-c9e4-bb36b65e2fd6@linux.intel.com>
	<CA+chaQeZ+unLUOmtNLigrg1kMR7p3A_n5xG+Wx+eqM8T+q2v2g@mail.gmail.com>
	<CAMKF1srpmrdiufg005CUOcq67cS2BhXkfGjfRGTkJG4ZXSbXnA@mail.gmail.com>
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Message-ID: <f60334c3-ac46-3ba1-c844-112600ba7de8@linux.intel.com>
Date: Wed, 25 Oct 2017 07:42:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srpmrdiufg005CUOcq67cS2BhXkfGjfRGTkJG4ZXSbXnA@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] mraa/upm: enable nodejs bindings by default
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
X-List-Received-Date: Wed, 25 Oct 2017 04:42:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,


On 21/10/17 18:39, Khem Raj wrote:
> On Fri, Oct 20, 2017 at 3:53 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Fails to build:
>> http://errors.yoctoproject.org/Errors/Details/157425/
>>
> and fails on musl too
>
> http://errors.yoctoproject.org/Errors/Build/47646/
>
>

We've been using nodejs bindings via HAVE_NODEJS but
with nodejs 6.x (which I used in my testing too).

It looks the errors are because nodejs >7.x- break
swig bindings: https://github.com/swig/swig/pull/968

Until oe-core gets the new version of swig, we'll have to
keep the nodejs bindings disabled. Let's scratch my previous
patches and I'll submit a new one that just cleans out that
HAVE_NODEJS leftover.

-- Mikko




Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 88D2D71E4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 01:15:36 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2017 18:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,417,1496127600"; d="scan'208";a="291923216"
Received: from ritushar-mobl1.amr.corp.intel.com ([10.252.201.202])
	by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2017 18:15:36 -0700
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <CAMKF1srk4G2zOdsTFiXnoB2oq2yoa6Yn6=mNm7sg59_etThpgQ@mail.gmail.com>
Date: Wed, 26 Jul 2017 18:15:36 -0700
Message-Id: <EDB386C2-78B4-4418-AAC6-9717E7548A60@linux.intel.com>
References: <CAPybu_3uuf6n73pYn8cA3GJPQC6VnWjAKODi7TMr7ondCTjG8g@mail.gmail.com>
	<CAMKF1srk4G2zOdsTFiXnoB2oq2yoa6Yn6=mNm7sg59_etThpgQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Has anyone added support for bazel
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
X-List-Received-Date: Thu, 27 Jul 2017 01:15:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> On Jul 26, 2017, at 11:31 AM, Khem Raj <raj.khem@gmail.com> wrote:
> 
> On Wed, Jul 26, 2017 at 8:07 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>> Hi all
>> 
>> I am working on adding support for TensorFlow in Openembbedded.
>> 
>> One of the building dependencies is bazel ( https://bazel.build/ )
>> 
>> Before I create a recipe and a class I was wondering if anyone has
>> already worked on this?
> 
> It will be a good addition, I have this in my long list of things to do

Ditto. That list never gets any shorter.

> but if you take a stab at it, would be great.
> 

My concern is the bootstrapping script might be
very awkward in a cross-compilation situation:
https://github.com/bazelbuild/bazel/blob/master/scripts/bootstrap/compile.sh

Native might not be as bad? meta-java tooling might get in your way.

>> 
>> Regards!
>> 
>> 
>> Random Thought: Why dont we fix the current build systems that we
>> have, instead of inventing new ones that require java?
> 
> heh, well read this strip and enjoy
> https://xkcd.com/927/
> 
>> 
>> --
>> Ricardo Ribalda
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



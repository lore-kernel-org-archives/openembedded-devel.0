Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web10.2512.1626171655688665880
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jul 2021 03:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=UmnWSpXG;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1m3FX2-0007t6-Gt; Tue, 13 Jul 2021 12:20:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WklA3kokNbNdPO9qsM7gigYzK5lx9cuNGmxMkGHywoA=; b=UmnWSpXGp6T6DoXAdsOPsDGqwF
	qSKWQ+zrAdxxXaLFpuTcIA1rl2fknzX4/0NqClNgI7YnxE5D+o0pzBkV9t1iKjp+vISlzLXJmYEu1
	a4KfM9Tnk6CF4vgeD+HnhMB4Ow59h5p6SkygKts/uqnAFAf3jx1zbYPSbyeCyLdMB45YLKoJNhsYH
	YzkVjV4CA42ikiL5Q0ifORtAIzL10qe42exGy/KUWhSTxs49kCQokRBcZ80G7BZMMpl0m3cWHx/It
	ySduu6OUlfK9pjRveJ5Ro61BJaDQ2G/o8jGdE282mAG5WJ1ZKJsdGnnMnUqyL5zonY2u2P7qZYm2k
	5CQ38+kg==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1m3FWy-0000Vm-7O; Tue, 13 Jul 2021 12:20:50 +0200
Subject: Re: [oe] Upstream scipy recipe to meta-openembedded
To: Khem Raj <raj.khem@gmail.com>, Gregory Anders <greg@gpanders.com>,
 openembedded-devel@lists.openembedded.org
References: <YOxdaI1jQgdxKTQn@gpanders.com>
 <59d33c0b-fbf0-593c-a259-be23aac0de6a@gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <be74a5ac-d9d9-8efa-434b-504bc7663c19@pr.hu>
Date: Tue, 13 Jul 2021 12:20:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <59d33c0b-fbf0-593c-a259-be23aac0de6a@gmail.com>
X-Spam-Score: -1.1 (-)
X-Scan-Signature: c6025692b75800ad60ff0631e8044444
X-Spam-Tracer: backend.mail.pr.hu -1.1 20210713102050Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2021. 07. 12. 18:01 keltezéssel, Khem Raj írta:
> 
> 
> On 7/12/21 8:19 AM, Gregory Anders wrote:
>> Hello all,
>>
>> I wrote and maintain a recipe to provide scipy in the OpenEmbedded build system [1]. I 
>> would like to upstream this recipe into meta-python so that it is more broadly available 
>> to those who need it as well as to reduce my own maintenance burden.
>>
>> Before sending a patch, however, I'd like to solicit feedback from the meta-oe community 
>> on how best to integrate this recipe into the meta-openembedded project. If you look at 
>> the source for the recipe at [1] you will see that there are a few steps/hacks that need 
>> to be done in order to get scipy to correctly cross-compile:
>>
>> 1. We have to add a CMake parameter to lapack ("-DCBLAS=ON"). This causes LAPACK to 
>> build the C BLAS library instead of the Fortran BLAS library. This is necessary as scipy 
>> tries to link against `cblas_*` functions.

FYI, there's another layer (https://github.com/tuxable-ltd/meta-scikit-learn that
I had to fork and make hardknott-compatible) that uses python3-scipy as a build
and runtime dependency for python3-scikit-learn so import sklearn.linear_model"
is possible. That layer also extends python3-scipy with a native build variant
which doesn't exist in your layer AND patches lapack further to use openblas.

>> 2. We have to patch numpy to force it not to include rpaths in the compiled shared 
>> object file. Otherwise the bitbake QA fails as it detects rpaths from the build system.
>> 3. Two variables must be set in either the local.conf or distro.conf file to enable 
>> Fortran support. These can't be added in the scipy recipe directly (at least, last time 
>> I tried it they couldn't be) so users have to manually add these themselves.
>>
>> I am by no means an expert in bitbake or in the broader OE build environment. If you 
>> know of a better solution to any of the problems outlined above, please share them. I am 
>> also more than happy to provide more detail if anyone has any questions.
>>
>> Ultimately, the ideal goal is to have a single 'python3_scipy.bb' recipe file that I can 
>> send as a patch for inclusion in the meta-python layer rather than maintaining an 
>> entirely separate meta-scipy layer.
>>
> 
> I think meta-python is right layer for this.
> 
>> Thanks!
>>
>> Greg
>>
>> [1]: https://github.com/gpanders/meta-scipy
>>
>>
>>
>>
> 
> 
> 
> 


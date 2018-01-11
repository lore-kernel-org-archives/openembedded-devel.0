Return-Path: <zboszor@pr.hu>
Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
	by mail.openembedded.org (Postfix) with ESMTP id ADD7860068
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:09:00 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1eZeTS-0000Ho-J2; Thu, 11 Jan 2018 16:08:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qj0Um2akIHvg9Jo/NnchVNp/nmVaDlqvITMWc5usOQs=;
	b=mqT8bvtA7l/LoeFBKQT6ud+y3+
	Nt5+jQ0PeBNUB5LXSxUWV8CntJQTKeacVDFM0nKLc+4VeQOuRql8+51Uv4+7EodMtHVLolWLqkQWI
	OKkcmaBo8GWFaHuD52SbknV4bAtFR0gPu4P8AKnATYJiApu/NG4M4UO6MI9noMMFFZ68leIF9u0qg
	983t+D5zX0BYx4AlKjmmgcmYOPLtmbqpt/Fja6p+bNwdtE6Ee4+vFFjVbo0lZeTnB+nrKjK4iox94
	wIJdx1U1YwcKa2GQHVSw3DIgEqGl4IaM9pwQh+g236luhDw4gZuNNEohJ8FRHTns3Lw0YpWRedHjF
	aI3yq5Vg==;
Received: from host-87-242-32-111.prtelecom.hu ([87.242.32.111]
	helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1eZeTO-000491-NX; Thu, 11 Jan 2018 16:08:56 +0100
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
References: <9f004ada-4627-0a82-cb3f-7ee9e38791b7@pr.hu>
	<86ea3002-07b8-aa1a-d1dd-78a4a6dd906c@linux.intel.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <a02f04da-8bc9-a276-e4bd-9ef0103275c5@pr.hu>
Date: Thu, 11 Jan 2018 16:08:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <86ea3002-07b8-aa1a-d1dd-78a4a6dd906c@linux.intel.com>
X-Spam-Score: 2.3 (++)
X-Spam-Report-Back: Spamchecker on "prspamd4.pr.hu" has DOESN'T believe this
	is spam.
	pts rule name              description  (score: __SCORE__ points)
	---- ----------------------
	--------------------------------------------------
	-0.2 ALL_TRUSTED Passed through trusted hosts only via SMTP
	3.5 BAYES_99               BODY: Bayes spam probability is 99 to 100%
	[score: 1.0000]
	0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
	[score: 1.0000]
	-1.2 AWL AWL: Adjusted score from AWL reputation of From: address
	Preview: 2018-01-11 15:46 keltez_ssel, Alexander Kanavin _rta: > On
	01/11/2018 04:07 PM,
	B_sz_rm_nyi Zolt_n wrote: > >> Since my itch was too
	big now,
	I have proverbially scratched it. >> I have created a PR against
	Rocko here: >>
	https://github.com/openembedded/openembedded-core/pull/28/files
	>> >> Please comment whether it's the right approach. > > Looks okay,
	but:
	> > Please rebase this against oe-core master, and submit to the oe-core
	mailing list. > > Alex [...]
X-Scan-Signature: c0465d31707be8780557d6b88741a1e1
X-Spam-Tracer: backend.mail.pr.hu 2.3 20180111150856Z
Subject: Re: RFC: Record PE for shlib dependencies
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
X-List-Received-Date: Thu, 11 Jan 2018 15:09:00 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2018-01-11 15:46 keltezéssel, Alexander Kanavin írta:
> On 01/11/2018 04:07 PM, Böszörményi Zoltán wrote:
> 
>> Since my itch was too big now, I have proverbially scratched it.
>> I have created a PR against Rocko here:
>> https://github.com/openembedded/openembedded-core/pull/28/files
>>
>> Please comment whether it's the right approach.
> 
> Looks okay, but:
> 
> Please rebase this against oe-core master, and submit to the oe-core mailing list.
> 
> Alex

I will. Please also backport it to other supported branches, if there are any.
Rocko is still supported, I guess.


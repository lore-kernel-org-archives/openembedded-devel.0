Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 092B671975
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 09:44:41 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>)
	id 1d8keH-0004FW-5c; Thu, 11 May 2017 11:44:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=V1QW6Fw++p6ThoMqYlvF9Rxb4TpNW+bsJqhIV//OQhk=; 
	b=SO3+JbX4RrxP+Dz65fReYnvmiC3fK2PT8zeGgsBlHIwEHuLMUj3aTMUn1AA+K0FacvrWMUqR9DHH1Sx+KjbGQ9cVEYsu/lt0xOzIEhDhuduAxRMFcx3S/tk8MBwHGGhblb7/NkRLiAV3tRz7JfHfC1/NrHoB8rzd0NrrUipIs6Nqp1ALyqRco7iKvE5+0iu2HTBgOlHEmRM7eQmM4+RXNwn2X2O1YO0AihbXDJ9aZJG7Vr5KPP6xICkaVr7j+tGu3zwuzvw4JFqat9Kpyvhtx497fCLRGwiz23rbeYLgKeJiq5Sm/fhWfu0ZXC0h8kZLqWTr4Hm7Lb0MOnWM887v7A==;
Received: from host-87-242-51-16.prtelecom.hu ([87.242.51.16]
	helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>)
	id 1d8ke9-0004BV-SJ; Thu, 11 May 2017 11:44:39 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <2fe15965-3372-3e2e-1d77-3c46ea397527@pr.hu>
	<CAJTo0Lb3pTp4Jjv=e2mE4CTaJdLsMMmFYxzE9861vJTgkkj7Pg@mail.gmail.com>
From: Boszormenyi Zoltan <zboszor@pr.hu>
Message-ID: <ac2c7531-1cf9-8a98-aadd-13ef495cee29@pr.hu>
Date: Thu, 11 May 2017 11:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb3pTp4Jjv=e2mE4CTaJdLsMMmFYxzE9861vJTgkkj7Pg@mail.gmail.com>
X-Spam-Score: 1.3 (+)
X-Scan-Signature: 13b9407719ac6afd820d4a5497ba97eb
X-Spam-Tracer: backend.mail.pr.hu 1.3 20170511094439Z
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Cairo egl / glesv2 PACKAGECONFIG dependency hell
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
X-List-Received-Date: Thu, 11 May 2017 09:44:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2017-05-11 11:01 keltezéssel, Burton, Ross írta:
> 
> On 11 May 2017 at 09:08, Boszormenyi Zoltan <zboszor@pr.hu <mailto:zboszor@pr.hu>> wrote:
> 
>     Please fix it either way: remove PACKAGECONFIG[egl] from cairo
>     or add native build to mesa.
> 
> 
> Or only enable egl in target builds (using a class override), which is the easier, 
> simpler, and correct fix.

Thanks!


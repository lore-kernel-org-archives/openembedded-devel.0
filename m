Return-Path: <jaragunde@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 15E9271AB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Oct 2017 10:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=bDl7/l/vUzxKya5MBilR+MbHU/Gq9FOZs0io58RvKuo=; 
	b=q+L29/T+cbQXHNnK3W+reRiaiBlXNUvgmWLmeD2k0Udgl8k4awFmFf3ZhqF6UXsAzQG+9lF5hqhaMgKg0O50sdHK7skbXr1xq0CYZ4IVOXl1ya5BQ1iRxflYViyqhHMYcuL9zfoPn+v+b6j/4lo+Sw24uoOFv82JKMOD6VLQnM/iBf5JcdrUGMbZ2YmDlgizg2Rh86EtzW9Dg+0noZuHpLmmvE/10IJbSv+VckV17zcqTYCgQM8fERy9i2M0tn+d1mHn1Kjtqpp2KTHqRcxrkpnFdFHV96OS7n1huMEomP6I3nZvodYzhLDzwNuRLI9/LQ8aMhGLeLmRtZRxkWEdEw==;
Received: from [192.168.13.210] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1e03Gy-00054u-Cn; Thu, 05 Oct 2017 12:20:56 +0200
To: Trevor Woerner <twoerner@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <8410af28-acc0-4022-cce0-be12c38af92e@igalia.com>
Date: Thu, 5 Oct 2017 12:20:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Thu, 05 Oct 2017 10:20:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

On 05/10/17 02:43, Trevor Woerner wrote:
> Hi Jocobo,
> 
> Please have a look at
> https://github.com/rakuco/meta-crosswalk/tree/chromium61/recipes-browser/chromium
> from Raphael (CCed). It is an interesting and promising approach.
> 

Indeed, I've been in touch with Raphael who has also attended the
hackfest. We have decided to go on with his approach, I will test those
recipes in different hardware and add some missing bits there were
before in meta-browser.

> I have built against minnow (x86-64) and rpi3-32 (armv7ve)
> successfully with pyro. I haven't had time to runtime test anything
> yet. I'm still seeing a build issue with both MACHINEs against master.
> 

I've tested a rpi3-32 image and I've successfully built an armv8 image
for R-Car gen3, which I still have to test. So far I had to add a couple
of backports related with the toolchain they use in Renesas BSPs.

I'll keep you informed of the progress :)

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia


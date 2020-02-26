Return-Path: <leo.yan@linaro.org>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 87DE860640
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 12:30:43 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 2so1379082pfg.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 04:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uoisO5Damy7boLrP6Yk12wUzpq2GWvnLietJ6AU7Yjw=;
	b=olJS/KeWnSqlvy2u4VAkdv4PuoJ71FnB7a4QDx88f2ffSEKmwbel/lo9QjbRroBx5s
	3PrugSeb7dmhdfIWpvOJdSmmKBqW8+bNSwehwLUM87s7aRuhl/K8E9wupsWhhjCT70YF
	a90cGHh2C/F+Z8wRx9DtjlDI9+nBrbRVcdtQ1L5Jo2MXPm43fKjp5AG07tthnFq1bIWE
	FdNKHRrBd/MXKgFJ4c1rsd825VaBkZUmW3fMsxY/thSnqjnmDFQKC7t1kv4bTPGpyGu5
	6N/KHFUKycqxrGcX9ybspqpVn/ck5B1jp5I3ttsdT9Ycbs2SKIarVNn/nvv7ZX8m5qyy
	zGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uoisO5Damy7boLrP6Yk12wUzpq2GWvnLietJ6AU7Yjw=;
	b=b96gI3rNnyp+6wuDhkOEwDQq3/03TjonkKSRENF6ZTENxH9ffUv7i9SO0tni2GU5s3
	DOeRfe5OcVeNaa19GtPftQNAxvhjqK9YLigzvB5Cct4kCi2nkkwZeew1As7eKp0X+Gcl
	rR9aatX4ECMa6haCsUng9eY0P5kAdGjqY4/wLLnHyjsHaehwn9FFY96MMlVEqKhdif7D
	lBrhOZ2w+07ccyXge5l6oxVRakbIsMASzqjQcA5oxnWGzLyTP7I3M4j3AjqdqdRPnc2y
	lI//0STDLbC7U7LCCuYAdy4J6lGLRDLEf5MOme8q+pkzLUhNZAiXpe0WrUEMJhZfeGjB
	g3cA==
X-Gm-Message-State: APjAAAWSUpOlZ6vcXvvrGxLPLXXfFjuyzFCqkVo5MckAwYb9kPZ62YXJ
	rVAQFp5WgmRgl0pWvo3u99Igmg==
X-Google-Smtp-Source: APXvYqzezbXlY4IaduiknxO5KLp0S3U6Lhd8Iwt2o5ssBKgPMzAAjONebnJ1KEEEwD9/R9pBa3MTKQ==
X-Received: by 2002:a63:594a:: with SMTP id j10mr3773655pgm.227.1582720244382; 
	Wed, 26 Feb 2020 04:30:44 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:ee42])
	by smtp.gmail.com with ESMTPSA id
	w189sm2942824pfw.157.2020.02.26.04.30.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Feb 2020 04:30:43 -0800 (PST)
Date: Wed, 26 Feb 2020 20:30:36 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200226123036.GA2551@leoy-ThinkPad-X240s>
References: <20200225063711.4848-1-leo.yan@linaro.org>
	<263955b2-9b82-f24c-172c-0761d86a1391@gmail.com>
	<20200225073129.GA1169@leoy-ThinkPad-X240s>
	<8e32456d-c86d-3e87-9588-d8dc075ce061@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8e32456d-c86d-3e87-9588-d8dc075ce061@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Wed, 26 Feb 2020 12:30:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Tue, Feb 25, 2020 at 07:57:09AM -0800, Khem Raj wrote:
> 
> 
> On 2/24/20 11:38 PM, Leo Yan wrote:
> > Hi Khem,
> > 
> > On Mon, Feb 24, 2020 at 10:41:04PM -0800, Khem Raj wrote:
> > > 
> > > 
> > > On 2/24/20 10:37 PM, Leo Yan wrote:
> > > > Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
> > > > misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.
> > > > 
> > > > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > > > ---
> > > >    .../luajit/luajit/clang.patch                 | 19 -------------------
> > > 
> > > 
> > > why is this patch dropped ? it building with clang handled differently now ?
> > > if so please add a line or two in commit msg
> > 
> > To be honest, I don't know how to hit the condition for
> > '#elif !LJ_TARGET_PS3', and since considering Clang has upgraded to new
> > version (9.0.1), this is another reason I dropped this patch.
> > 
> 
> you could easily excercise the need for it, by adding meta-clang and setting
> 
> TOOLCHAIN_pn-luajit = "clang" (in local.conf)
> bitbake luajit

I tested up setting with MACHINE=qemumips, it can hit the condition
for '#elif !LJ_TARGET_PS3' and the patch clang.patch is still needed,
otherwise, it can cause building error.

So have sent out patch v4 to keep clang.patch with minor updating
to dismiss patching warning.

Thanks a lot for guidance.

Leo


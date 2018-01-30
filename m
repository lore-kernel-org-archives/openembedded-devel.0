Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id CCEBE77BD2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 06:50:57 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id w14so12178875itc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 22:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RTngKLnZr48FxdpiI03zppM8/jCjvs5CQ2HDEKaSwHY=;
	b=povIzwf5w5kPqvmEI1tpIRpzP7XafC97HdrEuO5aeZQ2mhM4/yGk3G/t3sHCPrinQU
	lgcVa5TNihn6TcTYmNeNSWogB6DUV4tcvwhpk99QTF9xIFM3lY9MUoOfMXtKlBDoX97i
	3WUWZy44HAx0iX1hLgPchQoFGFNY4rH4mIhy3ItmV/EU1DgAm4lGqvMF6IxtJXQXWDI2
	cgkfzU196wSk3FYGJaf5P03l6C6DbEakt1U0noMpKQnQpm1Yzrl5vgj0zkMA/zYYS4FR
	SF6tYb62vQ94v3nhPdKkuLoQt6qqSIZCEkCbuCcT62fSi91LX0+sn/puDgKzDpCdFcd2
	V9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=RTngKLnZr48FxdpiI03zppM8/jCjvs5CQ2HDEKaSwHY=;
	b=RMYUYHHP2e2dP9obSWQnrYhgqQ4btEQ2WIvTAAQqjVOqRJIRSdOoUlZdYUJhRgNS/w
	oEDBULOjl9/7amgQ0jI2aEAp2kgEB735pSPjDL4u2ZCEHF6E6NXgmw0o6lJDNt1M16x+
	auDDt2jhMh5iaProPdoQtp4/PuCY8oXkoXqiKU3FDrxieO5lUuA9HcZgwIvIvm/kWoHe
	SkFuqCjZGB4nrqFuFRaPF9+wZ1H/mCi5JjlkEz9Lb7c9aQpk4OTsTgWjGYhXGq2J7rgT
	HwO6rqYkQBYoz095yo9V7in0Ofnsbd3O0WZi2roVgxzKYLrmXRNSD9UsMtUuYNb2cjIe
	4E+g==
X-Gm-Message-State: AKwxytd5Nx0RViQ/Z+HHDDQXGzMt+NBKZr8fx/oaSxQul7RBNY0U2WFK
	mjD4Ah4xe06aLGFuXvZujsV2spfY
X-Google-Smtp-Source: AH8x225tAXjSt50dX/ly00RWpBXDEVpilDNCUphzQ24+L0OF8awBPqDMbtB/ieHMR9vbanWT15Ixpw==
X-Received: by 10.36.2.16 with SMTP id 16mr30309147itu.81.1517295058574;
	Mon, 29 Jan 2018 22:50:58 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:fd41:97d0:e3d:7877])
	by smtp.gmail.com with ESMTPSA id r13sm5266696ioa.4.2018.01.29.22.50.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 22:50:57 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <4e5a0f53-a5eb-a4d4-2030-d7580d16bac3@thecshore.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <d688a031-3567-7501-f870-a97216345b6a@gmail.com>
Date: Mon, 29 Jan 2018 22:50:56 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <4e5a0f53-a5eb-a4d4-2030-d7580d16bac3@thecshore.com>
Subject: Re: Per-binary-package LICENSE? and/or dependent on PACKAGECONFIG?
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
X-List-Received-Date: Tue, 30 Jan 2018 06:50:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1/29/18 5:38 PM, Daniel F. Dickinson wrote:
> Hi all,
> 
> I have a question about packages which by default don't ship e.g. LGPL 
> code in their binaries, but if a configure option is turned on then the 
> package generates examples / test programs that are LGPL (in this case 
> due to a shell script from shunit2).
> 
> How can you define the LICENSE so that it's correct in each case?
> 
> Is it possible to do e.g. LICENSE_ LICENSE_${PN}-examples, etc?

yes, you should be able to define per package license. May be its better 
to separate such output artifacts into separate packages and then use 
the above LICENSE_packagename constructs.

Now, if the license gets changed for binary due to some configure option
then its not well tracked. Probably its better to have a separate recipe 
for such cases.

> 
> What about making LICENSE contents conditional on PACKAGECONFIG
> (for if the offending examples are built)?

If packages are well defined then you might not need this.

> 
> Or is it best to not just build the examples and not worry about the 
> LGPL source code that's not in the output packages?
> 
> Also, I'm planning on a two patches for this package (libubox in 
> meta-oe/recipes-devtools); one which corrects the LICENSE (it's actually 
> BSD-1-Clause&BSD-3-Clause for the shipped binaries), and another which 
> updates to the latest stable release from upstream.  Since this is a new 
> ABI version/SOVERSION, should this be built as a separate recipe that 
> can exists alongside the older version?  (Not that there are likely many 
> users of this library yet; it really is primarily useful for the work 
> I'm doing on munging Openwrt packages like procd and netifd which depend 
> on ubus and libubox so they are useful outside Openwrt.

I think these packages should be left to meta-openwrt. They are not so 
common and meta-oe is not right place for them. So send a patch to 
delete them.

> 
> In particular I'm interested in procd as a tiny init with 
> process-handling (e.g. rewspawn, hotplug, network, and config change 
> triggers).
> 
> IIRC < 100K for procd stack vs. some # of MB's for systemd (not 
> including network).
> 
> The real question is whether there is any *modern* *Linux* embedded 
> hardware where that's a big deal.  Obviously old routers with 8MB flash 
> and 128 MB RAM it matters, but I'm have no insight into how common that 
> size of hardware is in any new development.

there still are designs which are relevant to this size, especially 
smaller wifi APs for e.g mesh networking, so it does have an appeal but 
its not a common case anymore,

> 
> If not much, then a better road for me would be to deal with UX for 
> headless (e.g. network/web) systemd builds.
> 

probably, is a good place for slightly bigger h/w with say 512M+ ram

> Regards,
> 
> Daniel


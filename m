Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 195FC61566
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 17:29:13 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id l6so5893305oag.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 09:29:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ShTJ7L35CjLR761ugP2DgX5obanXCQfbzPsHdF5Q0kE=;
	b=gxpzKPf68cYpcpCtNWdY71GdPLnBxmiu40b7VMS0TQRWocWW28XTSe5mABm/UKR5CJ
	5l/7MrZ/wOvxhFpeCAqHfaVd3ln47mDsNl4CKPeg+sQyD7mq61xUftGycp9SFLutx9li
	PmxwLh2hOW+fA2PEzsIuxfeSF4wgbdYMkCZN6YOAK0Spe3V4A6OLNNDNCin35TCzuDcP
	21MI6jbXcmVBGnT8SL8sYc0TOhgAdZOebc7356dL/g5pZz81CgZz/Zqk/F2o1nynun76
	Qq62A6qKUXsAapQNrXyoGkngjPAaYuADiksiX9Kxf7D8viRsnUiRu0x6zFUO7LldjDRL
	6hSw==
X-Gm-Message-State: ALoCoQkc+1yED6sioRuTmtDUth2IFOiiZHqrrEGUYLK1zdodPUeU8VqXRL7axa96zqQQEQdBUgrK
X-Received: by 10.60.117.225 with SMTP id kh1mr17672049oeb.15.1386696551733;
	Tue, 10 Dec 2013 09:29:11 -0800 (PST)
Received: from localhost.localdomain (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id hl3sm22731004obb.0.2013.12.10.09.29.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Dec 2013 09:29:10 -0800 (PST)
Message-ID: <52A74F65.3090202@felipetonello.com>
Date: Tue, 10 Dec 2013 09:29:09 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1385600219-18495-1-git-send-email-eu@felipetonello.com>	<14902072.IG3b8o4YqW@helios>	<l77732$ggi$1@ger.gmane.org>	<1825979.KGUos5WM3r@helios>	<l777t2$pcq$1@ger.gmane.org>	<CAGrhNMxYxbA-dL0iQFB_mD-s94nrKupCx-vJaijp=sPy5herwQ@mail.gmail.com>
	<l86mmo$28c$1@ger.gmane.org>
In-Reply-To: <l86mmo$28c$1@ger.gmane.org>
Subject: Re: [PATCH] packagekit: Updated to 0.8.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Dec 2013 17:29:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Koen,

On 12/10/2013 01:26 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Felipe Tonello schreef op 10-12-13 02:17:
>
>> It does split into packages. I splited it up in packages just so if the
>> user wants to have different backend options, it can.
>>
>> The problem with this aproach, is that you will add the apt and opkg
>> dependency to the build even if the user doesn't care about it. I don't
>> like this option to be honest.
>
> It's only 2 small build time dependencies saving a lot of rebuilding and
> runtime headaches.

So what's your suggestion for me to fix this patch?

Felipe


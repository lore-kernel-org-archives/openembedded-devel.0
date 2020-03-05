Return-Path: <leo.yan@linaro.org>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC396186D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 01:43:55 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id s2so1924777pgv.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 17:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uVOjdGO2X9Jv5ksBCxFUDB3KxyvGH0+qrv33F5N8npc=;
	b=CaHWpwNSJX7JhMLctxnuqVqNJujlBaJVVP/Y0efn/V4Ztw4rNDrNfymN20zdNtO+q/
	/SARkDlbqm6LBWhhqff7KZ4V3I9UC2uVt1Z7hAxuNWA4LlCXQMlB1eOkA836OM7ARJCD
	040K35HX9d17FhfLJYHfdh49hlPKi13w0tvJyyygATYUQPOD2M8j0QQWQROJ0pgCri2t
	ZdTbzmw/YxLXsemQNCc6UDDRVhMn7Suvhc3gc9fI61HcXz+Pv5zfqdWU4hcFEAFvtN1o
	niOwg5XIHrXy8madsq86QwlIXpnwYsSOQr2u5fJ9lYoNHQxDNSObyzaeqcJD6R7eTczu
	J7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uVOjdGO2X9Jv5ksBCxFUDB3KxyvGH0+qrv33F5N8npc=;
	b=NYIv9r7Vr78ZiI18oHYbWQJ1wFUaLGNZIqcuZNfwWP49eHRe40iqAkv8ZRg3R7EtfV
	7abyxACGi5yVv1zav+CEiu+KTcge4nMZS+9q/bqbZ6n6JEOZf83QXh4fZkFc7vLQIuua
	Kc/s5auSaybpnZp5Xq+XzLj44g9goET0eikxYEkWLid2aIkk11O8Q5chLqngvwvsokJE
	o/QY0WZRYaK7/knDpQb0ZLKBQI7XXoNeF0ajL/FQnzX/N5hEnKlnbpMipf8STygSoq5b
	R9o4fLUh4GKoFSBA+6Z3zLw8VAU7zTnuwLACrQQt46JrwqxJQIn6hNpJBdqq405jOWEK
	EihQ==
X-Gm-Message-State: ANhLgQ2lvTE5dg++cThV8Pr0DwTg46x8cFI+NWAqBMtuhQaL0m4FUieo
	f6+/bQNmacbZGsXxSrlSlx2eDw==
X-Google-Smtp-Source: ADFU+vvSUAMfZosWlyNuRInXN+xjcRGqT4RTN/3w0HaHOjBilJg9+uM4IDqVU5N0/RO1OtuW6NWEpQ==
X-Received: by 2002:a65:6843:: with SMTP id q3mr5159943pgt.269.1583372636439; 
	Wed, 04 Mar 2020 17:43:56 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:ee42])
	by smtp.gmail.com with ESMTPSA id d1sm21827252pfc.3.2020.03.04.17.43.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Mar 2020 17:43:55 -0800 (PST)
Date: Thu, 5 Mar 2020 09:43:47 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200305014347.GA5761@leoy-ThinkPad-X240s>
References: <20200304122811.16655-1-leo.yan@linaro.org>
	<alpine.LFD.2.21.2003041103340.29352@godzilla.spiteful.org>
	<a7ae7094-c8b4-f0cc-357f-c6cce1231e49@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a7ae7094-c8b4-f0cc-357f-c6cce1231e49@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v1] OpenCSD: Support for Arm CoreSight decode lib
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
X-List-Received-Date: Thu, 05 Mar 2020 01:43:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Wed, Mar 04, 2020 at 11:19:37AM -0800, Khem Raj wrote:
> 
> 
> On 3/4/20 8:05 AM, Scott Murray wrote:
> > On Wed, 4 Mar 2020, Leo Yan wrote:
> > 
> > > This recipe is to support OpenCSD, which is an open source
> > > CoreSight trace decode library and utility.
> > 
> > Just a thought, this seems like the kind of thing that might make sense
> > for the new meta-arm layer that Jon has been working up?

Thanks for the suggestion, Scott.

To be honest, I didn't know meta-arm layer before; seems to me it makes
sense to integrate this recipe into meta-arm rather than
meta-openembedded.  Will explain more for Khem's question.

> it also says x86_64 in COMPATIBLE_HOST, while coresight seems to be arm
> specific is this not supposed to be so ?

OpenCSD lib is dedicated to be used for Arm CoreSight IP, but it can
be built both for x86_64's and Arm64's distro.

The main usage case is to enable OpenCSD lib for Arm64 building, and the
users can decode the trace data with Perf/OpenCSD in the same distro.
Though I set COMPATIBLE_HOST for x86_64, it would be seldom to do cross
analysis (e.g. capture trace data in OE/Arm64 and copy the perf data to
OE/x86_64 for analysis).

For this reason, it's good to maintain this recipe in meta-arm.  If no
objection, I will prepare patch for meta-arm.

Thanks,
Leo


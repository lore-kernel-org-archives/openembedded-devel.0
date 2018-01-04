Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 065BA70057
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 06:31:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i11so1449993wmf.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 22:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=D//yILybmuih31lMQ+IesThw5eqdOq8nYLFQwhVTtv4=;
	b=Yi1r3TGS+cgX6B2fPDx+uCjA2mvHyCGDGdJA62xK6at8Xc6CpwscjT29T98MoSDIiv
	0ASlx7RlZR4+ZF8orL3painnoI8PbM4pWttsJ9WJW+6VJqM1Ka27f1wtdyWSdw6TYIMC
	zbaJxVxGwUrpJkLkA+scntHENwPetr4RP4zDujjiEB6RyCMfi69QzejqHeDdzJRK5sZU
	1k9NZN+QYvodClA7VyK49nzkPCkTnpTmm8C2O5OsMFeC5xiVvFVFjubwOycWr32sdzV5
	nknbANBK1t7x2sC57+pZvJy3ATrOYQEe7ZUfcET4+4qQrMxe5f/zEvHO0BZtiqA6sBwU
	PCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=D//yILybmuih31lMQ+IesThw5eqdOq8nYLFQwhVTtv4=;
	b=oSNt9egW6jMJmPVJZWlIPXQZFVMV25V70u/AmiwTK9PEsP5PywJi+lKsQBCRnnNoUX
	KiDQjrWPrgRY9tETUrXyQ/AsLp9CeQQz1NmOAgBc5QjCZbqaHojO6UWmobdcBW//HJvb
	VOckSmNEakondbXUSFpuMXxx/rP2ZrR4ByP1tJ41iypDv7W2FhEImtloWrbmU2OJVFng
	5JrMhqbmcQpNjmRFOWNfokwe9lUp+oau236o/4lBsjhkDlz596wg2KV6LUvF784iF/vx
	BktD6CxlUYkckfy6Qu+pKBDWIpSXTm8v9dMn21lHJoO9/h5XuUKDLmvANAGQ7WR/BXZY
	5ogw==
X-Gm-Message-State: AKGB3mJq4utcwj9/AgfHqHl/mJZcrunXGOjaSRb8SpAFPEvSBlYWYoFl
	eiGxTaSg1ENiRPOSgiRBwa8e1D9v
X-Google-Smtp-Source: ACJfBotvPnaHHotW2YMF0ZAcPas8YWHCHjnBHVgQJoazoB7xRqs0eJoUk6H/oZHyf/XtIkbhmKGw7g==
X-Received: by 10.80.164.241 with SMTP id x46mr5891946edb.247.1515047471721;
	Wed, 03 Jan 2018 22:31:11 -0800 (PST)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	j27sm1680130eda.59.2018.01.03.22.31.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 22:31:10 -0800 (PST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: "Burton, Ross" <ross.burton@intel.com>
References: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
	<CAJTo0LaHXJMMNg8VmqFNne_8rgEV9TER5saUzUXudRgvzggWNw@mail.gmail.com>
	<6d1905cf-26d2-49cf-d0bb-248cbf4a071d@dresearch-fe.de>
	<CAJTo0LYWwMnj4Wb6JC1y7uw4ZrPv6=SynfkSc0TU0dwi9Dezjw@mail.gmail.com>
	<8926eabe-78fe-dfaa-d123-5d4ed39e0001@dresearch-fe.de>
Message-ID: <9d1c1e79-5eab-941c-0d30-314f9df51de1@dresearch-fe.de>
Date: Thu, 4 Jan 2018 07:31:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <8926eabe-78fe-dfaa-d123-5d4ed39e0001@dresearch-fe.de>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] MS Windows machine?
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
X-List-Received-Date: Thu, 04 Jan 2018 06:31:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

On 21.12.2017 14:00, Steffen Sledz wrote:
> On 21.12.2017 12:39, Burton, Ross wrote:
>> If you want to build for a Windows target then that should be possible but
>> nobody as far as I'm aware has made the work public.  meta-mingw will
>> contain most of the changes needed as that does build Windows binaries.
> 
> That's exactly what we like to to.
> 
> So has anyone tried this before?
> 
> What else would be needed to build e.g. for MACHINE=i686-mingw32?

Is someone able to create a machine definition for this? I'm not really familiar with this job.

Steffen



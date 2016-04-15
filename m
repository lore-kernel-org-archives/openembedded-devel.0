Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id E8EBA6612C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 15:21:52 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id r5so2650918pag.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 08:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=KQccZIPpJ7r971uU1f2ZbOqWes3hi9JdztwE0PB8nqY=;
	b=NbIVu8GrNJ2PFF1ajDh7laLOjkb3YATBsh/4QpcFNaGtyeSIMDUKytneMVECwPUHmo
	4ymstxE1mUtZziMVRN+3ifv8BQ3IQbugMGkYYjdn7XxObgi53YJu75fnJwS/xAHv7l7A
	ausE8ZK7k7RwEy9Tlj8FGGizSQCCUH+XZbRx5YHN33HSz4e1LM5zza+N7AdFf/rgAZXA
	TbZOkiAEon2mTweuk9B3t7fLTBFzeANluEAV/i9xqu1HXY6Do/eBT7WlOS57P2cIH5xK
	UELCofCW7UGS70nwS2oQT3L+7ErHLNVoxTboAQXUECc+xWtbKnEtFSUVESXU+OfqTHbH
	7x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=KQccZIPpJ7r971uU1f2ZbOqWes3hi9JdztwE0PB8nqY=;
	b=lDhc80UaiQZFRwQtThN/2nEg4P8iprCfIbISk56MybmyO2OJ15MuIP3rfThQQSggPb
	zwUsGPxYlJlI8O+rtKywY0fFNOpdLzDH8TtDgNKNMd1yA8EPJyRTecAvJE0xEFVmvlbR
	rdlNAzgopTaSjYdMOuT+hFxh4vHst3E3QE/qhsIQcbTXV77sUnLuPBglkhfIdG1MYAVY
	0Rbquk8lqd9cVBvx3VJ042h49xZdHKHHknYCoXRnzr5XqmWbOAmH7Iy5DX40MhDGfaDu
	5IXFnPWln7oJHJbunE9gdGZ1zFe8RvMOZtxhE64pe+1lqwSP5hME1B8RZfJAA9LofuCY
	2VlQ==
X-Gm-Message-State: AOPr4FU2NQrooUYzOOUp6MYlM5yvyxFlokm8YvTvHan+lYTQrjgGpGmLjT1XSWuTELByqQ==
X-Received: by 10.66.225.235 with SMTP id rn11mr29947215pac.138.1460733713372; 
	Fri, 15 Apr 2016 08:21:53 -0700 (PDT)
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com.
	[209.85.220.48]) by smtp.gmail.com with ESMTPSA id
	p78sm5887987pfa.75.2016.04.15.08.21.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Apr 2016 08:21:52 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f48.google.com with SMTP id er2so27722194pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 08:21:51 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.251.10 with SMTP id zg10mr30189736pac.1.1460733711476;
	Fri, 15 Apr 2016 08:21:51 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Fri, 15 Apr 2016 08:21:51 -0700 (PDT)
In-Reply-To: <CAOd_LFyF5A_Xp5SGVM7cQXU=w3zhPeWsWVohb2V9VDVxMLwoTA@mail.gmail.com>
References: <CAOd_LFyF5A_Xp5SGVM7cQXU=w3zhPeWsWVohb2V9VDVxMLwoTA@mail.gmail.com>
Date: Fri, 15 Apr 2016 12:21:51 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrgiJvzB5NaH6GD2Sv8nt9nKAy=1kHzYXULQDLA9hd0_Q@mail.gmail.com>
Message-ID: <CAP9ODKrgiJvzB5NaH6GD2Sv8nt9nKAy=1kHzYXULQDLA9hd0_Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: anyone using docker for OE builds?
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
X-List-Received-Date: Fri, 15 Apr 2016 15:21:53 -0000
Content-Type: text/plain; charset=UTF-8

Hello Cliff,

On Thu, Apr 14, 2016 at 10:44 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> Does anyone have any suggestions or tips for using Docker to host OE
> builds -- especially the storage aspect?

Some of us here, at O.S. Systems, are using it as we migrated for Arch
Linux and we use Docker container (Debian 8) as build environment.
This works very well and we mount the $HOME as a volume so storage is
not a problem.

We are now in the process of int

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id CE9786204F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 11:01:10 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id ht10so206289vcb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 04:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=TgsdSqLoqULnVCs5NA53YYObWqb/0t7cnbggpe4YoGI=;
	b=VSPrM9kYUZldEDVCCl7mBY00RX9+FsF+Z1U11FDriW+aA8J+iqtv6smqA964RjzDr1
	AKKvi1GVrH9yfSIW/bmhr3p//M+vx3fB0UD+D4oJxsOs6D20kHFWJ8TRjnwyk82ZVpbh
	VNTZG8fYKCVGHPMx/xtpXBVpeJ7itq2YRIh3QQtCXEiqMtQor2Q5ZcpYwTRJmlaWgbVO
	CifN7e7NRvUg+GrVyM4cTAQ65ZY4LTG7vH8Jh3rXTY3FiV1EBmbVwneJXmInHsIi0kTW
	ElKkOCH5X3g+QLG8Mb3GgIFCiw6VAkRlO0NN7MLsBr3hN20NrbgqcA+OS5eWBVCS5C2P
	ziUA==
X-Received: by 10.52.18.171 with SMTP id x11mr2751668vdd.92.1372330871133;
	Thu, 27 Jun 2013 04:01:11 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Thu, 27 Jun 2013 04:00:30 -0700 (PDT)
In-Reply-To: <1372326719-11068-1-git-send-email-lei.yang@windriver.com>
References: <1372326719-11068-1-git-send-email-lei.yang@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 27 Jun 2013 12:00:30 +0100
X-Google-Sender-Auth: XAdGXOnMT7nprWmELOKrYXtTRcw
Message-ID: <CANyK_8cc7LLLDJssgeWhRHkBy4AshZsGByvjUdwJUZPeBzprgw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Cc: Joe.MacDonald@windriver.com
Subject: Re: [meta-networking][PATCH:V3] vlan: Add vlan recipe
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
X-List-Received-Date: Thu, 27 Jun 2013 11:01:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 27 June 2013 10:51,  <lei.yang@windriver.com> wrote:
> From: Lei Yang <lei.yang@windriver.com>
>
> A 802.1q vlan support program,which can be used by virt-test
>
> Signed-off-by: Lei Yang <lei.yang@windriver.com>

Just took a quick look at this out of interest. What's using the
vconfig program once it's installed on the target?

vlan-1.9 was released in 2005 and there hasn't been an update since.
The ArchWiki suggests that the modern 'ip' command can do what vconfig
used to do (https://wiki.archlinux.org/index.php/VLAN).

If we can avoid a dependency on such legacy code that would probably
be good. Though I may be missing something as I haven't followed all
the discussion around this patch and I don't know your use case.

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


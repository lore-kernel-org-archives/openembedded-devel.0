Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 957FB61F16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 09:12:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5C9CWXW000825
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jun 2014 02:12:32 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Jun 2014 02:12:32 -0700
Message-ID: <53996EFE.5090608@windriver.com>
Date: Thu, 12 Jun 2014 17:12:30 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Eduardo Silva <eduardo@monkey.io>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <1401987607-32495-1-git-send-email-eduardo@monkey.io>	<5397D858.8020408@windriver.com>	<1767793.gX9fSKelVL@peggleto-mobl5.ger.corp.intel.com>
	<CAEaCVQjL3uhWV_sdu0ec=sEC-QLAKKwkt1m=Wh5G5Z42wWYomg@mail.gmail.com>
In-Reply-To: <CAEaCVQjL3uhWV_sdu0ec=sEC-QLAKKwkt1m=Wh5G5Z42wWYomg@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-webserver]: add Monkey HTTP Server.
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
X-List-Received-Date: Thu, 12 Jun 2014 09:12:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/12/2014 01:47 AM, Eduardo Silva wrote:
> Hi all,
>
>     /media/large/tmp/work/core2-64-poky-linux/monkey/1.5.0-
>     r0/temp/log.do_compile.22474)
>     ERROR: Task 6 (/home/paul/poky/meta-oe/meta-webserver/recipes-
>     httpd/monkey/monkey_1.5.0.bb <http://monkey_1.5.0.bb>, do_compile) failed
>     with exit code '1'
>     ----------------- snip ------------------
>
>     The quick fix for this is to inherit autotools-brokensep; a more desirable
>     long-term fix would be to fix monkey to allow building it in a separate build
>     directory.
>
>     Eduardo, could you please send patches for these?
>
>
> thanks for tracking down this problem.
>
> After verify, our configure script miss that feature (i am wondering why this
> problem did not happened on our local tests), as this is something that is

Are you using oe-core's master branch ? Separate builds by default is enabled
after daisy released.

// Robert

> breaking the build we will work in a long-term fix. You should receive today a
> patch for the quickfix plus the new recipe for Monkey v1.5.1 (minor release).
>
> cheers,
>
>


Return-Path: <Yadi.Hu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDA571CAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 04:39:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v444d4Ck002792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 May 2017 21:39:04 -0700 (PDT)
Received: from [0.0.0.0] (147.11.105.122) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 3 May 2017 21:39:03 -0700
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
References: <1493781959-31023-1-git-send-email-yadi.hu@windriver.com>
From: yhu2 <yadi.hu@windriver.com>
Message-ID: <f8a42b9e-02a0-d625-7cab-54e4f7aeddc3@windriver.com>
Date: Thu, 4 May 2017 12:39:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1493781959-31023-1-git-send-email-yadi.hu@windriver.com>
Cc: marius.tiplea@windriver.com
Subject: Re: drbd-utils: fix dependency for perl under small-fs
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
X-List-Received-Date: Thu, 04 May 2017 04:39:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Any comments would be appreciated.


Yadi


On 2017年05月03日 11:25, Yadi Hu wrote:
> when run drbd-overview under samll fs, the perl script fails to run
> due to lack of perl's lib. warning shows as below:
>
> drbd-overview
> random: nonblocking pool is initialized
> Can't locate Getopt/Long.pm in @INC (you may need to install the Getopt::Long module) (@INC contains: /etc/perl /usr/lib64/perl/site_perl/5.22.0/ /usr/lib64/perl/site_perl/5.22.0 /usr/lib64/perl/vendor_perl/5.22.0/ /usr/lib64/perl/vendor_perl/5.22.0 /usr/lib64/perl/5.22.0/ /usr/lib64/perl/5.22.0 /usr/local/lib/site_perl /usr/lib64/perl/5.22.0 .) at /usr/sbin/drbd-overview line 393.
> BEGIN failed--compilation aborted at /usr/sbin/drbd-overview line 393.
>
> the patch explicaitly specified dependency for perl;s lib needed.
>



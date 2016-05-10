Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5273700FD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 15:31:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4AFVXUH014123
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 10 May 2016 08:31:33 -0700
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 08:31:32 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1462604487-112658-1-git-send-email-hongxu.jia@windriver.com>
	<20160510121740.GA5675@jama>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <5731FECD.2020901@windriver.com>
Date: Tue, 10 May 2016 23:31:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20160510121740.GA5675@jama>
Cc: koen.kooi@linaro.org, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH V4 0/3] efivar: update to 0.23
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
X-List-Received-Date: Tue, 10 May 2016 15:31:36 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2016 08:17 PM, Martin Jansa wrote:
> No it fails with different unknown option:
> http://errors.yoctoproject.org/Errors/Details/61934/
> http://errors.yoctoproject.org/Errors/Details/61951/
 From above log, unknown option is '-PIC'
...
i586-oe-linux/5.3.0/ld: -PIC: unknown option
...

As you suggested, I add 'ld-is-gold' to my build.
Yes, it could reproduce the failure, I will try to fix it.

//Hongxu


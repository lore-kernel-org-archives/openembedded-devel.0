Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B25E6AC93
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 02:46:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6B2koUV024474
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Jul 2014 19:46:51 -0700 (PDT)
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 10 Jul 2014 19:46:50 -0700
Message-ID: <53BF5020.8020203@windriver.com>
Date: Fri, 11 Jul 2014 10:46:56 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1404976077-1809-1-git-send-email-rongqing.li@windriver.com>
	<CABcZANktDnJnQTN-mz+1BUx4Bs-m5PeXAMY+nideskOdbSpwog@mail.gmail.com>
In-Reply-To: <CABcZANktDnJnQTN-mz+1BUx4Bs-m5PeXAMY+nideskOdbSpwog@mail.gmail.com>
Cc: Christopher Larson <clarson@kergoth.com>
Subject: Re: [meta-oe][PATCH] sdparm: add recipe file
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
X-List-Received-Date: Fri, 11 Jul 2014 02:46:53 -0000
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/11/2014 01:16 AM, Christopher Larson wrote:
> On Thu, Jul 10, 2014 at 12:07 AM, <rongqing.li@windriver.com> wrote:
>
>> +-INCLUDES = -I/usr/include/scsi
>> ++INCLUDES = -I=/usr/include/scsi
>>
>
> Also doesn't obey @includedir@, so it'll break on a non-/usr prefix.
>

The original code is written like this, I only make it to accept
sysroot.

How should I change it? like below

INCLUDES = -I=@includedir@/scsi

-- 
Best Reagrds,
Roy | RongQing Li


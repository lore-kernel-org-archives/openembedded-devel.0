Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C59AF745A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 14:17:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8CEGZDb029463
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Sep 2018 07:16:45 -0700
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 12 Sep 2018 07:16:24 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180912082642.35624-1-hongxu.jia@windriver.com>
	<8a566f88-4b87-b0a4-228f-dbc2bbb8981b@windriver.com>
	<CAMKF1so5pxbk84E+cjXbzbmVJfg=dDzjJ1Ubnkw2yUk4_E_xDQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <425aaced-f337-89a0-d659-6754460f2e57@windriver.com>
Date: Wed, 12 Sep 2018 22:16:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1so5pxbk84E+cjXbzbmVJfg=dDzjJ1Ubnkw2yUk4_E_xDQ@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] cyrus-sasl: use autotools-brokensep to build in sources
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
X-List-Received-Date: Wed, 12 Sep 2018 14:17:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年09月12日 22:12, Khem Raj wrote:
>>> The crypto-compat.h locates in git/common/, it should be
>>> `-I../../git/common'
> this should b fixable in source Makefile.am to use $(srcdir) in that
> -I spec it might be either missing or ignoring the fact that S can be
> different then B
>
Yes, I will try send the fix on Makefile.am to upstream and wait their reply

This patch is a quick fix to OE

//Hongxu



Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 51A35780CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 20:08:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6QK8nEc002051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Jul 2017 13:08:49 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 26 Jul 2017 13:08:48 -0700
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20170724172825.10560-1-Martin.Jansa@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <d22a333c-a737-96ba-88f4-555bdd9e10ea@windriver.com>
Date: Wed, 26 Jul 2017 16:08:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724172825.10560-1-Martin.Jansa@gmail.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH][RFC][meta-oe] bluez4: remove bluez4-only recipes
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
X-List-Received-Date: Wed, 26 Jul 2017 20:08:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-07-24 01:28 PM, Martin Jansa wrote:
> * remove recipes which support only bluez4 and are blacklisted when
>    bluez5 is selected in DISTRO_FEATURES, if someone is still using
>    bluez4, then it can be restored in separate meta-bluez4 and
>    maintained by people using it.
> 
> * there are few recipes which support both bluez5 or bluez4 based on
>    selected DISTRO_FEATURES, these can stay in meta-oe repository, but
>    now people without bluez5 in DISTRO_FEATURES will need to add
>    meta-bluez4 layer to satisfy bluez4 dependency


Sounds reasonable.

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5


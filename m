Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3FDCE783C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 01:24:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7E1O2Gg028817
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 13 Aug 2017 18:24:02 -0700 (PDT)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 13 Aug 2017 18:24:01 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1501142861.git.hongxu.jia@windriver.com>
	<2b121c2e2fbf3f417f9689d2435084d01a4a2f68.1501142861.git.hongxu.jia@windriver.com>
	<20170812090830.GA3337@jama>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <571a4e1f-db18-3234-f9d9-3fa4920ce60f@windriver.com>
Date: Mon, 14 Aug 2017 09:24:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170812090830.GA3337@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 5/6] python3-blivet: add recipe 2.2.0
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
X-List-Received-Date: Mon, 14 Aug 2017 01:24:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年08月12日 17:08, Martin Jansa wrote:
>> +inherit distro_features_check
>> +REQUIRED_DISTRO_FEATURES = "systemd"
>> +
>> +inherit setuptools3 python3native
>> +
>> +RDEPENDS_${PN} = "pykickstart python3-pyudev \
> Should it rdepend on pykickstart or python3-pykickstart?
>
> There is
> PROVIDES = "pykickstart"
> RPROVIDES_${PN} = "pykickstart"
>
> in python3-pykickstart recipe so this works, but I don't understand why
> not rdepend on python3-pykickstart directly like for most other python
> packages.
>

Oh, the `pykickstart' is used by upstream blivet at very begging.
And this recipe kept it since then.

https://github.com/storaged-project/blivet/commit/9a6acef77255e2454822fbf758d65e92145fe32a

I keep it in python3-pykickstart just to backward compatibility, and
in the newly added python3-blivet, rdepends python3-pykickstart
like other python packages is better.

//Hongxu




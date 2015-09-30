Return-Path: <radek.dostal@streamunlimited.com>
Received: from bsmtp4.bon.at (bsmtp4.bon.at [195.3.86.186])
	by mail.openembedded.org (Postfix) with ESMTP id 36D2B77027
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:44:28 +0000 (UTC)
Received: from [10.1.14.92] (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp4.bon.at (Postfix) with ESMTPSA id 3nQzMv5M2Kz5tlc;
	Wed, 30 Sep 2015 15:44:26 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <3D222848-8306-43E1-BD45-3D106F04AD70@gmail.com>
From: =?UTF-8?Q?Radek_Dost=c3=a1l?= <radek.dostal@streamunlimited.com>
Message-ID: <560BE73A.9070703@streamunlimited.com>
Date: Wed, 30 Sep 2015 15:44:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <3D222848-8306-43E1-BD45-3D106F04AD70@gmail.com>
Subject: Re: Cmake + qt4 = linker error
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
X-List-Received-Date: Wed, 30 Sep 2015 13:44:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Raj,

 > may be you should inherit qt4e in your recipe as well

I have tried this as well producing interesting behavior. When using:

1) inherit cmake qt4e

it did not even passed do_configure, as qt4e overwrite configuration 
method with the one which used qmake.

2) inherit qt4e cmake

it produced the same behavior as the DEPENDS += "qt4-embedded".

FYI: I have chosen DEPENDS += "qt4-embedded" for example as it looked 
slightly more readable, but there is no difference between the two.

Thanks,
Radek


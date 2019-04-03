Return-Path: <prvs=989280226=Richard.Leitner@skidata.com>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Apr 2019 09:12:29 UTC
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 08DCB7D26B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 09:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1554282751; x=1585818751;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=AzztQJsDsdbkKk4VyBSNkeCCU3A4RGxIFtQiRMrMLU0=;
	b=VyUk8Dch/LYmuiQHmqJRaERlxR6q9jlNaXs186RNdZMwVAEfwBeTQ6il
	8qHDsUI68dtAD0P2L5hKZbnLzmrycAAkgXX9BmAK/4O0EiLOKMjqwQS1n
	7pwpn7HuN/GBs1NyY1stfG2kTYlUXdosDcQkWh62yJLYfiPkWb14VYIch
	bjrIF88rVAmwLf154TRw+R/siyAwq9hkEPt/SdGvvznt3+SfmdwkAEw/R
	J932hKa8rtsG55s8kIO5zfhjiKF/NixYO0SrosmBZYc7LwND6RaGq1Vsm
	Jh1DgVo8oUSxMwJjFsBiDZUCySK58pSDjaz/G4yJWfyXPZ/JxOrtTshQX g==;
IronPort-SDR: UUYcb/A9ASu7E9Iawea3aol2JLcVy3jY9q4HEOQwkdsUHjD3AkHAJ1dmWBJnIIp8Tkyql9wl0b
	GhEIx+YxN0rQDyeYUHLiDJjbVIRgzheKnmAH3W4ASO6uLH3IMbiDjzxIAspiy3apaDlgOboOCf
	infjgCu9lK+1P8l1RMstADg5NLMWKKNBl8N8q4TwHHtn5CEmENxZh9w1xBXRqL8SJNt5rhXEfz
	fGWDWBaQeEVQHMrXAhGe1KPC+DbMf2qgsYfa2O6Ap2nAxfQYlN95l8Zg+R4JSohQTRUOHeReW8
	kaU=
X-IronPort-AV: E=Sophos;i="5.60,304,1549926000"; 
   d="scan'208";a="2070231"
To: <openembedded-devel@lists.openembedded.org>
References: <20190401140821.2226-1-andrej.valek@siemens.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <e3c52e27-e62a-82e8-03db-919045a14d85@skidata.com>
Date: Wed, 3 Apr 2019 11:09:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190401140821.2226-1-andrej.valek@siemens.com>
X-Originating-IP: [192.168.111.22]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: Peter Marko <peter.marko@siemens.com>
Subject: Re: [meta-java][PATCH 0/2] Allow building jre from hosttools
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
X-List-Received-Date: Wed, 03 Apr 2019 09:12:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Andrej, Peter,

On 01/04/2019 16:08, Andrej Valek wrote:
> From: Peter Marko <peter.marko@siemens.com>
> 
> Buildding whole native openjdk toolchain takes very long time
> as is a waste of resources.
> 
> Following layer configuration allows to build from hosttools:
> HOSTTOOLS += "java javac pack200"
> ASSUME_PROVIDED += "openjdk-8-native"
> 
> This requires some changes in the recipes.

Thanks for this series.

I'll merge it to master-next, take a look at it ASAP and run it through 
my tests. Unfortunately I'm currently quite busy so please don't expect 
any results before end of next week. Sorry for that.

regards;Richard.L

> 
> Peter Marko (2):
>    openjre-8: allow build from hosttools
>    openjdk-8: add missing unzip-native dependency
> 
>   recipes-core/openjdk/openjdk-8-cross.inc | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 


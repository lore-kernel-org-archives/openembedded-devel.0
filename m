Return-Path: <prvs=298a941f5=Richard.Leitner@skidata.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Feb 2020 09:31:17 UTC
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id C411760197
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Feb 2020 09:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580981479; x=1612517479;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=HvamizdaVS5cDckE93XvGokmQEXxAnmA/QQoIuSb0N8=;
	b=LM3YDpzf+YxZptQ6v4ONyoM1r3fhAvEByFcZ99Hp6wjafl/qjIswKM1O
	bCjjK/NMzBv/MS0rNzG6RY01WpeG8wdXco8HMW+sXUdSQdRtmmQgfY9rn
	pGag9iqnQhLKdArYzmeBMWeNnepOnajVQlxDhn2YZKLtcqWiWqI4QypGv
	CAJTNPaDwH9HSnhE9caUl8jrnh7dm8GguN4qhB3gnUUJGtWlx3DmZaPyO
	ZtIrxsdgsLH1QhY/soUwZuTzbF5eoKmz4/5GNU5rmQVej38JF5cRKFyHa
	Q3ppuroJL3CYKHl/M3fyVzL/HSEcbQt5JQ5mCCLHqwIENfObgchoWZgN/ g==;
IronPort-SDR: +4U8TtASafIckPWfNkcpviX06k/ZluXWVfyB/zNth9A57OoGGjseUkN4Gsk7AFATYTqySKHbBc
	HjL/NsRq7Vx6jArhmo14YAdA0EO6cvene/QPo+NbzayBoMcd0F4KVoLVjKk0v6GmkJRkChxb9A
	Om9dietNXknffNzGWzMvw/w6iR3dUzL/jbQJFFXzH5i9EQqh7faQPRRNxTmM2XJdpZUydJTb0z
	kWhzoZlHDb7lplHod3nLIrtlbXsipyP6wyXfkpn1e4R3BaK3haI5vBdZ6MQPoIFOMtxNbSzAqo
	aF0=
X-IronPort-AV: E=Sophos;i="5.70,409,1574118000"; d="scan'208";a="22500481"
Date: Thu, 6 Feb 2020 10:24:07 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
Message-ID: <20200206092407.GA7361@pcleri>
References: <20200126111035.273501-1-jacob.kroon@gmail.com>
	<20200126112146.GB2043417@pcleri>
	<80d30f83-b342-cfb7-9114-86ee61198fd7@gmail.com>
	<424d1981-b4f0-de86-f18b-8a216339d3ea@gmail.com>
	<20200127052211.GA2138442@pcleri>
	<639e9a61-3ef7-e391-649d-9b53567ded40@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <639e9a61-3ef7-e391-649d-9b53567ded40@googlemail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][g0hl1n/wip-jdk8u242ga][PATCH] Fix building openjre-8 242
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
X-List-Received-Date: Thu, 06 Feb 2020 09:31:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Matthias,

On Wed, Feb 05, 2020 at 02:20:53PM +0100, Matthias Schoepfer via Openembedded-devel wrote:
> Hi Richard and Jacob,
> 
> I just stumbled across the very same error, but on aarch64. I tried to
> switch to the wip-branch, but I get
> 
>  ParseError at
> /[...]/meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb:7: Could not
> inherit file classes/features_check.bbclass
> 
> I am on zeus...

This seems legit as AFAIK features_check.bbclass was introduced after the zeus
release. For zeus you can replace it with distro_features_check.bbclass,
but please note that I haven't tested on zeus. I'm working on master.

Futhermore please use meta-java's master-next branch for testing as I will
remove the wip branch in the near future.

thanks for your testing!

regards;rl

> 
> Regards,
> 
>   Matthias
> 


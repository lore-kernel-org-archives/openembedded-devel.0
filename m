Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB01.domain01.net (STOEXHUB01.domain01.net
	[83.145.59.142])
	by mail.openembedded.org (Postfix) with ESMTP id C24536CDCB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 08:29:43 +0000 (UTC)
Received: from [172.22.79.29] (212.20.242.100) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Mon, 21 Oct 2013 10:29:42 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <2478778.XBk41EpSZr@koontz>
References: <2478778.XBk41EpSZr@koontz>
MIME-Version: 1.0
From: Anders Darander <anders@chargestorm.se>
Date: Mon, 21 Oct 2013 09:29:27 +0100
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, =?ISO-8859-1?Q?S=F8ren_Holm?=
	<sgh@sgh.dk>
Message-ID: <544da34b-acbf-44ca-8f84-fd993db893f4@email.android.com>
Subject: Re: Regarding layers and their versioning.
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
X-List-Received-Date: Mon, 21 Oct 2013 08:29:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="UTF-8"



"Søren Holm" <sgh@sgh.dk> wrote:
>Hello
>
>What is the best way to manage a private repo with recipes as well as
>meta-oe, 
>meta-core and meta-angstrom.

>Currently I have a private repo that has the layers attached as
>submodules. Is 
>that a crazy setup or what?

We're doing the same internally at ChargeStorm. One benefit is that we're having our "master" repo keeping track of all the layers that we're using and which revision of those layers. 

Other people / projects just use a shell script checking out the desired layers. Some people combines layers into one huge repo (though I'd personally not recommend that approach). (That'd be similar to how Poky is being managed). 

Yet other people / projects use repo. 

It's up to what you're comfortable with in the end. 

> ...... and while  I'm at it - which
>revision of 
>all those layers are ment to match together? does master og meta-oe
>match 
>master of meta-core or do they have simmilar tags/branches.

Yes, in general master of all (most) layers are intended to be used with master from oe-core. Most layers k att least bigger and more used ones) try to support a few old releases, and typically do this using the same branch name as used in oe-core. 

Cheers, 
Anders 

-- 
ChargeStorm AB / eStorm 


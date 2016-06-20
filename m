Return-Path: <jeremy.rosen@smile.fr>
X-Greylist: delayed 379 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Jun 2016 12:43:32 UTC
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id B830F73175
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 12:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 2E4111EE0778
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 14:37:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024) with ESMTP id wuhmBkgVs6HG
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 14:37:13 +0200 (CEST)
Received: from [10.9.18.208] (247.37.0.109.rev.sfr.net [109.0.37.247])
	by idris.smile.fr (Postfix) with ESMTPSA id E9F1C1EE0558
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 14:37:12 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <7fb5e28e-d153-a396-58ae-c4d656835524@emagii.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <6c3c2d7a-0b1e-fb20-1be9-679b3a728dcb@smile.fr>
Date: Mon, 20 Jun 2016 14:37:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <7fb5e28e-d153-a396-58ae-c4d656835524@emagii.com>
Subject: Re: Using EXTERNALSRC in practice
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
X-List-Received-Date: Mon, 20 Jun 2016 12:43:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 20/06/2016 14:08, Ulf Samuelsson wrote:
> We have a meta-layer which builds the kernel.
>
> This contains among other things:
>
> FILESEXTRAPATHS_prepend_<machine> = "${THIS_DIR}/<machine>"
>
> SRC_URI = "git://<server>/<repo.git>;protocol=ssh;branch=<branch>"
> SRC_URI += "file://defconfig"
>
> PV = "...+git${SRCPV}"
> SRCREV = "<shaid>"
> ...
>
> Would like to have an option to build the kernel with external source.
> That option should be easy to enable/disable
>
[skip the rest]

What you are describing here is very close to how the devtool works. I 
think it can deal with kernel packages in its latest iteration

did you have a look at that tool ? does it satisfy your need ? if not, 
what would it need to do what you want...


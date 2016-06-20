Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id E0E9C7318F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 13:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 6E53D1EE07A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 15:58:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024) with ESMTP id hKzZoVaxBrYS
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 15:58:23 +0200 (CEST)
Received: from [10.9.18.208] (247.37.0.109.rev.sfr.net [109.0.37.247])
	by idris.smile.fr (Postfix) with ESMTPSA id 33AC51EE0782
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 15:58:23 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <7fb5e28e-d153-a396-58ae-c4d656835524@emagii.com>
	<6c3c2d7a-0b1e-fb20-1be9-679b3a728dcb@smile.fr>
	<01564453-efa0-c067-83bc-67f995a86452@emagii.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <8646f486-90f9-738d-9daf-6ba1644c83ba@smile.fr>
Date: Mon, 20 Jun 2016 15:58:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <01564453-efa0-c067-83bc-67f995a86452@emagii.com>
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
X-List-Received-Date: Mon, 20 Jun 2016 13:58:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



On 20/06/2016 15:48, Ulf Samuelsson wrote:
> Den 2016-06-20 kl. 14:37, skrev Jérémy Rosen:
>>
>> On 20/06/2016 14:08, Ulf Samuelsson wrote:
>>> We have a meta-layer which builds the kernel.
>>>
>>> This contains among other things:
>>>
>>> FILESEXTRAPATHS_prepend_<machine> = "${THIS_DIR}/<machine>"
>>>
>>> SRC_URI = "git://<server>/<repo.git>;protocol=ssh;branch=<branch>"
>>> SRC_URI += "file://defconfig"
>>>
>>> PV = "...+git${SRCPV}"
>>> SRCREV = "<shaid>"
>>> ...
>>>
>>> Would like to have an option to build the kernel with external source.
>>> That option should be easy to enable/disable
>>>
>> [skip the rest]
>>
>> What you are describing here is very close to how the devtool works. 
>> I think it can deal with kernel packages in its latest iteration
>>
>> did you have a look at that tool ? does it satisfy your need ? if 
>> not, what would it need to do what you want...
>
> No, where can I find more information?
>
The yocto manual has quite a section on that tool

> The customer does not use the latest version of Yocto right now, so 
> that might be a problem,

depends on how old "not the latest" is... but if you can do a sandbox 
with the latest version, you can probably see how devtool works and 
manually do the same thing...
>
> so It would be good to have an example ".bbappend" to start with.
>
> BR
>
> Ulf
>
>



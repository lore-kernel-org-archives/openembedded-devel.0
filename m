Return-Path: <sbabic@denx.de>
X-Greylist: delayed 316 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Apr 2017 07:08:02 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id C434071E01
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 07:08:02 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wBHNR2nLXz1qtYC;
	Mon, 24 Apr 2017 09:02:47 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wBHNR2G2qz3jgY4;
	Mon, 24 Apr 2017 09:02:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id BHGKfIG7NiiS; Mon, 24 Apr 2017 09:02:46 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221]) by mail.mnet-online.de (Postfix) with ESMTP;
	Mon, 24 Apr 2017 09:02:46 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 0083F454055D;
	Mon, 24 Apr 2017 09:02:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id eLwYfit8DPMn; Mon, 24 Apr 2017 09:02:42 +0200 (CEST)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id B94504540441;
	Mon, 24 Apr 2017 09:02:42 +0200 (CEST)
To: Steven Osborn <osborn.steven@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <67ed839c-53ba-4b8b-2e9f-a40655e25e98@denx.de>
Date: Mon, 24 Apr 2017 09:02:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
Subject: Re: State of Java on OE
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
X-List-Received-Date: Mon, 24 Apr 2017 07:08:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 22/04/2017 00:25, Steven Osborn wrote:
> Is anyone using Java on OE devices right now?
> 
> meta-java - no release branches.  Seems to only be focused on master.
> I've had trouble even finding a revision that will compile on Morty.
> 
> meta-oracle-java has a Morty branch, but the URI for the binaries is
> bad so it fails to install.
> 
> Overall it seems like Java is not a very favored or platform at the moment.
> 

I have got the same problems - the missing of release branches in
meta-java is quite confusing. -master does not work with last releases,
and everybody have to find working commit id for each release. And after
that, cherry-picking something from -master to fix global issue (it was
for me dependency's issue with classpath).

Maybe we have to try to propose the maintainers to set release branches
as usual.

Regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================


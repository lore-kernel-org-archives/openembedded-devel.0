Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0007D735
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 11:18:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 453FYN4W2xz60;
	Tue, 14 May 2019 13:18:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557832712;
	bh=eOmeAPwULduKYsLG/JjsI64XGs5/ZnvWJvYkpMbPxek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQskPH7hWU4Dg9VvVyXuJZIdshYqeadzOG8sDsteNwqcAN7h0Oz1g95xjp172wzP5
	0MP99Oo+WvKz0txfZNrVGJSxlNMqhqSDUPnAb+byAH6+/yPiSNbW3ICTuGCevpUd60
	sbdZdaKtEbS+sycQCctGlH80a8LyzZ6A1zmNgZ49TySVF2QNohxeIk6bduHML90/pl
	JK1fhbFMs3ZhF1e7b8uuzZ65cUR6xiTInwfWjAXPMIp1XE14PX28X5uSthIpDnUG2D
	uNPBe4wEmogeSAkY7UQaDFwQMNaZhcvy2sg0d48jl15KsaQBtwuDtEwKBfk72edCVb
	o03f8zQO9obtiY8lqJh+ks9pFhsrz+LS+tQsSR8UPWZZXQx5jeruYLyK8ZEjk7fY2p
	1jGt4gOD8Tng/rKIISjBVDkD8hOeVAnQfc5jCuwWZueZ4Gwju0XDW39MQ85wNbtyW0
	RfXcvjlY+NsUKcIrCUFbrsg3Dp1YxXlOpA7D0E6d6YbMG0OiAZswJ47CoZgQjUT/CI
	ZC2ne3NlZJpfhYD/JjMZGMpRSWsq8rVs9CTY7XsSvDWNoCIRBSDbo9eGk7+WNzM9ce
	Q0hX80rkKoDUE6dkgGP46+uA4yLA9LNqnOzD5aM3jpR6+ozkjj+N/R5fdjSQ5gZG2Q
	o8lqWcBZcWhzLTXR6IHnZ6ag=
Date: Tue, 14 May 2019 14:18:30 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Scott Ellis <scott@jumpnowtek.com>
Message-ID: <20190514111830.GC18877@localhost>
References: <41c04e88-4b89-6f1a-57a1-78bcbfcb562b@jumpnowtek.com>
MIME-Version: 1.0
In-Reply-To: <41c04e88-4b89-6f1a-57a1-78bcbfcb562b@jumpnowtek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openembedded] Wireguard broken with 5.1+ kernels
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
X-List-Received-Date: Tue, 14 May 2019 11:18:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 14, 2019 at 05:26:34AM -0400, Scott Ellis wrote:
> This kernel commit removes nf_nat_core.h which breaks wireguard 20190123.
> 
>     commit d2c5c103b1337f590b7edf1509a6e294bdf22402
>     Author: Florian Westphal <fw@strlen.de>
>     Date:   Tue Feb 19 17:38:27 2019 +0100
> 
>         netfilter: nat: remove nf_nat_l3proto.h and nf_nat_core.h
> 
> 
> Version 20190406 of wireguard fixes this.
> 
> Will a patch to upgrade the wireguard version on the warrior branch be
> accepted?

IMHO backporting the fix would be more appropriate for warrior.

And wireguard should be fixed or upgraded on master before this gets 
fixed in warrior.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



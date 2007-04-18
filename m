Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>)
	id 1HeHnh-0007Hf-TF; Wed, 18 Apr 2007 23:34:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3ILYq2o022571;
	Wed, 18 Apr 2007 22:34:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22335-04; Wed, 18 Apr 2007 22:34:49 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3ILYiU2022524
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 18 Apr 2007 22:34:44 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <E1HeHLs-0002fv-Ua@linuxtogo.org>
References: <E1HeHLs-0002fv-Ua@linuxtogo.org>
Date: Wed, 18 Apr 2007 22:34:45 +0100
Message-Id: <1176932085.5845.38.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev conf/distro/nylon.conf, conf/machine/mtx-3a.conf, classes/nylon-image.bbclass:
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2007 21:34:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-04-18 at 23:06 +0200, MartinDietze commit wrote:
> conf/distro/nylon.conf, conf/machine/mtx-3a.conf, classes/nylon-image.bbclass:
> * formally added (experimental, ARM-based) mtx-3a hardware platform used by nylon
> 
> Author: MartinDietze@openembedded.org
> Branch: org.openembedded.dev
> Revision: d239d8e4c15c87d5220a874aa7d750d83e6eb1bb
> ViewMTN: http://monotone.openembedded.org/revision.psp?id=d239d8e4c15c87d5220a874aa7d750d83e6eb1bb
> Files:
> 1
> conf/machine/mtx-3a.conf
> classes/nylon-image.bbclass
> conf/distro/nylon.conf
> Diffs:
[...]

> ============================================================
> --- conf/machine/mtx-3a.conf    cfca01bd0a530d291f82e6ca36a324710d2ce2b2
> +++ conf/machine/mtx-3a.conf    cfca01bd0a530d291f82e6ca36a324710d2ce2b2
> +TARGET_ARCH = "arm"
> +IPKG_ARCHS = "all arm ${MACHINE}"

This has also changed in OE.dev to PACKAGE_ARCHS (iirc) and the default
is probably sane for you now so it can just be removed...

Richard




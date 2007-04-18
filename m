Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HeHxY-0007V0-6E
	for openembedded-devel@openembedded.org; Wed, 18 Apr 2007 23:45:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3ILj1PM023037;
	Wed, 18 Apr 2007 22:45:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22918-02; Wed, 18 Apr 2007 22:44:58 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3ILitXX023020
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 18 Apr 2007 22:44:55 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <E1HeHMy-0002iw-VJ@linuxtogo.org>
References: <E1HeHMy-0002iw-VJ@linuxtogo.org>
Date: Wed, 18 Apr 2007 22:44:56 +0100
Message-Id: <1176932696.5845.47.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev quilt: added DEPEND on autoconf-native	(>= 2.61)
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
X-List-Received-Date: Wed, 18 Apr 2007 21:45:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-04-18 at 23:07 +0200, MartinDietze commit wrote:
> quilt: added DEPEND on autoconf-native (>= 2.61)
> 
> Author: MartinDietze@openembedded.org
> Branch: org.openembedded.dev
> Revision: 2620a9b57f6ef565cef134f6a34c2a51381ac2e3
> ViewMTN: http://monotone.openembedded.org/revision.psp?id=2620a9b57f6ef565cef134f6a34c2a51381ac2e3
> Files:
> 1
> packages/quilt/quilt_0.45.bb
> Diffs:
> 
> #
> # mt diff -rb62da04643bc273f9af7ef850c8ade01937d5309 -r2620a9b57f6ef565cef134f6a34c2a51381ac2e3
> #
> # 
> # 
> # patch "packages/quilt/quilt_0.45.bb"
> #  from [8f756223ce9e287788362df20a70a06d5c21b2c0]
> #    to [1dffd21abb3d337a34cfe9fbc06d025ae8886e99]
> # 
> ============================================================
> --- packages/quilt/quilt_0.45.bb	8f756223ce9e287788362df20a70a06d5c21b2c0
> +++ packages/quilt/quilt_0.45.bb	1dffd21abb3d337a34cfe9fbc06d025ae8886e99
> @@ -1,3 +1,4 @@
> +DEPENDS = "autoconf-native (>= 2.61)"
>  RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"

Could you explain this a little more? I made some changes a while back
so both bitbake 1.6 and bitbake 1.8 should be able to parse that
versioned DEPENDS syntax but it doesn't actually do anything yet.
"autoconf-native" should already be in the DEPENDS?

What problem were you seeing that required this?

Cheers,

Richard







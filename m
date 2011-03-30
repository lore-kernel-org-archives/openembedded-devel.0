Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Q4wbS-00033g-Ax
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 16:42:34 +0200
Received: (qmail 26000 invoked by uid 2404007); 30 Mar 2011 14:40:35 -0000
X-clamdmail: clamdmail 0.18a
Received: from 87-206-60-144.dynamic.chello.pl (HELO ?192.168.1.112?)
	(marcin@juszkiewicz.com.pl@87.206.60.144)
	by host4.kei.pl with ESMTPA; 30 Mar 2011 14:40:35 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1301494030-10554-4-git-send-email-v2g.udel@gmail.com>
References: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
	<1301494030-10554-4-git-send-email-v2g.udel@gmail.com>
Date: Wed, 30 Mar 2011 16:40:42 +0200
Message-ID: <1301496042.11614.15.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 4/6] Add recipes for building TS75xx userspace utilities
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Mar 2011 14:42:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Dnia 2011-03-30, śro o godzinie 10:07 -0400, UDel V2G Team pisze:

Few notes:

1. use real name surname for commits
2. drop any PR=r0 or DEPENDS="" lines
3. I would prefer patching Makefile then own do_compile/do_install
4. tarballs are not versioned - discuss it with upstream

> +++ b/recipes/ts7500/ts7500_0.0.1.bb

rename to task-ts7500 

> @@ -0,0 +1,7 @@
> +DESCRIPTION = "TS 7500 Utility Scripts"
> +MAINTAINER = "Sachin Kamboj"

E-mail please. And add this to /MAINTAINERS instead.

> +PR = "r0"

"r0" is default - drop

> +# ALLOW_EMPTY = 1

"1" is preferred version

> +DEPENDS = "canctl ts-utils  dioctl  dmxctl  spictl nbd"

DEPENDS will be generated from RDEPENDS - drop

> +RDEPENDS = "canctl ts-utils  dioctl  dmxctl  spictl nbd-client"

> +PROVIDES = "ts7500"

useless - drop





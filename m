Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PgE7z-0002FX-EZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 11:21:59 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ag4FACLtOE1bdWOb/2dsb2JhbACWSI8PvlOFUASKK4QZgg0
X-IronPort-AV: E=Sophos;i="4.60,357,1291590000"; d="scan'208";a="322424245"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 21 Jan 2011 11:21:16 +0100
Received: from [95.61.238.167] (helo=lit.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PgE7I-0003V4-36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 11:21:16 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PgE74-0005R2-Hd
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 11:21:02 +0100
Date: Fri, 21 Jan 2011 11:21:02 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110121102102.GA7400@lit.local.igalia.com>
References: <20110120181233.GA1789@lit.local.igalia.com>
	<AANLkTin6XfEpo_ic0Edp8+58EbzGutuhohM-V4EzzwhJ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTin6XfEpo_ic0Edp8+58EbzGutuhohM-V4EzzwhJ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: problems compiling glibc_2.9-r37.4 under Angstrom
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
X-List-Received-Date: Fri, 21 Jan 2011 10:21:59 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jan 20, 2011 at 01:40:19PM -0800, Khem Raj wrote:
> 2011/1/20 Víctor M. Jáquez L. <vjaquez@igalia.com>:
> >
> > In order to build native-sdk-image recipe, I found my self compiling
> > glibc_2.9-r37.4, because it is the real provider of virtual-libc-dev (the
> > toolchain does not truly provide it -but that is another bug [1]-).
> >
> > But the glibc_2.9-r37.4 configuration fails using the canonical
> > arm-angstrom-linux-gnueabi- toolchain (using the csl external toolchain fails
> > too, but for other reasons):
> >
> > Log data follows:
> > [snip]
> 
> 
> you might try to use eglibc. It may fix this issue for you.
> 

Thanks. I'm giving a try to minimal distribution according to Yuri's
observation [1].

1. http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/028950.html



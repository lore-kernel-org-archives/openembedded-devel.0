Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Ma8xu-0006NT-JQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Aug 2009 16:01:38 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C09221B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2009 13:48:34 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 9 Aug 2009 15:45:01 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A78D247.7090605@gmail.com>
In-Reply-To: <4A78D247.7090605@gmail.com>
MIME-Version: 1.0
Message-Id: <200908091545.01663.holger+oe@freyther.de>
Subject: Re: [PATCH] fix libicu compilation with GCC-4.4 on mips
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
X-List-Received-Date: Sun, 09 Aug 2009 14:01:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 05 August 2009 02:28:55 Graham Gower wrote:
> Not sure if this one is mips specific or not, but linking fails due to
> missing -fPIC on rematch.o.
>
> | /home/grg/oe/tmp/cross/mipsel/lib/gcc/mipsel-angstrom-linux/4.4.1/../../.
> |./../mipsel-angstrom-linux/bin/ld: rematch.o: relocation R_MIPS_HI16
> | against `__gnu_local_gp' can not be used when making a shared object;
> | recompile with -fPIC
>
> Perhaps someone who experienced the (arm specific?) gcc bug mentioned in
> commit 798c780a3a016e56d9b8849cf8a07521b6e402a9 can confirm this fix does
> not trigger the same bug?


i will test an arm build for you.

Signed-Off-By: Holger Hans Peter Freyther <holger@freyther.de>



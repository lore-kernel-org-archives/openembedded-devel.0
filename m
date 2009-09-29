Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <richard@openedhand.com>) id 1MseAV-0000Ut-Qf
	for openembedded-devel@openembedded.org; Tue, 29 Sep 2009 16:59:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n8TEwPfx019497
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Sep 2009 15:58:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18946-10 for <openembedded-devel@openembedded.org>;
	Tue, 29 Sep 2009 15:58:21 +0100 (BST)
Received: from [192.168.3.6] ([192.168.3.6]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n8TEwHG2019491
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Sep 2009 15:58:20 +0100
From: Richard Purdie <richard@openedhand.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <4AC12E48.3010801@techworks.ie>
References: <4AC12E48.3010801@techworks.ie>
Date: Tue, 29 Sep 2009 15:58:15 +0100
Message-Id: <1254236295.1654.10.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: richard@openedhand.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: meta-native?
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
X-List-Received-Date: Tue, 29 Sep 2009 14:59:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-09-28 at 22:44 +0100, Christian Gagneraud wrote:

> I expected then that a "rm -Rf $TMPDIR; MACHINE=whatever bitbake 
> meta-native" would have build only the native recipes but it looks 
> like some cross/target recipes are being build too, for now (the build 
> is still ongoing) it has pulled the following "non-native" 
> dependencies (found in stamps/armv4t-angstrom-linux-gnueabi):
> binutils-cross
> expat
> gcc-cross
> gcc-cross-initial
> gcc-cross-intermediate
> glibc
> glibc-initial
> libtool-cross
> linux-libc-headers
> 
> Is it really a native package that pulls these dependencies, or is it 
> because the cross-toolchain is a kind of default dependency?

I think its your meta-native recipe itself which is pulling in the cross
compiler. Try adding INHIBIT_DEFAULT_DEPS = "1" to it and see if that
helps. As a hint, "bitbake -g meta-native" will tell you what it will
build (and what pulls what in).

Cheers,

Richard
-- 
Richard Purdie
Intel Open Source Technology Centre




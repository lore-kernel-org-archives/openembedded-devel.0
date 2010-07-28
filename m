Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1Oe6rU-00081q-9V
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 15:40:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id A34CD2C807
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 13:34:55 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7-uKWjQ5XUn
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 13:34:51 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 36F172C7E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 13:34:51 +0000 (UTC)
Message-ID: <4C503315.8090009@gmail.com>
Date: Wed, 28 Jul 2010 15:39:33 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1280309434.7083.8.camel@utx.lan>
In-Reply-To: <1280309434.7083.8.camel@utx.lan>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake: staging of binary over symlink breaks sysroot (lzma x xz)
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
X-List-Received-Date: Wed, 28 Jul 2010 13:40:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Stanislav Brabec ha scritto, Il 28/07/2010 11:30:
> I just built an angstrom image and thinks failed.
> 
> lzma image depends on lzma-native, grep and other programs that use .xz
> suffix for tarballs depend on xz-native.
> This fact itself is bad - it creates file conflicts in the sysroot.
> 
> But things were even worse:
> - xz-native staged xz binary and lzma as a symlink to xz.
> - lzma-native tried to stage lzma 4 minutes later
> 
> But staging of lzma apparently went wrong. Instead of removal of lzma
> symlink and installation of lzma binary, bitbake followed the symlink
> and staged lzma as xz with a result of broken build environment.
> 
> I have bitbake-1.8.18.
> 


In the meantime we are waiting for a patch I used
 bitbake xz-native
prior to launch
 bitbake x11-image

/marco



Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JpAty-0001nJ-RE
	for openembedded-devel@openembedded.org; Fri, 25 Apr 2008 01:30:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3ONUhTA028377
	for <openembedded-devel@openembedded.org>;
	Fri, 25 Apr 2008 00:30:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28090-08 for <openembedded-devel@openembedded.org>;
	Fri, 25 Apr 2008 00:30:36 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3ONUYSd028370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 25 Apr 2008 00:30:34 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <f96d234e0804241613j604a4283ofe32c1a8b64ad940@mail.gmail.com>
References: <f96d234e0804241613j604a4283ofe32c1a8b64ad940@mail.gmail.com>
Date: Fri, 25 Apr 2008 00:30:36 +0100
Message-Id: <1209079836.28694.1.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: xfonts, mapfile dir, and pkg-config issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 24 Apr 2008 23:30:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, 2008-04-24 at 19:13 -0400, Cliff Brake wrote: 
> This issue is that "pkg-config --variable=mapdir fontutil" returns:
> 
> /usr/lib/X11/fonts/util
> 
> which is correct if mapdir is used on the target system, but in this
> case mapdir is used on the host system during the build, so it really
> needs the path to staging.
> 
> We can't modify font-util to put the staging path in fontutil.pc or
> insane.class complains about tmdir's in a *.pc file.
> 
> What is the correct solution in this case?
> 
> 1) hardcode EXTRA_OECONF with the MAPFILES_PATH (would require
> patching font packages -- bad)

If you can override from the commandline this may be an option,
particularly if all font packages accept the same option and we can use
a .inc file.

The alternative is to patch the configure.ac files so it uses something
like:

$PKG_CONFIG_SYSROOT_DIR`pkg-config --variable=mapdir fontutil`

which in theory should be accepted upstream too...

> 2) convince insane.class that this tmpdir is really OK in fontutil.pc

From what you said above, this wouldn't help.

Cheers,

Richard






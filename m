Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QwAmV-0003f0-Av
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 12:33:59 +0200
Received: by bkbzu17 with SMTP id zu17so832827bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 03:29:13 -0700 (PDT)
Received: by 10.204.142.90 with SMTP id p26mr2106450bku.110.1314181752812;
	Wed, 24 Aug 2011 03:29:12 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id zw12sm236277bkb.60.2011.08.24.03.29.10
	(version=SSLv3 cipher=OTHER); Wed, 24 Aug 2011 03:29:11 -0700 (PDT)
Message-ID: <4E54D276.2000708@dresearch-fe.de>
Date: Wed, 24 Aug 2011 12:29:10 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E54CC8A.3080507@cit-ec.uni-bielefeld.de>
In-Reply-To: <4E54CC8A.3080507@cit-ec.uni-bielefeld.de>
X-Enigmail-Version: 1.3.1
Subject: Re: [2011.03-maintenance] Unable to build meta-toolchain
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
X-List-Received-Date: Wed, 24 Aug 2011 10:33:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.08.2011 12:03, Stefan Herbrechtsmeier wrote:
> Hi,
> 
> commit 105d881227d06f31c180dffb777ee63361b2f2b8
>  'gcc: Package libstdc++ gdb python helpers into dev package'
> breaks meta-toolchain generation. See also [1]
> 
> This commit adds dev packages (libstdc++-dev libgcc-dev) to
> gcc-cross (gcc-package-cross.inc) which are already part of
> gcc. The libgcc-dev package both include the libgcc_s.so file
> which triggers a 'file is already provided by package' error on
> incremental builds. The libstdc++-dev package have different
> content and triggers a 'Cannot satisfy the following
> dependencies for task-sdk-bare' error. If an empty
> libstdc++-dev package is generated it triggers a
> '..../usr/include/c++ not exist' error as this is part of the
> package from gcc but not gcc-cross.
> 
> For me the gcc-package-cross.inc part of the patch looks wrong
> as the dev packages are already part of the gcc recipe and the
> python helpers should only be removed from libstdc++ package.
> 
> I have the problems with my own machines (armv5te, armv7a)
> as well as with a fresh beagleboard build for angstrom-2008.1.
> 
> Regards,
>     Stefan
> 
> [1] http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg20425.html

Seems to be the same problem mentioned in the last part of [2]. Would be great if this could be fixed quickly.

Regards,
Steffen

[2] http://thread.gmane.org/gmane.comp.handhelds.openembedded/46924/focus=47145

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



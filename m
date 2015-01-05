Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 4335 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Jan 2015 16:10:25 UTC
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 373E9601F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 16:10:25 +0000 (UTC)
Received: from [70.30.87.145] (port=60540 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Y896f-0000vh-BR for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2015 09:58:09 -0500
Date: Mon, 5 Jan 2015 09:58:01 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1501050948080.16705@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: missing trailing spaces in some "_prepend" expressions in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jan 2015 16:10:26 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  after running across a variable "_prepend" assignment that had no
trailing space, i did a quick grep through oe-core and ran across the
following, which would all seem to need that trailing space:

$ grep -rn "DEPENDS_prepend.*[^ ]\"$" *
meta/classes/qt4e.bbclass:2:DEPENDS_prepend = "${QT4EDEPENDS}"
meta/classes/cpan_build.bbclass:27:DEPENDS_prepend = "${@cpan_build_dep_prepend(d)}"
meta/classes/autotools.bbclass:24:DEPENDS_prepend = "${@autotools_dep_prepend(d)}"
meta/classes/qt4x11.bbclass:2:DEPENDS_prepend = "${QT4DEPENDS}"
$

and

$ grep -rn "SRC_URI_prepend.*[^ ]\"$" *
meta/recipes-devtools/qemu/qemu_git.bb:10:SRC_URI_prepend = "git://git.qemu.org/qemu.git"
meta/recipes-devtools/qemu/qemu_2.2.0.bb:10:SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
$

  there may be more, i just left it at that, not sure if there's
something magic about those examples or whether they really should
have the space added, so i'll leave it with someone else to tweak.

rday

p.s. is there any difference between appending or prepending to the
list of build-time dependencies in "DEPENDS"? most extensions to
"DEPENDS" i've seen use "_append", but occasionally, i see "_prepend".
does it matter?

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


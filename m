Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1L6qP0-0002sb-SM
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Nov 2008 18:48:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id EB7F2140533F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2008 18:41:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F7KIJTVnRWb5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2008 18:41:39 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 7564F1405326
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2008 18:41:39 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <8f4584b50811290344w166abf78m294ab5132b72d278@mail.gmail.com>
References: <8f4584b50811290344w166abf78m294ab5132b72d278@mail.gmail.com>
Date: Sun, 30 Nov 2008 18:44:54 +0100
Message-Id: <1228067094.4244.13.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: sanity test problems at end of build
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
X-List-Received-Date: Sun, 30 Nov 2008 17:48:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E4=BB=A3=E5=B0=94=E6=AC=A3 wrote:

> Q:
> 1. What is the purpose of the QA sanity check? And How this check do?

.pc or .la files referring to the build time paths not existing target
system will break native compilation=EF=BB=BF in the best case, and =EF=BB=
=BFcauses run
time failures in worst case.

In general, all references to the build system=EF=BB=BF paths (except deb=
ug info
source code references) are incorrect, and QA check will reject them.

> 2. Just a guess, QA sanity check, Is it for checking the lib or include=
 file
> installed correctly base on the .pc file or the .la(mail in Valentin
> Longchamp)? If it is, I think the error is in the bb files or Makefile =
in
> the package, it can't install the lib correctly.

It is not so easy. Pkgconfig nor libtool are not aware of advanced
techniques of cross compilation. Packager must find potential problems
and create tricks to prevent them.

The most often sources of problems:

- There is no simple way to discriminate between calling of build time
binaries as tools (must be native), calling build time binaries as
source of compilation info (must be native, but must return info for
target platform), actual path to target binary or library and finally
target path to target binary or library.

- Combining of differnt approaches to get information together. For
example use of output of binconfig (*-config) as a source for pkgconfig
file (*.pc) will most probably cause problems - binconfig requires
custom patching, pkg-config has support for sysroot and needs target
paths.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus




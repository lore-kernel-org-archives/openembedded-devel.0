Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Jf2CU-00016S-En
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 01:12:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 6CC361416BC6
	for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 01:10:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bukSFZLum-Q9 for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 01:10:17 +0100 (CET)
Received: from zaurus (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 315751416BC5
	for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 01:10:17 +0100 (CET)
Date: Fri, 28 Mar 2008 01:12:11 +0100
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@openembedded.org
Message-ID: <20080328011211.7c66e00b@zaurus>
X-Mailer: Claws Mail 3.3.0 (GTK+ 2.12.3; arm-angstrom-linux-gnueabi)
Mime-Version: 1.0
Subject: binconfig.bbclass breaks packages QA
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Mar 2008 00:12:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hallo.

I just debugged libgnomecups failing with QA in oe.dev. It seems, that
mangling magic in the binconfig.bblass is now obsolete and should be
removed, as it makes things worse:
Package a installs a-config.
Bitbake mangles it for staging.
Package b creates b.pc and includes mangled values from a-config.
QA of b fails.

After the fix, maybe binconfig files could be moved to the
standard staging directory (it must be in build path then).

Could anybody with deeper insight confirm it or do this change?

Thanks.
-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



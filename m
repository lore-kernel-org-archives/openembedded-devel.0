Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MXzPR-0001aR-4f
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Aug 2009 17:25:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 04F931417197
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2009 17:13:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZRdcIYtrm5G
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2009 17:13:12 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id D967D1416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2009 17:13:12 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1249309178.3246.32.camel@hammer.suse.cz>
References: <DAE7325AE217459DAF9E0769B867ED98@sg01.cassis>
	<h562kl$iuf$1@ger.gmane.org>
	<7C16A480101D49679492E3351AC7450E@sg01.cassis>
	<1249309178.3246.32.camel@hammer.suse.cz>
Date: Mon, 03 Aug 2009 17:09:42 +0200
Message-Id: <1249312182.3246.49.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.2 
Subject: Re: libtool/libltdl problem
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
X-List-Received-Date: Mon, 03 Aug 2009 15:26:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Stanislav Brabec wrote:

> I hope that all these issues are fixed by:

> These fixes should make libtool working again.

Well, yet another problem found:

libtool-cross and -sdk packages used target paths to grep and sed.
Target paths should be used only for libtool package and nothing else.
libtool-cross, libtool-native and libtool-sdk should use values provided
by system check. Fixed by:
daf5409a75e97aa5a60b11e9f150e2532676889e

If you know a better way, how to apply variables just for the target
build and not for -native, -cross and -sdk builds, feel free to improve
the recipe.

I found one possible consequent mis-compilation: imagemagick fixed by PR
bump: de1cf42779c207621d25afc08ad65f655494d573

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus




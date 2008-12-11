Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LAiil-0005xF-6v
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 11:24:39 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LAieo-0006UE-0F
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 10:20:35 +0000
Received: from 203.117.215.163 ([203.117.215.163])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 11 Dec 2008 10:20:33 +0000
Received: from robk by 203.117.215.163 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 11 Dec 2008 10:20:33 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Thu, 11 Dec 2008 18:20:10 +0800
Message-ID: <ghqphb$kt0$1@ger.gmane.org>
References: <ggd81q$re5$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 203.117.215.163
User-Agent: KNode/0.10.9
Sender: news <news@ger.gmane.org>
Subject: Update: Bitbake r1090 (env hiding) makes my build fail.
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
X-List-Received-Date: Thu, 11 Dec 2008 10:24:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Hia,

After several hours of hunting, the problem (for stable branch) comes down
to this: there needs to be an 'export PATH' in one of the config files,
otherwise my host compiler fails in the previously stated manner (calling
it explicitly as /usr/bin/gcc also works). The .dev trunk has the export in
bitbake.conf.

Even with the export, I still get screwy ccache behaviour, but if I just add
a CCACHE = "" then all is well.

Cheers,

    Rob


Rob Kramer wrote:
> Hia,
> 
> I'm tracking the stable branch and recently updated bitbake to HEAD. When
> trying a build-from-scratch, I noticed BB quickly failed in shasum-native.
> Some manual svn disecting pointed to r1090 as the one that caused the
> fail. I tried adding a BB_PRESERVE_ENV, but no difference.
> 
> Output is at http://pastebin.com/m65e66603. There is no log.do_compile
> generated for some reason, and a build with -D shows nothing much. The gcc
> invoke actually works OK and produces the oe_shasum256 executable.
> 
> Any ideas what could be wrong with my setup?
> 
> Cheers!
> 
>     Rob





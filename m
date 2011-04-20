Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QCZYP-00022G-1G
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 17:42:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id D3B881416BC5;
	Wed, 20 Apr 2011 17:40:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ai9g+vpBB+h; Wed, 20 Apr 2011 17:40:59 +0200 (CEST)
Received: from [10.20.5.32] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id 66B971416BA5;
	Wed, 20 Apr 2011 17:40:51 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: Andreas Oberritter <obi@opendreambox.org>
In-Reply-To: <4DAD7077.4020006@opendreambox.org>
References: <1302996184.3122.30.camel@utx.lan>
	<4DAD7077.4020006@opendreambox.org>
Date: Wed, 20 Apr 2011 17:40:27 +0200
Message-ID: <1303314027.17572.256.camel@oct.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Cc: Khem, openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH 0/5] *.bbclass: search configs in D instead of S
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
X-List-Received-Date: Wed, 20 Apr 2011 15:42:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Andreas Oberritter wrote:
> On 04/17/2011 01:23 AM, Stanislav Brabec wrote:
> > Following series of patches changes way how config files are populated.
> > Searching for *-config and .pc config files in S makes more problems
> > than it brings benefits. Searching in the installed root seems to be
> > more logical.
> 
> The subject says 0/5, but only two patches appeared on the mailing list.

Policy does not require to send non-core recipe patches for review:
[PATCH 3/5] tcl, tk: Use standard staging:
* Remove custom staging.
* Remove custom native recipes.
* Adapt tclConfig.sh modification to binconfig.class change.
[PATCH 4/5] ncurses: Increment PR to rebuild with correct -config files after binconfig.class change.
[PATCH 5/5] lynx: New recipe.

If you want to see them, I'll send them all for review.
-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus




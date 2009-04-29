Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lz0nM-0008Oz-Tw
	for openembedded-devel@openembedded.org; Wed, 29 Apr 2009 05:49:17 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090429034402.CMBH27308.fed1rmmtao101.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 28 Apr 2009 23:44:02 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id lFjz1b0074dMFYL03Fk1i7; Tue, 28 Apr 2009 23:44:01 -0400
X-Authority-Analysis: v=1.0 c=1 a=hIENGkm314AA:10 a=TzmGqyqdOwcA:10
	a=alK4_DS-AAAA:8 a=IQzxOcdqz3W_wDuvCfUA:9
	a=6d7cSQhVPPhXrtnt8CO3z8ar85wA:4
	a=djP8yJPOCv2S4OPs:21 a=4l0IfBN8DGYnEtkB:21
X-CM-Score: 0.00
Date: Tue, 28 Apr 2009 20:43:58 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090429034358.GX18788@smtp.west.cox.net>
References: <87r5zckux9.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <87r5zckux9.fsf@neumann.lab.ossystems.com.br>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Pull request from O.S. Systems tree
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
X-List-Received-Date: Wed, 29 Apr 2009 03:49:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2009 at 12:20:18AM -0300, Otavio Salvador wrote:

> [ To easy PatchWork people I preferred to use a pull request and let
>   people to review the branch. Once people ack it, I do the pull on the
>   dev tree. ]
> 
> The following changes since commit 6422fe2b0a110c3a611c0e98cd96b489d4f11880:
>   Andrea Adami (1):
>         linux-kexecboot.inc: force CONFIG_KEXEC=y just in case  - no runtime changes, no PR BUMP
> 
> are available in the git repository at:
> 
>   git://projetos.ossystems.com.br/git/users/otavio/org.openembedded.dev.git master
> 
> Otavio Salvador (11):
>       gtk-engines: add 2.18.1
>       machine/geode[gl]x: use more optimization while compiling
>       acpid: add 1.0.8 (with netlink support)
>       hal-info: add 20080414
>       python-pycups: add
>       checksums.ini: add flash-plugin
>       checksums.ini: add sun-jdk
>       checksums.ini: firefox-l10n-pt-br
>       system-config-printer: add to provide python-cupshelpers to hal-cups-utils
>       hal-cups-utils: add
>       cups: split backends and models

To summarize our IRC chat just now:
- cups should RRECOMMENDS in some stuff that's dynamic now and used to
  be included in another package.
- GPLv2 is in licenses.conf, GPL-2 isn't, change please :)

Otherwise, everything looks fine (and I recall Koen looking at, and I
think agreeing with the geode optimization changes, including the glibc
build change).

-- 
Tom Rini



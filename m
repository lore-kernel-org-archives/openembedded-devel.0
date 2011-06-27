Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QbCOV-0004fg-LM
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 16:02:31 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QbCKz-0008Ln-CY
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 15:58:53 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jun 2011 14:58:50 +0100
Message-ID: <1309183130.21613.317.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Remove SHELL from preserved_envvars_exported?
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
X-List-Received-Date: Mon, 27 Jun 2011 14:02:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

One of my colleagues pointed out to me just now that $SHELL is, somewhat
surprisingly, passed through to bitbake subprocesses from the calling
environment.  Under most circumstances this would be fairly benign since
few things actually care about that variable, but it turns out that:

a) flock(1) has the misfeature of using $SHELL rather than /bin/sh if
the former is set in the environment (in contrast to system(3), which
always uses /bin/sh); and

b) zsh has the misfeature of always reading ~/.zshenv even if it was
invoked as "zsh -c ...".

So the net result of all this is that, if you are using zsh as your
interactive shell, the contents of your .zshenv end up in the
environment for everything that's run under flock and bad results can
potentially ensue.  In our particular case my colleague was setting
$PATH from his .zshenv with predictably unfortunate consequences.

It isn't very obvious to me that having SHELL whitelisted is sensible
for anything except interactive tasks.  Does anybody know of a reason
why it needs to be included everywhere?

p.





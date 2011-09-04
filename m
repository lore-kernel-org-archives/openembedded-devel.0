Received: from mailrelay04.sunrise.ch ([194.158.229.47]
	helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@vollmann.ch>) id 1R0KDc-0008BE-6n
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Sep 2011 23:27:09 +0200
Received: from localhost.localdomain (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	p84LMOdk004136; Sun, 4 Sep 2011 23:22:24 +0200
From: "Detlef Vollmann" <dv@vollmann.ch>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Sep 2011 23:21:31 +0200
Message-Id: <1315171293-11256-1-git-send-email-dv@vollmann.ch>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/2] Re: filename restrictions for packaged staging
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
X-List-Received-Date: Sun, 04 Sep 2011 21:27:09 -0000

From: Detlef Vollmann <dv@vollmann.ch>

On 09/04/11 15:01, Detlef Vollmann wrote:
> Some of my recipes fail with
> ERROR: Function 'staging_packager' failed (see /dev/null for further 
> information)
> 
> Unfortunately /dev/null didn't give much information ;-(
This was fixed by bitbake commit 90fc09ee050a24095a488d8ce98c7945bf282f6d.

> 
> But eventually (with -vvvvv -D -D -D -D) I got a real error message:
> *** Error: Package name contains illegal characters, (other than 
> [a-z0-9.+-])
> 
> While the '' between 'name' and 'contains' isn't of much help
> either (it's a bug in stage-manager-ipkg-build, I'll file a patch
> for that later),
This is a no-brainer.

> it turned out that my machine name contained
> upper case letters, which stage-manager-ipkg-build doesn't like.
The second patch also allows uppercase letters, but I have no idea
what consequences this has...


Detlef Vollmann (2):
  stage-manager: fix typo in error message
  stage-manager: allow for upper case in package names

 bin/stage-manager-opkg-build |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)




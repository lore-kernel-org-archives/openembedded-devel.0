Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OulPM-0007qx-Ni
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 14:11:45 +0200
Received: from [192.168.1.178] (79.54.144.55) by smtp209.alice.it (8.5.124.08)
	(authenticated as editempo)
	id 4C1A27590526DC76 for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 14:10:57 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1283356659-31867-1-git-send-email-i@minami.cz>
References: <1283356659-31867-1-git-send-email-i@minami.cz>
Date: Sun, 12 Sep 2010 14:10:54 +0200
Message-ID: <1284293454.17458.0.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 82.57.200.105
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] grub 0.97: fixing broken 256byte-inodes patch
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
X-List-Received-Date: Sun, 12 Sep 2010 12:11:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-09-01 at 17:57 +0200, Michal Minar wrote:
> * original patch causes termination of grub with floating point exception,
>    when operating upon ext2 partitions
>  * the bug description came from:
>    http://bugs.gentoo.org/show_bug.cgi?id=220687
>  * fixed patch was done by RB <aoz.syn@gmail.com>
> 
> Signed-off-by: Michal Minar <i@minami.cz>
> ---
>  .../grub/grub-0.97/grub-support-256byte-inode.diff |   21 ++++++++++++-------
>  1 files changed, 13 insertions(+), 8 deletions(-)
you also need to bump PR,else it doesn't get rebuild.

Denis.





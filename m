Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1ORAYY-0001W7-NJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 22:58:55 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1ORAU8-0004Lx-31
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 21:54:20 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C20A60D.40102@dresearch.de>
References: <1277201329-1339-1-git-send-email-sledz@dresearch.de>
	<hvq586$1jc$1@dough.gmane.org>  <4C20A60D.40102@dresearch.de>
Date: Tue, 22 Jun 2010 21:54:25 +0100
Message-ID: <1277240065.4745.160.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] udev/mount.sh: try to kill active processes before umount
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
X-List-Received-Date: Tue, 22 Jun 2010 20:58:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-06-22 at 14:01 +0200, Steffen Sledz wrote:
> mount.sh is called with REMOVE action when the device *is
> disconnected* i.e. the filesystem is no longer available.
> So i believe it is not possible to "cleanup all references
> to the filesystem as soon as it is not busy anymore".
> 
> I think killing all the processes is the only way here.

I don't think that's necessarily true.  Any process that is holding a
file open on the removed device will get an I/O error the next time it
tries to access that filesystem.  Obviously, whether or not it handles
that error correctly is open to question, but increasingly many apps do
get it right and it seems a bit sad to kill them all off just in case
one doesn't do the right thing.

In the worst case, an app that chronically ignores I/O errors will just
keep the file descriptor open forever (or until it exits normally).
That doesn't sound like such an awful outcome.

p.





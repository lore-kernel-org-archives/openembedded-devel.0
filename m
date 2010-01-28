Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NacKE-0005j8-OX
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 22:54:58 +0100
Received: from 88-109-44-56.dynamic.dsl.as9105.com ([88.109.44.56]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NacHv-0005KB-FZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 21:52:31 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100128200049.GA4958@gmail.com>
References: <20100128200049.GA4958@gmail.com>
Date: Thu, 28 Jan 2010 21:52:10 +0000
Message-ID: <1264715530.9974.436.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: update hook for git to check push commit message
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
X-List-Received-Date: Thu, 28 Jan 2010 21:54:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-01-28 at 12:00 -0800, Khem Raj wrote:
> Attached is a small hook for updates that are pushed into repo.
> Right now it only checks the first line of the commit and expects
> module: summary

I'm not really in favour of applying the commit message policy quite
that harshly.  The wiki page that you linked to doesn't really seem to
support this kind of check: the actual guidance it gives about checkin
messages is:

* Have a clear commit message (example):
    - The first line of commit is a summary of the changes.
    - The first line should start with the name of the recipe the change affects.
    - The rest of the message should give more details on the change as appropriate.
    - Mention the affected bug numbers if appropriate.
    - Give credit where credit is due. If you commit someone else's work more or 
      less verbatim, you should use git commit --author $mail-of-author. If pulling
      changes from somewhere like Poky or OpenMoko there is no problem with that
      but mention where the changes came from.
    - Include a Signed-off-by: line indicating the change has valid certificate 
      of origin as per the Linux kernel

... which is nowhere near as prescriptive as the rule that you seem to
be implementing in your script.  Also, the wiki page has an explicit
statement that "[these] rules are not hard fast rules", which would
suggest that even such guidance as it does provide is not intended to be
taken too dogmatically. 

Personally I think that the current situation of the TSC applying
pressure to those people who seem to be chronically unable to write
suitable checkin comments is a perfectly fine way of solving the
problem.

On a technical level, I think you could probably do without the sed
subprocess, and "summary = rev.split(1)" doesn't look quite right
either.

p.


p.





Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QJjSp-0002MF-CX
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 11:42:47 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QJjKx-000793-CS
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 11:34:39 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110510093616.GB3673@jama.jama.net>
References: <1305013151-17485-1-git-send-email-Martin.Jansa@gmail.com>
	<1305019695.8000.132.camel@phil-desktop>
	<20110510093616.GB3673@jama.jama.net>
Date: Tue, 10 May 2011 10:40:03 +0100
Message-ID: <1305020403.8000.141.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/2] recipes: fix LICENSE fields
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
X-List-Received-Date: Tue, 10 May 2011 09:42:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 11:36 +0200, Martin Jansa wrote:
> it calls cd tmp/deploy/sources/$license/pixman
> where with $license == '&' (because LICENSE field is splitted by ' ' and
> then '|'), it ends doing cd on background and then complaing about /pixman

Right, so that is a bug.  The argument to cd should be quoted.  (There
is no need for backslashes as your mail implied.)

> Directory named & even when created with right backslash
> is still hard to use, so I think it would be better to have QA check 
> that LICENSE field has sane value, even better when we have list of
> possible values etc.

Yes, agreed, but I think the quoting bug should also be fixed.

p.





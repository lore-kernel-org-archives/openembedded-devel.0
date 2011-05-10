Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QJjHQ-0007Tu-6q
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 11:31:00 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QJj9Y-00078Q-34
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 11:22:52 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305013151-17485-1-git-send-email-Martin.Jansa@gmail.com>
References: <1305013151-17485-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 10 May 2011 10:28:15 +0100
Message-ID: <1305019695.8000.132.camel@phil-desktop>
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
X-List-Received-Date: Tue, 10 May 2011 09:31:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 09:39 +0200, Martin Jansa wrote:
>   | /OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/pixman-0.22.0-r5.0/temp/run.SRC_DISTRIBUTECOMMAND.17340: line 95: /pixman: No such file or directory

If '&' in ${LICENSE} is breaking SRC_DISTRIBUTECOMMAND then that
suggests there is a bug in that code (probably some sort of missing
quotes).  Removing the &s might be a fine thing to do anyway, but it
would also be a good idea to track down and fix the underlying bug.

p.





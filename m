Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PrXPD-0006EN-Kt
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 16:10:31 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PrXO0-0004eF-Qx
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 16:09:16 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D5EE9A9.10205@mentor.com>
References: <4D5E45C1.7010504@opendreambox.org>
	<1298063776-2260-1-git-send-email-filip.zyzniewski@gmail.com>
	<4D5EE9A9.10205@mentor.com>
Date: Mon, 21 Feb 2011 15:12:32 +0000
Message-ID: <1298301152.2178.375.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] package_deb.bbclass: armel architecture name for eabi	systems.
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
X-List-Received-Date: Mon, 21 Feb 2011 15:10:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-02-18 at 14:50 -0700, Tom Rini wrote:
> I'm a little puzzled. So little endian gnueabi ARM is armel, little 
> endian OABI ARM is arm.  What about big endian ARM cases?  Thanks!

Debian has never had big-endian ARM as an officially supported
architecture, so to that extent there's no precedent to follow in this
area.  

The natural name for a big-endian gnueabi port would obviously be
"armeb".  That does leave big-endian OABI somewhat out in the cold but,
given that OABI has been obsolescent for the best part of a decade, this
doesn't seem totally unreasonable.  If anybody did want to use dpkg with
such a thing (and wanted to avoid colliding with armeb) then I guess
they'd have to name it "armob" or something.

p.





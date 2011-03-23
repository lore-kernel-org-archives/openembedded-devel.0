Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q2Mrk-00084n-KW
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 13:08:44 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q2Mpz-00083l-SQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 13:06:56 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300878254.4101.21.camel@mattotaupa>
References: <1300878254.4101.21.camel@mattotaupa>
Date: Wed, 23 Mar 2011 12:07:30 +0000
Message-ID: <1300882050.2228.142.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: libarchive: task compile fails with `error: static declaration of 'wcscpy' follows non-static declaration`
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
X-List-Received-Date: Wed, 23 Mar 2011 12:08:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-23 at 12:04 +0100, Paul Menzel wrote:
> 	libarchive/archive_entry.c:136:18: error: static declaration of 'wcscpy' follows non-static declaration

Seems to be some kind of autoconf lossage.  You'll need to check
log.do_configure to find out why it thinks wcscpy isn't available.

p.





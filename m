Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TTXLw-0008NL-U5
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:25:00 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TTX8o-0002np-9n
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:11:26 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Oct 2012 12:11:25 +0000
In-Reply-To: <50910EFB.7010804@gmail.com>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<50910EFB.7010804@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1351685486.13864.97.camel@phil-desktop>
Mime-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 12:25:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-31 at 12:43 +0100, Martin Erts=C3=A5s wrote:

> for now I guess we can just use pool.ntp.org


I'm not sure that this is a very good idea.  The pool.ntp.org
documentation is fairly explicit that they don't want this:


        You must absolutely not use the default pool.ntp.org zone names
        as the default configuration in your application or appliance.=20


p.



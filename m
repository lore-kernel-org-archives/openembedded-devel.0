Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KDQwD-0007wp-1s
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 23:29:30 +0200
Received: from ip-89-168-195-27.cust.homechoice.net ([89.168.195.27]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KDQtA-0005KN-Dk
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 22:26:22 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <87r6aeabjb.fsf@neumann.lab.ossystems.com.br>
References: <877ic6srbf.fsf@neumann.lab.ossystems.com.br>
	<1214853946.21138.8.camel@lenovo.internal.reciva.com>
	<87zlp2elny.fsf@neumann.lab.ossystems.com.br>
	<1214858808.21138.20.camel@lenovo.internal.reciva.com>
	<87r6aeabjb.fsf@neumann.lab.ossystems.com.br>
Date: Mon, 30 Jun 2008 22:26:13 +0100
Message-Id: <1214861173.21138.24.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: Re: Problem with i18n (input)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 30 Jun 2008 21:29:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-06-30 at 17:54 -0300, Otavio Salvador wrote:
> Any way for me to enable it?

What do you have listed for pt_BR in /usr/share/X11/locale/compose.dir?
It should contain a reference to one of
the /usr/share/X11/locale/XXX/Compose files; check that this is in place
and readable.  Might be worth using "strace xev" to see if X is making
any effort to open the right files.

p.




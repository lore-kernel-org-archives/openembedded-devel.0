Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KQHmx-0006gy-Ik
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Aug 2008 10:21:03 +0200
Received: from 88-110-124-15.dynamic.dsl.as9105.com ([88.110.124.15]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KQHkq-0005Da-PK
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Aug 2008 09:18:53 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 05 Aug 2008 09:19:02 +0100
Message-Id: <1217924342.25732.163.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: openmp in gcc-cross
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
X-List-Received-Date: Tue, 05 Aug 2008 08:21:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

At present gcc-4.2.4.inc sets:

EXTRA_OECONF_BASE = "--enable-libssp --disable-bootstrap --disable-libgomp --disable-libmudflap"

There doesn't seem to be any good reason to disable libgomp, and its
absence is breaking gettext-0.16.1 at least.  Does anybody know why it
was disabled, and/or know a good reason why it shouldn't be re-enabled?

p.





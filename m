Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NcEdp-0005hC-N9
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Feb 2010 10:01:52 +0100
Received: from [85.210.8.8] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NcEbT-0001IR-VZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Feb 2010 08:59:24 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265065479.4255.32.camel@trini-m4400>
References: <1265011036-9086-1-git-send-email-raj.khem@gmail.com>
	<1265028954.3777.317.camel@mill.internal.reciva.com>
	<1265065479.4255.32.camel@trini-m4400>
Date: Tue, 02 Feb 2010 08:59:16 +0000
Message-ID: <1265101156.9974.1089.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.8.8
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH][RFC] gcc: Restructure package creation.
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
X-List-Received-Date: Tue, 02 Feb 2010 09:01:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-02-01 at 17:04 -0600, Tom Rini wrote:
> Well, isn't that exposing problems that exist today, rather than adding
> new ones (ie the problem is that an unexpected (OE-built) libfoo is
> used) ?

The problem is more that, if you use an external toolchain and don't
build gcc-cross at all, you end up getting unresolved dependencies at
rootfs population time because no libgcc package at all has been
generated.

For libstdc++ I suspect it would be even worse because no dependencies
will even be generated if the package doesn't exist: in this case you
won't get a build error of any kind, you'll just find that no binaries
in your rootfs will run because libstdc++.so.6 is missing.

p.





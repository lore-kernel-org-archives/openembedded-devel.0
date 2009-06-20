Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MI7jj-0001M4-EG
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 23:04:31 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MI7ZG-00018K-Vo
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 21:53:43 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <7DD56667-6DAE-4017-B636-C82258C4E15F@mac.com>
References: <7DD56667-6DAE-4017-B636-C82258C4E15F@mac.com>
Date: Sat, 20 Jun 2009 21:53:38 +0100
Message-Id: <1245531218.29153.296.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Writing a test program for libserial
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
X-List-Received-Date: Sat, 20 Jun 2009 21:04:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-06-21 at 00:27 +0400, Elvis Dowson wrote:
> SRC_URI = "file://* "
> 
> S = "${WORKDIR}/${PN}-${PV}"

Try:

SRC_URI = "file://read_port.cpp"
S = "${WORKDIR}"

If you have multiple source files, just list them all in SRC_URI,
separated by spaces.

p.





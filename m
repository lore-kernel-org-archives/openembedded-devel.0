Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QJr8l-0007QE-Mc
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 19:54:35 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QJr0p-0007Ix-HK
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 19:46:23 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110510161532.GB10493@mx.loc>
References: <4DC8F3A2.2090005@nedap.com> <20110510100020.GA10493@mx.loc>
	<1305022004.8000.149.camel@phil-desktop>
	<20110510161532.GB10493@mx.loc>
Date: Tue, 10 May 2011 18:51:47 +0100
Message-ID: <1305049907.3355.99.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: x86_64
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
X-List-Received-Date: Tue, 10 May 2011 17:54:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 18:15 +0200, Bernhard Reutner-Fischer wrote:
> On Tue, May 10, 2011 at 11:06:44AM +0100, Phil Blundell wrote:
> >"x86_64" seems to be what's currently used as the architecture name.  If
> 
> That doesn't work as arch-dependent e.g. append, does it.
> 
> FOO_append_x86_64 = '-mcpu=barcelona'

It seems to work just fine for me.  What goes wrong for you?

$ cat >t.bb <<EOF
TARGET_ARCH = "x86_64"
x = "a"
x_append_x86_64 = "b"
x_append_x87_65 = "c"
EOF
$ bitbake -e -b t.bb |grep ^x
x="ab"
$

p.





Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OXvSn-000187-Lf
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 14:18:03 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OXvO2-0003F1-MA
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 13:11:58 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OXvO2-0001Cu-CI
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 13:11:58 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1278778757-31330-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1278577398.15825.1.camel@lenovo.internal.reciva.com>
	<1278778757-31330-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Sun, 11 Jul 2010 13:11:58 +0100
Message-ID: <1278850318.2345.1909.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: introduce COMPATIBLE_TARGET_SYS
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
X-List-Received-Date: Sun, 11 Jul 2010 12:18:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-07-10 at 18:19 +0200, Frans Meulenbroeks wrote:
> This patch introduces COMPATIBLE_TARGET_SYS
> It is similar to COMPATIBLE_MACHINE but where COMPATIBLE_MACHINE
> is used to specify that a certain recipe is for a certain machine
> COMPATIBLE_TARGET_SYS can be used to specify that a certain recipe
> is for a certain architecture.
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Per our IRC discussion, I am still not totally comfortable with
introducing this extra overhead to all users of base.bbclass.  In the
vast majority of cases (i.e. essentially all packages apart from
toolchain ones), TARGET_SYS == HOST_SYS and hence checking both of them
is just a waste of time.  But I do take your point about wanting to mop
up both cross and regular gcc.

I think I would prefer to see the TARGET_SYS check placed in some common
place which can be included by all toolchain recipes (and, possibly, a
general ongoing effort to reduce the number of non-cross recipes which
refer explicitly to TARGET_xx when HOST_xx would do).  But I don't have
a very strong view on the matter and, if there is a general consensus in
favour of putting this in base.bbclass, I will go along with that.

p.





Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NVjjX-0003ty-I4
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 11:48:54 +0100
Received: from 88-110-78-150.dynamic.dsl.as9105.com ([88.110.78.150]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NVjhR-0004LX-1Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 10:46:41 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <op.u6klcvzcmn1qzu@guohr-laptop-ubuntu>
References: <> <1263455739-13595-1-git-send-email-camelguo@gmail.com>
	<201001141014.53764.marcin@juszkiewicz.com.pl>
	<op.u6imubdtmn1qzu@guohr-laptop-ubuntu>
	<20100114195301.GA3529@gmail.com>
	<op.u6jv0uycmn1qzu@guohr-laptop-ubuntu> <4B4FE54D.3070402@mwester.net>
	<op.u6kherjdmn1qzu@guohr-laptop-ubuntu>
	<1263549399.457.313.camel@lenovo.internal.reciva.com>
	<op.u6klcvzcmn1qzu@guohr-laptop-ubuntu>
Date: Fri, 15 Jan 2010 10:46:36 +0000
Message-ID: <1263552396.457.318.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Support building all project in one directory
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
X-List-Received-Date: Fri, 15 Jan 2010 10:48:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-01-15 at 18:42 +0800, Guo Hongruan wrote:
> OE should provide a mechanism which should not restrict one certain libc  
> type.
> 
> Even though every distro supports only one libc type, you should be better  
> add ${LIBC} into your pathnames if you are trying to build multiple  
> projects (which use different libc) in one directory. To illustrate this  
> problem, let suppose that: you are trying to build DISTR_A which uses  
> glibc and DISTRO_B which uses eglibc for qemumips machine, What would  
> happended when building them in one directory?

You can't do this.  There are many other reasons besides C library
selection why packages (and even -native tools, under some
circumstances) from DISTRO_A might be incompatible with those for
DISTRO_B.  Mixing multiple DISTROs in a single TMPDIR is not, and never
has been, supported.

p.





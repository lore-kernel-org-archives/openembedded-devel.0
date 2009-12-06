Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NHOXG-0002QO-Dc
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 22:20:57 +0100
Received: from [85.210.162.25] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NHOVh-0005L8-DC
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 21:19:17 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <loom.20091204T213241-372@post.gmane.org>
References: <loom.20091204T213241-372@post.gmane.org>
Date: Sun, 06 Dec 2009 21:19:15 +0000
Message-ID: <1260134355.6896.4.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.162.25
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Questions about gcc target packages
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
X-List-Received-Date: Sun, 06 Dec 2009 21:20:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2009-12-04 at 20:49 +0000, Jeremy Williams wrote:
> Looking into the first issue reveals something puzzling to me. If you look at
> gcc-package-target.inc, the do_install operation creates a .so symlink to
> libgcc. Looking at the FILES definition for the gcc package (non -dev), it
> appears that this symlink is being sucked into the package by the entry
> "${gcclibdir}/${TARGET_SYS}/${BINV}/lib*". Am I confused here?

I think you're probably right, and the QA test is just wrong/unhelpful
in this situation.  Having the .so symlink in the gcc package is the
correct thing to do: it would be silly to force everybody to install an
extra gcc-dev package in order to get it.

p.





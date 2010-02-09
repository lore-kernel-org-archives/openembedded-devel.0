Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NelwK-0007qC-W4
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 09:59:28 +0100
Received: from [85.210.8.8] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Neltt-0006ZP-9L
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 08:56:53 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100209085019.GA1663@mx.loc>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265666186.6761.3.camel@lenovo.internal.reciva.com>
	<20100209085019.GA1663@mx.loc>
Date: Tue, 09 Feb 2010 08:56:50 +0000
Message-ID: <1265705811.6761.7.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.8.8
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 05/12] no need to set LD nowadays
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
X-List-Received-Date: Tue, 09 Feb 2010 08:59:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-02-09 at 09:50 +0100, Bernhard Reutner-Fischer wrote:
> It seems that the .dev tree has 1.2.1, 1.2.2, 1.3.1 still in there but
> i, personally would strongly advise against using those (same for the
> standalone tinylogin, but that's a different thing and not relevant
> right now).

As long as those versions are there, I don't think it would be
acceptable to check in a patch to busybox.inc which would delete them.
Leaving the ${LD} setting as a comment doesn't really help with that.

If you wanted to generate a new patch which added the ${LD} setting to
the individual recipes that still require it, and simultaneously delete
it from busybox.inc, then I think that would be fine. 

p.





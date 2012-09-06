Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T9ep1-0005gO-A6
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 18:20:51 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T9ed2-0005YZ-Sw
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 18:08:29 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 06 Sep 2012 17:08:27 +0100
In-Reply-To: <5048C7D5.70301@communistcode.co.uk>
References: <5048B901.3060103@communistcode.co.uk>
	<1346943545.2673.198.camel@phil-desktop>
	<5048BC6D.8080904@communistcode.co.uk>
	<1346944157.2673.199.camel@phil-desktop>
	<5048BE25.2070004@communistcode.co.uk>
	<1346944624.2673.200.camel@phil-desktop>
	<5048BF04.2000904@communistcode.co.uk>
	<5048C7D5.70301@communistcode.co.uk>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1346947708.2673.201.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Issues building tinyXML
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
X-List-Received-Date: Thu, 06 Sep 2012 16:20:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-06 at 16:57 +0100, Jack Mitchell wrote:
> I take this back, It built correctly but it seems the makefile doesn't 
> build the shared library to link against?!
> 
> The Archlinux package has something similar to:
> 
>    ${CXX} -shared -o lib${PN}.so.0.${PV} \
>      -Wl,-soname,lib${PN}.so.0 $(ls *.o | grep -v xmltest)
> 
> Which seems to collect all the objects and link them together into a 
> shared object? Is there anywhere else in OE we do this so I could see 
> how it is formally done?

Yeah, pretty much that.  If you're going to make it into a DSO then you
also need to make sure that all the objects are compiled -fpic.

p.





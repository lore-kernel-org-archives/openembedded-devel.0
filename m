Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SLEaQ-0007eZ-Fe
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 16:13:22 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SLERG-0003bd-Gp
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 16:03:54 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Apr 2012 15:03:53 +0100
In-Reply-To: <4F916294.6090706@mlbassoc.com>
References: <4F916294.6090706@mlbassoc.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1334930634.27021.52.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: COMPATIBLE_MACHINE
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
X-List-Received-Date: Fri, 20 Apr 2012 14:13:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-04-20 at 07:20 -0600, Gary Thomas wrote:
> I'm writing a .bbappend for a recipe which contains a COMPATIBLE_MACHINE
> pattern like this:
>    COMPATIBLE_MACHINE = "(machine1|machine2|machine3)"
> 
> Is there a way my .bbappend file can add to this pattern?  I don't want
> to disturb what's there, just add my machine as well.

COMPATIBLE_MACHINE .= "|machine4"

p.





Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1S2NJo-0000Gs-Q6
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 14:42:16 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1S2NBf-0003HS-JK
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 14:33:51 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 13:33:50 +0000
In-Reply-To: <4F4CC45C.8010501@dresearch-fe.de>
References: <4F4C9DB8.5050203@dresearch-fe.de> <1567078.cdBARgH5ks@helios>
	<4F4CC45C.8010501@dresearch-fe.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1330436031.14363.384.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Use python in variable assigment of a recipe
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
X-List-Received-Date: Tue, 28 Feb 2012 13:42:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-28 at 13:11 +0100, Steffen Sledz wrote:
> Because i'm working with oe-classic i tried this (found in some other examples):
> 
>   MYVAR = "${@my_func()}"
> 
>   def my_func():
>       bbpath = os.path.dirname(bb.data.getVar('FILE',d,1))
>       ...
> 
> But this leads to an error:
> 
>   NameError: global name 'd' is not defined
> 
> :(

MYVAR = "${@my_func(d)}"

def my_func(d):
   ...

p.






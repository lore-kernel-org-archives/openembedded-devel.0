Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M8dA1-0004nY-2D
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 18:36:25 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M8d2E-00054u-Ui
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 17:28:23 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d1b08f940905250229o2482fda0l7ec6e57804542665@mail.gmail.com>
References: <d1b08f940905250229o2482fda0l7ec6e57804542665@mail.gmail.com>
Date: Mon, 25 May 2009 17:28:20 +0100
Message-Id: <1243268900.4869.47.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [RFC][Zaurus] (Re)move obsolete kernels
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
X-List-Received-Date: Mon, 25 May 2009 16:36:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-25 at 11:29 +0200, Andrea Adami wrote:
> I was testing a build for some Zaurus models (akita,spitz) and
> re-discovered an old issue (oebug 4784):
> 
> NOTE: Resolving any missing task queue dependencies
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
> 'virtual/arm-angstrom-linux-gnueabi-gcc-2.95' but it wasn't found in any
> PACKAGE or RPROVIDES variables
> NOTE: Runtime target 'virtual/arm-angstrom-linux-gnueabi-gcc-2.95' is
> unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['virtual/arm-angstrom-linux-gnueabi-gcc-2.95']
> 
> The c7x0 model is already 'fixed' - no error
> We know the error is not fatal but still...so, my proposal is to move
> the old stuff to 'obsolete' or to patch the recipes as done for c7x0
> (see a.m. bug).
> This would lead to unbuildability of  'sharprom-compatible'
> distro...which noone seems to be using now in 2009.

I'm not quite sure what the issue is here.  Are you saying that you see
this diagnostic about gcc-2.95 even when the kernel that needs it isn't
selected for building?  If so, that seems like it would be a bitbake bug
and should be fixed as such.  (The fact that it's showing an empty list
for the dependent packages does indicate that something is a bit wrong
in bitbake, anyway.)

p.





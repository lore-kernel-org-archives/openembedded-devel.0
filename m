Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1KRNvX-0001Pq-Te
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Aug 2008 11:06:27 +0200
Received: from aquilonia.hyboria ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Fri, 08 Aug 2008 10:06:14 +0100
	id 000304F5.489C0C86.0000263A
Date: Fri, 8 Aug 2008 10:06:11 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080808100611.3acb6c21@aquilonia.hyboria>
In-Reply-To: <489BFEB3.4060103@gmx.net>
References: <48239d390808040638r7a5e6351x4c8346497451adae@mail.gmail.com>
	<48980E9D.8000709@gmx.net>
	<20080805124514.GA5131@doriath.ww600.siemens.net>
	<489BFEB3.4060103@gmx.net>
X-Mailer: Claws Mail 3.5.0 (GTK+ 2.12.10; i486-pc-linux-gnu)
Mime-Version: 1.0
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, theBohemian@gmx.net
Subject: Re: ppc64 host
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
X-List-Received-Date: Fri, 08 Aug 2008 09:06:28 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 08 Aug 2008 10:07:15 +0200
Robert Schuster <theBohemian@gmx.net> wrote:

> Hi Dmitry,
> 
> Dmitry Baryshkov schrieb:
> > I'm building the OE images on the ppc64 host (Apple xServe G5):
> > Debian lenny (current), 64-bit kernel, 32-bit userspace.
> 64 bit kernel + 32 bit userspace is calling for trouble. At one place
> the autotools stuff will think it needs 64 bit pointers but the
> compiler supports only 32 bit pointers.
> 
> I was once experiencing this problem on an x86_64 box with 64 bit
> kernel and 32 bit userland.
> 
You can use the linux32 command to hide the 64 bitness from OE.

Graeme



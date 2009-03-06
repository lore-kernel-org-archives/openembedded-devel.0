Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1LfbjT-0002Ct-CE
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 16:13:03 +0100
Received: from 88-109-164-210.dynamic.dsl.as9105.com ([88.109.164.210]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Lfbf7-0004MB-5M
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 15:08:33 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b10903060142k13d1908btcd39319477b37530@mail.gmail.com>
References: <ac9c93b10903050921y59233df1o731fb4983e22e12f@mail.gmail.com>
	<gop5fu$ec$1@ger.gmane.org>
	<ac9c93b10903051310g48c05d5eiaa6371f67383f7f1@mail.gmail.com>
	<1236330230.4607.54.camel@lenovo.internal.reciva.com>
	<ac9c93b10903060142k13d1908btcd39319477b37530@mail.gmail.com>
Date: Fri, 06 Mar 2009 15:08:32 +0000
Message-Id: <1236352112.4607.57.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: need help: cdrkit & bitifields
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
X-List-Received-Date: Fri, 06 Mar 2009 15:13:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-03-06 at 10:42 +0100, Frans Meulenbroeks wrote:
> However the problem occurs in code that I have not written and that is
> not easy to modify.
> I don't have the code handy but it could be that the code in cdrkit
> works just the other way:

What I meant really was that the outcome of your test program might have
been influenced by alignment issues, and this might have been obscuring
the real situation with cdrtools.

> E.g. something like:
> bitfields bf;
> char *p = &bf;
> *p = 0xf0;

Right, this is safe.  Casting from a more restrictive type to "char*" is
always OK since there are no types with less restrictive alignment
requirements than char.

> I'll test that variant as well.
> The stupid thing is that cdrkit words under opensuse/x68 but not under
> oe/arm (LE).
> So either this is a compiler issue or a nonportable construct.

Yes, it seems.  My guess would be that it's a non-portable construct
somewhere rather than a compiler bug, but either is possible.

If it does turn out to be a struct alignment thing then you might be
able to work around it with judicious use of "__attribute__
((__packed__))".

It might also be worth checking out the ARM binary from Debian to see if
that behaves the same.

p.





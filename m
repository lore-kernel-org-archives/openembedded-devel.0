Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M6h9M-000305-Iw
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 10:27:46 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M6h27-000J5p-9r
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 12:20:15 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 12:18:42 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <8f4584b50905192359w46f238b0x85fcd709d5e30c5b@mail.gmail.com>
In-Reply-To: <8f4584b50905192359w46f238b0x85fcd709d5e30c5b@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200905201218.44786.khimov@altell.ru>
Subject: Re: How to use the native package?
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
X-List-Received-Date: Wed, 20 May 2009 08:27:49 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 20 May 2009 10:59:29 =E4=BB=A3=E5=B0=94=E6=AC=A3 wrote:
> I can hack to use native mytools.bin. I want to know the normal way in OE
> treat this case.

It's a package bug in first place. There is quite a number of packages in O=
E=20
that build some temporary (not included in installation) tools in process a=
nd=20
use them for some purposes. But if the package is done properly, that tools=
=20
are never compiled by cross-compiler. So, IMHO, this should be fixed in=20
package. And how to do that depends on package build system, of course. If=
=20
that's some custom make, then BUILD_CC should be your friend, I guess.



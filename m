Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1REHe0-0007V9-PA
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 11:32:04 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1REHYV-0002Il-5U
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 11:26:23 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2011 10:26:22 +0100
In-Reply-To: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
References: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1318497983.14199.54.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Creating Rootfs images without packages
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
X-List-Received-Date: Thu, 13 Oct 2011 09:32:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-12 at 15:22 +0300, mgundes wrote:
>    I think one of the big issue with OE is build time. It does everything
> for you, so that it takes too much times. I want to minimize build time and
> realized that OE creates ipkgs for almost every package. If there is a way
> to prevent creation of ipkgs it would be really good for me. In my opinion,
> it would be fine for other people too since usually rootfs directory is
> enough and ipkgs are not frequently used directly by developers.

If you want to eliminate ipk specifically then there is no problem: you
can select package_rpm or package_tar or package_deb instead.

If you want to eliminate the whole packaging step then this is rather
more tricky and it's not really obvious that this would buy much.  Do
you have a proposal for how rootfs construction could be done in that
case?

p.





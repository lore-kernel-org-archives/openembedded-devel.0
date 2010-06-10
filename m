Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OMp50-0001Sa-Ky
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 23:14:32 +0200
Received: from jost.swaffham-prior.co.uk ([217.154.114.20]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OMp0Z-0007gV-N9
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 22:09:51 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100610204459.GV14941@mx.loc>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
	<1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTin367SqiCodgs_CxGiwAihL-SI0nlCJKUWqUZjq@mail.gmail.com>
	<1276201371.13179.20.camel@lenovo.internal.reciva.com>
	<20100610204459.GV14941@mx.loc>
Date: Thu, 10 Jun 2010 22:09:58 +0100
Message-ID: <1276204198.13179.35.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] busybox: configure according to {MACHINE, DISTRO}_FEATURES
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
X-List-Received-Date: Thu, 10 Jun 2010 21:14:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-06-10 at 22:44 +0200, Bernhard Reutner-Fischer wrote:
> the kernel configury should also look whether it should enable
> socket/ipv4/ipv6 or any combination.
> There are quite some packages out there who can be configured with
> --disable-ipv6 =C2=B9) and these should probably also honor the distro's =
ipv6
> choice, for example.

Yes, agreed.=20

> I think it would also be good to put USE_NLS into DISTRO_FEATURES as
> "nls" like it was done for busybox and uclibc, yes?

Sounds OK to me, yeah.

p.





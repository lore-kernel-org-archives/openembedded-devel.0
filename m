Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pu7FF-0006DS-9W
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 18:50:53 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1Pu7Du-0006SN-B5; Mon, 28 Feb 2011 18:49:30 +0100
From: Phil Blundell <philb@gnu.org>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <AANLkTi=fohQFaxQnTP-VxoNh+P8np9uXCsvChtdT2ORT@mail.gmail.com>
References: <1298899606-9139-1-git-send-email-otavio@ossystems.com.br>
	<1298899606-9139-2-git-send-email-otavio@ossystems.com.br>
	<1298912239.23547.10.camel@phil-desktop>
	<AANLkTi=fohQFaxQnTP-VxoNh+P8np9uXCsvChtdT2ORT@mail.gmail.com>
Date: Mon, 28 Feb 2011 17:54:44 +0000
Message-ID: <1298915684.23547.28.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] conf/bitbake.conf: add DISTRO_ARCH and MACHINE_DISTRO_ARCH
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
X-List-Received-Date: Mon, 28 Feb 2011 17:50:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-02-28 at 17:04 +0000, Otavio Salvador wrote:
> We have a set of products that reuse a common distro definition but
> has different needs on a small set of packages. To avoid having them
> all rebuild we set those to DISTRO_ARCH and the ones that depends on
> machine and distro to MACHINE_DISTRO_ARCH avoiding a lot of rebuilding
> and CPU time.

That sounds to me like you're using ${DISTRO} for a purpose that was not
really intended.  I do have some sympathy for the scenario you mention
but I'm not convinced that adding these new ARCHS for everyone is the
right answer. 

Obviously you're welcome to bash PACKAGE_ARCHS any way you want in your
own DISTRO.conf file and I think that's probably the right place for
this sort of thing rather than putting it in the global bitbake.conf and
causing extra complexity for everyone.  Or maybe you could consider
using ${MACHINE}, which is already a PACKAGE_ARCH, to discriminate
between the different packages.

p.





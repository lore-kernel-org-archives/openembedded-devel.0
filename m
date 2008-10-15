Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jluebbe@lasnet.de>) id 1Kq6iZ-00047P-BD
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 15:47:15 +0200
Received: from a061.apm.etc.tu-bs.de ([134.169.172.61])
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Kq6dV-00083i-6g by authid <jluebbe@lasnet.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2008 15:42:07 +0200
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jluebbe@lasnet.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1224062879.5189.49.camel@ted>
References: <1223989999.29816.56.camel@polaris>
	<1223990240.29816.58.camel@polaris>  <1224062879.5189.49.camel@ted>
Date: Wed, 15 Oct 2008 15:42:00 +0200
Message-Id: <1224078120.3653.40.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: please check BK&MTN to GIT conversion dry-run repository
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
X-List-Received-Date: Wed, 15 Oct 2008 13:47:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2008-10-15 at 10:27 +0100, Richard Purdie wrote:
> The original plan was to add the BKCVS later as a git tree graft rather
> than hardcoding it into the history now in a broken form. Is it too late
> to do this now?

It is not possible to change history in git without changing the commit
hashes. (so a "graft" is impossible without rebasing)

> The BKCVS conversion still has the problems I wanted to get resolved
> before we did this for example:
>=20
> http://git.sicherheitsschwankung.de/?p=3Djan/oetest.git;a=3Dcommit;h=3D66=
944efa040bdf36062522c7c33413fc1e039d83
>=20
> Where two commits have been rolled into one.

I tried to figure out how to solve this, but ran out of time. Adding the
(somewhat mangled) bk history now doesn't have any disadvantages and
still allows to find ot where the files come from. If someone figures
out how to do a better conversion, we can still rebase, it that is
desired.

--=20
Jan L=C3=BCbbe <jluebbe@lasnet.de>            http://sicherheitsschwankung.=
de
 gpg-key      1024D/D8480F2E 2002-03-20
 fingerprint  1B25 F91F 9E7B 5D4F 1282  02D6 8A83 8BE4 D848 0F2E




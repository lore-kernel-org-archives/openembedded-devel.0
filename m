Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jluebbe@lasnet.de>) id 1K8Xr7-0001dd-9m
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jun 2008 11:52:01 +0200
Received: from a061.apm.etc.tu-bs.de ([134.169.172.61])
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1K8XqI-0006WY-Do by authid <jluebbe@lasnet.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2008 11:51:13 +0200
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jluebbe@lasnet.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080616130932.GA22229@sirena.org.uk>
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<74d0deb30806130306tf5ca604t7238ab26d715e03@mail.gmail.com>
	<g2tv3m$t5l$1@ger.gmane.org>
	<74d0deb30806130925u7ec0c1e4sfdf2144e703f2b9a@mail.gmail.com>
	<g2ubb9$a55$1@ger.gmane.org>
	<87od65rxi8.fsf@neumann.lab.ossystems.com.br>
	<20080616130932.GA22229@sirena.org.uk>
Date: Tue, 17 Jun 2008 11:51:13 +0200
Message-Id: <1213696273.28438.50.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 17 Jun 2008 09:52:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2008-06-16 at 14:09 +0100, Mark Brown wrote:
> On Fri, Jun 13, 2008 at 03:38:23PM -0300, Otavio Salvador wrote:
>=20
> > I don't know how kernel people do to amend the patch to add the
> > acked-by/whatever data into each patch. It can be a big amount of work
> > to do an iteractive rebase for every ack given on ml for each patch
> > and with a high risk of human mistake while doing it.
>=20
> For the most part everything except the Signed-off-by is added by the
> patch submitter as they submit and resubmit the patch - often that
> information will just get dropped on the floor otherwise.

Instead of having the "acked-by" in the changeset, we could have it
implicit in the history:

* Everyone with commit access has their own branch
  - org.openembedded.dev.<username>
* Someone else reviewes/compiletestes the changes and then merges the=20
  branch into .dev
  - The name of the reviewer then appears in the merge

Trivial changes might go into .dev directly...

--=20
Jan L=C3=BCbbe <jluebbe@lasnet.de>            http://sicherheitsschwankung.=
de
 gpg-key      1024D/D8480F2E 2002-03-20
 fingerprint  1B25 F91F 9E7B 5D4F 1282  02D6 8A83 8BE4 D848 0F2E




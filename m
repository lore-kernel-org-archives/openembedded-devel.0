Received: from mout.web.de ([212.227.15.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <j.schauer@email.de>) id 1U7NgA-0002wb-De
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 11:10:36 +0100
Received: from localhost ([212.201.44.247]) by smtp.web.de (mrweb003) with
	ESMTPSA (Nemesis) id 0Lfipe-1UejuT0iT4-00oc0F for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 10:41:47 +0100
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130218094145.29630.63354@hoothoot>
From: Johannes Schauer <j.schauer@email.de>
User-Agent: alot/0.3.3+
Date: Mon, 18 Feb 2013 10:41:45 +0100
X-Provags-ID: V02:K0:Gh1ovPMMCvGI4Uo1yQXASPACbfKLrK5q8JWshPPpfv3
	xvJVy1On0e6NhbfgqUoZ2O1uzgQC0R2ck8kfRg/VBoDj5DihSk
	gF9yc2pRirWGaKteavN8B7+dU09u+s+7zBgWLojdhakoI3X+2T
	8fvfniilnwIiAmhJ7G+owB5fWfPJSnxV1PevfEMwYdf5PFyLpe
	2HcccpRWMB1YEGrDEfP1w==
Subject: build dependency cycles in openembedded
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
X-List-Received-Date: Mon, 18 Feb 2013 10:10:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear list,

I am analyzing build dependency graphs for rpm and deb based binary
distributions. I gave a talk about my work on this years FOSDEM [1]. To imp=
rove
my work I was looking into Gentoo and Openembedded.

While build dependency cycles in Gentoo are easily taken care of by manually
compiling some source packages with different USE flags, how is this topic
handled in OpenEmbedded?

Searching the wiki, mailinglist and internet I was not able to find good
sources which explain how serious the problem of build dependency cycles in
OpenEmbedded is when bootstrapping a new target from nothing. I also did not
find how build dependency cycles are dealt with, should they occur.

Could you direct me to some resources which document the status and handlin=
g of
build dependency cycles in OpenEmbedded?

Thanks!

cheers, josch

[1] https://fosdem.org/2013/schedule/event/debian_bootstrap/



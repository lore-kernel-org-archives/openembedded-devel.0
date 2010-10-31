Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PCf4h-0004KU-7H
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 22:04:24 +0100
Received: by vws17 with SMTP id 17so2867116vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Oct 2010 14:03:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.204.72 with SMTP id fl8mr7077449qab.173.1288559014774;
	Sun, 31 Oct 2010 14:03:34 -0700 (PDT)
Sender: jay@jay-tech.ru
Received: by 10.220.96.67 with HTTP; Sun, 31 Oct 2010 14:03:34 -0700 (PDT)
X-Originating-IP: [93.81.139.215]
In-Reply-To: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
Date: Mon, 1 Nov 2010 00:03:34 +0300
X-Google-Sender-Auth: CWOaN4UAhSR4o9XFTzL83QgljBU
Message-ID: <AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Sun, 31 Oct 2010 21:04:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/29 Cliff Brake <cliff.brake@gmail.com>:
> testing-next is ready for clean builds. =A0I'm still working on my
> process to get this branch created automatically--thanks for your
> patience.

I have joined to testing initiative with:

DISTROS=3D"angstrom-2008.1 minimal"
MACHINES=3D"tosa collie akita efikamx ben-nanonote qemux86 qemuarm"
IMAGES=3D"x11-image opie-image"

Test-builder will build every image for every machine for every distro
from list.
Every build will be started with clean $TMPDIR for now at least (may
be changed - depends on time required for full build).

OE-stats will be published with 'Jay7-tb' builder name.
Test-builder is running inside LXC-container with Debian Lenny x64.

Feel free to request to add other machines and images.

--=20
Yuri Bushmelev



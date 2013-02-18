Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1U7IO6-0006v4-Ks
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 05:31:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1I1f22T015781
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 17 Feb 2013 17:41:02 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.63]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0318.004;
	Sun, 17 Feb 2013 17:41:02 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [oe] [PATCH] arptables: defeat multi-job for install
Thread-Index: AQHOCvva6iB/zuxFakyCRkH9M8djWph9eUKAgAFedXE=
Date: Mon, 18 Feb 2013 01:41:02 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF8436F4C82F@ALA-MBB.corp.ad.wrs.com>
References: <1360878004-11267-1-git-send-email-jslater@windriver.com>,
	<1911913.2th2JZ7kj7@helios>
In-Reply-To: <1911913.2th2JZ7kj7@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.117.52]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] arptables: defeat multi-job for install
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
X-List-Received-Date: Mon, 18 Feb 2013 04:31:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

I apologize for the patch path.  I applied it to a repository for meta-netw=
orking,
not meta-openembedded.  I should have guessed that the subject qualifier sh=
ould
be more specific than [oe].

As to PARALLEL_MAKEINST, I did note that usually it is "", but I think that
"-j1" makes it very clear what the form of this variable is and doesn't cos=
t all that
much, so that's what I went for.

Joe

________________________________________
From: Paul Eggleton [paul.eggleton@linux.intel.com]
Sent: Saturday, February 16, 2013 12:31 PM
To: Slater, Joseph
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] arptables: defeat multi-job for install

Hi Joe,

On Thursday 14 February 2013 13:40:04 Joe Slater wrote:
> CQID: 399299
>
> The make install target is not parallel job
> safe, but doesn't do all that much, so we
> limit make to one job for that.
>
> The make target is of the form
>
> install: x y z
>
> Unfortunately, z depends on y, so if z is started
> before y (almost) completes, we will fail.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  recipes-support/arptables/arptables_0.0.3-4.bb |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/recipes-support/arptables/arptables_0.0.3-4.bb
> b/recipes-support/arptables/arptables_0.0.3-4.bb index 2faccec..de3f62d
> 100644
> --- a/recipes-support/arptables/arptables_0.0.3-4.bb
> +++ b/recipes-support/arptables/arptables_0.0.3-4.bb
> @@ -3,6 +3,8 @@ PRIORITY =3D "optional"
>  LICENSE =3D "GPL-2.0"
>  SECTION =3D "console/network"
>
> +PR =3D "r2"
> +
>  RDEPENDS_${PN} +=3D "perl"
>
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=3D801f80980d17=
1dd6
> 425610833a22dbe6" @@ -20,6 +22,11 @@ do_compile () {
>       oe_runmake
>  }
>
> +# the install target is not multi-job safe, but it doesn't do much
> +# so we just install seriatim
> +#

I hope I don't expose my ignorance too much by saying I just learned a new
word thanks to the above comment... ;)

> +PARALLEL_MAKEINST =3D "-j1"

Of course this will work but typically we would just set PARALLEL_MAKEINST =
=3D
"" to accomplish this.

More importantly, this appears to be a patch for the meta-networking layer =
and
should therefore have [meta-networking] in the subject and use the meta-
networking/ path.

Cheers,
Paul=



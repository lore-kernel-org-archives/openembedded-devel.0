Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1STE2f-0002Ts-Er for openembedded-devel@lists.openembedded.org;
	Sat, 12 May 2012 17:15:33 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1STDt2-00051h-LA for openembedded-devel@lists.openembedded.org;
	Sat, 12 May 2012 17:05:36 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2012 17:05:36 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2012 17:05:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 12 May 2012 17:05:21 +0200
Message-ID: <jolu7i$t0k$1@dough.gmane.org>
References: <1336650961-11681-1-git-send-email-rd@radekdostal.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <1336650961-11681-1-git-send-email-rd@radekdostal.com>
X-Enigmail-Version: 1.4
Subject: Re: [meta-oe][PATCH] libopus: adding libopus_0.9.10
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
X-List-Received-Date: Sat, 12 May 2012 15:15:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 10-05-12 13:56, Radek Dostal schreef:

Re: [oe] [meta-oe][PATCH] libopus: adding libopus_0.9.10

Nitpick: it's 'add', not 'adding', so:

Subject: libopus: add 0.9.10

> Signed-off-by: Radek Dostal <rd@radekdostal.com> --- 
> .../recipes-multimedia/libopus/libopus_0.9.10.bb   |   22
> ++++++++++++++++++++ 1 files changed, 22 insertions(+), 0 deletions(-) 
> create mode 100644 meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb
> 
> diff --git a/meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb
> b/meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb new file mode
> 100644 index 0000000..27d8a75 --- /dev/null +++
> b/meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb @@ -0,0 +1,22 @@ 
> +SUMMARY = "Celt Audio Codec"

No mention of opus?

> +DEPENDS = ""

drop that

> + +PR = "r0"

And drop that

> + +SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz" 
> +

No newline here

> +SRC_URI[md5sum] = "afbda2fd20dc08e6075db0f60297a137" +SRC_URI[sha256sum]
> = "4e379a98ba95bbbfe9087ef10fdd05c8ac9060b6d695f587ea82a7b43a0df4fe"

But add a newline here

> +S = "${WORKDIR}/opus-${PV}" + +inherit autotools pkgconfig + 
> +EXTRA_OECONF = "--enable-fixed-point"

That should probably check TARGET_FPU (or TUNEFEATURES, I forget)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPrnwvAAoJEHZqAkdh1vT6UXEQAIfN+nscFo1DWz8eQrxV8BYX
ulqhSBMwvnHOoWxoZXTgV4wVMRdCGASqC+rUmswlLITrlVNy0B4TOGyR2faKJsQz
GpQUcthXV1TQQKpiF9C8yUcJxuZNE3fhmAHH5b63zKgKaRVeankbpdJotCTt+i+n
18FYHkjTcLYG7jpjxXmHXouidIGeEfLBiAJkfxk1jNFfmale4El1INCW+/v68Ywa
Ilk6ciM9rPLZM8udUcUCEA+5Q7GHttOSWiOCpU/j+82wj7GS+L/OQ0TWtU70S5kI
GwMMsEoy2QmDKNDb+YdkzewjjAxwp1eJscncyIfW/fBQ41BgNNDQsksvOq75AsWv
JAGt0stEJVAI9sLqTxOQ0CpNO1vsvyMJfl3Zf3OxAX+bft/i+ii8b9/2MZUDCCRp
OBziy91Bq96JZ3JeoD0vGWRqDHrEdFH28A7II27A2lmWjQn9BVpwhJ3vO+LrmloM
CFHO4VotDqou8E58AZP3jqo0k7zoR+yXw0X8GYm04KH7bTbv3iRcun9xqnl4DWFX
ppMb1fJwrejG+NVMKmTDGU2ydlyP4Hx2dxZ46IrtyliGLMaKusBKIuMvpIzSjYlI
HjlIJnj6J8/m8PAd32UUAoR1yDpAxCgeWNMZr2ISlldImTdrlbZzQKq75NZNgxhy
sfrMOySRtP915fUbYI7H
=83KG
-----END PGP SIGNATURE-----




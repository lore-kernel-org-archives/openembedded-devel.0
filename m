Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SMPGH-0003c7-7U for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 21:49:25 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SMP71-0007Im-4O for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 21:39:51 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2012 21:39:51 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2012 21:39:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 23 Apr 2012 21:39:36 +0200
Message-ID: <jn4b5o$gfi$1@dough.gmane.org>
References: <1335191135-6762-1-git-send-email-koen@dominion.thruhere.net>
	<2199708.NNXS638hI1@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <2199708.NNXS638hI1@helios>
X-Enigmail-Version: 1.4
Subject: Re: [meta-kde][PATCH] qt4-x11-free 4.8.0 bbappend: fix GLES configure switch and turn it on for AM335x SoCs as well
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
X-List-Received-Date: Mon, 23 Apr 2012 19:49:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 23-04-12 17:46, Paul Eggleton schreef:
> On Monday 23 April 2012 16:25:35 Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> --- 
>> recipes-misc-support/qt4-x11-free_4.8.0.bbappend |    5 +++-- 1 files
>> changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend 
>> b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend index
>> b5a3c16..4895893 100644 ---
>> a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend +++
>> b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend @@ -1,7 +1,8 @@ 
>> -QT_GLFLAGS_omap3 = "-egl" +QT_GLFLAGS_omap3 = "-opengl es2 " 
>> DEPENDS_append_omap3 = " libgles-omap3" +DEPENDS_append_ti33x = "
>> libgles-omap3"
>> 
>> # Needed by kdelibs QT_DISTRO_FLAGS = "-accessibility -sm"
>> 
>> -PRINC := "${@int(PRINC) + 1}" \ No newline at end of file +PRINC :=
>> "${@int(PRINC) + 2}"
> 
> Can we avoid this machine-specific stuff creeping into software layers?
> At least in this case we're appending something in OE-Core so there
> should be no problem with this appearing in an append in the BSP(s).

Have a look at what was discussed in the "[meta-kde] Test images (was: Re:
[OE-core] RFC: Porting KDE Plasma Active (WIP))" thread

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPla/zAAoJEHZqAkdh1vT63cAP/0uMXlmsoAgrlN3LpHrB0Qw5
wRfJoku9dqYY8rx3rNUZewwVL3VQsUyZWItCfCT2HfHhaFdd6XDMMaka8Vq7BF8R
eH5reueGTbRlDXTFQ7c3BeCmI4af4ThvPDTPogNJXzHPg/7pMb94Z4TmBrZwgz9t
Clz/UntDusu6L+k347yZ9Dulsnisw/65Pt4U3CHbRceEwR5dHBpO64XDyCJpKKUe
ubdyxWcJtlKRGIr+LqP/G/SWZGgtHKJVzDKby3gxPsdvnML6Gh2o3eXIwfDKnGpv
7Yq1n7Zh1xAXJvwGLifd6w7NdOFRbqyUtYXnebWm4jAqZa9kTMmT/GQPdYM5Ykfb
Twlxlczkzrj1acKHNyiI61wgd8yoB7B/h2gtyyYacPFPntSOnePGvU+N/Zfxi39Z
61zRQlw+0Gtg4DLQVp0egea2G7RhopfK6JaDyioW/wawHPXEQAOSVQhhznCxoEt4
fASr62lSM/o1IKPRdjt810Oji93PTdwe0Fe7IWtpx/tGku9wsedxqKQJmxaFwcmf
/Vp6wFchhqda8wTTFVqTMlv2I9Tm5if2FKVes7Qob5FGFyok11jHCTLH2uKSMA/0
MsuqybuJgVh2EIqW26feGNQoYJQIkO/jjWEyCIhnRykliCS9HeQdFgPpt9yrPpDT
oocoaz7/GMLaffiJP7yD
=E/KO
-----END PGP SIGNATURE-----




Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RDe08-0000hb-69 for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 17:12:16 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RDdue-0008Gy-7a for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 17:06:36 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 17:06:36 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 17:06:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 11 Oct 2011 17:06:16 +0200
Message-ID: <j71m18$dsq$1@dough.gmane.org>
References: <E1RDdYN-0006Pm-Qd@garnet.openembedded.org>
	<20111011144607.GF27073@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
In-Reply-To: <20111011144607.GF27073@jama.jama.net>
X-Enigmail-Version: 1.3.2
Subject: Re: [oe-commits] Koen Kooi : guile: fix licensing and gettext inherit
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
X-List-Received-Date: Tue, 11 Oct 2011 15:12:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-10-11 16:46, Martin Jansa schreef:
> On Tue, Oct 11, 2011 at 02:43:35PM +0000, git version control wrote:
>> Module: meta-openembedded.git Branch: master Commit:
>> 8fcf92fed89557683a08f67667acc77a8f73dc0a URL:
>> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=8fcf92fed89557683a08f67667acc77a8f73dc0a
>>
>>
>> 
Author: Koen Kooi <koen@dominion.thruhere.net>
>> Date:   Tue Oct 11 16:40:25 2011 +0200
>> 
>> guile: fix licensing and gettext inherit
>> 
>> Reported by Philip Balister
>> 
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> 
>> ---
>> 
>> meta-oe/recipes-support/guile/guile-native.inc     |    1 - 
>> .../recipes-support/guile/guile-native_1.8.7.bb    |    2 ++ 
>> meta-oe/recipes-support/guile/guile.inc            |    5 ++--- 
>> meta-oe/recipes-support/guile/guile_1.8.7.bb       |    2 ++ 4 files
>> changed, 6 insertions(+), 4 deletions(-)
>> 
>> diff --git a/meta-oe/recipes-support/guile/guile-native.inc
>> b/meta-oe/recipes-support/guile/guile-native.inc index 20ff541..dfa126a
>> 100644 --- a/meta-oe/recipes-support/guile/guile-native.inc +++
>> b/meta-oe/recipes-support/guile/guile-native.inc @@ -2,7 +2,6 @@
>> SECTION = "unknown" DEPENDS = "gettext-native gmp-native"
>> 
>> LICENSE = "LGPLv2.1" -LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=c9ba0d76ca3ef2a1d15a2ac839ef01fa"
>> 
>> inherit autotools native
>> 
>> diff --git a/meta-oe/recipes-support/guile/guile-native_1.8.7.bb
>> b/meta-oe/recipes-support/guile/guile-native_1.8.7.bb index
>> f8fd4c7..2b2707a 100644 ---
>> a/meta-oe/recipes-support/guile/guile-native_1.8.7.bb +++
>> b/meta-oe/recipes-support/guile/guile-native_1.8.7.bb @@ -1,5 +1,7 @@ 
>> require guile-native.inc
>> 
>> +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=c9ba0d76ca3ef2a1d15a2ac839ef01fa" + PR = "r1" 
>> SRC_URI = "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \ 
>> file://configure-fix.patch \ diff --git
>> a/meta-oe/recipes-support/guile/guile.inc
>> b/meta-oe/recipes-support/guile/guile.inc index 918ce33..842e8d7
>> 100644 --- a/meta-oe/recipes-support/guile/guile.inc +++
>> b/meta-oe/recipes-support/guile/guile.inc @@ -7,10 +7,9 @@ PACKAGES =+
>> "${PN}-el" FILES_${PN}-el = "${datadir}/emacs" DESCRIPTION_${PN}-el =
>> "Emacs lisp files for Guile"
>> 
>> -LICENSE = "LGPLv2.1" -LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=c9ba0d76ca3ef2a1d15a2ac839ef01fa" +LICENSE =
>> "LGPLv2.1+"
>> 
>> -inherit autotools +inherit autotools gettext
>> 
>> acpaths = "-I ${S}/guile-config"
>> 
>> diff --git a/meta-oe/recipes-support/guile/guile_1.8.7.bb
>> b/meta-oe/recipes-support/guile/guile_1.8.7.bb index 8b3a80d..d02fe42
>> 100644 --- a/meta-oe/recipes-support/guile/guile_1.8.7.bb +++
>> b/meta-oe/recipes-support/guile/guile_1.8.7.bb @@ -1,5 +1,7 @@ require
>> guile.inc
>> 
>> +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=5711ae313ffd140741e741b88d9d4007" + PR = "r1"
>> 
>> SRC_URI = "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \
> 
> Is there some special reason why guile-1.8.7/18.diff is applied only in
> target recipe? I've noticed only because different LIC_FILES_CHKSUM look
> strange..

Not that I know of, but I didn't feel like fixing that right now :) Philip
also mentioned it should be converted to BBCLASSEXTEND....
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOlFtoMkyGM64RGpERAuvVAKCFkKK5d+J0zM4AHI6oO4eDUgeGzgCdFtqJ
EZBDB1U3RaqZDVEUsfbfWNQ=
=zNP3
-----END PGP SIGNATURE-----




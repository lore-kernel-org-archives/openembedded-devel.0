Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QqMhH-0000jS-Fv for openembedded-devel@lists.openembedded.org;
	Mon, 08 Aug 2011 12:04:35 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QqMcz-0005w9-EF for openembedded-devel@lists.openembedded.org;
	Mon, 08 Aug 2011 12:00:09 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2011 12:00:09 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2011 12:00:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 08 Aug 2011 11:55:35 +0200
Message-ID: <j1obqn$ma0$2@dough.gmane.org>
References: <1312796732-9259-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1312796732-9259-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-efl][PATCH] webkit-efl: inherit perlnative and s/ARM/arm/g in ARM_INSTRUCTION_SET
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
X-List-Received-Date: Mon, 08 Aug 2011 10:04:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 08-08-11 11:45, Martin Jansa schreef:
> * ARM_INSTRUCTION_SET != "thumb" is enough but better to unify with other recipes in case someone does ARM_INSTRUCTION_SET == "arm" later

Applied, thanks

> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- meta-efl/recipes-efl/webkit/webkit-efl_svn.bb |    4 ++-- 1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb index ee1e18d..bffded7 100644 --- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb +++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb @@ -22,7 +22,7 @@ SRC_URI = "\
> 
> S = "${WORKDIR}/src/Source"
> 
> -inherit cmake lib_package pkgconfig +inherit cmake lib_package pkgconfig perlnative
> 
> # Wants to jump too far for THUMB on armv4t # in WebCore::DocTypeStringsHash::doctype_hash_function(char const*, unsigned int)': @@ -30,7 +30,7 @@ inherit cmake lib_package pkgconfig # the same in WebCore::CSSValueKeywordsHash::value_hash_function(char const*, unsigned int)': #
> WebCore::CSSPropertyNamesHash::propery_hash_function(char const*, unsigned int)': #             WebCore::ColorDataHash::colordata_hash_function(char const*, unsigned int)': -ARM_INSTRUCTION_SET = "ARM" +ARM_INSTRUCTION_SET = "arm"
> 
> EXTRA_OECMAKE = "-DPORT=Efl -DSHARED_CORE=ON"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOP7KXMkyGM64RGpERAqH3AJ4p4XF+ki1hssM389UF1a49ZsPMrQCfRueM
khVdasbeKy5odmcreV4/JQk=
=KdWV
-----END PGP SIGNATURE-----




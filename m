Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 15D5760684
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Oct 2016 12:10:11 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1bsqS2-00023Z-Ug for openembedded-devel@lists.openembedded.org;
	Sat, 08 Oct 2016 14:10:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 8 Oct 2016 14:09:36 +0200
Message-ID: <ntanlu$nkt$1@blaine.gmane.org>
References: <1475854216-6859-1-git-send-email-msbarth@linux.vnet.ibm.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.3.0
In-Reply-To: <1475854216-6859-1-git-send-email-msbarth@linux.vnet.ibm.com>
Subject: Re: [meta-oe][PATCH v2] autoconf-archive: 2012.04.07 -> 2016.09.16
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Oct 2016 12:10:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 07-10-16 om 17:30 schreef Matthew Barth:
> Signed-off-by: Matthew Barth <msbarth@linux.vnet.ibm.com>
> ---
>  meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc    | 7 ++++---
>  ...oconf-archive_2012.04.07.bb => autoconf-archive_2016.09.16.bb} | 8 +++-----
>  2 files changed, 7 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-devtools/autoconf-archive/{autoconf-archive_2012.04.07.bb => autoconf-archive_2016.09.16.bb} (55%)
> 
> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> index 9399363..2b5df70 100644
> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> @@ -1,15 +1,16 @@
> +SUMMARY = "A collection of macros for GNU Autoconf"
> +DESCRIPTION = "The autoconf-archive set of macros extend the pre-defined \
> +capabilities within the complete autoconf tool set."
>  LICENSE = "GPLv3"
>  HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
>  SECTION = "devel"
> -
>  DEPENDS += "m4-native"
>  DEPENDS_class-native = "m4-native gnu-config-native"
>  DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
> -
>  RDEPENDS_${PN} = "m4 gnu-config"
>  RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
>  RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"

Removing that whitespace makes the recipe less readable. And like I said
before, if you're going to touch style issues, move R* below do_install





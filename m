Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 393 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Jan 2015 10:30:46 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.16])
	by mail.openembedded.org (Postfix) with ESMTP id 774D47231B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 10:30:46 +0000 (UTC)
Received: from [216.82.249.131] by server-16.bemta-12.messagelabs.com id
	1C/CC-02703-C4E7FB45; Wed, 21 Jan 2015 10:24:12 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-5.tower-28.messagelabs.com!1421835851!38192603!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5378 invoked from network); 21 Jan 2015 10:24:11 -0000
Received: from mail.mx4.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-5.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	21 Jan 2015 10:24:11 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Wed, 21 Jan 2015 04:23:14 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Wed, 21 Jan 2015 04:23:26 -0600
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Wed, 21 Jan 2015 11:23:24 +0100
Message-ID: <54BF7E14.3080401@digi.com>
Date: Wed, 21 Jan 2015 11:23:16 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1417166024-2366-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1417166024-2366-1-git-send-email-Qi.Chen@windriver.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [Dizzy backport] [meta-oe][PATCH] xmlto: remove recipe as it's in OE core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Jan 2015 10:30:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Poky/OE-core added xmlto for Dizzy, but in meta-oe it has only been 
removed in master so for Dizzy the recipe is duplicated:

$ bitbake-layers show-overlayed
xmlto:
   meta-oe              0.0.25
   meta                 0.0.25

Could this removal patch be backported?

-
Regards,

Javier Viguera


On 28/11/14 10:13, Chen Qi wrote:
> Remove xmlto recipe from meta-oe because it's in OE core now.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../xmlto-0.0.25/obsolete_automake_macros.patch    |   12 ------------
>   meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb      |   18 ------------------
>   2 files changed, 30 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
>   delete mode 100644 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
>
> diff --git a/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch b/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
> deleted file mode 100644
> index faa8acc..0000000
> --- a/meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff -Nurd xmlto-0.0.25/configure.in xmlto-0.0.25/configure.in
> ---- xmlto-0.0.25/configure.in	2011-12-01 17:49:00.000000000 +0200
> -+++ xmlto-0.0.25/configure.in	2013-01-07 05:24:16.169953519 +0200
> -@@ -1,7 +1,7 @@
> - AC_INIT(xmlto, 0.0.25)
> - AC_CONFIG_SRCDIR(xmlto.spec.in)
> - AM_INIT_AUTOMAKE([dist-bzip2 subdir-objects 1.6])
> --AM_CONFIG_HEADER(config.h)
> -+AC_CONFIG_HEADERS(config.h)
> -
> - AC_PROG_CC
> - AM_PROG_CC_C_O
> diff --git a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
> deleted file mode 100644
> index 9188c8a..0000000
> --- a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "A shell-script tool for converting XML files to various formats"
> -HOMEPAGE = "https://fedorahosted.org/xmlto/"
> -SECTION = "docs/xmlto"
> -LICENSE = "GPLv2"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> -
> -PR = "r1"
> -
> -SRC_URI = "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz \
> -           file://obsolete_automake_macros.patch \
> -"
> -SRC_URI[md5sum] = "a88cd3f08789b4825d1ac89fa065170d"
> -SRC_URI[sha256sum] = "c52b56d929e8d20fc19cd3b7ec238f8d039730c56ee311cc352e843147e3e31a"
> -
> -inherit autotools
> -
> -BBCLASSEXTEND = "native nativesdk"
>




Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 50E406D700
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 08:23:53 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VjPYF-00044L-AP for openembedded-devel@lists.openembedded.org;
	Thu, 21 Nov 2013 09:23:51 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 09:23:51 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 09:23:51 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 21 Nov 2013 09:28:45 +0100
Message-ID: <l6kftv$imc$1@ger.gmane.org>
References: <1384985738-31057-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <1384985738-31057-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][meta-efl][PATCH] meta-oe, meta-efl: Restore few MIRROR variables
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
X-List-Received-Date: Thu, 21 Nov 2013 08:23:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Martin Jansa schreef op 20-11-13 23:15:
> * these were correctly removed from oe-core in commit
> 3b333896c71689c664475d53daed52404bf6b21b Author: Phil Blundell
> <pb@pbcl.net> Date:   Thu Nov 14 18:15:46 2013 +0000
> 
> bitbake.conf: Remove obsolete/unused MIRROR cruft but we still need them
> here, so add them to layer.conf
> 
> * FREESMARTPHONE_GIT is used by 4 recipes in meta-oe and a lot more in
> meta-fso (which depends on meta-oe) 
> meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb:SRC_URI
> = "${FREESMARTPHONE_GIT}/vala-dbus-binding-tool.git;branch=master" 
> meta-oe/recipes-support/serial-utils/pty-forward-native.bb:SRC_URI =
> "${FREESMARTPHONE_GIT}/cornucopia" 
> meta-oe/recipes-support/serial-utils/serial-forward_git.bb:SRC_URI =
> "${FREESMARTPHONE_GIT}/cornucopia" 
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:SRC_URI =
> "${FREESMARTPHONE_GIT}/vala-terminal.git;branch=master"

Our CI loop at linaro caught that as well :)

Acked-by: Koen Kooi <koen.kooi@linaro.org>

> 
> * E_MIRROR/E_SVN are used in many recipes in meta-efl, even with upstream
> moveing to git, not all components are already in git and for distros
> with populated PREMIRROR these variables are still important to parse the
> recipes.
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
> meta-efl/conf/layer.conf | 3 +++ meta-oe/conf/layer.conf  | 2 ++ 2 files
> changed, 5 insertions(+)
> 
> diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf index
> 272fc04..fb9a7ce 100644 --- a/meta-efl/conf/layer.conf +++
> b/meta-efl/conf/layer.conf @@ -7,3 +7,6 @@ BBFILES +=
> "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend" 
> BBFILE_COLLECTIONS += "efl-layer" BBFILE_PATTERN_efl-layer :=
> "^${LAYERDIR}/" BBFILE_PRIORITY_efl-layer = "7" + +E_MIRROR =
> "http://download.enlightenment.org/releases" +E_SVN =
> "svn://svn.enlightenment.org/svn/e" diff --git a/meta-oe/conf/layer.conf
> b/meta-oe/conf/layer.conf index bd7eceb..393b4e6 100644 ---
> a/meta-oe/conf/layer.conf +++ b/meta-oe/conf/layer.conf @@ -37,3 +37,5 @@
> SIGGEN_EXCLUDERECIPES_ABISAFE += " \ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "
> \ usb-modeswitch-data->usb-modeswitch \ " + +FREESMARTPHONE_GIT =
> "git://git.freesmartphone.org"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSjcQ9MkyGM64RGpERAu33AJ40U+DxY/MdA6gnfziq19wdL+EJQgCffoFc
ABj35a+jEvyH7I0JBCL0oEY=
=MRUa
-----END PGP SIGNATURE-----



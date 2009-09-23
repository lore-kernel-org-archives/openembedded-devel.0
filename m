Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MqMde-0006Rd-Ge
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Sep 2009 09:51:49 +0200
Received: from tamarin.localnet (unknown [188.46.219.97])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 896C91B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2009 07:57:50 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Sep 2009 09:50:38 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.31; KDE/4.3.1; i686; ; )
References: <4AB967B5.4060304@gmail.com>
In-Reply-To: <4AB967B5.4060304@gmail.com>
MIME-Version: 1.0
Message-Id: <200909230950.38300.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libsoup: add gnome-keyring dependency.
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
X-List-Received-Date: Wed, 23 Sep 2009 07:51:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 23 September 2009 02:11:33 Graham Gower wrote:
> libsoup's configure.in added a gnome-keyring check since the last version.
> 
> Failure looks like this:
> | checking whether to build libsoup-gnome... yes
> | checking for GNOME_KEYRING... no
> | configure: error: Could not find gnome-keyring devel files.
> | Configure with --without-gnome if you wish to build only libsoup
> | without GNOME-specific features.
> | FATAL: oe_runconf failed`
> 
> ---
>  recipes/gnome/libsoup-2.4_2.27.91.bb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/gnome/libsoup-2.4_2.27.91.bb
>  b/recipes/gnome/libsoup-2.4_2.27.91.bb index ae50306..1fce0ff 100644
> --- a/recipes/gnome/libsoup-2.4_2.27.91.bb
> +++ b/recipes/gnome/libsoup-2.4_2.27.91.bb
> @@ -1,7 +1,9 @@
>  DESCRIPTION = "An HTTP library implementation in C"
>  SECTION = "x11/gnome/libs"
>  LICENSE = "GPL"
> -DEPENDS = "libproxy glib-2.0 gnutls libxml2 sqlite3"
> +DEPENDS = "libproxy glib-2.0 gnutls libxml2 sqlite3 gnome-keyring"
> +
> +PR = "r1"


Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>



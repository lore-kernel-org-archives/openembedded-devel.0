Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N4zZr-0001FG-HP for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 17:16:22 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N4zYd-0007lj-Ph
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 17:15:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2009 17:15:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2009 17:15:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 02 Nov 2009 17:09:50 +0100
Message-ID: <hcn08e$rq9$1@ger.gmane.org>
References: <1257162955-28103-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1257162955-28103-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] matchbox-config-gtk: sync with Poky
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
X-List-Received-Date: Mon, 02 Nov 2009 16:16:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-11-09 12:55, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>


>
> ---
>   conf/distro/include/sane-srcrevs.inc               |    1 +
>   recipes/matchbox-config-gtk/files/no-handed.patch  |   33 ++++++++++++++++++++
>   .../matchbox-config-gtk/matchbox-config-gtk_svn.bb |   11 ++++--
>   3 files changed, 41 insertions(+), 4 deletions(-)
>   create mode 100644 recipes/matchbox-config-gtk/files/no-handed.patch
>
> diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
> index 2f22a7d..94d641d 100644
> --- a/conf/distro/include/sane-srcrevs.inc
> +++ b/conf/distro/include/sane-srcrevs.inc
> @@ -113,6 +113,7 @@ SRCREV_pn-madbutterfly ?= "ecd1842714b5e982f3138cbdd358517d57be6aa3"
>   SRCREV_pn-maemo-mapper ?= "118"
>   SRCREV_pn-mamonaim_e_applet ?= "51c747849f71981bd1dc9eb1807df4993ad97d04"
>   SRCREV_pn-mamona_input_methods ?= "7e6a8cc947689a045d0fba90015da599275347d9"
> +SRCREV_pn-matchbox-config-gtk ?= "1614"
>   SRCREV_pn-matchbox-desktop-2 ?= "2096"
>   SRCREV_pn-matchbox-keyboard ?= "1910"
>   SRCREV_pn-matchbox-keyboard-inputmethod ?= "1910"
> diff --git a/recipes/matchbox-config-gtk/files/no-handed.patch b/recipes/matchbox-config-gtk/files/no-handed.patch
> new file mode 100644
> index 0000000..9ab51ec
> --- /dev/null
> +++ b/recipes/matchbox-config-gtk/files/no-handed.patch
> @@ -0,0 +1,33 @@
> +Index: appearance/mb-appearance.c
> +===================================================================
> +--- appearance/mb-appearance.c	(revision 1614)
> ++++ appearance/mb-appearance.c	(working copy)
> +@@ -300,11 +300,13 @@
> +     gtk_font_button_set_font_name (GTK_FONT_BUTTON (font_button),
> +                                    gconf_value_get_string (value));
> +   } else if (strcmp (key, HANDED_KEY) == 0) {
> ++#if 0
> +     GEnumValue *e;
> +     e = g_enum_get_value_by_name (g_type_class_ref (GTK_TYPE_CORNER_TYPE),
> +                                   gconf_value_get_string (value));
> +     gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (handed_check),
> +                                   e->value == GTK_CORNER_TOP_RIGHT);
> ++#endif
> +   }
> + }
> +
> +@@ -395,12 +397,13 @@
> +   gtk_container_add (GTK_CONTAINER (align), font_button);
> +
> +   /* Left/Right Handed */
> +-
> ++#if 0
> +   frame = new_frame (_("Orientation"),&align);
> +   gtk_box_pack_start (GTK_BOX (box), frame, TRUE, TRUE, 0);
> +   handed_check = gtk_check_button_new_with_mnemonic (_("_Left-handed"));
> +   g_signal_connect (handed_check, "toggled", G_CALLBACK (on_handed_set), NULL);
> +   gtk_container_add (GTK_CONTAINER (align), handed_check);
> ++#endif
> +
> +   gconf_client_add_dir (gconf, INTERFACE_DIR, GCONF_CLIENT_PRELOAD_ONELEVEL, NULL);
> +   g_signal_connect (gconf, "value-changed", G_CALLBACK (on_gconf_value_changed), NULL);
> diff --git a/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb b/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
> index ec11e45..bc6c051 100644
> --- a/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
> +++ b/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
> @@ -1,11 +1,14 @@
> -DESCRIPTION = "Matchbox gtk theme configuration application."
> +DESCRIPTION = "Matchbox GTK+ theme configuration application."
>   LICENSE = "GPL"
> -DEPENDS = "gconf libglade gtk+"
> +DEPENDS = "gconf gtk+"
>   RDEPENDS = "settings-daemon"
> -PV = "0.0+svn${SRCDATE}"
> +
> +PV = "0.0+svnr${SRCREV}"
> +
>   S = "${WORKDIR}/${PN}"
>
> -SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=${PN};proto=http"
> +SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=${PN};proto=http \
> +        file://no-handed.patch;patch=1;pnum=0"
>
>   inherit autotools pkgconfig
>





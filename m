Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LpRUI-0002Go-91
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 20:18:10 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LpRRs-0000s8-2S
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 18:15:32 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 18:15:32 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 18:15:32 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 02 Apr 2009 20:15:20 +0200
Message-ID: <gr2vbp$k2v$1@ger.gmane.org>
References: <1238654651-7091-1-git-send-email-k.kooi@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1238654651-7091-1-git-send-email-k.kooi@student.utwente.nl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] places: add patch to fix API change introduced by SRCREV bump
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
X-List-Received-Date: Thu, 02 Apr 2009 18:18:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Any comments on this one? Without the patch the applet won't launch:

http://scap.linuxtogo.org/files/d5103ea0b270cdafb84aeffb1ead7750.png

regards,

Koen

On 02-04-09 08:44, Koen Kooi wrote:
> From: Koen Kooi<koen@openembedded.org>
>
>
> Signed-off-by: Koen Kooi<koen@openembedded.org>
> ---
>   recipes/e17/places/fix-api.diff |   53 +++++++++++++++++++++++++++++++++++++++
>   recipes/e17/places_svn.bb       |    4 ++-
>   2 files changed, 56 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/e17/places/fix-api.diff
>
> diff --git a/recipes/e17/places/fix-api.diff b/recipes/e17/places/fix-api.diff
> new file mode 100644
> index 0000000..ef09d25
> --- /dev/null
> +++ b/recipes/e17/places/fix-api.diff
> @@ -0,0 +1,53 @@
> +Index: trunk/E-MODULES-EXTRA/places/src/e_mod_places.c
> +===================================================================
> +--- trunk/E-MODULES-EXTRA/places/src/e_mod_places.c (revision 39774)
> ++++ trunk/E-MODULES-EXTRA/places/src/e_mod_places.c (revision 39830)
> +@@ -371,5 +371,5 @@
> +                e_menu_item_label_set(mi, alias ? alias :
> +                                         ecore_file_file_get(uri->path));
> +-               e_util_menu_item_icon_theme_set(mi, "folder");
> ++               e_util_menu_item_theme_icon_set(mi, "folder");
> +                e_menu_item_callback_set(mi, _places_run_fm, strdup(uri->path)); //TODO free somewhere
> +             }
> +@@ -398,5 +398,5 @@
> +       mi = e_menu_item_new(em);
> +       e_menu_item_label_set(mi, D_("Home"));
> +-      e_util_menu_item_icon_theme_set(mi, "user-home");
> ++      e_util_menu_item_theme_icon_set(mi, "user-home");
> +       e_menu_item_callback_set(mi, _places_run_fm, (char*)e_user_homedir_get());
> +    }
> +@@ -407,5 +407,5 @@
> +       mi = e_menu_item_new(em);
> +       e_menu_item_label_set(mi, D_("Desktop"));
> +-      e_util_menu_item_icon_theme_set(mi, "user-desktop");
> ++      e_util_menu_item_theme_icon_set(mi, "user-desktop");
> +       snprintf(buf, sizeof(buf), "%s/Desktop", (char*)e_user_homedir_get());
> +       e_menu_item_callback_set(mi, _places_run_fm, strdup(buf)); //TODO free somewhere
> +@@ -417,5 +417,5 @@
> +       mi = e_menu_item_new(em);
> +       e_menu_item_label_set(mi, D_("Trash"));
> +-      e_util_menu_item_icon_theme_set(mi, "folder");
> ++      e_util_menu_item_theme_icon_set(mi, "folder");
> +       e_menu_item_callback_set(mi, _places_run_fm, "trash:///");
> +    }
> +@@ -426,5 +426,5 @@
> +       mi = e_menu_item_new(em);
> +       e_menu_item_label_set(mi, D_("Filesystem"));
> +-      e_util_menu_item_icon_theme_set(mi, "drive-harddisk");
> ++      e_util_menu_item_theme_icon_set(mi, "drive-harddisk");
> +       e_menu_item_callback_set(mi, _places_run_fm, "/");
> +    }
> +@@ -435,5 +435,5 @@
> +       mi = e_menu_item_new(em);
> +       e_menu_item_label_set(mi, D_("Temp"));
> +-      e_util_menu_item_icon_theme_set(mi, "user-temp");
> ++      e_util_menu_item_theme_icon_set(mi, "user-temp");
> +       e_menu_item_callback_set(mi, _places_run_fm, "/tmp");
> +    }
> +@@ -498,5 +498,5 @@
> +    mi = e_menu_item_new(em);
> +    e_menu_item_label_set(mi, D_("Places"));
> +-   e_util_menu_item_icon_theme_set(mi, "system-file-manager");
> ++   e_util_menu_item_theme_icon_set(mi, "system-file-manager");
> +
> +    m = e_menu_new();
> diff --git a/recipes/e17/places_svn.bb b/recipes/e17/places_svn.bb
> index dc0961f..4aeaed2 100644
> --- a/recipes/e17/places_svn.bb
> +++ b/recipes/e17/places_svn.bb
> @@ -1,10 +1,12 @@
>   LICENSE = "GPLv3 LGPLv3"
>   PV = "0.1.0+svnr${SRCREV}"
>
> -PR = "r2"
> +PR = "r3"
>
>   require e-module.inc
>
> +SRC_URI += "file://fix-api.diff;patch=1;maxrev=39830;pnum=3"
> +
>   # Calls /usr/bin/eject for media
>   RRECOMMENDS_${PN} += "eject"
>





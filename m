Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M8Fwa-0008NM-Qk
	for openembedded-devel@openembedded.org; Sun, 24 May 2009 17:49:01 +0200
Received: (qmail 26478 invoked from network); 24 May 2009 15:41:05 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 24 May 2009 08:41:05 -0700
Date: Sun, 24 May 2009 08:41:04 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090524154104.GQ23842@smtp.west.cox.net>
References: <20090523210658.GO23842@smtp.west.cox.net>
	<1243154705-20600-1-git-send-email-mad_soft@inbox.ru>
MIME-Version: 1.0
In-Reply-To: <1243154705-20600-1-git-send-email-mad_soft@inbox.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH v2] netsurf: add recipe for version 2.1
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
X-List-Received-Date: Sun, 24 May 2009 15:49:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 24, 2009 at 12:45:05PM +0400, Dmitry Artamonow wrote:
> It's gtk+ version built with GIF,JPEG,PNG and without SVG,MNG and
> PDF printing support.
> 
> Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>

Acked-by: Tom Rini <trini@embeddedalley.com>

Do you have commit access?

> ---
> Changes after v1:
> 
>  * removed versioned dependancies, as they're not supported by OE at the moment
> 
>  recipes/netsurf/netsurf-2.1/Makefile.config    |    9 +++
>  recipes/netsurf/netsurf-2.1/debugxml_fix.patch |   64 ++++++++++++++++++++++++
>  recipes/netsurf/netsurf-2.1/fix_makefile.patch |   12 +++++
>  recipes/netsurf/netsurf-2.1/netsurf.desktop    |   10 ++++
>  recipes/netsurf/netsurf-2.1/netsurf.png        |  Bin 0 -> 9329 bytes
>  recipes/netsurf/netsurf_2.1.bb                 |   32 ++++++++++++
>  6 files changed, 127 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/netsurf/netsurf-2.1/Makefile.config
>  create mode 100644 recipes/netsurf/netsurf-2.1/debugxml_fix.patch
>  create mode 100644 recipes/netsurf/netsurf-2.1/fix_makefile.patch
>  create mode 100644 recipes/netsurf/netsurf-2.1/netsurf.desktop
>  create mode 100644 recipes/netsurf/netsurf-2.1/netsurf.png
>  create mode 100644 recipes/netsurf/netsurf_2.1.bb
> 
> diff --git a/recipes/netsurf/netsurf-2.1/Makefile.config b/recipes/netsurf/netsurf-2.1/Makefile.config
> new file mode 100644
> index 0000000..72c8600
> --- /dev/null
> +++ b/recipes/netsurf/netsurf-2.1/Makefile.config
> @@ -0,0 +1,9 @@
> +override NETSURF_USE_BMP := YES
> +override NETSURF_USE_GIF := YES
> +override NETSURF_USE_JPEG := YES
> +override NETSURF_USE_PNG := YES
> +override NETSURF_USE_MNG := NO
> +override NETSURF_USE_HARU_PDF := NO
> +override NETSURF_USE_RSVG := NO
> +override NETSURF_USE_ROSPRITE := NO
> +
> diff --git a/recipes/netsurf/netsurf-2.1/debugxml_fix.patch b/recipes/netsurf/netsurf-2.1/debugxml_fix.patch
> new file mode 100644
> index 0000000..3a6626a
> --- /dev/null
> +++ b/recipes/netsurf/netsurf-2.1/debugxml_fix.patch
> @@ -0,0 +1,64 @@
> +--- netsurf-2.0/gtk/gtk_scaffolding.c.orig	2009-05-15 01:18:44.000000000 +0400
> ++++ netsurf-2.0/gtk/gtk_scaffolding.c	2009-05-15 01:24:32.000000000 +0400
> +@@ -22,7 +22,6 @@
> + #include <stdlib.h>
> + #include <string.h>
> + #include <gtk/gtk.h>
> +-#include <libxml/debugXML.h>
> + #include "content/content.h"
> + #include "desktop/browser.h"
> + #include "desktop/history_core.h"
> +@@ -1040,52 +1039,7 @@
> + 
> + MENUHANDLER(save_dom_tree)
> + {
> +-	GtkWidget *save_dialog;
> +-	struct gtk_scaffolding *gw = (struct gtk_scaffolding *)g;
> +-	
> +-	save_dialog = gtk_file_chooser_dialog_new("Save File", gw->window,
> +-			GTK_FILE_CHOOSER_ACTION_SAVE,
> +-			GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL,
> +-			GTK_STOCK_SAVE, GTK_RESPONSE_ACCEPT,
> +-			NULL);
> +-	
> +-	gtk_file_chooser_set_current_folder(GTK_FILE_CHOOSER(save_dialog),
> +-			getenv("HOME") ? getenv("HOME") : "/");
> +-	
> +-	gtk_file_chooser_set_current_name(GTK_FILE_CHOOSER(save_dialog),
> +-			"domtree.txt");
> +-	
> +-	if (gtk_dialog_run(GTK_DIALOG(save_dialog)) == GTK_RESPONSE_ACCEPT) {
> +-		gchar *filename = gtk_file_chooser_get_filename(
> +-				GTK_FILE_CHOOSER(save_dialog));
> +-		FILE *fh;
> +-		LOG(("Saving dom tree to %s...\n", filename));
> +-		
> +-		fh = fopen((const char *) filename, "w");
> +-		if (fh == NULL) {
> +-			warn_user("Error saving box tree dump.",
> +-				"Unable to open file for writing.");
> +-		} else {
> +-			struct browser_window *bw;
> +-			bw = nsgtk_get_browser_window(gw->top_level);
> +-
> +-			if (bw->current_content && 
> +-					bw->current_content->type == 
> +-					CONTENT_HTML) {
> +-				xmlDebugDumpDocument(fh, 
> +-					bw->current_content->
> +-						data.html.document);
> +-			}
> +-
> +-			fclose(fh);
> +-		}
> +-		
> +-		g_free(filename);
> +-	}
> +-	
> +-	gtk_widget_destroy(save_dialog);
> +-	
> +-	return TRUE;
> ++	return FALSE;
> + }
> + 
> + 
> diff --git a/recipes/netsurf/netsurf-2.1/fix_makefile.patch b/recipes/netsurf/netsurf-2.1/fix_makefile.patch
> new file mode 100644
> index 0000000..1783921
> --- /dev/null
> +++ b/recipes/netsurf/netsurf-2.1/fix_makefile.patch
> @@ -0,0 +1,12 @@
> +Index: Makefile
> +===================================================================
> +--- a/Makefile	(revision 7536)
> ++++ b/Makefile	(working copy)
> +@@ -820,7 +820,6 @@
> + 	@cp -vRL gtk/res/netsurf-16x16.xpm $(DESTDIR)$(NETSURF_GTK_RESOURCES)
> + 	@cp -vRL gtk/res/throbber/*.png $(DESTDIR)$(NETSURF_GTK_RESOURCES)/throbber
> + 	@cp -vRL gtk/res/Aliases $(DESTDIR)$(NETSURF_GTK_RESOURCES)
> +-	@cp -vrL gtk/res/docs $(DESTDIR)/$(NETSURF_GTK_RESOURCES)
> + 	gzip -9v < gtk/res/messages > $(DESTDIR)$(NETSURF_GTK_RESOURCES)messages
> + 	gzip -9v < gtk/res/downloads.glade > $(DESTDIR)$(NETSURF_GTK_RESOURCES)downloads.glade
> + 	gzip -9v < gtk/res/netsurf.glade > $(DESTDIR)$(NETSURF_GTK_RESOURCES)netsurf.glade
> diff --git a/recipes/netsurf/netsurf-2.1/netsurf.desktop b/recipes/netsurf/netsurf-2.1/netsurf.desktop
> new file mode 100644
> index 0000000..4188d30
> --- /dev/null
> +++ b/recipes/netsurf/netsurf-2.1/netsurf.desktop
> @@ -0,0 +1,10 @@
> +[Desktop Entry]
> +Type=Application
> +Name=NetSurf
> +Comment=NetSurf Web Browser
> +GenericName=Web Browser
> +Icon=netsurf
> +Exec=netsurf
> +Terminal=false
> +StartupNotify=false
> +Categories=Network;WebBrowser;
> diff --git a/recipes/netsurf/netsurf-2.1/netsurf.png b/recipes/netsurf/netsurf-2.1/netsurf.png
> new file mode 100644
> index 0000000000000000000000000000000000000000..3064e5d4f37bb31f98c6acdbce3807a905d3ebcb
> GIT binary patch
> literal 9329
> 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
> Fe*lRf9GL(B
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/recipes/netsurf/netsurf_2.1.bb b/recipes/netsurf/netsurf_2.1.bb
> new file mode 100644
> index 0000000..073f17f
> --- /dev/null
> +++ b/recipes/netsurf/netsurf_2.1.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "Lightweight web browser capable of handling many of the \
> +web standards in use today."
> +HOMEPAGE = "http://www.netsurf-browser.org/"
> +SECTION = "x11/network"
> +LICENSE = "GPLv2"
> +
> +SRC_URI = "http://www.netsurf-browser.org/downloads/releases/netsurf-${PV}-src.tar.gz \
> +	   file://fix_makefile.patch;patch=1 \
> +	   file://debugxml_fix.patch;patch=1 \
> +	   file://netsurf.png \
> +	   file://netsurf.desktop \
> +	   file://Makefile.config"
> +
> +# Workaround for 2.1 tarball (unpacks into netsurf/, not netsurf-2.1/ )
> +S = "${WORKDIR}/netsurf"
> +
> +DEPENDS = "gtk+ lemon-native re2c-native jpeg openssl curl libxml2 \
> +	   libglade hubbub libnsgif libnsbmp lcms"
> +
> +EXTRA_OEMAKE = "CURDIR=${S} DESTDIR=${D} PREFIX=${prefix}"
> +
> +do_configure() {
> +	cp ${WORKDIR}/Makefile.config ${S}/
> +}
> +
> +do_install() {
> +	oe_runmake install
> +	install -d ${D}/${datadir}/applications
> +	install -d ${D}/${datadir}/pixmaps
> +	install -m 0644 ${WORKDIR}/netsurf.png ${D}/${datadir}/pixmaps/
> +	install -m 0644 ${WORKDIR}/netsurf.desktop ${D}/${datadir}/applications/
> +}
> -- 
> 1.6.0.6
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini



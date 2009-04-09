Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lrwx9-0006dB-Vf
	for openembedded-devel@openembedded.org; Thu, 09 Apr 2009 18:18:14 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Lrwu6-0007ZZ-H9
	for openembedded-devel@openembedded.org; Thu, 09 Apr 2009 16:15:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 09 Apr 2009 16:15:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 09 Apr 2009 16:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 09 Apr 2009 18:11:02 +0200
Message-ID: <grl6mm$5qt$2@ger.gmane.org>
References: <1239292804-564-1-git-send-email-k.kooi@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090405 Shredder/3.0b3pre
In-Reply-To: <1239292804-564-1-git-send-email-k.kooi@student.utwente.nl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [STABLE] Re: gnome-panel: Compile idl files against STAGING_DIR_HOST.
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
X-List-Received-Date: Thu, 09 Apr 2009 16:18:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

forgot the [STABLE] tag, sorry

On 09-04-09 18:00, Koen Kooi wrote:
> From: Stanislav Brabec<utx@penguin.cz>
>
> Adapted from the .dev patch to gnome-panel 2.24 since 2.26 isn't in stable yet
>
> Signed-off-by: Koen Kooi<koen@openembedded.org>
>
> ---
> diff --git a/recipes/gnome/gnome-panel/idl-sysroot.patch b/recipes/gnome/gnome-panel/idl-sysroot.patch
> new file mode 100644
> index 0000000..07e5ded
> --- a/dev/null
> +++ b/recipes/gnome/gnome-panel/idl-sysroot.patch
> @@ -0,0 +1,26 @@
> +Index: gnome-panel-2.24.0/gnome-panel/Makefile.am
> +===================================================================
> +--- gnome-panel-2.24.0.orig/gnome-panel/Makefile.am	2009-03-16 22:37:12.000000000 +0000
> ++++ gnome-panel-2.24.0/gnome-panel/Makefile.am	2009-04-09 14:39:02.000000000 +0000
> +@@ -43,7 +43,7 @@
> + 	$(NULL)
> +
> + $(CORBA_SRCLIST): $(top_srcdir)/idl/GNOME_Panel.idl $(ORBIT_IDL)
> +-	$(ORBIT_IDL) -I $(BONOBO_IDLDIR) -I $(BONOBO_ACT_IDLDIR) $(top_srcdir)/idl/GNOME_Panel.idl
> ++	$(ORBIT_IDL) -I $(SYSROOT)$(BONOBO_IDLDIR) -I $(SYSROOT)$(BONOBO_ACT_IDLDIR) $(top_srcdir)/idl/GNOME_Panel.idl
> +
> + BUILT_SOURCES = \
> + 	$(CORBA_SRCLIST)	\
> +Index: gnome-panel-2.24.0/libpanel-applet/Makefile.am
> +===================================================================
> +--- gnome-panel-2.24.0.orig/libpanel-applet/Makefile.am	2009-03-16 22:37:13.000000000 +0000
> ++++ gnome-panel-2.24.0/libpanel-applet/Makefile.am	2009-04-09 14:51:18.000000000 +0000
> +@@ -45,7 +45,7 @@
> + 	GNOME_Panel.h
> +
> + $(CORBA_SRCLIST): $(top_srcdir)/idl/GNOME_Panel.idl $(ORBIT_IDL)
> +-	$(ORBIT_IDL) -I $(BONOBO_IDLDIR) -I $(BONOBO_ACT_IDLDIR) $(top_srcdir)/idl/GNOME_Panel.idl
> ++	$(ORBIT_IDL) -I $(SYSROOT)$(BONOBO_IDLDIR) -I $(SYSROOT)$(BONOBO_ACT_IDLDIR) $(top_srcdir)/idl/GNOME_Panel.idl
> +
> + noinst_PROGRAMS = test-bonobo-applet
> +
> diff --git a/recipes/gnome/gnome-panel_2.24.0.bb b/recipes/gnome/gnome-panel_2.24.0.bb
> index 743e0fa..473bea4 100644
> --- a/recipes/gnome/gnome-panel_2.24.0.bb
> +++ b/recipes/gnome/gnome-panel_2.24.0.bb
> @@ -5,6 +5,8 @@ inherit gnome pkgconfig
>
>   SRC_URI += "file://scrollkeeper.patch;patch=1"
>
> +SRC_URI += "file://idl-sysroot.patch;patch=1"
> +
>   do_configure_prepend() {
>           sed -i -e s:help:: ${S}/Makefile.am
>   }
> @@ -16,7 +18,8 @@ FILES_libpanel-applet = "${libdir}/libpanel-applet-2.so.*"
>   FILES_${PN} =+ "${datadir}/gnome* \
>                   ${datadir}/icons"
>
> -EXTRA_OEMAKE = "ORBIT_IDL=${STAGING_BINDIR_NATIVE}/orbit-idl-2"
> +export SYSROOT = "${STAGING_DIR_HOST}"
> +EXTRA_OEMAKE = "ORBIT_IDL=${STAGING_BINDIR_NATIVE}/orbit-idl-2 SYSROOT=${SYSROOT}"
>   EXTRA_OECONF = "--disable-scrollkeeper"
>
>   do_stage() {





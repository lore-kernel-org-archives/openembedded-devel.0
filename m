Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ls66H-0008AP-Si
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Apr 2009 04:04:16 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHV00JE048YEK3A@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	09 Apr 2009 21:00:40 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A1D5F6B83A8; Thu,
	09 Apr 2009 22:00:34 -0400 (EDT)
Date: Thu, 09 Apr 2009 22:00:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090410020034.GA26001@denix.org>
References: <1239292804-564-1-git-send-email-k.kooi@student.utwente.nl>
MIME-version: 1.0
In-reply-to: <1239292804-564-1-git-send-email-k.kooi@student.utwente.nl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: gnome-panel: Compile idl files against STAGING_DIR_HOST.
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
X-List-Received-Date: Fri, 10 Apr 2009 02:04:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 09, 2009 at 06:00:03PM +0200, Koen Kooi wrote:
> From: Stanislav Brabec <utx@penguin.cz>
> 
> Adapted from the .dev patch to gnome-panel 2.24 since 2.26 isn't in stable yet
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

BTW, should tested patches get Tested-by: instead of Acked-by:?

> ---
> diff --git a/recipes/gnome/gnome-panel/idl-sysroot.patch b/recipes/gnome/gnome-panel/idl-sysroot.patch
> new file mode 100644
> index 0000000..07e5ded
> --- a/dev/null

The above had to be changed to "--- /dev/null" instead to satisfy git-am and 
git-apply. How was this patch generated? I wonder what went wrong...


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
>  SRC_URI += "file://scrollkeeper.patch;patch=1"
>  
> +SRC_URI += "file://idl-sysroot.patch;patch=1"
> +
>  do_configure_prepend() {
>          sed -i -e s:help:: ${S}/Makefile.am
>  }
> @@ -16,7 +18,8 @@ FILES_libpanel-applet = "${libdir}/libpanel-applet-2.so.*"
>  FILES_${PN} =+ "${datadir}/gnome* \
>                  ${datadir}/icons"
>  
> -EXTRA_OEMAKE = "ORBIT_IDL=${STAGING_BINDIR_NATIVE}/orbit-idl-2"
> +export SYSROOT = "${STAGING_DIR_HOST}"
> +EXTRA_OEMAKE = "ORBIT_IDL=${STAGING_BINDIR_NATIVE}/orbit-idl-2 SYSROOT=${SYSROOT}"
>  EXTRA_OECONF = "--disable-scrollkeeper"
>  
>  do_stage() {
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



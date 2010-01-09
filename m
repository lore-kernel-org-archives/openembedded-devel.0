Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NTdOJ-000868-4d for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 16:38:18 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NTdMD-0001Ma-Um
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 16:36:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 16:36:05 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 16:36:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 09 Jan 2010 16:35:43 +0100
Message-ID: <hia7oe$i01$1@ger.gmane.org>
References: <1263047335.14620.17.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091222 Shredder/3.0.1pre
In-Reply-To: <1263047335.14620.17.camel@mattotaupa.wohnung.familie-menzel.net>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Put common information in separate file and require it in the recipe.
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
X-List-Received-Date: Sat, 09 Jan 2010 15:38:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Your commit message "Put common information in separate file and require
it   in the recipe." doesn't really tell us what it is about, could you
make it look more like the ones we use in OE? e.g:

vdr: put common information in separate file and require it in the recipe.

regards,

Koen


On 09-01-10 15:28, Paul Menzel wrote:
> Dear OE developers,
> 
> 
> could this please be checked in. I build tested it and it saw no
> differences.
> 
> The patch is also attached.
> 
> 
> Thanks,
> 
> Paul
> 
> ---
> This hopefully lessens the effort to add new versions.
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/vdr/files/linkerflags.patch      |  186 ------------------------------
>  recipes/vdr/vdr-1.7.10/linkerflags.patch |  186 ++++++++++++++++++++++++++++++
>  recipes/vdr/vdr.inc                      |    8 ++
>  recipes/vdr/vdr_1.7.10.bb                |   13 +--
>  4 files changed, 197 insertions(+), 196 deletions(-)
>  delete mode 100644 recipes/vdr/files/linkerflags.patch
>  create mode 100644 recipes/vdr/vdr-1.7.10/linkerflags.patch
>  create mode 100644 recipes/vdr/vdr.inc
> 
> diff --git a/recipes/vdr/files/linkerflags.patch b/recipes/vdr/files/linkerflags.patch
> deleted file mode 100644
> index 63c4477..0000000
> --- a/recipes/vdr/files/linkerflags.patch
> +++ /dev/null
> @@ -1,186 +0,0 @@
> -Index: vdr-1.7.10/Makefile
> -===================================================================
> ---- vdr-1.7.10.orig/Makefile	2010-01-07 22:01:54.000000000 +0100
> -+++ vdr-1.7.10/Makefile	2010-01-07 22:02:32.167165564 +0100
> -@@ -20,7 +20,7 @@
> - MANDIR   = $(PREFIX)/share/man
> - BINDIR   = $(PREFIX)/bin
> - LOCDIR   = ./locale
> --LIBS     = -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig
> -+LIBS     = -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig ${LDFLAGS}
> - INCLUDES = ${CFLAGS}
> - 
> - PLUGINDIR= ./PLUGINS
> -Index: vdr-1.7.10/PLUGINS/src/hello/Makefile
> -===================================================================
> ---- vdr-1.7.10.orig/PLUGINS/src/hello/Makefile	2010-01-07 22:01:07.000000000 +0100
> -+++ vdr-1.7.10/PLUGINS/src/hello/Makefile	2010-01-07 22:02:02.240496954 +0100
> -@@ -19,6 +19,7 @@
> - 
> - CXX      ?= g++
> - CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> -+LIBS     ?= ${LDFLAGS}
> - 
> - ### The directory environment:
> - 
> -@@ -95,7 +96,7 @@
> - ### Targets:
> - 
> - libvdr-$(PLUGIN).so: $(OBJS)
> --	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
> -+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
> - 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> - 
> - dist: clean
> -Index: vdr-1.7.10/PLUGINS/src/osddemo/Makefile
> -===================================================================
> ---- vdr-1.7.10.orig/PLUGINS/src/osddemo/Makefile	2010-01-07 22:01:07.000000000 +0100
> -+++ vdr-1.7.10/PLUGINS/src/osddemo/Makefile	2010-01-07 22:02:02.240496954 +0100
> -@@ -17,6 +17,7 @@
> - 
> - CXX      ?= g++
> - CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> -+LIBS     ?= ${LDFLAGS}
> - 
> - ### The directory environment:
> - 
> -@@ -68,7 +69,7 @@
> - ### Targets:
> - 
> - libvdr-$(PLUGIN).so: $(OBJS)
> --	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
> -+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
> - 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> - 
> - dist: clean
> -Index: vdr-1.7.10/PLUGINS/src/pictures/Makefile
> -===================================================================
> ---- vdr-1.7.10.orig/PLUGINS/src/pictures/Makefile	2010-01-07 22:01:07.000000000 +0100
> -+++ vdr-1.7.10/PLUGINS/src/pictures/Makefile	2010-01-07 22:02:02.240496954 +0100
> -@@ -19,6 +19,7 @@
> - 
> - CXX      ?= g++
> - CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> -+LIBS     ?= ${LDFLAGS}
> - 
> - ### The directory environment:
> - 
> -@@ -95,7 +96,7 @@
> - ### Targets:
> - 
> - libvdr-$(PLUGIN).so: $(OBJS)
> --	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
> -+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
> - 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> - 
> - dist: clean
> -Index: vdr-1.7.10/PLUGINS/src/servicedemo/Makefile
> -===================================================================
> ---- vdr-1.7.10.orig/PLUGINS/src/servicedemo/Makefile	2010-01-07 22:01:07.000000000 +0100
> -+++ vdr-1.7.10/PLUGINS/src/servicedemo/Makefile	2010-01-07 22:02:02.240496954 +0100
> -@@ -19,6 +19,7 @@
> - 
> - CXX      ?= g++
> - CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> -+LIBS     ?= ${LDFLAGS}
> - 
> - ### The directory environment:
> - 
> -@@ -70,11 +71,11 @@
> - ### Targets:
> - 
> - libvdr-$(PLUGIN1).so: $(PLUGIN1).o
> --	$(CXX) $(CXXFLAGS) -shared $(PLUGIN1).o -o $@
> -+	$(CXX) $(CXXFLAGS) -shared $(PLUGIN1).o -o $@ $(LIBS)
> - 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> - 
> - libvdr-$(PLUGIN2).so: $(PLUGIN2).o
> --	$(CXX) $(CXXFLAGS) -shared $(PLUGIN2).o -o $@
> -+	$(CXX) $(CXXFLAGS) -shared $(PLUGIN2).o -o $@ $(LIBS)
> - 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> - 
> - dist: clean
> -Index: vdr-1.7.10/PLUGINS/src/skincurses/Makefile
> -===================================================================
> ---- vdr-1.7.10.orig/PLUGINS/src/skincurses/Makefile	2010-01-07 22:01:07.000000000 +0100
> -+++ vdr-1.7.10/PLUGINS/src/skincurses/Makefile	2010-01-07 22:02:02.240496954 +0100
> -@@ -19,6 +19,7 @@
> - 
> - CXX      ?= g++
> - CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> -+LIBS     ?= ${LDFLAGS}
> - 
> - ### The directory environment:
> - 
> -@@ -95,7 +96,7 @@
> - ### Targets:
> - 
> - libvdr-$(PLUGIN).so: $(OBJS)
> --	$(CXX) $(CXXFLAGS) -shared $(OBJS) -lncursesw -o $@
> -+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -lncursesw -o $@ $(LIBS)
> - 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> - 
> - dist: clean
> -Index: vdr-1.7.10/PLUGINS/src/sky/Makefile
> -===================================================================
> ---- vdr-1.7.10.orig/PLUGINS/src/sky/Makefile	2010-01-07 22:01:07.000000000 +0100
> -+++ vdr-1.7.10/PLUGINS/src/sky/Makefile	2010-01-07 22:02:02.240496954 +0100
> -@@ -17,6 +17,7 @@
> - 
> - CXX      ?= g++
> - CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> -+LIBS     ?= ${LDFLAGS}
> - 
> - ### The directory environment:
> - 
> -@@ -68,7 +69,7 @@
> - ### Targets:
> - 
> - libvdr-$(PLUGIN).so: $(OBJS)
> --	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
> -+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
> - 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> - 
> - dist: clean
> -Index: vdr-1.7.10/PLUGINS/src/status/Makefile
> -===================================================================
> ---- vdr-1.7.10.orig/PLUGINS/src/status/Makefile	2010-01-07 22:01:07.000000000 +0100
> -+++ vdr-1.7.10/PLUGINS/src/status/Makefile	2010-01-07 22:02:02.240496954 +0100
> -@@ -17,6 +17,7 @@
> - 
> - CXX      ?= g++
> - CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> -+LIBS     ?= ${LDFLAGS}
> - 
> - ### The directory environment:
> - 
> -@@ -68,7 +69,7 @@
> - ### Targets:
> - 
> - libvdr-$(PLUGIN).so: $(OBJS)
> --	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
> -+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
> - 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> - 
> - dist: clean
> -Index: vdr-1.7.10/PLUGINS/src/svdrpdemo/Makefile
> -===================================================================
> ---- vdr-1.7.10.orig/PLUGINS/src/svdrpdemo/Makefile	2010-01-07 22:01:07.000000000 +0100
> -+++ vdr-1.7.10/PLUGINS/src/svdrpdemo/Makefile	2010-01-07 22:02:02.240496954 +0100
> -@@ -17,6 +17,7 @@
> - 
> - CXX      ?= g++
> - CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> -+LIBS     ?= ${LDFLAGS}
> - 
> - ### The directory environment:
> - 
> -@@ -68,7 +69,7 @@
> - ### Targets:
> - 
> - libvdr-$(PLUGIN).so: $(OBJS)
> --	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
> -+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
> - 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> - 
> - dist: clean
> diff --git a/recipes/vdr/vdr-1.7.10/linkerflags.patch b/recipes/vdr/vdr-1.7.10/linkerflags.patch
> new file mode 100644
> index 0000000..63c4477
> --- /dev/null
> +++ b/recipes/vdr/vdr-1.7.10/linkerflags.patch
> @@ -0,0 +1,186 @@
> +Index: vdr-1.7.10/Makefile
> +===================================================================
> +--- vdr-1.7.10.orig/Makefile	2010-01-07 22:01:54.000000000 +0100
> ++++ vdr-1.7.10/Makefile	2010-01-07 22:02:32.167165564 +0100
> +@@ -20,7 +20,7 @@
> + MANDIR   = $(PREFIX)/share/man
> + BINDIR   = $(PREFIX)/bin
> + LOCDIR   = ./locale
> +-LIBS     = -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig
> ++LIBS     = -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig ${LDFLAGS}
> + INCLUDES = ${CFLAGS}
> + 
> + PLUGINDIR= ./PLUGINS
> +Index: vdr-1.7.10/PLUGINS/src/hello/Makefile
> +===================================================================
> +--- vdr-1.7.10.orig/PLUGINS/src/hello/Makefile	2010-01-07 22:01:07.000000000 +0100
> ++++ vdr-1.7.10/PLUGINS/src/hello/Makefile	2010-01-07 22:02:02.240496954 +0100
> +@@ -19,6 +19,7 @@
> + 
> + CXX      ?= g++
> + CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> ++LIBS     ?= ${LDFLAGS}
> + 
> + ### The directory environment:
> + 
> +@@ -95,7 +96,7 @@
> + ### Targets:
> + 
> + libvdr-$(PLUGIN).so: $(OBJS)
> +-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
> ++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
> + 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> + 
> + dist: clean
> +Index: vdr-1.7.10/PLUGINS/src/osddemo/Makefile
> +===================================================================
> +--- vdr-1.7.10.orig/PLUGINS/src/osddemo/Makefile	2010-01-07 22:01:07.000000000 +0100
> ++++ vdr-1.7.10/PLUGINS/src/osddemo/Makefile	2010-01-07 22:02:02.240496954 +0100
> +@@ -17,6 +17,7 @@
> + 
> + CXX      ?= g++
> + CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> ++LIBS     ?= ${LDFLAGS}
> + 
> + ### The directory environment:
> + 
> +@@ -68,7 +69,7 @@
> + ### Targets:
> + 
> + libvdr-$(PLUGIN).so: $(OBJS)
> +-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
> ++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
> + 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> + 
> + dist: clean
> +Index: vdr-1.7.10/PLUGINS/src/pictures/Makefile
> +===================================================================
> +--- vdr-1.7.10.orig/PLUGINS/src/pictures/Makefile	2010-01-07 22:01:07.000000000 +0100
> ++++ vdr-1.7.10/PLUGINS/src/pictures/Makefile	2010-01-07 22:02:02.240496954 +0100
> +@@ -19,6 +19,7 @@
> + 
> + CXX      ?= g++
> + CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> ++LIBS     ?= ${LDFLAGS}
> + 
> + ### The directory environment:
> + 
> +@@ -95,7 +96,7 @@
> + ### Targets:
> + 
> + libvdr-$(PLUGIN).so: $(OBJS)
> +-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
> ++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
> + 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> + 
> + dist: clean
> +Index: vdr-1.7.10/PLUGINS/src/servicedemo/Makefile
> +===================================================================
> +--- vdr-1.7.10.orig/PLUGINS/src/servicedemo/Makefile	2010-01-07 22:01:07.000000000 +0100
> ++++ vdr-1.7.10/PLUGINS/src/servicedemo/Makefile	2010-01-07 22:02:02.240496954 +0100
> +@@ -19,6 +19,7 @@
> + 
> + CXX      ?= g++
> + CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> ++LIBS     ?= ${LDFLAGS}
> + 
> + ### The directory environment:
> + 
> +@@ -70,11 +71,11 @@
> + ### Targets:
> + 
> + libvdr-$(PLUGIN1).so: $(PLUGIN1).o
> +-	$(CXX) $(CXXFLAGS) -shared $(PLUGIN1).o -o $@
> ++	$(CXX) $(CXXFLAGS) -shared $(PLUGIN1).o -o $@ $(LIBS)
> + 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> + 
> + libvdr-$(PLUGIN2).so: $(PLUGIN2).o
> +-	$(CXX) $(CXXFLAGS) -shared $(PLUGIN2).o -o $@
> ++	$(CXX) $(CXXFLAGS) -shared $(PLUGIN2).o -o $@ $(LIBS)
> + 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> + 
> + dist: clean
> +Index: vdr-1.7.10/PLUGINS/src/skincurses/Makefile
> +===================================================================
> +--- vdr-1.7.10.orig/PLUGINS/src/skincurses/Makefile	2010-01-07 22:01:07.000000000 +0100
> ++++ vdr-1.7.10/PLUGINS/src/skincurses/Makefile	2010-01-07 22:02:02.240496954 +0100
> +@@ -19,6 +19,7 @@
> + 
> + CXX      ?= g++
> + CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> ++LIBS     ?= ${LDFLAGS}
> + 
> + ### The directory environment:
> + 
> +@@ -95,7 +96,7 @@
> + ### Targets:
> + 
> + libvdr-$(PLUGIN).so: $(OBJS)
> +-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -lncursesw -o $@
> ++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -lncursesw -o $@ $(LIBS)
> + 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> + 
> + dist: clean
> +Index: vdr-1.7.10/PLUGINS/src/sky/Makefile
> +===================================================================
> +--- vdr-1.7.10.orig/PLUGINS/src/sky/Makefile	2010-01-07 22:01:07.000000000 +0100
> ++++ vdr-1.7.10/PLUGINS/src/sky/Makefile	2010-01-07 22:02:02.240496954 +0100
> +@@ -17,6 +17,7 @@
> + 
> + CXX      ?= g++
> + CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> ++LIBS     ?= ${LDFLAGS}
> + 
> + ### The directory environment:
> + 
> +@@ -68,7 +69,7 @@
> + ### Targets:
> + 
> + libvdr-$(PLUGIN).so: $(OBJS)
> +-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
> ++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
> + 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> + 
> + dist: clean
> +Index: vdr-1.7.10/PLUGINS/src/status/Makefile
> +===================================================================
> +--- vdr-1.7.10.orig/PLUGINS/src/status/Makefile	2010-01-07 22:01:07.000000000 +0100
> ++++ vdr-1.7.10/PLUGINS/src/status/Makefile	2010-01-07 22:02:02.240496954 +0100
> +@@ -17,6 +17,7 @@
> + 
> + CXX      ?= g++
> + CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> ++LIBS     ?= ${LDFLAGS}
> + 
> + ### The directory environment:
> + 
> +@@ -68,7 +69,7 @@
> + ### Targets:
> + 
> + libvdr-$(PLUGIN).so: $(OBJS)
> +-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
> ++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
> + 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> + 
> + dist: clean
> +Index: vdr-1.7.10/PLUGINS/src/svdrpdemo/Makefile
> +===================================================================
> +--- vdr-1.7.10.orig/PLUGINS/src/svdrpdemo/Makefile	2010-01-07 22:01:07.000000000 +0100
> ++++ vdr-1.7.10/PLUGINS/src/svdrpdemo/Makefile	2010-01-07 22:02:02.240496954 +0100
> +@@ -17,6 +17,7 @@
> + 
> + CXX      ?= g++
> + CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> ++LIBS     ?= ${LDFLAGS}
> + 
> + ### The directory environment:
> + 
> +@@ -68,7 +69,7 @@
> + ### Targets:
> + 
> + libvdr-$(PLUGIN).so: $(OBJS)
> +-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
> ++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
> + 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
> + 
> + dist: clean
> diff --git a/recipes/vdr/vdr.inc b/recipes/vdr/vdr.inc
> new file mode 100644
> index 0000000..2e8cf40
> --- /dev/null
> +++ b/recipes/vdr/vdr.inc
> @@ -0,0 +1,8 @@
> +DESCRIPTION = "Video Disk Recorder (VDR) is a digital sat-receiver program using Linux and DVB technologies. It allows one to record MPEG2 streams, as well as output the stream to TV. It is also possible to watch DVDs (hardware accelerated) with some comfort and use an IR remote control."
> +AUTHOR = "Klaus Schmidinger"
> +LICENSE = "GPLv2"
> +HOMEPAGE = "http://www.tvdr.de"
> +
> +DEPENDS = "fontconfig freetype gettext libcap jpeg virtual/libintl"
> +
> +SRC_URI = "ftp://ftp.tvdr.de/vdr/Developer/${P}.tar.bz2"
> diff --git a/recipes/vdr/vdr_1.7.10.bb b/recipes/vdr/vdr_1.7.10.bb
> index a8fa82c..69ca012 100644
> --- a/recipes/vdr/vdr_1.7.10.bb
> +++ b/recipes/vdr/vdr_1.7.10.bb
> @@ -1,13 +1,7 @@
> -DESCRIPTION = "Video Disk Recorder (VDR) is a digital sat-receiver program using Linux and DVB technologies. It allows one to record MPEG2 streams, as well as output the stream to TV. It is also possible to watch DVDs (hardware accelerated) with some comfort and use an IR remote control."
> -AUTHOR = "Klaus Schmidinger"
> -LICENSE = "GPLv2"
> -HOMEPAGE = "http://www.tvdr.de"
> +require vdr.inc
>  PR = "r2"
>  
> -DEPENDS = "fontconfig freetype gettext libcap jpeg virtual/libintl"
> -
> -SRC_URI = "ftp://ftp.tvdr.de/vdr/Developer/${P}.tar.bz2 \
> -           file://fixpaths.patch;patch=1 \
> +SRC_URI += " file://fixpaths.patch;patch=1 \
>             file://cplusplus.patch;patch=1 \
>             file://disable_plugin.patch;patch=1 \
>             file://linkerflags.patch;patch=1 \
> @@ -27,7 +21,7 @@ do_install () {
>                   'VIDEODIR=/var/lib/vdr/video' \
>                   'PLUGINLIBDIR=${PLUGINDIR}' \
>                   'LOCDIR=${datadir}/locale' \
> -                 install 
> +                 install
>  }
>  
>  PACKAGES_DYNAMIC += "vdr-plugin-*"
> @@ -39,4 +33,3 @@ python populate_packages_prepend () {
>  
>  FILES_${PN} = "${bindir}/* /var/lib/vdr/conf/* ${sysconfdir}/*"
>  FILES_${PN}-dbg += "${PLUGINDIR}/.debug/*"
> -
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLSKJOMkyGM64RGpERAh6rAJ9frGALta8N8FfVcElufMSkPsvofQCfUqXC
0VC8XBqjjXXxXj9sDjik/+8=
=M9AN
-----END PGP SIGNATURE-----




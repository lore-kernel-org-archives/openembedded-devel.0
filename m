Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id D6FC47E66A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 19:11:55 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id u40so40583104qth.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 12:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wKRvtok5VPmuQLua8/5cn9a1/5nhuurQtA+HFfkkyFk=;
	b=MymfXofkPXMsMf95t/tjBGoBUzRdV5tnK5JAmVvj+dIqV9ikshKL6pC6jJ3J1eSkMr
	gbZCmW4LqI1P0Q55ksRugQOspq7O8KtlYdQ2VlJ41ITRRQbVSgTFVuxL+YNUQW1Ua58v
	9tKmk0WAnIwYK2HleqYQ4H2TTsxbwGHf7pCgVMYaqmcdNAkQ57DVjJ3wQVBn1tdd2M4u
	nJgfEt3rJJKBfxcpqulwRNFtbsWXf1ktLdHze6J9fxejJwa8By/BKT1mzltQ4VrHYGg8
	fPAY2EAOjvtDY7t+XbuDrheNxPhJEYN+ukh9j0XBuSpDY7G42ODJes2v2THTzuPmz44W
	y1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wKRvtok5VPmuQLua8/5cn9a1/5nhuurQtA+HFfkkyFk=;
	b=VwDJ8gcg0ckbacMBGoFXRg3bB6XDRsS4GwCEVIgHBsX7knreCpf8ByuBk91XatPueq
	i/lhT5tmM02zQH6Ly4xUmdF1rF6LspEp+pty0LlKJ4K/qjvt0/K/M4O2UuA6j02SRubM
	ksnYVC9VIqdiZY85dpZjZZ+8UIGI6OeknYxcdY38ldNeCj8Jcdj4TH0PebbBGfGCrFnE
	zPwrXkN7u0Zq+FG9twJgtlKWNFmnD/2GPCTCHazCGmVvQ+zFIxw9wDKMrESLee/s75BO
	A65JJiS7OdLIw2ckDnqAp5cZWXYAgJuK0jY7sMr/OwZ76899pzOfe2hGwwtuEsr3dJc9
	4dDQ==
X-Gm-Message-State: APjAAAVcgLq3+6fJ0ByCEsWTOBRhtroqNYOSnXEPaCRcRV++/vc1xlfG
	WM50ttdU7XjeTolPO3t2ACzvMXzg0PXneXDD0Qg=
X-Google-Smtp-Source: APXvYqy1ls6ZXwOfQmrRQtYhfcgtKESfOnisMBSSrujQ5FueJsSvemr9yJ2SX8WI0fpqqfH4YvxlGVxYNMLyIEkl+rM=
X-Received: by 2002:ac8:460d:: with SMTP id p13mr14249136qtn.378.1568574716275;
	Sun, 15 Sep 2019 12:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <1568559873-19974-1-git-send-email-scott@jumpnowtek.com>
	<ed7801d1-0f93-15be-f490-b03fbe9d0a51@gmail.com>
In-Reply-To: <ed7801d1-0f93-15be-f490-b03fbe9d0a51@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Sep 2019 12:11:29 -0700
Message-ID: <CAMKF1srEMc6_V3MZhbrX9UFxyZG6Z-qD6zkWMyy6LqVSU56FUw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Scott Ellis <scottellis.developer@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nmap: Upgrade to 7.80
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
X-List-Received-Date: Sun, 15 Sep 2019 19:11:56 -0000
Content-Type: text/plain; charset="UTF-8"

it also fails to build

https://errors.yoctoproject.org/Errors/Details/270623/

On Sun, Sep 15, 2019 at 9:52 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 9/15/19 8:04 AM, Scott Ellis wrote:
> > Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
> > ---
> >  ... => 0001-Redefine-the-python-library-dir.patch} | 19 +++---
> >  ...lude-time.h-for-time-structure-definition.patch | 78 ----------------------
> >  .../nmap/files/0002-Fix-building-with-libc.patch   | 76 ---------------------
> >  ...Include-time.h-for-time-struct-definition.patch | 37 ++++++++++
> >  .../nmap/files/0003-Fix-building-with-libc.patch   | 46 +++++++++++++
> >  ...shtool-mkdir-with-coreutils-mkdir-command.patch | 48 -------------
> >  .../nmap/{nmap_7.70.bb => nmap_7.80.bb}            | 17 ++---
> >  7 files changed, 98 insertions(+), 223 deletions(-)
> >  rename meta-oe/recipes-security/nmap/files/{nmap-redefine-the-python-library-dir.patch => 0001-Redefine-the-python-library-dir.patch} (72%)
> >  delete mode 100644 meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
> >  delete mode 100644 meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
> >  create mode 100644 meta-oe/recipes-security/nmap/files/0002-Include-time.h-for-time-struct-definition.patch
> >  create mode 100644 meta-oe/recipes-security/nmap/files/0003-Fix-building-with-libc.patch
> >  delete mode 100644 meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
> >  rename meta-oe/recipes-security/nmap/{nmap_7.70.bb => nmap_7.80.bb} (73%)
>
> Why did the LIC_FILES_CHKSUM change?
> Why where the patches dropped?
> The patch updates are missing the standard OE patch formate? no
> Upstream-Status: or Signed-off-by.
>
> >
> > diff --git a/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch b/meta-oe/recipes-security/nmap/files/0001-Redefine-the-python-library-dir.patch
> > similarity index 72%
> > rename from meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
> > rename to meta-oe/recipes-security/nmap/files/0001-Redefine-the-python-library-dir.patch
> > index 356b507..389f0e4 100644
> > --- a/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
> > +++ b/meta-oe/recipes-security/nmap/files/0001-Redefine-the-python-library-dir.patch
> > @@ -1,20 +1,17 @@
> > -[PATCH] redefine the python library install dir
> > +From 2c1af5be159b40bf666fad2088034fe0b7b88a3c Mon Sep 17 00:00:00 2001
> > +From: Scott Ellis <scott@jumpnowtek.com>
> > +Date: Sat, 14 Sep 2019 15:47:31 -0400
> > +Subject: [PATCH 1/3] Redefine the python library dir
> >
> > -Upstream-Status: Pending
> > -
> > -If install-lib is not defined, it is always /usr/lib/, but it
> > -maybe /usr/lib64 for multilib
> > -
> > -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >  ---
> >   Makefile.in | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/Makefile.in b/Makefile.in
> > -index 1bb062c..cced2fb 100644
> > +index 7ac5ae5..eee8863 100644
> >  --- a/Makefile.in
> >  +++ b/Makefile.in
> > -@@ -311,7 +311,7 @@ build-zenmap: $(ZENMAPDIR)/setup.py $(ZENMAPDIR)/zenmapCore/Version.py
> > +@@ -377,7 +377,7 @@ build-zenmap: $(ZENMAPDIR)/setup.py $(ZENMAPDIR)/zenmapCore/Version.py
> >
> >   install-zenmap: $(ZENMAPDIR)/setup.py
> >       $(INSTALL) -d $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
> > @@ -23,7 +20,7 @@ index 1bb062c..cced2fb 100644
> >       $(INSTALL) -c -m 644 docs/zenmap.1 $(DESTDIR)$(mandir)/man1/
> >   # Create a symlink from nmapfe to zenmap if nmapfe doesn't exist or is
> >   # already a link.
> > -@@ -328,7 +328,7 @@ build-nping: $(NPINGDIR)/Makefile nbase_build nsock_build netutil_build $(NPINGD
> > +@@ -394,7 +394,7 @@ build-nping: $(NPINGDIR)/Makefile build-nbase build-nsock build-netutil $(NPINGD
> >       @cd $(NPINGDIR) && $(MAKE)
> >
> >   install-ndiff:
> > @@ -33,5 +30,5 @@ index 1bb062c..cced2fb 100644
> >   NSE_FILES = scripts/script.db scripts/*.nse
> >   NSE_LIB_LUA_FILES = nselib/*.lua nselib/*.luadoc
> >  --
> > -1.9.1
> > +2.7.4
> >
> > diff --git a/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch b/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
> > deleted file mode 100644
> > index 561c8c8..0000000
> > --- a/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
> > +++ /dev/null
> > @@ -1,78 +0,0 @@
> > -From c774f2b129fd5acd5647d92c57a2079ae638a62b Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sun, 20 Jan 2019 23:07:39 -0800
> > -Subject: [PATCH] include time.h for time structure definition
> > -
> > -Exposed by musl/clang
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - nmap_error.cc       | 1 +
> > - nping/EchoServer.cc | 1 +
> > - osscan.cc           | 1 +
> > - osscan2.cc          | 1 +
> > - service_scan.cc     | 1 +
> > - 5 files changed, 5 insertions(+)
> > -
> > -diff --git a/nmap_error.cc b/nmap_error.cc
> > -index 19beafb..ea14e08 100644
> > ---- a/nmap_error.cc
> > -+++ b/nmap_error.cc
> > -@@ -135,6 +135,7 @@
> > - #include "xml.h"
> > -
> > - #include <errno.h>
> > -+#include <time.h>
> > -
> > - extern NmapOps o;
> > -
> > -diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
> > -index 70f39b0..40cd4d6 100644
> > ---- a/nping/EchoServer.cc
> > -+++ b/nping/EchoServer.cc
> > -@@ -137,6 +137,7 @@
> > - #include "NpingOps.h"
> > - #include "ProbeMode.h"
> > - #include <signal.h>
> > -+#include <time.h>
> > -
> > - extern NpingOps o;
> > - extern EchoServer es;
> > -diff --git a/osscan.cc b/osscan.cc
> > -index f851f60..6ae0c83 100644
> > ---- a/osscan.cc
> > -+++ b/osscan.cc
> > -@@ -149,6 +149,7 @@
> > - #  include <time.h>
> > - # endif
> > - #endif
> > -+#include <time.h>
> > -
> > - #include <algorithm>
> > - #include <list>
> > -diff --git a/osscan2.cc b/osscan2.cc
> > -index e341947..887fbd2 100644
> > ---- a/osscan2.cc
> > -+++ b/osscan2.cc
> > -@@ -147,6 +147,7 @@
> > -
> > - #include <list>
> > - #include <math.h>
> > -+#include <time.h>
> > -
> > - extern NmapOps o;
> > - #ifdef WIN32
> > -diff --git a/service_scan.cc b/service_scan.cc
> > -index 9780ae3..e07b940 100644
> > ---- a/service_scan.cc
> > -+++ b/service_scan.cc
> > -@@ -145,6 +145,7 @@
> > - #include "nmap_tty.h"
> > -
> > - #include <errno.h>
> > -+#include <time.h>
> > -
> > - #if HAVE_OPENSSL
> > - /* OpenSSL 1.0.0 needs _WINSOCKAPI_ to be defined, otherwise it loads
> > diff --git a/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch b/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
> > deleted file mode 100644
> > index 064be8f..0000000
> > --- a/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-libc.patch
> > +++ /dev/null
> > @@ -1,76 +0,0 @@
> > -From 2a361989b5f84ec23ba7ccb6e527a5590ff55deb Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sun, 20 Jan 2019 23:11:56 -0800
> > -Subject: [PATCH] Fix building with libc++
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - nping/EchoServer.cc | 16 ++++++++--------
> > - 1 file changed, 8 insertions(+), 8 deletions(-)
> > -
> > -diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
> > -index 40cd4d6..04433e1 100644
> > ---- a/nping/EchoServer.cc
> > -+++ b/nping/EchoServer.cc
> > -@@ -282,14 +282,14 @@ int EchoServer::nep_listen_socket(){
> > -         server_addr6.sin6_len = sizeof(struct sockaddr_in6);
> > -     #endif
> > -     /* Bind to local address and the specified port */
> > --    if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
> > -+    if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
> > -         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr6.sin6_addr), port);
> > -         /* If the bind failed for the supplied address, just try again with in6addr_any */
> > -         if( o.spoofSource() ){
> > -             server_addr6.sin6_addr = in6addr_any;
> > --            if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
> > -+            if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
> > -                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
> > --            }else{
> > -+            }else{
> > -                 nping_print(VB_1, "Server bound to port %d", port);
> > -             }
> > -         }
> > -@@ -320,12 +320,12 @@ int EchoServer::nep_listen_socket(){
> > - #endif
> > -
> > -     /* Bind to local address and the specified port */
> > --    if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
> > -+    if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
> > -         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr4.sin_addr), port);
> > -         /* If the bind failed for the supplied address, just try again with in6addr_any */
> > -         if( o.spoofSource() ){
> > -             server_addr4.sin_addr.s_addr=INADDR_ANY;
> > --            if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
> > -+            if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
> > -                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
> > -             }else{
> > -                 nping_print(VB_1, "Server bound to port %d", port);
> > -@@ -561,7 +561,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
> > -                             nping_print(DBG_3, ";");
> > -                             /* The payload magic may affect the score only between
> > -                              * zero and 4 bytes. This is done to prevent long
> > --                             * common strings like "GET / HTTP/1.1\r\n"
> > -+                             * common strings like "GET / HTTP/1.1\r\n"
> > -                              * increasing the score a lot and cause problems for
> > -                              * the matching logic. */
> > -                             current_score+= MIN(4, fspec->len)*FACTOR_PAYLOAD_MAGIC;
> > -@@ -571,7 +571,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4, IPv6Header *ip6, TCPHe
> > -                     default:
> > -                         nping_warning(QT_2, "Bogus field specifier found in client #%d context. Please report a bug", ctx->getIdentifier());
> > -                     break;
> > --                }
> > -+                }
> > -             } /* End of field specifiers loop */
> > -
> > -             nping_print(DBG_3, "%s() current_score=%.02f candidate_score=%.02f", __func__, current_score, candidate_score);
> > -@@ -650,7 +650,7 @@ clientid_t EchoServer::nep_match_packet(const u8 *pkt, size_t pktlen){
> > -                 }else{
> > -                     if( (tcplen=tcp.validate())==OP_FAILURE){
> > -                         return CLIENT_NOT_FOUND;
> > --                    }else{
> > -+                    }else{
> > -                         if( (int)pktlen > (iplen+tcplen) ){
> > -                            if( payload.storeRecvData(pkt+iplen+tcplen, pktlen-iplen-tcplen)!=OP_FAILURE)
> > -                                payload_included=true;
> > diff --git a/meta-oe/recipes-security/nmap/files/0002-Include-time.h-for-time-struct-definition.patch b/meta-oe/recipes-security/nmap/files/0002-Include-time.h-for-time-struct-definition.patch
> > new file mode 100644
> > index 0000000..9755288
> > --- /dev/null
> > +++ b/meta-oe/recipes-security/nmap/files/0002-Include-time.h-for-time-struct-definition.patch
> > @@ -0,0 +1,37 @@
> > +From 6decd89b609a2175156848e75b340a8166fbd647 Mon Sep 17 00:00:00 2001
> > +From: Scott Ellis <scott@jumpnowtek.com>
> > +Date: Sat, 14 Sep 2019 15:55:29 -0400
> > +Subject: [PATCH 2/3] Include time.h for time struct definition
> > +
> > +---
> > + nping/EchoServer.cc | 1 +
> > + osscan2.cc          | 1 +
> > + 2 files changed, 2 insertions(+)
> > +
> > +diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
> > +index ccdcf9c..c403aed 100644
> > +--- a/nping/EchoServer.cc
> > ++++ b/nping/EchoServer.cc
> > +@@ -137,6 +137,7 @@
> > + #include "NpingOps.h"
> > + #include "ProbeMode.h"
> > + #include <signal.h>
> > ++#include <time.h>
> > +
> > + extern NpingOps o;
> > + extern EchoServer es;
> > +diff --git a/osscan2.cc b/osscan2.cc
> > +index aa31feb..89673e1 100644
> > +--- a/osscan2.cc
> > ++++ b/osscan2.cc
> > +@@ -147,6 +147,7 @@
> > +
> > + #include <list>
> > + #include <math.h>
> > ++#include <time.h>
> > +
> > + extern NmapOps o;
> > + #ifdef WIN32
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-oe/recipes-security/nmap/files/0003-Fix-building-with-libc.patch b/meta-oe/recipes-security/nmap/files/0003-Fix-building-with-libc.patch
> > new file mode 100644
> > index 0000000..6c60f6a
> > --- /dev/null
> > +++ b/meta-oe/recipes-security/nmap/files/0003-Fix-building-with-libc.patch
> > @@ -0,0 +1,46 @@
> > +From dabe64926f7fc33ebe81291d75d7ddcb8128f48a Mon Sep 17 00:00:00 2001
> > +From: Scott Ellis <scott@jumpnowtek.com>
> > +Date: Sat, 14 Sep 2019 15:57:48 -0400
> > +Subject: [PATCH 3/3] Fix building with libc
> > +
> > +---
> > + nping/EchoServer.cc | 8 ++++----
> > + 1 file changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
> > +index c403aed..7b23a2a 100644
> > +--- a/nping/EchoServer.cc
> > ++++ b/nping/EchoServer.cc
> > +@@ -282,12 +282,12 @@ int EchoServer::nep_listen_socket(){
> > +         server_addr6.sin6_len = sizeof(struct sockaddr_in6);
> > +     #endif
> > +     /* Bind to local address and the specified port */
> > +-    if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
> > ++    if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
> > +         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr6.sin6_addr), port);
> > +         /* If the bind failed for the supplied address, just try again with in6addr_any */
> > +         if( o.spoofSource() ){
> > +             server_addr6.sin6_addr = in6addr_any;
> > +-            if( bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
> > ++            if( ::bind(master_sd, (struct sockaddr *)&server_addr6, sizeof(server_addr6)) != 0 ){
> > +                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
> > +             }else{
> > +                 nping_print(VB_1, "Server bound to port %d", port);
> > +@@ -320,12 +320,12 @@ int EchoServer::nep_listen_socket(){
> > + #endif
> > +
> > +     /* Bind to local address and the specified port */
> > +-    if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
> > ++    if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
> > +         nping_warning(QT_3, "Failed to bind to source address %s. Trying to bind to port %d...", IPtoa(server_addr4.sin_addr), port);
> > +         /* If the bind failed for the supplied address, just try again with in6addr_any */
> > +         if( o.spoofSource() ){
> > +             server_addr4.sin_addr.s_addr=INADDR_ANY;
> > +-            if( bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
> > ++            if( ::bind(master_sd, (struct sockaddr *)&server_addr4, sizeof(server_addr4)) != 0 ){
> > +                 nping_fatal(QT_3, "Could not bind to port %d (%s).", port, strerror(errno));
> > +             }else{
> > +                 nping_print(VB_1, "Server bound to port %d", port);
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch b/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
> > deleted file mode 100644
> > index cfe043a..0000000
> > --- a/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
> > +++ /dev/null
> > @@ -1,48 +0,0 @@
> > -[PATCH] replace "./shtool mkdir" with coreutils mkdir command
> > -
> > -Upstream-Status: Pending
> > -
> > -"./shtool mkdir" is used when mkdir has not -p parameter, but mkdir in today
> > -most release has supportted the -p parameter, not need to use shtool, and it
> > -can not fix the race if two process are running mkdir to create same dir
> > -
> > -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > ----
> > - ncat/Makefile.in        | 4 ++--
> > - nmap-update/Makefile.in | 2 +-
> > - 2 files changed, 3 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/ncat/Makefile.in b/ncat/Makefile.in
> > -index cfd306d..2166e08 100644
> > ---- a/ncat/Makefile.in
> > -+++ b/ncat/Makefile.in
> > -@@ -163,11 +163,11 @@ $(NSOCKDIR)/libnsock.a: $(NSOCKDIR)/Makefile
> > -
> > - install: $(TARGET)
> > -     @echo Installing Ncat;
> > --    $(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
> > -+    mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
> > -     $(INSTALL) -c -m 755 ncat $(DESTDIR)$(bindir)/ncat
> > -     $(STRIP) -x $(DESTDIR)$(bindir)/ncat
> > -     if [ -n "$(DATAFILES)" ]; then \
> > --            $(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(pkgdatadir); \
> > -+            mkdir -p -m 755 $(DESTDIR)$(pkgdatadir); \
> > -             $(INSTALL) -c -m 644 $(DATAFILES) $(DESTDIR)$(pkgdatadir)/; \
> > -     fi
> > -     $(INSTALL) -c -m 644 docs/$(TARGET).1 $(DESTDIR)$(mandir)/man1/$(TARGET).1
> > -diff --git a/nmap-update/Makefile.in b/nmap-update/Makefile.in
> > -index 89ff928..93f48d8 100644
> > ---- a/nmap-update/Makefile.in
> > -+++ b/nmap-update/Makefile.in
> > -@@ -37,7 +37,7 @@ $(NBASELIB):
> > -     cd $(NBASEDIR) && $(MAKE)
> > -
> > - install: nmap-update
> > --    $(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
> > -+    mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
> > -     $(INSTALL) -c -m 755 nmap-update $(DESTDIR)$(bindir)
> > -     $(STRIP) -x $(DESTDIR)$(bindir)/nmap-update
> > -     $(INSTALL) -c -m 644 ../docs/nmap-update.1 $(DESTDIR)$(mandir)/man1/
> > ---
> > -1.9.1
> > -
> > diff --git a/meta-oe/recipes-security/nmap/nmap_7.70.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
> > similarity index 73%
> > rename from meta-oe/recipes-security/nmap/nmap_7.70.bb
> > rename to meta-oe/recipes-security/nmap/nmap_7.80.bb
> > index b1b150a..2d66ef2 100644
> > --- a/meta-oe/recipes-security/nmap/nmap_7.70.bb
> > +++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
> > @@ -3,17 +3,16 @@ DESCRIPTION = "Nmap ("Network Mapper") is a free and open source (license) utili
> >  SECTION = "security"
> >  LICENSE = "GPL-2.0"
> >
> > -LIC_FILES_CHKSUM = "file://COPYING;beginline=7;endline=12;md5=1489288f46af415fadc4e8b6345ab9f4"
> > +LIC_FILES_CHKSUM = "file://COPYING;beginline=7;endline=12;md5=66938a7e5b4c118eda78271de14874c2"
> >
> > -SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
> > -           file://nmap-redefine-the-python-library-dir.patch \
> > -           file://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch \
> > -           file://0001-include-time.h-for-time-structure-definition.patch \
> > -           file://0002-Fix-building-with-libc.patch \
> > +SRCREV = "7ce92c68df276c4321525c2f754ffe2deb9eb920"
> > +SRC_URI = "git://github.com/nmap/nmap.git;branch=master \
> > +           file://0001-Redefine-the-python-library-dir.patch \
> > +           file://0002-Include-time.h-for-time-struct-definition.patch \
> > +           file://0003-Fix-building-with-libc.patch \
> >             "
> >
> > -SRC_URI[md5sum] = "84eb6fbe788e0d4918c2b1e39421bf79"
> > -SRC_URI[sha256sum] = "847b068955f792f4cc247593aca6dc3dc4aae12976169873247488de147a6e18"
> > +S = "${WORKDIR}/git"
> >
> >  inherit autotools-brokensep pkgconfig pythonnative
> >
> > @@ -48,5 +47,3 @@ do_configure() {
> >  }
> >
> >  FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
> > -
> > -RDEPENDS_${PN} = "python"
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


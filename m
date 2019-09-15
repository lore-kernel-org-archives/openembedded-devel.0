Return-Path: <scott@jumpnowtek.com>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 15 Sep 2019 19:56:48 UTC
Received: from smtp102.iad3a.emailsrvr.com (smtp102.iad3a.emailsrvr.com
	[173.203.187.102])
	by mail.openembedded.org (Postfix) with ESMTP id E4F0E7E53D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 19:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
	s=20190322-9u7zjiwi; t=1568577105;
	bh=WhW3Bo2ldvskFExaPQ7A3V1fvChJO1siyhNWcC6UkqU=;
	h=Date:Subject:From:To:From;
	b=C+FHiyMDqJNQEcrsM6ovTQfBKB59NpDGBYgWxCLkOo7wT1X5cmUb1gbC1ziKJiMNt
	KbEbdvYSrCsgeUcQFF06Ntsl5RiFtlQ757mYjsc5TlCJ8TnxGDv6ipKQ9TLXUFut60
	9B3/wQZ4UaHEQsjQVSTE2/ABvmBjPLTCxKaBeLS8=
Received: from app43.wa-webapps.iad3a (relay-webapps.rsapps.net
	[172.27.255.140])
	by smtp29.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	63FF31F817; Sun, 15 Sep 2019 15:51:45 -0400 (EDT)
X-Sender-Id: scott@jumpnowtek.com
Received: from app43.wa-webapps.iad3a (relay-webapps.rsapps.net
	[172.27.255.140]) by 0.0.0.0:25 (trex/5.7.12);
	Sun, 15 Sep 2019 15:51:45 -0400
Received: from jumpnowtek.com (localhost.localdomain [127.0.0.1])
	by app43.wa-webapps.iad3a (Postfix) with ESMTP id 4EEE160046;
	Sun, 15 Sep 2019 15:51:45 -0400 (EDT)
Received: by apps.rackspace.com (Authenticated sender: scott@jumpnowtek.com,
	from: scott@jumpnowtek.com) 
	with HTTP; Sun, 15 Sep 2019 15:51:45 -0400 (EDT)
X-Auth-ID: scott@jumpnowtek.com
Date: Sun, 15 Sep 2019 15:51:45 -0400 (EDT)
From: "Scott Ellis" <scott@jumpnowtek.com>
To: "Khem Raj" <raj.khem@gmail.com>
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Type: plain
In-Reply-To: <CAMKF1srEMc6_V3MZhbrX9UFxyZG6Z-qD6zkWMyy6LqVSU56FUw@mail.gmail.com>
References: <1568559873-19974-1-git-send-email-scott@jumpnowtek.com> 
	<ed7801d1-0f93-15be-f490-b03fbe9d0a51@gmail.com> 
	<CAMKF1srEMc6_V3MZhbrX9UFxyZG6Z-qD6zkWMyy6LqVSU56FUw@mail.gmail.com>
Message-ID: <1568577105.319116051@apps.rackspace.com>
X-Mailer: webmail/16.6.0-RC
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
X-List-Received-Date: Sun, 15 Sep 2019 19:56:49 -0000
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Only tested arm64 and x86 with gcc.=0A=0AWorks fine for those.=0A=0AI have =
been doing a lot of NSE testing using it the last few days.=0A=0AThe 7.70 r=
ecipe patches did not apply, hence the new patches.=0A=0AYou may as well dr=
op my PATCH request then. =0A=0AI won't have time to look at clang builds u=
ntil next weekend the earliest.=0A=0A=0A"Khem Raj" <raj.khem@gmail.com> sai=
d:=0A=0A> it also fails to build=0A> =0A> https://errors.yoctoproject.org/E=
rrors/Details/270623/=0A> =0A> On Sun, Sep 15, 2019 at 9:52 AM akuster808 <=
akuster808@gmail.com> wrote:=0A>>=0A>>=0A>>=0A>> On 9/15/19 8:04 AM, Scott =
Ellis wrote:=0A>> > Signed-off-by: Scott Ellis <scott@jumpnowtek.com>=0A>> =
> ---=0A>> >  ... =3D> 0001-Redefine-the-python-library-dir.patch} | 19 +++=
---=0A>> >  ...lude-time.h-for-time-structure-definition.patch | 78=0A>> --=
--------------------=0A>> >  .../nmap/files/0002-Fix-building-with-libc.pat=
ch   | 76 ---------------------=0A>> >  ...Include-time.h-for-time-struct-d=
efinition.patch | 37 ++++++++++=0A>> >  .../nmap/files/0003-Fix-building-wi=
th-libc.patch   | 46 +++++++++++++=0A>> >  ...shtool-mkdir-with-coreutils-m=
kdir-command.patch | 48 -------------=0A>> >  .../nmap/{nmap_7.70.bb =3D> n=
map_7.80.bb}            | 17 ++---=0A>> >  7 files changed, 98 insertions(+=
), 223 deletions(-)=0A>> >  rename=0A>> meta-oe/recipes-security/nmap/files=
/{nmap-redefine-the-python-library-dir.patch=0A>> =3D> 0001-Redefine-the-py=
thon-library-dir.patch} (72%)=0A>> >  delete mode 100644=0A>> meta-oe/recip=
es-security/nmap/files/0001-include-time.h-for-time-structure-definition.pa=
tch=0A>> >  delete mode 100644=0A>> meta-oe/recipes-security/nmap/files/000=
2-Fix-building-with-libc.patch=0A>> >  create mode 100644=0A>> meta-oe/reci=
pes-security/nmap/files/0002-Include-time.h-for-time-struct-definition.patc=
h=0A>> >  create mode 100644=0A>> meta-oe/recipes-security/nmap/files/0003-=
Fix-building-with-libc.patch=0A>> >  delete mode 100644=0A>> meta-oe/recipe=
s-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-comman=
d.patch=0A>> >  rename meta-oe/recipes-security/nmap/{nmap_7.70.bb =3D> nma=
p_7.80.bb} (73%)=0A>>=0A>> Why did the LIC_FILES_CHKSUM change?=0A>> Why wh=
ere the patches dropped?=0A>> The patch updates are missing the standard OE=
 patch formate? no=0A>> Upstream-Status: or Signed-off-by.=0A>>=0A>> >=0A>>=
 > diff --git=0A>> a/meta-oe/recipes-security/nmap/files/nmap-redefine-the-=
python-library-dir.patch=0A>> b/meta-oe/recipes-security/nmap/files/0001-Re=
define-the-python-library-dir.patch=0A>> > similarity index 72%=0A>> > rena=
me from=0A>> meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-l=
ibrary-dir.patch=0A>> > rename to=0A>> meta-oe/recipes-security/nmap/files/=
0001-Redefine-the-python-library-dir.patch=0A>> > index 356b507..389f0e4 10=
0644=0A>> > ---=0A>> a/meta-oe/recipes-security/nmap/files/nmap-redefine-th=
e-python-library-dir.patch=0A>> > +++=0A>> b/meta-oe/recipes-security/nmap/=
files/0001-Redefine-the-python-library-dir.patch=0A>> > @@ -1,20 +1,17 @@=
=0A>> > -[PATCH] redefine the python library install dir=0A>> > +From 2c1af=
5be159b40bf666fad2088034fe0b7b88a3c Mon Sep 17 00:00:00 2001=0A>> > +From: =
Scott Ellis <scott@jumpnowtek.com>=0A>> > +Date: Sat, 14 Sep 2019 15:47:31 =
-0400=0A>> > +Subject: [PATCH 1/3] Redefine the python library dir=0A>> >=
=0A>> > -Upstream-Status: Pending=0A>> > -=0A>> > -If install-lib is not de=
fined, it is always /usr/lib/, but it=0A>> > -maybe /usr/lib64 for multilib=
=0A>> > -=0A>> > -Signed-off-by: Roy Li <rongqing.li@windriver.com>=0A>> > =
 ---=0A>> >   Makefile.in | 4 ++--=0A>> >   1 file changed, 2 insertions(+)=
, 2 deletions(-)=0A>> >=0A>> >  diff --git a/Makefile.in b/Makefile.in=0A>>=
 > -index 1bb062c..cced2fb 100644=0A>> > +index 7ac5ae5..eee8863 100644=0A>=
> >  --- a/Makefile.in=0A>> >  +++ b/Makefile.in=0A>> > -@@ -311,7 +311,7 @=
@ build-zenmap: $(ZENMAPDIR)/setup.py=0A>> $(ZENMAPDIR)/zenmapCore/Version.=
py=0A>> > +@@ -377,7 +377,7 @@ build-zenmap: $(ZENMAPDIR)/setup.py=0A>> $(Z=
ENMAPDIR)/zenmapCore/Version.py=0A>> >=0A>> >   install-zenmap: $(ZENMAPDIR=
)/setup.py=0A>> >       $(INSTALL) -d $(DESTDIR)$(bindir) $(DESTDIR)$(mandi=
r)/man1=0A>> > @@ -23,7 +20,7 @@ index 1bb062c..cced2fb 100644=0A>> >      =
 $(INSTALL) -c -m 644 docs/zenmap.1 $(DESTDIR)$(mandir)/man1/=0A>> >   # Cr=
eate a symlink from nmapfe to zenmap if nmapfe doesn't exist or is=0A>> >  =
 # already a link.=0A>> > -@@ -328,7 +328,7 @@ build-nping: $(NPINGDIR)/Mak=
efile nbase_build nsock_build=0A>> netutil_build $(NPINGD=0A>> > +@@ -394,7=
 +394,7 @@ build-nping: $(NPINGDIR)/Makefile build-nbase build-nsock=0A>> b=
uild-netutil $(NPINGD=0A>> >       @cd $(NPINGDIR) && $(MAKE)=0A>> >=0A>> >=
   install-ndiff:=0A>> > @@ -33,5 +30,5 @@ index 1bb062c..cced2fb 100644=0A=
>> >   NSE_FILES =3D scripts/script.db scripts/*.nse=0A>> >   NSE_LIB_LUA_F=
ILES =3D nselib/*.lua nselib/*.luadoc=0A>> >  --=0A>> > -1.9.1=0A>> > +2.7.=
4=0A>> >=0A>> > diff --git=0A>> a/meta-oe/recipes-security/nmap/files/0001-=
include-time.h-for-time-structure-definition.patch=0A>> b/meta-oe/recipes-s=
ecurity/nmap/files/0001-include-time.h-for-time-structure-definition.patch=
=0A>> > deleted file mode 100644=0A>> > index 561c8c8..0000000=0A>> > ---=
=0A>> a/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-st=
ructure-definition.patch=0A>> > +++ /dev/null=0A>> > @@ -1,78 +0,0 @@=0A>> =
> -From c774f2b129fd5acd5647d92c57a2079ae638a62b Mon Sep 17 00:00:00 2001=
=0A>> > -From: Khem Raj <raj.khem@gmail.com>=0A>> > -Date: Sun, 20 Jan 2019=
 23:07:39 -0800=0A>> > -Subject: [PATCH] include time.h for time structure =
definition=0A>> > -=0A>> > -Exposed by musl/clang=0A>> > -=0A>> > -Upstream=
-Status: Pending=0A>> > -=0A>> > -Signed-off-by: Khem Raj <raj.khem@gmail.c=
om>=0A>> > ----=0A>> > - nmap_error.cc       | 1 +=0A>> > - nping/EchoServe=
r.cc | 1 +=0A>> > - osscan.cc           | 1 +=0A>> > - osscan2.cc          =
| 1 +=0A>> > - service_scan.cc     | 1 +=0A>> > - 5 files changed, 5 insert=
ions(+)=0A>> > -=0A>> > -diff --git a/nmap_error.cc b/nmap_error.cc=0A>> > =
-index 19beafb..ea14e08 100644=0A>> > ---- a/nmap_error.cc=0A>> > -+++ b/nm=
ap_error.cc=0A>> > -@@ -135,6 +135,7 @@=0A>> > - #include "xml.h"=0A>> > -=
=0A>> > - #include <errno.h>=0A>> > -+#include <time.h>=0A>> > -=0A>> > - e=
xtern NmapOps o;=0A>> > -=0A>> > -diff --git a/nping/EchoServer.cc b/nping/=
EchoServer.cc=0A>> > -index 70f39b0..40cd4d6 100644=0A>> > ---- a/nping/Ech=
oServer.cc=0A>> > -+++ b/nping/EchoServer.cc=0A>> > -@@ -137,6 +137,7 @@=0A=
>> > - #include "NpingOps.h"=0A>> > - #include "ProbeMode.h"=0A>> > - #incl=
ude <signal.h>=0A>> > -+#include <time.h>=0A>> > -=0A>> > - extern NpingOps=
 o;=0A>> > - extern EchoServer es;=0A>> > -diff --git a/osscan.cc b/osscan.=
cc=0A>> > -index f851f60..6ae0c83 100644=0A>> > ---- a/osscan.cc=0A>> > -++=
+ b/osscan.cc=0A>> > -@@ -149,6 +149,7 @@=0A>> > - #  include <time.h>=0A>>=
 > - # endif=0A>> > - #endif=0A>> > -+#include <time.h>=0A>> > -=0A>> > - #=
include <algorithm>=0A>> > - #include <list>=0A>> > -diff --git a/osscan2.c=
c b/osscan2.cc=0A>> > -index e341947..887fbd2 100644=0A>> > ---- a/osscan2.=
cc=0A>> > -+++ b/osscan2.cc=0A>> > -@@ -147,6 +147,7 @@=0A>> > -=0A>> > - #=
include <list>=0A>> > - #include <math.h>=0A>> > -+#include <time.h>=0A>> >=
 -=0A>> > - extern NmapOps o;=0A>> > - #ifdef WIN32=0A>> > -diff --git a/se=
rvice_scan.cc b/service_scan.cc=0A>> > -index 9780ae3..e07b940 100644=0A>> =
> ---- a/service_scan.cc=0A>> > -+++ b/service_scan.cc=0A>> > -@@ -145,6 +1=
45,7 @@=0A>> > - #include "nmap_tty.h"=0A>> > -=0A>> > - #include <errno.h>=
=0A>> > -+#include <time.h>=0A>> > -=0A>> > - #if HAVE_OPENSSL=0A>> > - /* =
OpenSSL 1.0.0 needs _WINSOCKAPI_ to be defined, otherwise it loads=0A>> > d=
iff --git=0A>> a/meta-oe/recipes-security/nmap/files/0002-Fix-building-with=
-libc.patch=0A>> b/meta-oe/recipes-security/nmap/files/0002-Fix-building-wi=
th-libc.patch=0A>> > deleted file mode 100644=0A>> > index 064be8f..0000000=
=0A>> > --- a/meta-oe/recipes-security/nmap/files/0002-Fix-building-with-li=
bc.patch=0A>> > +++ /dev/null=0A>> > @@ -1,76 +0,0 @@=0A>> > -From 2a361989=
b5f84ec23ba7ccb6e527a5590ff55deb Mon Sep 17 00:00:00 2001=0A>> > -From: Khe=
m Raj <raj.khem@gmail.com>=0A>> > -Date: Sun, 20 Jan 2019 23:11:56 -0800=0A=
>> > -Subject: [PATCH] Fix building with libc++=0A>> > -=0A>> > -Upstream-S=
tatus: Pending=0A>> > -=0A>> > -Signed-off-by: Khem Raj <raj.khem@gmail.com=
>=0A>> > ----=0A>> > - nping/EchoServer.cc | 16 ++++++++--------=0A>> > - 1=
 file changed, 8 insertions(+), 8 deletions(-)=0A>> > -=0A>> > -diff --git =
a/nping/EchoServer.cc b/nping/EchoServer.cc=0A>> > -index 40cd4d6..04433e1 =
100644=0A>> > ---- a/nping/EchoServer.cc=0A>> > -+++ b/nping/EchoServer.cc=
=0A>> > -@@ -282,14 +282,14 @@ int EchoServer::nep_listen_socket(){=0A>> > =
-         server_addr6.sin6_len =3D sizeof(struct sockaddr_in6);=0A>> > -  =
   #endif=0A>> > -     /* Bind to local address and the specified port */=
=0A>> > --    if( bind(master_sd, (struct sockaddr *)&server_addr6,=0A>> si=
zeof(server_addr6)) !=3D 0 ){=0A>> > -+    if( ::bind(master_sd, (struct so=
ckaddr *)&server_addr6,=0A>> sizeof(server_addr6)) !=3D 0 ){=0A>> > -      =
   nping_warning(QT_3, "Failed to bind to source address %s. Trying to=0A>>=
 bind to port %d...", IPtoa(server_addr6.sin6_addr), port);=0A>> > -       =
  /* If the bind failed for the supplied address, just try again with=0A>> =
in6addr_any */=0A>> > -         if( o.spoofSource() ){=0A>> > -            =
 server_addr6.sin6_addr =3D in6addr_any;=0A>> > --            if( bind(mast=
er_sd, (struct sockaddr *)&server_addr6,=0A>> sizeof(server_addr6)) !=3D 0 =
){=0A>> > -+            if( ::bind(master_sd, (struct sockaddr *)&server_ad=
dr6,=0A>> sizeof(server_addr6)) !=3D 0 ){=0A>> > -                 nping_fa=
tal(QT_3, "Could not bind to port %d (%s).", port,=0A>> strerror(errno));=
=0A>> > --            }else{=0A>> > -+            }else{=0A>> > -          =
       nping_print(VB_1, "Server bound to port %d", port);=0A>> > -        =
     }=0A>> > -         }=0A>> > -@@ -320,12 +320,12 @@ int EchoServer::nep=
_listen_socket(){=0A>> > - #endif=0A>> > -=0A>> > -     /* Bind to local ad=
dress and the specified port */=0A>> > --    if( bind(master_sd, (struct so=
ckaddr *)&server_addr4,=0A>> sizeof(server_addr4)) !=3D 0 ){=0A>> > -+    i=
f( ::bind(master_sd, (struct sockaddr *)&server_addr4,=0A>> sizeof(server_a=
ddr4)) !=3D 0 ){=0A>> > -         nping_warning(QT_3, "Failed to bind to so=
urce address %s. Trying to=0A>> bind to port %d...", IPtoa(server_addr4.sin=
_addr), port);=0A>> > -         /* If the bind failed for the supplied addr=
ess, just try again with=0A>> in6addr_any */=0A>> > -         if( o.spoofSo=
urce() ){=0A>> > -             server_addr4.sin_addr.s_addr=3DINADDR_ANY;=
=0A>> > --            if( bind(master_sd, (struct sockaddr *)&server_addr4,=
=0A>> sizeof(server_addr4)) !=3D 0 ){=0A>> > -+            if( ::bind(maste=
r_sd, (struct sockaddr *)&server_addr4,=0A>> sizeof(server_addr4)) !=3D 0 )=
{=0A>> > -                 nping_fatal(QT_3, "Could not bind to port %d (%s=
).", port,=0A>> strerror(errno));=0A>> > -             }else{=0A>> > -     =
            nping_print(VB_1, "Server bound to port %d", port);=0A>> > -@@ =
-561,7 +561,7 @@ clientid_t EchoServer::nep_match_headers(IPv4Header *ip4,=
=0A>> IPv6Header *ip6, TCPHe=0A>> > -                             nping_pri=
nt(DBG_3, ";");=0A>> > -                             /* The payload magic m=
ay affect the score only=0A>> between=0A>> > -                             =
 * zero and 4 bytes. This is done to prevent=0A>> long=0A>> > --           =
                  * common strings like "GET / HTTP/1.1\r\n"=0A>> > -+     =
                        * common strings like "GET / HTTP/1.1\r\n"=0A>> > -=
                              * increasing the score a lot and cause proble=
ms=0A>> for=0A>> > -                              * the matching logic. */=
=0A>> > -                             current_score+=3D MIN(4,=0A>> fspec->=
len)*FACTOR_PAYLOAD_MAGIC;=0A>> > -@@ -571,7 +571,7 @@ clientid_t EchoServe=
r::nep_match_headers(IPv4Header *ip4,=0A>> IPv6Header *ip6, TCPHe=0A>> > - =
                    default:=0A>> > -                         nping_warning=
(QT_2, "Bogus field specifier found in=0A>> client #%d context. Please repo=
rt a bug", ctx->getIdentifier());=0A>> > -                     break;=0A>> =
> --                }=0A>> > -+                }=0A>> > -             } /* =
End of field specifiers loop */=0A>> > -=0A>> > -             nping_print(D=
BG_3, "%s() current_score=3D%.02f=0A>> candidate_score=3D%.02f", __func__, =
current_score, candidate_score);=0A>> > -@@ -650,7 +650,7 @@ clientid_t Ech=
oServer::nep_match_packet(const u8 *pkt,=0A>> size_t pktlen){=0A>> > -     =
            }else{=0A>> > -                     if( (tcplen=3Dtcp.validate(=
))=3D=3DOP_FAILURE){=0A>> > -                         return CLIENT_NOT_FOU=
ND;=0A>> > --                    }else{=0A>> > -+                    }else{=
=0A>> > -                         if( (int)pktlen > (iplen+tcplen) ){=0A>> =
> -                            if( payload.storeRecvData(pkt+iplen+tcplen,=
=0A>> pktlen-iplen-tcplen)!=3DOP_FAILURE)=0A>> > -                         =
       payload_included=3Dtrue;=0A>> > diff --git=0A>> a/meta-oe/recipes-se=
curity/nmap/files/0002-Include-time.h-for-time-struct-definition.patch=0A>>=
 b/meta-oe/recipes-security/nmap/files/0002-Include-time.h-for-time-struct-=
definition.patch=0A>> > new file mode 100644=0A>> > index 0000000..9755288=
=0A>> > --- /dev/null=0A>> > +++=0A>> b/meta-oe/recipes-security/nmap/files=
/0002-Include-time.h-for-time-struct-definition.patch=0A>> > @@ -0,0 +1,37 =
@@=0A>> > +From 6decd89b609a2175156848e75b340a8166fbd647 Mon Sep 17 00:00:0=
0 2001=0A>> > +From: Scott Ellis <scott@jumpnowtek.com>=0A>> > +Date: Sat, =
14 Sep 2019 15:55:29 -0400=0A>> > +Subject: [PATCH 2/3] Include time.h for =
time struct definition=0A>> > +=0A>> > +---=0A>> > + nping/EchoServer.cc | =
1 +=0A>> > + osscan2.cc          | 1 +=0A>> > + 2 files changed, 2 insertio=
ns(+)=0A>> > +=0A>> > +diff --git a/nping/EchoServer.cc b/nping/EchoServer.=
cc=0A>> > +index ccdcf9c..c403aed 100644=0A>> > +--- a/nping/EchoServer.cc=
=0A>> > ++++ b/nping/EchoServer.cc=0A>> > +@@ -137,6 +137,7 @@=0A>> > + #in=
clude "NpingOps.h"=0A>> > + #include "ProbeMode.h"=0A>> > + #include <signa=
l.h>=0A>> > ++#include <time.h>=0A>> > +=0A>> > + extern NpingOps o;=0A>> >=
 + extern EchoServer es;=0A>> > +diff --git a/osscan2.cc b/osscan2.cc=0A>> =
> +index aa31feb..89673e1 100644=0A>> > +--- a/osscan2.cc=0A>> > ++++ b/oss=
can2.cc=0A>> > +@@ -147,6 +147,7 @@=0A>> > +=0A>> > + #include <list>=0A>> =
> + #include <math.h>=0A>> > ++#include <time.h>=0A>> > +=0A>> > + extern N=
mapOps o;=0A>> > + #ifdef WIN32=0A>> > +--=0A>> > +2.7.4=0A>> > +=0A>> > di=
ff --git=0A>> a/meta-oe/recipes-security/nmap/files/0003-Fix-building-with-=
libc.patch=0A>> b/meta-oe/recipes-security/nmap/files/0003-Fix-building-wit=
h-libc.patch=0A>> > new file mode 100644=0A>> > index 0000000..6c60f6a=0A>>=
 > --- /dev/null=0A>> > +++ b/meta-oe/recipes-security/nmap/files/0003-Fix-=
building-with-libc.patch=0A>> > @@ -0,0 +1,46 @@=0A>> > +From dabe64926f7fc=
33ebe81291d75d7ddcb8128f48a Mon Sep 17 00:00:00 2001=0A>> > +From: Scott El=
lis <scott@jumpnowtek.com>=0A>> > +Date: Sat, 14 Sep 2019 15:57:48 -0400=0A=
>> > +Subject: [PATCH 3/3] Fix building with libc=0A>> > +=0A>> > +---=0A>>=
 > + nping/EchoServer.cc | 8 ++++----=0A>> > + 1 file changed, 4 insertions=
(+), 4 deletions(-)=0A>> > +=0A>> > +diff --git a/nping/EchoServer.cc b/npi=
ng/EchoServer.cc=0A>> > +index c403aed..7b23a2a 100644=0A>> > +--- a/nping/=
EchoServer.cc=0A>> > ++++ b/nping/EchoServer.cc=0A>> > +@@ -282,12 +282,12 =
@@ int EchoServer::nep_listen_socket(){=0A>> > +         server_addr6.sin6_=
len =3D sizeof(struct sockaddr_in6);=0A>> > +     #endif=0A>> > +     /* Bi=
nd to local address and the specified port */=0A>> > +-    if( bind(master_=
sd, (struct sockaddr *)&server_addr6,=0A>> sizeof(server_addr6)) !=3D 0 ){=
=0A>> > ++    if( ::bind(master_sd, (struct sockaddr *)&server_addr6,=0A>> =
sizeof(server_addr6)) !=3D 0 ){=0A>> > +         nping_warning(QT_3, "Faile=
d to bind to source address %s. Trying to=0A>> bind to port %d...", IPtoa(s=
erver_addr6.sin6_addr), port);=0A>> > +         /* If the bind failed for t=
he supplied address, just try again with=0A>> in6addr_any */=0A>> > +      =
   if( o.spoofSource() ){=0A>> > +             server_addr6.sin6_addr =3D i=
n6addr_any;=0A>> > +-            if( bind(master_sd, (struct sockaddr *)&se=
rver_addr6,=0A>> sizeof(server_addr6)) !=3D 0 ){=0A>> > ++            if( :=
:bind(master_sd, (struct sockaddr *)&server_addr6,=0A>> sizeof(server_addr6=
)) !=3D 0 ){=0A>> > +                 nping_fatal(QT_3, "Could not bind to =
port %d (%s).", port,=0A>> strerror(errno));=0A>> > +             }else{=0A=
>> > +                 nping_print(VB_1, "Server bound to port %d", port);=
=0A>> > +@@ -320,12 +320,12 @@ int EchoServer::nep_listen_socket(){=0A>> > =
+ #endif=0A>> > +=0A>> > +     /* Bind to local address and the specified p=
ort */=0A>> > +-    if( bind(master_sd, (struct sockaddr *)&server_addr4,=
=0A>> sizeof(server_addr4)) !=3D 0 ){=0A>> > ++    if( ::bind(master_sd, (s=
truct sockaddr *)&server_addr4,=0A>> sizeof(server_addr4)) !=3D 0 ){=0A>> >=
 +         nping_warning(QT_3, "Failed to bind to source address %s. Trying=
 to=0A>> bind to port %d...", IPtoa(server_addr4.sin_addr), port);=0A>> > +=
         /* If the bind failed for the supplied address, just try again wit=
h=0A>> in6addr_any */=0A>> > +         if( o.spoofSource() ){=0A>> > +     =
        server_addr4.sin_addr.s_addr=3DINADDR_ANY;=0A>> > +-            if(=
 bind(master_sd, (struct sockaddr *)&server_addr4,=0A>> sizeof(server_addr4=
)) !=3D 0 ){=0A>> > ++            if( ::bind(master_sd, (struct sockaddr *)=
&server_addr4,=0A>> sizeof(server_addr4)) !=3D 0 ){=0A>> > +               =
  nping_fatal(QT_3, "Could not bind to port %d (%s).", port,=0A>> strerror(=
errno));=0A>> > +             }else{=0A>> > +                 nping_print(V=
B_1, "Server bound to port %d", port);=0A>> > +--=0A>> > +2.7.4=0A>> > +=0A=
>> > diff --git=0A>> a/meta-oe/recipes-security/nmap/files/nmap-replace-sht=
ool-mkdir-with-coreutils-mkdir-command.patch=0A>> b/meta-oe/recipes-securit=
y/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch=
=0A>> > deleted file mode 100644=0A>> > index cfe043a..0000000=0A>> > ---=
=0A>> a/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-=
coreutils-mkdir-command.patch=0A>> > +++ /dev/null=0A>> > @@ -1,48 +0,0 @@=
=0A>> > -[PATCH] replace "./shtool mkdir" with coreutils mkdir command=0A>>=
 > -=0A>> > -Upstream-Status: Pending=0A>> > -=0A>> > -"./shtool mkdir" is =
used when mkdir has not -p parameter, but mkdir in today=0A>> > -most relea=
se has supportted the -p parameter, not need to use shtool, and it=0A>> > -=
can not fix the race if two process are running mkdir to create same dir=0A=
>> > -=0A>> > -Signed-off-by: Roy Li <rongqing.li@windriver.com>=0A>> > ---=
-=0A>> > - ncat/Makefile.in        | 4 ++--=0A>> > - nmap-update/Makefile.i=
n | 2 +-=0A>> > - 2 files changed, 3 insertions(+), 3 deletions(-)=0A>> > -=
=0A>> > -diff --git a/ncat/Makefile.in b/ncat/Makefile.in=0A>> > -index cfd=
306d..2166e08 100644=0A>> > ---- a/ncat/Makefile.in=0A>> > -+++ b/ncat/Make=
file.in=0A>> > -@@ -163,11 +163,11 @@ $(NSOCKDIR)/libnsock.a: $(NSOCKDIR)/M=
akefile=0A>> > -=0A>> > - install: $(TARGET)=0A>> > -     @echo Installing =
Ncat;=0A>> > --    $(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir)=0A>> $(=
DESTDIR)$(mandir)/man1=0A>> > -+    mkdir -p -m 755 $(DESTDIR)$(bindir) $(D=
ESTDIR)$(mandir)/man1=0A>> > -     $(INSTALL) -c -m 755 ncat $(DESTDIR)$(bi=
ndir)/ncat=0A>> > -     $(STRIP) -x $(DESTDIR)$(bindir)/ncat=0A>> > -     i=
f [ -n "$(DATAFILES)" ]; then \=0A>> > --            $(SHTOOL) mkdir -f -p =
-m 755 $(DESTDIR)$(pkgdatadir); \=0A>> > -+            mkdir -p -m 755 $(DE=
STDIR)$(pkgdatadir); \=0A>> > -             $(INSTALL) -c -m 644 $(DATAFILE=
S) $(DESTDIR)$(pkgdatadir)/; \=0A>> > -     fi=0A>> > -     $(INSTALL) -c -=
m 644 docs/$(TARGET).1=0A>> $(DESTDIR)$(mandir)/man1/$(TARGET).1=0A>> > -di=
ff --git a/nmap-update/Makefile.in b/nmap-update/Makefile.in=0A>> > -index =
89ff928..93f48d8 100644=0A>> > ---- a/nmap-update/Makefile.in=0A>> > -+++ b=
/nmap-update/Makefile.in=0A>> > -@@ -37,7 +37,7 @@ $(NBASELIB):=0A>> > -   =
  cd $(NBASEDIR) && $(MAKE)=0A>> > -=0A>> > - install: nmap-update=0A>> > -=
-    $(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir)=0A>> $(DESTDIR)$(mand=
ir)/man1=0A>> > -+    mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandi=
r)/man1=0A>> > -     $(INSTALL) -c -m 755 nmap-update $(DESTDIR)$(bindir)=
=0A>> > -     $(STRIP) -x $(DESTDIR)$(bindir)/nmap-update=0A>> > -     $(IN=
STALL) -c -m 644 ../docs/nmap-update.1 $(DESTDIR)$(mandir)/man1/=0A>> > ---=
=0A>> > -1.9.1=0A>> > -=0A>> > diff --git a/meta-oe/recipes-security/nmap/n=
map_7.70.bb=0A>> b/meta-oe/recipes-security/nmap/nmap_7.80.bb=0A>> > simila=
rity index 73%=0A>> > rename from meta-oe/recipes-security/nmap/nmap_7.70.b=
b=0A>> > rename to meta-oe/recipes-security/nmap/nmap_7.80.bb=0A>> > index =
b1b150a..2d66ef2 100644=0A>> > --- a/meta-oe/recipes-security/nmap/nmap_7.7=
0.bb=0A>> > +++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb=0A>> > @@ -3,1=
7 +3,16 @@ DESCRIPTION =3D "Nmap ("Network Mapper") is a free and open=0A>>=
 source (license) utili=0A>> >  SECTION =3D "security"=0A>> >  LICENSE =3D =
"GPL-2.0"=0A>> >=0A>> > -LIC_FILES_CHKSUM =3D=0A>> "file://COPYING;beginlin=
e=3D7;endline=3D12;md5=3D1489288f46af415fadc4e8b6345ab9f4"=0A>> > +LIC_FILE=
S_CHKSUM =3D=0A>> "file://COPYING;beginline=3D7;endline=3D12;md5=3D66938a7e=
5b4c118eda78271de14874c2"=0A>> >=0A>> > -SRC_URI =3D "http://nmap.org/dist/=
${BP}.tar.bz2 \=0A>> > -           file://nmap-redefine-the-python-library-=
dir.patch \=0A>> > -           file://nmap-replace-shtool-mkdir-with-coreut=
ils-mkdir-command.patch=0A>> \=0A>> > -           file://0001-include-time.=
h-for-time-structure-definition.patch \=0A>> > -           file://0002-Fix-=
building-with-libc.patch \=0A>> > +SRCREV =3D "7ce92c68df276c4321525c2f754f=
fe2deb9eb920"=0A>> > +SRC_URI =3D "git://github.com/nmap/nmap.git;branch=3D=
master \=0A>> > +           file://0001-Redefine-the-python-library-dir.pat=
ch \=0A>> > +           file://0002-Include-time.h-for-time-struct-definiti=
on.patch \=0A>> > +           file://0003-Fix-building-with-libc.patch \=0A=
>> >             "=0A>> >=0A>> > -SRC_URI[md5sum] =3D "84eb6fbe788e0d4918c2=
b1e39421bf79"=0A>> > -SRC_URI[sha256sum] =3D=0A>> "847b068955f792f4cc247593=
aca6dc3dc4aae12976169873247488de147a6e18"=0A>> > +S =3D "${WORKDIR}/git"=0A=
>> >=0A>> >  inherit autotools-brokensep pkgconfig pythonnative=0A>> >=0A>>=
 > @@ -48,5 +47,3 @@ do_configure() {=0A>> >  }=0A>> >=0A>> >  FILES_${PN} =
+=3D "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"=0A>> > -=0A>> > -RDEPENDS=
_${PN} =3D "python"=0A>>=0A>> --=0A>> _____________________________________=
__________=0A>> Openembedded-devel mailing list=0A>> Openembedded-devel@lis=
ts.openembedded.org=0A>> http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-devel=0A> --=0A> _______________________________________________=
=0A> Openembedded-devel mailing list=0A> Openembedded-devel@lists.openembed=
ded.org=0A> http://lists.openembedded.org/mailman/listinfo/openembedded-dev=
el=0A> =0A



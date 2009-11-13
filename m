Received: from [213.160.213.92] (helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1N8tXq-0001WI-JY
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 11:38:25 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Fri, 13 Nov 2009 11:37:02 +0100
X-TM-IMSS-Message-ID: <6887099a00021fad@nedap.com>
Received: from [10.2.40.9] ([10.2.40.9]) by nedap.com ([10.91.8.1]) with ESMTP
	(TREND IMSS SMTP Service 7.0) id 6887099a00021fad for
	<jaap.dejong@nedap.com>; Fri, 13 Nov 2009 11:37:02 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258046396.13901.4.camel@andromeda>
References: <1258040941.18126.5.camel@nvc0624>
	<1258046396.13901.4.camel@andromeda>
Date: Fri, 13 Nov 2009 11:34:39 +0100
Message-ID: <1258108479.15272.3.camel@nvc0624>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 13 Nov 2009 10:37:02.0936 (UTC)
	FILETIME=[3CD56D80:01CA644D]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Precision Time Protocol (PTP) as defined by the IEEE 1588 standard
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
X-List-Received-Date: Fri, 13 Nov 2009 10:38:25 -0000
X-Groupsio-MsgNum: 14257
Content-Type: multipart/mixed; boundary="=-jcDQsRsfwki4DgbwHXsg"

--=-jcDQsRsfwki4DgbwHXsg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Mickey,

Thanks for your suggestions. 
Attached the changed patch.

Regarding your error; I've seen it before somewhere else, i can't
remember where and worse, I can't remember how I fixed it...
Perhaps someone else can shine a light here?


On Thu, 2009-11-12 at 18:19 +0100, Michael 'Mickey' Lauer wrote:
> Hi Jaap,
> 
> thanks for your patch. 
> 
> Some additional style comments:
> 
> 1.) Please use SOURCEFORGE_MIRROR in SRC_URI
> 2.) Please use whitespace around the assignment operator
> 3.) Please check the OE wiki for recommended metadata ordering.
> 
> Unfortunately ptpd doesn't build for me. It bails out with:
> 
> ERROR: function do_compile failed
> ERROR: log data follows
> (/local/pkg/oe/om-gta02/tmp/work/armv4t-oe-linux-gnueabi/ptpd-1.0.0-r0/temp/log.do_compile.29312)
> | NOTE: make -j3 -e MAKEFLAGS=
> | ccache arm-oe-linux-gnueabi-gcc -march=armv4t -mtune=arm920t
> -mthumb-interwork -mthumb -c
> -isystem/local/pkg/oe/om-gta02/tmp/staging/armv4t-oe-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -isystem/local/pkg/oe/om-gta02/tmp/staging/armv4t-oe-linux-gnueabi/usr/include -o ptpd.o ptpd.c
> | ccache arm-oe-linux-gnueabi-gcc -march=armv4t -mtune=arm920t
> -mthumb-interwork -mthumb -c
> -isystem/local/pkg/oe/om-gta02/tmp/staging/armv4t-oe-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -isystem/local/pkg/oe/om-gta02/tmp/staging/armv4t-oe-linux-gnueabi/usr/include -o arith.o arith.c
> | ccache arm-oe-linux-gnueabi-gcc -march=armv4t -mtune=arm920t
> -mthumb-interwork -mthumb -c
> -isystem/local/pkg/oe/om-gta02/tmp/staging/armv4t-oe-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -isystem/local/pkg/oe/om-gta02/tmp/staging/armv4t-oe-linux-gnueabi/usr/include -o bmc.o bmc.c
> | arith.c: In function 'fromInternalTime':
> | arith.c:46: error: 'INT_MAX' undeclared (first use in this function)
> | arith.c:46: error: (Each undeclared identifier is reported only once
> | arith.c:46: error: for each function it appears in.)
> | arith.c: In function 'toInternalTime':
> | arith.c:64: error: 'INT_MAX' undeclared (first use in this function)
> | make: *** [arith.o] Error 1
> | make: *** Waiting for unfinished jobs....
> | FATAL: oe_runmake failed
> 
> Any idea about that?
> 


--=-jcDQsRsfwki4DgbwHXsg
Content-Disposition: attachment; filename="0001-Precision-Time-Protocol.patch"
Content-Type: text/x-patch; name="0001-Precision-Time-Protocol.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Precision Time protocol (IEEE 1588)

---
 conf/checksums.ini         |    4 ++++
 recipes/ptpd/ptpd_1.0.0.bb |   14 ++++++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ptpd/ptpd_1.0.0.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index a8c8263..cf8a275 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -20774,6 +20774,10 @@ sha256=22eae4f6c72247f8ac79c57ce4469797ad3df67614758c5096b7ce9290bd10b4
 md5=db7fd581b66998cd76d96f8b7c3f22a1
 sha256=78e290d3cf78d4dc15c7397b0edd138b4d29cf2ad0a7311bfc1c4dfb88f2a400
 
+[http://downloads.sourceforge.net/ptpd/ptpd-1.0.0.tar.gz]
+md5=b112b2bedc7f6e6e11a838608b9e0357
+sha256=8ac1fdcad1e246b0395097dd9af29966c6823533d7e6989aae91506048fb51bc
+
 [http://pypi.python.org/packages/source/p/ptrace/ptrace-0.3.2.tar.gz]
 md5=8108c2474bef16d126e956dce3c5073b
 sha256=634fe75e195179adafb6218040724f38252bd0fc8f796bb3e3e9bdba065890c5
diff --git a/recipes/ptpd/ptpd_1.0.0.bb b/recipes/ptpd/ptpd_1.0.0.bb
new file mode 100644
index 0000000..3737d63
--- /dev/null
+++ b/recipes/ptpd/ptpd_1.0.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Precision Time protocol (PTP) as defined by the IEEE 1588 standard"
+LICENSE = "BSD"
+HOMEPAGE = "http://sourceforge.net/projects/ptpd"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/ptpd/ptpd-${PV}.tar.gz" 
+
+S = "${WORKDIR}/ptpd-${PV}/src"
+PR = "r0"
+
+do_install() {                            
+        install -d ${D}${bindir} ${D}${mandir}/man8
+        install -m 4555 ptpd ${D}${bindir}
+        install -m 644 ptpd.8 ${D}${mandir}/man8
+}
-- 
1.6.3.3


--=-jcDQsRsfwki4DgbwHXsg--

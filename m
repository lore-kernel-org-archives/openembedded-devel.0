Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>)
	id 1LofVO-00050S-PD; Tue, 31 Mar 2009 17:03:59 +0200
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.116]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>)
	id 1LofT1-00027h-AT; Tue, 31 Mar 2009 23:01:42 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gqsel4$g9v$1@ger.gmane.org>
References: <1238452829.7128.4.camel@alap>  <gqsel4$g9v$1@ger.gmane.org>
Date: Tue, 31 Mar 2009 09:01:17 -0600
Message-Id: <1238511677.7128.86.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 70.73.132.19
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] add hotplug2 package
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
X-List-Received-Date: Tue, 31 Mar 2009 15:03:59 -0000
X-Groupsio-MsgNum: 8873
Content-Type: multipart/mixed; boundary="=-iUVvqispVAO5TNKDSC79"

--=-iUVvqispVAO5TNKDSC79
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-03-31 at 08:53 +0200, Koen Kooi wrote:
> On 31-03-09 00:40, Angus Ainslie wrote:
> 
> Your commit message is invalid
> 
> 

Thanks for pointing out the problem. I would find it helpful if you gave
a hint about what might be invalid. Hopefully this is corrected.


> 
> > +PR = "r0"
> 
> r0 is the default so you can remove that
> 

fixed

> 
> > +DEFAULT_PREFERENCE = "-1"
> 
> There's only one version of hotplug2, so why add a default_pref?
> 

I had 2 on my system but only chose to submit this one. Fixed.

> 
> > +INITSCRIPT_PARAMS = "start 03 S ."
> 
> You forgot to inherit update-rc.d
> 

fixed 

> > +LDFLAGS += "-lglibc"
> 
> I don't think that actually works, and if it did, uclibc would break
> 

Without that I get undefined refeences

 loader.c:(.text+0x14): undefined reference to `dlclose'
 workers/loader.o: In function `worker_load':
 loader.c:(.text+0x44): undefined reference to `dlopen'
 loader.c:(.text+0x5c): undefined reference to `dlsym'
 loader.c:(.text+0x84): undefined reference to `dlerror'

> 
> > +DESTDIR=${D}
> 
> missing quotes
> 

fixed

> > +do_configure () {
> > +}
> 
> missing colon between the braces. But more importantly: why inherit 
> autotools when you're not going to run configure?
> 

I was under the mistaken impression that autotools need to be included
to get do_compile() and do_install(). It seems those are the defaults.

There is a deeper problem that without the inherit autotools then the
LDFLAGS above fails to find glibc. Is there something missing in the
default case ?


> regards,
> 
> Koen
> 

Thanks
Angus

--=-iUVvqispVAO5TNKDSC79
Content-Disposition: attachment; filename*0=0001-hotplug2-added-new-recipe-and-updated-checksums.ini.patc; filename*1=h
Content-Type: text/x-patch; name="0001-hotplug2-added-new-recipe-and-updated-checksums.ini.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 24de7beb1d43caab4e3a59bb4de78e0449e47dfc Mon Sep 17 00:00:00 2001
From: Angus Ainslie <nytowl@openmoko.org>
Date: Tue, 31 Mar 2009 08:56:46 -0600
Subject: [PATCH] hotplug2: added new recipe and updated checksums.ini

---
 conf/checksums.ini                        |    4 +++
 packages/hotplug2/hotplug2_0.9+1.0beta.bb |   30 +++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 packages/hotplug2/hotplug2_0.9+1.0beta.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 9548a02..c5e6910 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -9318,6 +9318,10 @@ sha256=af40399fe434678454ae8ea100db6cba0482aa65b8972a05098c779cac57bc48
 md5=faa08f321fefd2c61ce4c9355a62fe31
 sha256=ca7ef124cde06883fbf28c7e78ce1e4c5526434bbe5672ef0a3e85a61a9d0b5f
 
+[http://isteve.bofh.cz/~isteve/hotplug2/downloads/hotplug2-1.0-beta.tar.gz]
+md5=353656ea499d395260c0de143983da4d
+sha256=54e2fa375506d92a8ac94b5ed332c4c0bf1b69c252692b332c92702670bba583
+
 [http://www.porchdogsoft.com/download/howl-0.9.7.tar.gz]
 md5=85fbe016e2ebad99108b1212ae4b1d6f
 sha256=f8766c44291aac92b2b4abc762e1b11e3504dd9f2a855fdde371b5abd730fe9f
diff --git a/packages/hotplug2/hotplug2_0.9+1.0beta.bb b/packages/hotplug2/hotplug2_0.9+1.0beta.bb
new file mode 100644
index 0000000..1702c4f
--- /dev/null
+++ b/packages/hotplug2/hotplug2_0.9+1.0beta.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "hotplug2 is a daemon which dynamically creates and removes device nodes from \
+/dev/, handles hotplug events and loads drivers at boot time. It replaces \
+the hotplug and udev packages and requires a kernel not older than 2.6.12."
+RPROVIDES_${PN} = "hotplug"
+RREPLACES_${PN} = "udev"
+
+SRC_URI = "http://isteve.bofh.cz/~isteve/hotplug2/downloads/hotplug2-1.0-beta.tar.gz \
+           "
+
+S = "${WORKDIR}/hotplug2-1.0-beta"
+
+inherit update-rc.d autotools
+
+INITSCRIPT_PARAMS = "start 03 S ."
+INITSCRIPT_NAME = "hotplug2"
+
+LDFLAGS += "-lglibc"
+DESTDIR="${D}"
+
+do_configure() {
+:
+}
+
+do_install_prepend () {
+        install -d ${D}/lib/hotplug2
+        install -d ${D}/sbin
+}
+
+FILES_${PN} += "${base_libdir}/hotplug2/*"
+FILES_${PN}-dbg += "${base_libdir}/hotplug2/.debug"
-- 
1.5.6.3


--=-iUVvqispVAO5TNKDSC79--

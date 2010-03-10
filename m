Received: from mail-qy0-f178.google.com ([209.85.221.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1NpTTi-00053l-TV
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 22:30:07 +0100
Received: by qyk8 with SMTP id 8so6658767qyk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 13:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fGNEnQU1nKSMQ2VlVYWblIGMV6SF8B5sog7PbudJ/zE=;
	b=XggYbppZhvi5q6hzlnmDcvNbXPOuhUXrAvIkIY/wckM1aH7ranyZUI/PlzahYX+tTY
	wpLN+O60mQQ94AsiAhQdbfJXSNtRS4k1l4y3bTZaXWbG+bXD7ZLAkvDhf/LqY5NofNo/
	LDPMtWD8vBiHH0aVzsAB7CH95ElyG7PJWEpd4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Hvfa3I8/fwn0x2LBWo3shJC4W+KYDLALA8dVP2qpPiCyW7sNSn5IJQnf5zgMg0bHmx
	l297ctRDEZhau4m3lipNN+Mhw+m8nHRfgOSYdQxhxV17i7dsgMKc2TqzXFFhKUaGrt13
	H4lJdHCG4rNerLznubVPBar00kmBm958f1Tv8=
MIME-Version: 1.0
Received: by 10.229.212.213 with SMTP id gt21mr563296qcb.2.1268256428233; Wed, 
	10 Mar 2010 13:27:08 -0800 (PST)
In-Reply-To: <1268254780.5437.2044.camel@lenovo.internal.reciva.com>
References: <E1NnJzb-0001K2-HM@melo.openembedded.org>
	<1267888617.11175.42.camel@rex> <20100309181656.GA19931@denix.org>
	<1268159056.5437.2018.camel@lenovo.internal.reciva.com>
	<5e088bd91003100922t9b6668fl577fdbafae53c82@mail.gmail.com>
	<1268247148.14566.1079.camel@mill.internal.reciva.com>
	<5e088bd91003101214y53a1d0b2h3bd47f2865e66b74@mail.gmail.com>
	<1268252731.5437.2042.camel@lenovo.internal.reciva.com>
	<5e088bd91003101234h267a24bfr558d696fdf703685@mail.gmail.com>
	<1268254780.5437.2044.camel@lenovo.internal.reciva.com>
Date: Wed, 10 Mar 2010 13:27:08 -0800
Message-ID: <5e088bd91003101327t16d245c8ldba85d3d32085ad3@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Phil Blundell : gtk+: build gtk-demo and package it appropriately
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
X-List-Received-Date: Wed, 10 Mar 2010 21:30:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2010 at 12:59 PM, Phil Blundell <philb@gnu.org> wrote:

> Ah, I remember now, you need a patch to base.bbclass as well to make it
> stage the files from etc/. =A0Try this:

I must be cursed :-(

Still no luck.  gtk+-native builds, but gtk+ still fails with the
apple_red issue.

Here is my diff from top of tree:

diff --git a/classes/base.bbclass b/classes/base.bbclass
index bbc1cc7..a94fa27 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1100,6 +1100,7 @@ sysroot_stage_dirs() {
 		sysroot_stage_libdir $from${base_libdir} $to${STAGING_DIR_HOST}${base_li=
bdir}
 	fi
 	sysroot_stage_dir $from${datadir} $to${STAGING_DATADIR}
+	sysroot_stage_dir $from${sysconfdir} $to${sysconfdir}
 }

 sysroot_stage_all() {
diff --git a/recipes/gtk+/gtk+.inc b/recipes/gtk+/gtk+.inc
index 268657b..5431c76 100644
--- a/recipes/gtk+/gtk+.inc
+++ b/recipes/gtk+/gtk+.inc
@@ -66,6 +66,23 @@ do_install_append () {
 	rm -f ${D}${libdir}/gtk-2.0/*/*.la ${D}${libdir}/gtk-2.0/${LIBV}/*/*.la
 }

+do_install_virtclass-native () {
+        autotools_do_install
+
+       mkdir -p ${D}${libdir}/gtk-2.0/include
+       install -m 0644 gdk/gdkconfig.h
${D}${libdir}/gtk-2.0/include/gdkconfig.h
+       # Copy over all headers, since the maemo stuff needs access to
the private api. *sigh*
+       cp gtk/*.h ${D}${includedir}/gtk-2.0/gtk/
+
+       install -m 0644 m4macros/gtk-2.0.m4 ${STAGING_DATADIR}/aclocal/
+
+       install -d ${D}${sysconfdir}/gtk-2.0
+       rm -f ${D}${libdir}/gtk-2.0/*/*.la ${D}${libdir}/gtk-2.0/${LIBV}/*/=
*.la
+
+        mkdir -p "${D}${sysconfdir}/gtk-2.0"
+        ${B}/gdk-pixbuf/gdk-pixbuf-query-loaders >
"${D}${sysconfdir}/gtk-2.0/gdk-pixbuf.loaders"
+}
+
 postinst_prologue() {
 if [ "x$D" !=3D "x" ]; then
   exit 1

Thanks for helping!

Steve



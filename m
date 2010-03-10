Received: from qw-out-1920.google.com ([74.125.92.146])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1NpSed-0007Sf-SL
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 21:37:22 +0100
Received: by qw-out-1920.google.com with SMTP id 5so2314188qwc.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 12:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=biwT5piUi5QzSzp3eyxPbyuGB7WjUhRW2MBLGfJlCGk=;
	b=Eaak1Ln9l27hesfEdBNbQktifXB7Rn0B3gKIPHiSKLgi/ZhUJxTF8/5eLZp7K+lJ6t
	fUNrEmIFKcTafDdNIywLP1Acbi3JH9/62pzzq2P23bYwRbZ0NyhLYHDxmdikPxSk5hw4
	bCCu3/GsnHhhLbsZapx1B3l81My/xhaAYjdhE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RjR2Bij0gOcO9ftI6e7kJxSu3Q2W3SqSkxmKtoPe+fCalRyE75bkTd4MRkTbA9dIH4
	JKElQvFxCvqRIMaYvCYLfGQpFJSverQlEgsKiUjpFTYo6dd2peUmjJ7zTyEqGaZdgH4L
	jyITMFhY7qvwiF2XDnSTefykhl4UkBsy5JcJI=
MIME-Version: 1.0
Received: by 10.229.127.164 with SMTP id g36mr2022590qcs.99.1268253262868; 
	Wed, 10 Mar 2010 12:34:22 -0800 (PST)
In-Reply-To: <1268252731.5437.2042.camel@lenovo.internal.reciva.com>
References: <E1NnJzb-0001K2-HM@melo.openembedded.org>
	<141020e31003052236w4afdcc26x1008a539f0491c9a@mail.gmail.com>
	<1267888617.11175.42.camel@rex> <20100309181656.GA19931@denix.org>
	<1268159056.5437.2018.camel@lenovo.internal.reciva.com>
	<5e088bd91003100922t9b6668fl577fdbafae53c82@mail.gmail.com>
	<1268247148.14566.1079.camel@mill.internal.reciva.com>
	<5e088bd91003101214y53a1d0b2h3bd47f2865e66b74@mail.gmail.com>
	<1268252731.5437.2042.camel@lenovo.internal.reciva.com>
Date: Wed, 10 Mar 2010 12:34:22 -0800
Message-ID: <5e088bd91003101234h267a24bfr558d696fdf703685@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.146
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
X-List-Received-Date: Wed, 10 Mar 2010 20:37:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2010 at 12:25 PM, Phil Blundell <pb@reciva.com> wrote:

> Did you clean and rebuild gtk+-native? =A0I forgot to mention that this i=
s
> necessary.

Yes, I did:

bitbake -c clean gtk+ gtk+-native gdk-pixbuf-csource-native
bitbake gtk+

My repo is at current top of tree with your gtk+.inc patch and
gtk+_2.18.6.bb unchanged:

$ git diff recipes/gtk+/gtk+.inc
diff --git a/recipes/gtk+/gtk+.inc b/recipes/gtk+/gtk+.inc
index 268657b..5431c76 100644
--- a/recipes/gtk+/gtk+.inc
+++ b/recipes/gtk+/gtk+.inc
@@ -66,6 +66,23 @@ do_install_append () {
        rm -f ${D}${libdir}/gtk-2.0/*/*.la ${D}${libdir}/gtk-2.0/${LIBV}/*/=
*.la
 }

+do_install_virtclass-native () {
+        autotools_do_install
+
+       mkdir -p ${D}${libdir}/gtk-2.0/include
+       install -m 0644 gdk/gdkconfig.h ${D}${libdir}/gtk-2.0/include/gdkco=
nfig.
+       # Copy over all headers, since the maemo stuff needs access to the =
priva
+       cp gtk/*.h ${D}${includedir}/gtk-2.0/gtk/
+
+       install -m 0644 m4macros/gtk-2.0.m4 ${STAGING_DATADIR}/aclocal/
+
+       install -d ${D}${sysconfdir}/gtk-2.0
+       rm -f ${D}${libdir}/gtk-2.0/*/*.la ${D}${libdir}/gtk-2.0/${LIBV}/*/=
*.la
+
+        mkdir -p "${D}${sysconfdir}/gtk-2.0"
+        ${B}/gdk-pixbuf/gdk-pixbuf-query-loaders > "${D}${sysconfdir}/gtk-=
2.0/g
+}
+
 postinst_prologue() {
 if [ "x$D" !=3D "x" ]; then
   exit 1

$ git diff recipes/gtk+/gtk+_2.18.6.bb
$



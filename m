Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <srinredplano@gmail.com>) id 1PqEBP-00033J-Re
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 01:26:52 +0100
Received: by vws6 with SMTP id 6so1530568vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 16:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to:cc
	:content-type; bh=sxMnQ1idSsgSLi+DVOHrKfaK4CMKIHey9CCxrnMtzUE=;
	b=DAYRRcCzZq77TL9c0CO5U0EaWVVqHtVUJGB2h8wXCf3QoZJXOIZ22QYpbMaF/wJ8Cn
	evxKJN8m+HGW1mo0guJyJpPFUbAcvDvbkWFLrrtV4zHGcQX76Ap7Xd/lR2ts9TpWjF8G
	0v3JnT7AibMcuT657VZNPu5PxUFYlZvUSxEIc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	b=Qxnoq9JDbK5XnTSKj0Lt5hMdk6Eiqhho7e0c/7CUS0ewDVZcMbKw8zDEUKZ+DxobmB
	+J8kA6SLdVqvv1+byDFh7BNYCO4P5y6rVpP0gBTNW3QDaBj/FYhGX6xiBiTJFX2pulif
	CMLx15jl9e0ymTKZz1fouNrzJx9QhDtYAJSBI=
MIME-Version: 1.0
Received: by 10.52.166.7 with SMTP id zc7mr130713vdb.66.1297988306948; Thu, 17
	Feb 2011 16:18:26 -0800 (PST)
Received: by 10.220.118.139 with HTTP; Thu, 17 Feb 2011 16:18:26 -0800 (PST)
Date: Thu, 17 Feb 2011 16:18:26 -0800
Message-ID: <AANLkTinNYGTxNkd=MOGBbNkDNYs7Xx=HJ1Cq7gi9svSg@mail.gmail.com>
From: srinredplano SP <srinredplano@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: arago-devel@gforge.ti.com
Subject: how to use other package headers from sysroots while compiling myrecipe
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
X-List-Received-Date: Fri, 18 Feb 2011 00:26:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I want to use the headers of liboil-0.3.17-r1 which are in " ....
sysroots/armv7a-none-linux-gnueabi/usr/include/liboil-0.3/ "  for
compiling   my gstreamer.bb  file
I have modified  gstreamer.bb  file as show below . But still i could
not see the  the liboil headers path getting included while compiling
my gstreamer package .
Was able to compile by adding  the path to CFALGS_append

gstreamer.bb
##=======================================================
require gstreamer-ti.inc
PV = "svnr${SRCREV}"
S = "${WORKDIR}/gst-dmai-plugins"
SRCREV = "1037"


DEPENDS += " virtual/kernel liboil "


#CPPFLAGS_append = " -I${STAGING_KERNEL_DIR}
-I${STAGING_KERNEL_DIR}/include -L${STAGING_KERNEL_DIR}/lib
-I${STAGING_DIR_TARGET}/usr/include/liboil-0.3 "


EXTRA_OECONF += " --with-liboil=${STAGING_DIR_TARGET}/usr/include/liboil-0.3 "


SRC_URI = "my path xxxxxxxx" \
file://xyz.patch \
"
do_install_prepend () {

    install -d ${D}/${installdir}/gst/${PLATFORM}

    # delete .svn files
    find ${D}/${installdir}/gst -name .svn -type d | xargs rm -rf
    chmod 0755 ${D}/${installdir}/gst -R

    install -d ${D}${sysconfdir}/init.d/
}
##=======================================================



Received: from rrcs-24-227-36-211.se.biz.rr.com ([24.227.36.211]
	helo=mail.eoimaging.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nharris@eoimaging.com>) id 1PusRo-0004aS-DE
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 21:15:00 +0100
Received: from [192.168.0.194] ([::ffff:192.168.0.194]) (AUTH: LOGIN nharris)
	by mail.eoimaging.com with esmtp; Wed, 02 Mar 2011 15:13:33 -0500
	id 00208643.4D6EA4ED.0000646D
Message-ID: <4D6EA4EC.8050000@eoimaging.com>
Date: Wed, 02 Mar 2011 15:13:32 -0500
From: Nathan Harris <nharris@eoimaging.com>
Organization: Electro-Optical Imaging, Inc.
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: libvmime recipe (static library)
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
X-List-Received-Date: Wed, 02 Mar 2011 20:15:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I have a "working" recipe for VMime.  So far, I can only get the static 
version of the library to compile and get successfully packaged.  When I 
try to link against this static library with another recipe, the linker 
says "skipping incompatible 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libvmime.a 
when searching for -lvmime".

Here is the recipe and patch.


libvmime_0.9.1.bb:
===============

DESCRIPTION = "VMime is a free mail library for C++"
HOMEPAGE = "http://www.vmime.org/"
DEPENDS = "libgsasl gnutls"
PR = "r1"

SRC_URI = "${SOURCEFORGE_MIRROR}/vmime/${PN}-${PV}.tar.bz2"
SRC_URI[md5sum] = "d5b6de44f7f9ca0e4cefe597d1905605"
SRC_URI[sha256sum] = 
"3b66cb76d9bc7da80ef1f271cc29d3a183b5ff8b560ef60e85ff006bffb4d1ae"

SRC_URI += "file://SConstruct.patch"

# Workaround for vmime which creates .pc inside install
do_install_append () {

for i in `find ${S}/ ${D}/${libdir}/pkgconfig -name "*.pc" -type f` ; do \
             sed -i -e 's:${D}::g' $i
         done
}

inherit scons pkgconfig



libvmime-0.9.1/SConstruct.patch:
=========================

--- libvmime-0.9.1/SConstruct.orig      2011-03-02 13:33:14.871718344 -0500
+++ libvmime-0.9.1/SConstruct   2011-03-02 14:39:23.699720558 -0500
@@ -500,7 +500,7 @@
                     + 'This option has no effect if "with_messaging" is 
not activated.\n'
                     + 'Separate protocols with spaces; string must be 
quoted with ".\n'
                     + 'Currently available protocols: pop3, smtp, imap, 
maildir, sendmail.',
-               '"pop3 smtp imap maildir sendmail"'
+               '"pop3 smtp imap maildir"'
         ),
         (
                 'with_platforms',





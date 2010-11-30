Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNEl8-0003fC-Qq
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 02:11:56 +0100
Received: by mail-pz0-f47.google.com with SMTP id 12so744611pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 17:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=XJt0ZelkylNoPAWBoOUND7XqxUY5egFa3gcYCMYKIlQ=;
	b=p0fta47br7b5v8ADMyTvcthnfNxQsuQexMAYBjEi9ZuOXWVdhO66/nTNo6O0+ilyOP
	t6RBi78Bgm3UbxS45KaUJoLPT9unHkQ8nIeZiHpOLmtCDETt6gmgSrWJA96PmZz4qUO5
	RmSHab/gxtcaBD4Z1HlhbAm1bWjitYeeC85tU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=MT+piWeOaA4fVTpU0vDNJeynbe1dYI58uRV/Znansy734aVj+fLpt0jixwG9EeflkR
	P7Uv7zwpXWocA9LC7B4srHMDqwWp1UGOCdi+fV30jlTYEimK+35JBNC3XYPiSYRTAwxQ
	x9xcokjLaEP+K/Sw+53lEL42wmK113xmrHQGQ=
Received: by 10.142.194.13 with SMTP id r13mr6350122wff.15.1291079436753;
	Mon, 29 Nov 2010 17:10:36 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id p8sm8215609wff.16.2010.11.29.17.10.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Nov 2010 17:10:36 -0800 (PST)
Message-ID: <4CF44F06.5020105@gmail.com>
Date: Tue, 30 Nov 2010 11:40:30 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gnome-vfs_2.24.1.bb: Fix build when DISTRO_FEATURES lacks "largefile".
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
X-List-Received-Date: Tue, 30 Nov 2010 01:11:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

mipsel-oe-linux-uclibc-libtool: compile:  mipsel-oe-linux-uclibc-gcc -march=mips32 -std=gnu99 -DHAVE_CONFIG_H -I. -I.. -I.. -I.. -pthread -DORBIT2=1 -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/glib-2.0 -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/glib-2.0/include -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/gconf/2 -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/orbit-2.0 -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/dbus-1.0 -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/dbus-1.0/include -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/libxml2 -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -D_REENTRANT -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/glib-2.0 -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/glib-2.0/include -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/glib-2.0 -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/glib-2.0/include -DXDG_PREFIX
=_gnome_vfs_xdg -DDBUS_API_SUBJECT_TO_CHANGE -D_FILE_OFFSET_BITS=64 -D_BSD_SOURCE -D_LARGEFILE64_SOURCE -D_POSIX_PTHREAD_SEMANTICS -D_REENTRANT -DG_DISABLE_DEPRECATED -DGNOME_VFS_PREFIX=\"\" -DGNOME_VFS_BINDIR=\"/bin\" -DGNOME_VFS_DATADIR=\"/share\" -DGNOME_VFS_LIBDIR=\"/lib\" -DGNOME_VFS_LOCALEDIR=\"/share/locale\" -DGNOME_VFS_SYSCONFDIR=\"/etc\" -DG_LOG_DOMAIN=\"libgnomevfs\" -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -MT gnome-vfs-ace.lo -MD -MP -MF .deps/gnome-vfs-ace.Tpo -c gnome-vfs-ace.c  -fPIC -DPIC -o .libs/gnome-vfs-ace.o
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/limits.h:27:0,
                 from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib/glib-2.0/include/glibconfig.h:11,
                 from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/glib-2.0/glib/gtypes.h:34,
                 from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/glib-2.0/glib/galloca.h:34,
                 from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/glib-2.0/glib.h:32,
                 from gnome-vfs-ace.h:28,
                 from gnome-vfs-ace.c:26:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/features.h:216:5: error: #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file support enabled.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gnome/gnome-vfs_2.24.1.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/recipes/gnome/gnome-vfs_2.24.1.bb b/recipes/gnome/gnome-vfs_2.24.1.bb
index e47f28d..268a219 100644
--- a/recipes/gnome/gnome-vfs_2.24.1.bb
+++ b/recipes/gnome/gnome-vfs_2.24.1.bb
@@ -22,8 +22,19 @@ EXTRA_OECONF = " \
                  --with-samba-includes=${STAGING_INCDIR} \
                "
 
+do_nolargefile() {
+	for file in ${S}/modules/Makefile.am \
+			${S}/daemon/Makefile.am \
+			${S}/libgnomevfs/Makefile.am; do
+		sed -i -e '/_FILE_OFFSET_BITS/d' $file
+		sed -i -e '/_LARGEFILE64_SOURCE/d' $file
+	done
+	sed -i -e '/_LARGEFILE64_SOURCE/,/#endif/d' ${S}/libgnomevfs/gnome-vfs-module-shared.h
+}
+
 do_configure_prepend() {
         sed -i -e 's:	doc	::g' Makefile.am
+	${@base_contains('DISTRO_FEATURES', 'largefile', '', 'do_nolargefile', d)}
 }
 
 PACKAGES_DYNAMIC = "gnome-vfs-plugin-*"
-- 
1.7.1




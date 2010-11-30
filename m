Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNEm9-0003vQ-GH
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 02:12:58 +0100
Received: by pwi8 with SMTP id 8so884933pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 17:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=/1YVTivuaVKIJDcAN5zKecp4gj9DIet8lbB7OKC9Ez8=;
	b=HdhgwC+GAzg3RiQU4o5qrJPMojQDlVwqIaBBEcrPFnFkOxADbixdCKYDnMapUrkNz7
	ffWb7a0rqOxYTOCczOWniK/3pr0Gdq89eE5gnYZ23gnhAmmd/9Fy8s3zIXPsOe7nkUYC
	aRQOZ2ufh4rUaNoRpyCIw+TxsC6lSafjkxD4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=cj0vVIU7mkXjwNJ7/RIEOHavycgh8MoWIHQQF0KSJwtGvZ+hai9y3HqqL5R18glKGW
	1mkBbePOEUBzL2RwiEPCLnxp+Z3K3QKspZMLsFGVdHvSJ9KEH5XX7TmPxGkV/WTfg7C1
	14amMujHlEbNdDA0dg6+D7WORuJ9gpRjNcJVE=
Received: by 10.142.232.4 with SMTP id e4mr6343350wfh.239.1291079496054;
	Mon, 29 Nov 2010 17:11:36 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id w14sm8217409wfd.6.2010.11.29.17.11.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Nov 2010 17:11:35 -0800 (PST)
Message-ID: <4CF44F42.3030308@gmail.com>
Date: Tue, 30 Nov 2010 11:41:30 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] x264_r2245.bb: Fix build when DISTRO_FEATURES lacks "largefile".
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
X-List-Received-Date: Tue, 30 Nov 2010 01:12:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

mipsel-oe-linux-uclibc-gcc -march=mips32 -O3 -ffast-math -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -Wall -I. -fPIC -std=gnu99 -s -fomit-frame-pointer -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include  -c -o common/mc.o common/mc.c
In file included from /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/stdio.h:28:0,
                 from common/osdep.h:29,
                 from common/common.h:76,
                 from common/mc.c:24:
/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include/features.h:216:5: error: #error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file support enabled.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/vlc/x264_r2245.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/vlc/x264_r2245.bb b/recipes/vlc/x264_r2245.bb
index f533bfc..e507d32 100644
--- a/recipes/vlc/x264_r2245.bb
+++ b/recipes/vlc/x264_r2245.bb
@@ -25,4 +25,8 @@ DEPENDS_x86 = "yasm-native"
 
 EXTRA_OECONF = '--enable-shared ${X264_DISABLE_ASM} --extra-cflags="${X264_ECFLAGS}"'
 
+do_configure_append() {
+	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "/_LARGEFILE_SOURCE/d" ${S}/common/osdep.h', d)}"
+	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/common/osdep.h', d)}"
+}
 
-- 
1.7.1




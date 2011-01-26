Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pi0Tc-0006xb-Tk
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 09:11:41 +0100
Received: by pwi8 with SMTP id 8so217143pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 00:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=12mIoR3LKapsjb6ByLMOWu/cTzx2pMPe/n7ESmtPnJo=;
	b=YVPVVS4/YupOKNWdDrCgOpV3r6q1GlyZgS6ns3Y5CvBfMdjUb+3ftv8wqsTbGnJjrf
	zRayDeDbwF+7kmGI+GzmeeUzOTAhlbLmWp0/BkiKndMBDR7I6rL3UJOl4ykUJ7UqXHfk
	1lzUXQUptDIBKNata/j4ZbuTeoZm6/4NtKmAk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=bKCU3owGYtVk8/J86ojCZDrNYf9lEokwTIzAlNY/kUK2bLC8n+aiyEJduRVzTYaWA1
	2ZD8UVloXrbFfGq5ZMub+PISmV4FDvSTJFsg/WAf8vvFBhQNTEkPI/jVOAEnJ3/51ajF
	KTK/XPQDMhEgD6abC4zfoofNKnGD92KjyDT9M=
Received: by 10.142.153.14 with SMTP id a14mr52721wfe.113.1296029452229;
	Wed, 26 Jan 2011 00:10:52 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w42sm19923140wfh.15.2011.01.26.00.10.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 00:10:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 00:10:46 -0800
Message-Id: <1296029446-27041-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH] samba: Fix build issue on uclibc/arm/thumb
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
X-List-Received-Date: Wed, 26 Jan 2011 08:11:41 -0000

We get following errors as of now. This patch fixes those

/scratch/oe/sysroots/x86_64-linux/usr/armv5te/lib/gcc/arm-oe-linux-uclibceabi/4.5.3/../../../../arm-oe-linux-uclibceabi/bin/ld:
/scratch/oe/sysroots/armv5te-oe-linux-uclibceabi/usr/lib//uclibc_nonshared.a(atexit.os)(.text+0x12):
unresolvable R_ARM_THM_CALL relocation against symbol `__cxa_atexit'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/samba/samba_3.2.15.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/samba/samba_3.2.15.bb b/recipes/samba/samba_3.2.15.bb
index ef2707e..214de58 100644
--- a/recipes/samba/samba_3.2.15.bb
+++ b/recipes/samba/samba_3.2.15.bb
@@ -9,7 +9,7 @@ SRC_URI += "file://configure-3.2.8.patch \
 SRC_URI[md5sum] = "5a3bcc4927c9643b9f42970d0815b18f"
 SRC_URI[sha256sum] = "84281fd1faeffee8558e49dff865dd382abbf78bc1be00f8cb5aa70aeea67d46"
 
-PR = "r3"
+PR = "r4"
 
 EXTRA_OECONF += "\
 	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
@@ -22,6 +22,7 @@ EXTRA_OECONF += "\
 	samba_cv_HAVE_WRFILE_KEYTAB=yes \
 	"
 
+EXTRA_OECONF_append_libc-uclibc = " --disable-pie"
 # for arm we always use ARM instruction set
 # gcc 4.5 ICE's in thumb mode
 # see http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46934
-- 
1.7.2.3




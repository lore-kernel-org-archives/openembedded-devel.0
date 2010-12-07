Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PPxNm-0000au-Cx
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 14:15:03 +0100
Received: by fxm17 with SMTP id 17so9876489fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 05:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=9GVDHky8IMIpkvXv/Q9mCS1eyXZ5kQKjJXsg3G/5azE=;
	b=LoFLPyQz6ErvPMbrUcJeJ3I43aTepVm7foU7DPm3vK1WGcj+5hz8jFlGRQLssC1bfj
	6KZ+5RkmFuaM/G/uvdX+uCv/EudnK11CO+5uR4LdOt8rDJD6bCKeLIRpyPuYZEuAM6RQ
	jY1JMKkwFtrauiY249uSuwCkWquuJoGC9r+hA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UVuu/cvZt+b5ex0GOlS2SmYVeCwFzjggDd4nkjMPP5+HsvLCgEhLiwkFU8uXLQO0iv
	HPmpV7CAyIqIJh+W4GD+OIQCZvpSKuZCCTJahLJgDxH9zBPwD197iU+2LoEWLVyw//ly
	Uw4xh5N6e3jgx6VFAwkQy6X9T0rYA1Ezap5bQ=
Received: by 10.223.96.197 with SMTP id i5mr2466755fan.122.1291727613899;
	Tue, 07 Dec 2010 05:13:33 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o17sm1902762fal.25.2010.12.07.05.13.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Dec 2010 05:13:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Dec 2010 14:13:29 +0100
Message-Id: <1291727609-11514-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <1291727196-11177-1-git-send-email-Martin.Jansa@gmail.com>
References: <1291727196-11177-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCHv2] eglibc_2.1[12]: remove upstream applied eglibc-make-382 patch
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
X-List-Received-Date: Tue, 07 Dec 2010 13:15:03 -0000

* after checking 2.11 branch with webinterface I've removed it too from
  2.11 version

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/eglibc/eglibc_2.11.bb              |    1 -
 recipes/eglibc/eglibc_2.12.bb              |    1 -
 recipes/eglibc/files/eglibc-make-382.patch |   15 ---------------
 3 files changed, 0 insertions(+), 17 deletions(-)
 delete mode 100644 recipes/eglibc/files/eglibc-make-382.patch

diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
index 37905eb..b249f29 100644
--- a/recipes/eglibc/eglibc_2.11.bb
+++ b/recipes/eglibc/eglibc_2.11.bb
@@ -14,7 +14,6 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://shorten-build-commands.patch \
            file://sh4_set_fpscr.patch \
            file://sh4_local-fpscr_values.patch \
-           file://eglibc-make-382.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.bb
index 8c019a1..1285568 100644
--- a/recipes/eglibc/eglibc_2.12.bb
+++ b/recipes/eglibc/eglibc_2.12.bb
@@ -16,7 +16,6 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://sh4_local-fpscr_values.patch \
            file://eglibc-dont-cache-slibdir.patch \
            file://armv4-eabi-compile-fix.patch \
-           file://eglibc-make-382.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
diff --git a/recipes/eglibc/files/eglibc-make-382.patch b/recipes/eglibc/files/eglibc-make-382.patch
deleted file mode 100644
index 5ecad90..0000000
--- a/recipes/eglibc/files/eglibc-make-382.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-http://git.frugalware.org/gitweb/gitweb.cgi?p=frugalware-current.git;a=blob_plain;f=source/base/glibc/make-3.82-fix.patch;hb=8217c32ecc2e14962847ba3d8a272eb64a3dba4f
-
---- libc/manual/Makefile
-+++ libc/manual/Makefile
-@@ -232,7 +232,9 @@
- .PHONY: stubs
- stubs: $(objpfx)stubs
- endif
--$(objpfx)stubs ../po/manual.pot $(objpfx)stamp%:
-+$(objpfx)stubs ../po/manual.pot:
-+	touch $@
-+$(objpfx)stamp%:
- 	$(make-target-directory)
- 	touch $@
- 
-- 
1.7.3.2




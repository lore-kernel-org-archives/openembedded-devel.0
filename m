Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OYP0l-0004Os-Pk
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 21:49:58 +0200
Received: by pvg13 with SMTP id 13so2328365pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 12:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=G6InwZ2HvHQr+nbEDs8E1gRe9e0QJD+PprUfLitEEaU=;
	b=QwJ4Jj/mCQ//8G0P+H/Fxdz7si0MEuyzM9E3meZzAfIdqGdxJMkhhz53cfhf9M2QWo
	SUb+EuUb/xLOE51MyP9aiWwOZ3mYmiFdJ4kCcqJEC67y8uvTjD+J+P2igMMFB5NTwrBS
	qdELU6jWEeF4Fru1e1cvqdf+pdudXzEKsVVP8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dOJtC6M1R6cqCDGjKFk1c0mJETQQ3895IxzKlQWcPpL6d8rKzT+aynO5UhaiC5PzWp
	1b1xdTBCM6iGMGoRnv676DVujxjnSGFe28fvmOBJKnXrlSIblXPCRmnDDS1xL9ZmjFLR
	6Uq7WsSTgwtX+7K6jJdi7QsMnFzXXGPTYX5zY=
Received: by 10.142.172.1 with SMTP id u1mr17686314wfe.286.1278963898070;
	Mon, 12 Jul 2010 12:44:58 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.224.36])
	by mx.google.com with ESMTPS id 23sm5192380wfa.22.2010.07.12.12.44.56
	(version=SSLv3 cipher=RC4-MD5); Mon, 12 Jul 2010 12:44:57 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 14:45:50 -0500
Message-Id: <1278963950-2587-9-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.1.1
In-Reply-To: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 9/9] glibc: fix LD_LIBRARY_PATH
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
X-List-Received-Date: Mon, 12 Jul 2010 19:49:58 -0000

* Configure fails due to LD_LIBRARY_PATH
* checking LD_LIBRARY_PATH variable... contains current directory
* | configure: error:
* | *** LD_LIBRARY_PATH shouldn't contain the current directory when
* | *** building glibc. Please change the environment variable
* | *** and run configure again.

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/glibc/glibc_2.9.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index e7ab63d..4196704 100644
--- a/recipes/glibc/glibc_2.9.bb
+++ b/recipes/glibc/glibc_2.9.bb
@@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
 PACKAGES_DYNAMIC = "libc6*"
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
@@ -143,6 +143,7 @@ do_configure () {
 		exit 1
 	fi
 	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
+	export LD_LIBRARY_PATH=`echo ${LD_LIBRARY_PATH} | sed 's/^://'`
 	CPPFLAGS="" oe_runconf
 }
 
-- 
1.7.1.1




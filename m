Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NO16o-0005qi-Rx
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Dec 2009 04:45:02 +0100
Received: by pzk30 with SMTP id 30so5902322pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 19:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=F5fmDlOj+t276YF/ZTAdyaRMY3kKhiWl46HJOm8hEj8=;
	b=RoDVAmJj2aGu3S3vX1A1f7GVWswrnOlFqTb4G+XQlU8QDLqznAwaDeqS3B29QTEyOR
	ilVwpkMuL9GE+SZ5qyLLbCYE1+ugW/8Xd6HmknVtJ1dgtrUb2ZoRwb7qW5u+dh5ibaXJ
	B4/aCHCi9i9CsqkXKux0ouGNpwgAG9UREWxZM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Bo5klU+s1CNVJxZ98fYxFHtilxuu1SPjlO6VhDS+Me7zBPrQmagdHNNE+pliS3iWKR
	UzoftZgWpMQfa560VKzcsipnWZjHSXS23GB+zejyvJc1kzz7jfl0UIFWTObtf5eY++LP
	xa9Pp3YqoRVigcBaBWMI3ew4amvIDmxjpZKcQ=
Received: by 10.142.249.41 with SMTP id w41mr8213620wfh.347.1261712584055;
	Thu, 24 Dec 2009 19:43:04 -0800 (PST)
Received: from localhost ([123.54.105.26])
	by mx.google.com with ESMTPS id 20sm8294966pzk.9.2009.12.24.19.43.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Dec 2009 19:43:03 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Dec 2009 11:42:53 +0800
Message-Id: <1261712573-10282-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Upgrade glibc from 2.6.1 to 2.10.1, the 2.6.1 glibc cause ltrace compilation failed
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
X-List-Received-Date: Fri, 25 Dec 2009 03:45:02 -0000

the include/sys/ptrace.h of glibc 2.6.1 does not include the PTRACE_EVENT* macroes, which is needed by ltrace. the one of glibc 2.10.1 does include them and on it the compilation of ltrace succeed
---
 conf/distro/include/sane-toolchain.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index 7bf1963..39bc9aa 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -9,8 +9,8 @@ PREFERRED_GCC_VERSION                ?= "4.4.2"
 PREFERRED_BINUTILS                   ?= "2.20"
 
 # Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
-PREFERRED_VERSION_glibc             ?= "2.6.1"
-PREFERRED_VERSION_glibc-initial     ?= "2.6.1"
+PREFERRED_VERSION_glibc             ?= "2.10.1"
+PREFERRED_VERSION_glibc-initial     ?= "2.10.1"
 PREFERRED_VERSION_eglibc             ?= "2.10"
 PREFERRED_VERSION_eglibc-initial     ?= "2.10"
 PREFERRED_VERSION_uclibc            ?= "0.9.30.1"
-- 
1.5.4.3




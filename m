Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PKk2e-00050f-Po
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 04:59:41 +0100
Received: by pvd12 with SMTP id 12so1810752pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 19:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=Oxrm1+NtydR8jWLfrC7F1qlAJgWC90a3XgxtnijwM9U=;
	b=KAgeGOc3LryS3lEmtwwNJxjnnU1onHtFmoQ+05ZDYsSz2ornoDn33eDmIb+h/XvjR6
	YVm36KB1rWxHaj2NQUQXZZ4PQcCRk5JzDv58A2tPSLbrvGFca/paOLNt841e7R3R83xP
	J9dZiQxRPP8cL5rDhLcvaVzW+3FFGP9bE3icc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=e6uriLxgxZKGD5zcFNHvRNVJ+VhnAguyq4NHuy7tKq6GrG1yxuzeWHBAwqtJ40NLSj
	TniUBmdAAvOSqYrdNixwLdgEQy1vI4V4QXWBXKGtAiwxZ8C34hLUPfm8TToTPdJgVgVa
	T7TyqmTqgYZormxCcPEBcYoHPVVlTiVe36L1A=
Received: by 10.142.232.9 with SMTP id e9mr5883424wfh.153.1290484707817;
	Mon, 22 Nov 2010 19:58:27 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	v19sm7310624wfh.12.2010.11.22.19.58.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Nov 2010 19:58:26 -0800 (PST)
Message-ID: <4CEB3BDD.1050709@gmail.com>
Date: Tue, 23 Nov 2010 14:28:21 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sane-toolchain-uclibc.inc: s/PREFERRED_UCLIBC_VERSION/PREFERRED_UCLIBC/
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
X-List-Received-Date: Tue, 23 Nov 2010 03:59:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Changed to match commit a69c8a4da6be7c3b6bd839f839d815e7de1b2c9f.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 conf/distro/include/sane-toolchain-uclibc.inc |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/conf/distro/include/sane-toolchain-uclibc.inc b/conf/distro/include/sane-toolchain-uclibc.inc
index bfe0bc8..41b133c 100644
--- a/conf/distro/include/sane-toolchain-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclibc.inc
@@ -14,12 +14,12 @@ USE_NLS ?= "no"
 USE_NLS_glib-2.0-native = "yes"
 USE_NLS_gcc-cross = "no"
 
-PREFERRED_VERSION_uclibc                    ?= "${PREFERRED_UCLIBC_VERSION}"
-PREFERRED_VERSION_uclibc-initial            ?= "${PREFERRED_UCLIBC_VERSION}"
-PREFERRED_VERSION_uclibc-cross              ?= "${PREFERRED_UCLIBC_VERSION}"
-PREFERRED_VERSION_uclibc-cross-sdk          ?= "${PREFERRED_UCLIBC_VERSION}"
-PREFERRED_VERSION_uclibc-cross-initial      ?= "${PREFERRED_UCLIBC_VERSION}"
-PREFERRED_VERSION_uclibc-cross-intermediate ?= "${PREFERRED_UCLIBC_VERSION}"
+PREFERRED_VERSION_uclibc                    ?= "${PREFERRED_UCLIBC}"
+PREFERRED_VERSION_uclibc-initial            ?= "${PREFERRED_UCLIBC}"
+PREFERRED_VERSION_uclibc-cross              ?= "${PREFERRED_UCLIBC}"
+PREFERRED_VERSION_uclibc-cross-sdk          ?= "${PREFERRED_UCLIBC}"
+PREFERRED_VERSION_uclibc-cross-initial      ?= "${PREFERRED_UCLIBC}"
+PREFERRED_VERSION_uclibc-cross-intermediate ?= "${PREFERRED_UCLIBC}"
 
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
-- 
1.7.1




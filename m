Received: from fg-out-1718.google.com ([72.14.220.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OS7xX-00067j-Cr
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 14:26:18 +0200
Received: by fg-out-1718.google.com with SMTP id d23so235558fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 05:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=wQNAArjLc22qctuoDTN04+2dh3Dr1yw0LDtAyokxU8o=;
	b=Xn7/ghU68RwPPkhlHg5nOwYvBizp5KvTgGbnb98OFUHUbGGkYs8+QXz4VpUQgebDhn
	byMVwuoXkZFYVrykrsUGtkp3TJEQt/OLLh9wEKGDWet64zw4FjEM6b0IigYJpLj3tvfc
	OSHGL+bguMpGsHigWazARgGLNhaWTKIf5SFZ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ryIILLZxlY+Dwfy3gmyXgWHAnMg0UfYKZbZMk20Yqizhij/oPukeSqF7Z+oXMOPu1C
	9df4xhbQiAVmAgVIMAcAZPTlb85+AQRHcGLs4nj2Xy4A1IJeO/UDAhsyeQY8RN7V3GQH
	J/VR081uTAYzmCZgZOm81lt7KIy5yfeGc4pcs=
Received: by 10.223.10.11 with SMTP id n11mr510354fan.3.1277468403060;
	Fri, 25 Jun 2010 05:20:03 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm43466484fav.1.2010.06.25.05.20.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 25 Jun 2010 05:20:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jun 2010 14:19:36 +0200
Message-Id: <1277468383-16679-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
References: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/9] preferred-om-2008-versions: remove pinned version of mesa/mesa-dri
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
X-List-Received-Date: Fri, 25 Jun 2010 12:28:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/preferred-om-2008-versions.inc |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/preferred-om-2008-versions.inc b/conf/distro/include/preferred-om-2008-versions.inc
index 3020fe9..79dde2e 100644
--- a/conf/distro/include/preferred-om-2008-versions.inc
+++ b/conf/distro/include/preferred-om-2008-versions.inc
@@ -1196,8 +1196,6 @@ PREFERRED_VERSION_mdev ?= "1.2.1"
 PREFERRED_VERSION_mdk2 ?= "v33"
 PREFERRED_VERSION_memedit ?= "0.7"
 PREFERRED_VERSION_memtester ?= "4.0.6"
-PREFERRED_VERSION_mesa ?= "6.5.2"
-PREFERRED_VERSION_mesa-dri ?= "6.5.2"
 PREFERRED_VERSION_meta-e-x11 ?= "1.0"
 PREFERRED_VERSION_meta-e-x11-core ?= "1.0"
 PREFERRED_VERSION_meta-gpe ?= "1.0"
-- 
1.7.0.2




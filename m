Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TqPKG-0006nq-Ha
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 15:29:49 +0100
Received: by mail-ea0-f181.google.com with SMTP id k14so5651817eaa.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 06:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=SGXJU31ttaeqsoHNiZkZtwJrYYT2GMTreTnrNlLxb+s=;
	b=pwos5HiI1qLjnLRkXWt87g4jIYZ/cMOXpkidNBbbXQIH1jp/GEQrR1zVWs1kT0U8FL
	9mK66H8InVAO/VS0P3aYJZsx0d6LHEkpdANy2QlyBz5tBKmt5I1cwrkHhVovZVDKiJus
	X/09rwC9anRGa34WEi8pEk+rAK3f7Z1QywFGrRsXRlA0NVewkqN4Lql+dpVDD7ALwIAs
	RFd0cKPS2p9KOUWmPKOqExiLhvLDODAubCkCiPQ1NkCb+bi5W8K66oWzKDRoUIxwjmpe
	haZ2udEc8PXI/fanm2DEsVrhZHSUqoWV7Smh5kRr5p8+aO7ldJxzIUq1L90TSEmN5zoZ
	rbMg==
X-Received: by 10.14.221.5 with SMTP id q5mr125437446eep.33.1357136086323;
	Wed, 02 Jan 2013 06:14:46 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id r1sm97742059eeo.2.2013.01.02.06.14.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 06:14:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 15:14:46 +0100
Message-Id: <025a39267b1261cf4159239d0d9b01fc1abf2631.1357135909.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1357135909.git.Martin.Jansa@gmail.com>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1357135909.git.Martin.Jansa@gmail.com>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 5/6] edbus2: update SRC_URI
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
X-List-Received-Date: Wed, 02 Jan 2013 14:29:49 -0000

* edbus2 was merged in efl tree and moved to IN-EFL in r81826
  there is important fix also in IN-EFL/edbus2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edbus2_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/edbus2_svn.bb b/meta-efl/recipes-efl/efl/edbus2_svn.bb
index 15e7002..1461d46 100644
--- a/meta-efl/recipes-efl/efl/edbus2_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus2_svn.bb
@@ -6,7 +6,7 @@ PR = "${INC_PR}.1"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/trunk/IN-EFL;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
-- 
1.8.0.2




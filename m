Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0A95673285
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 13:18:42 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o1so9434628qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=NU8wVUnqbvn3sE9SpmMvZEQR1VW74pIlU2OTVUbXUEk=;
	b=Fuw9OJSSEVrGXKwA1Xmn29AMRW64DeKPzJ+rA08MxwsUjc011Ucg1le0Z5gFU4IqeC
	k5L2oz3iwR2l3fFrvdzruvvsPpTzouNrtcEJCqAXcwd94ST9vxmQcLO8m6Uy5O64+sKz
	z/Abl42svO65O/4eMGGiAVDbZ0YEhJrEe4+kRydE9QXkjyjvcUaeavZg1r0fTrDBm/mb
	wUxYk+kB8eP4adTnjIGqPt7SgXbdwtDzG07A942HTb+61XX15UjSc6NiRJSab6omofqW
	jLEvGV1HuM+WzYePiG/dYIRVAgdb1vuJtbqlrOywDnP7yuusvIUU37I4JmVrbyE147jR
	qHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=NU8wVUnqbvn3sE9SpmMvZEQR1VW74pIlU2OTVUbXUEk=;
	b=MKQrl/Wn0awCBT1HqigfRkjKi68D9ZQZzYlzvT9xd4lWH34tShrigW5Pr72LPWhgUy
	nrpz9Vkrl8ZOh0WLWf5fFdzPyKt1P+kuo4Z3J1EIHNRjc56ia0G0PUJig5p2J3FOti6K
	kT86pqdnUhUVJqrQKQUVjHgnz3uHPy9rU518KLUWrOp7OeoZt9LXaMiALjbceGASyuGF
	9I6RoJqaJ2MB1Hhy9nm3vrW4spKNkztsd054Q3cN7jxF/C8kWTzY1E2NkD6gZJSR7bGn
	PQh1529DD6zjbkz7Mh3L6HUHBkE7DoGS8MzlQyNwcMfY7seXSQ5VgOG2xrqxmt5nGLa8
	ocPw==
X-Gm-Message-State: AEkoousJ9iEYv2Tx7dFGwLJOf220iygtC2VbdWYd2YuO8NeiF81BOh7PmjsVL1CLa36TGQ==
X-Received: by 10.55.160.135 with SMTP id j129mr42837193qke.167.1471439922843; 
	Wed, 17 Aug 2016 06:18:42 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	r187sm14680639qkc.49.2016.08.17.06.18.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Aug 2016 06:18:41 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Aug 2016 10:17:46 -0300
Message-Id: <1471439868-10118-6-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python][PATCH 6/8] python-functools32: Add recipe for version 3.2.3-2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Aug 2016 13:18:42 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-devtools/python/python-functools32_3.2.3-2.bb      | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-functools32_3.2.3-2.bb

diff --git a/meta-python/recipes-devtools/python/python-functools32_3.2.3-2.bb b/meta-python/recipes-devtools/python/python-functools32_3.2.3-2.bb
new file mode 100644
index 0000000..cb4bba4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-functools32_3.2.3-2.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Backport of the functools module from Python 3.2.3 for use on 2.7 and PyPy."
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27cf2345969ed18e6730e90fb0063a10"
+
+SRC_URI[md5sum] = "09f24ffd9af9f6cd0f63cb9f4e23d4b2"
+SRC_URI[sha256sum] = "f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416501e6d"
+
+inherit pypi setuptools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4



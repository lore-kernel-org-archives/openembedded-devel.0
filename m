Return-Path: <ticotimo@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id A922B7EB0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 05:46:16 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id ca19so1046533pjb.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 21:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F5lKDZq2y3oLIIlagXwLvg9+QEFFusgGGWWhgQ64ZIQ=;
	b=WSdfenlvPJ/0JYM9y3DpR4VEjHFAd7iegc8aijLgK7IjyUaiM9Z18CqjCQgN2ZQNOB
	JTaOpggeDIpSKMgwTNCVmOfggEzDgTCpEeX3Y1Awr/cXJJXj6R+XdWKuhQwbMmTiLFz2
	W526ode+E41Xd7+TNRuuh5Rckc2qg0gNYmyPQpnF9gid1CzHuuPnVAHywgsHhl7huD8D
	wjjF1G6SFchXxRNzwvna9uJlGqdqx9wy3GXzCX6cfgXi008xgwYEoz4OMhJ4KG2djTkt
	mpL3VWKsqTnwOqTZlETpBChsJibF2v5vJL7MqsdIfXL+wf2o8typcSwyICm2vgTGELCE
	8d6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F5lKDZq2y3oLIIlagXwLvg9+QEFFusgGGWWhgQ64ZIQ=;
	b=gseolYZM5YzHj9DqvePcFhfpXtzRsNS8ARJ/L63Abovv6NrJeXKvhDumMb+G6YwdQC
	PKSoUwnzgmRpvMTj2dmyJud/ofZqGEdCDBKwVowEJN9p6b9CcVlK8/RnRZnx9avMzLU+
	sKwQe2qFjZ63oqdk/LQdD1sl11ItnjpF3feWEBPALLyZCsbGxtpIJIHvxMBBTVI8zyc2
	2ZrkQTUtZNncwNxepo+M3OXi/77iU7MBWrVl06pVoICjigwWxXS0HHyzR4I7FD1Ll/Zt
	Tmb29h8kqFx8nEDR41imWx6H9cXXSY1aJhyLj+kF1MP1wXEp9r7Ysj0UmhRguhAbZzQH
	yw2w==
X-Gm-Message-State: APjAAAVNwuvjPkrqXdEqL3LnBeqOXAH/epIFkROJb3JOK1Pgjd5WQKKP
	BLSDWwGP6oYm4vNKwWtwUL20XAnhdfw=
X-Google-Smtp-Source: APXvYqzNWrFelJZeMzTZZ1TaW6JGr6K3RAQBVWE8Egl8fMTsLjZUtBitK5ImAt5CvnW2uzqI7iVgfw==
X-Received: by 2002:a17:902:900b:: with SMTP id
	a11mr3199386plp.116.1575351977442; 
	Mon, 02 Dec 2019 21:46:17 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:a470:42fc:1110:b615])
	by smtp.gmail.com with ESMTPSA id
	k10sm1223972pjp.12.2019.12.02.21.46.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 21:46:17 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 21:46:06 -0800
Message-Id: <20191203054606.14349-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH v3] python-django: upgrade 1.11.14 => 1.11.26
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
X-List-Received-Date: Tue, 03 Dec 2019 05:46:16 -0000
Content-Transfer-Encoding: 8bit

See upstream release notes for details of bugfixes.

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.26/
Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.25/
Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.24/

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.23/
CVE-2019-14232: Denial-of-service possibility in django.utils.text.Truncator
CVE-2019-14233: Denial-of-service possibility in strip_tags()
CVE-2019-14234: SQL injection possibility in key and index lookups for JSONField/HStoreField
CVE-2019-14235: Potential memory exhaustion in django.utils.encoding.uri_to_iri()

Bufixes: https://docs.djangoproject.com/en/3.0/releases/1.11.22/
CVE-2019-12781: Incorrect HTTP detection with reverse-proxy connecting via HTTPS

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.21/
CVE-2019-12308: AdminURLFieldWidget XSS

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.20/

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.19/
CVE-2019-6975: Memory exhaustion in django.utils.numberformat.format()

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.18/
CVE-2019-3498: Content spoofing possibility in the default 404 page

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.17/
Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.16/

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.15/
CVE-2018-14574: Open redirect possibility in CommonMiddleware

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../{python-django_1.11.14.bb => python-django_1.11.26.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python-django_1.11.14.bb => python-django_1.11.26.bb} (85%)

diff --git a/recipes-devtools/python/python-django_1.11.14.bb b/recipes-devtools/python/python-django_1.11.26.bb
similarity index 85%
rename from recipes-devtools/python/python-django_1.11.14.bb
rename to recipes-devtools/python/python-django_1.11.26.bb
index 3ecfdc57..94a98841 100644
--- a/recipes-devtools/python/python-django_1.11.14.bb
+++ b/recipes-devtools/python/python-django_1.11.26.bb
@@ -2,12 +2,13 @@ SUMMARY = "A high-level Python Web framework"
 DESCRIPTION = "A high-level Python Web framework that encourages rapid \
 development and clean, pragmatic design."
 HOMEPAGE = "http://www.djangoproject.com/"
+SECTION = "devel/python"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[md5sum] = "38e82b59a1c27bbf98ccf0564ead7426"
-SRC_URI[sha256sum] = "eb9271f0874f53106a2719c0c35ce67631f6cc27cf81a60c6f8c9817b35a3f6e"
+SRC_URI[md5sum] = "858e5417a10ce565a15d6e4a2ea0ee37"
+SRC_URI[sha256sum] = "861db7f82436ab43e1411832ed8dca81fc5fc0f7c2039c7e07a080a63092fb44"
 
 PYPI_PACKAGE = "Django"
 
-- 
2.24.0



Return-Path: <jbriance@cisco.com>
X-Greylist: delayed 572 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 May 2015 14:30:40 UTC
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	by mail.openembedded.org (Postfix) with ESMTP id D58FB6AC3E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1095; q=dns/txt; s=iport;
	t=1430836242; x=1432045842;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=FhzjKWjFlJ4EiWeH9Pvn/Pzd6OIhwiZ5PArD8VIYWPs=;
	b=hhkmI45WhCA2MuSQMlqMJPuhoCrDwxDv1kJrzBgX6hW9aepiwQrhW5W1
	6RkhV6oH/+pyNBu93HpwaH9i62gOVQ24pVHQK5khKdz+GNvivPPOVi03x
	J74boPq4QwP/c6C6gfH7+eu/d8Jlk+cc8B/+WT9skKstEWiRj1vlGEJZ4 k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A0BVBADm0EhV/5NdJa1cgwyBLwXFFWYJh1sCgTU4FAEBAQEBAQGBCoQhAQEEOj8QAgEqFBAyJQIEDgUIiCTEcgEBAQEBAQEBAQEBAQEBAQEBAQEBARePWTQxB4MXgRYFkh2hBSNggxRvgQJCgQEBAQE
X-IronPort-AV: E=Sophos;i="5.13,372,1427760000"; d="scan'208";a="147142469"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
	by alln-iport-8.cisco.com with ESMTP; 05 May 2015 14:21:09 +0000
Received: from xhc-aln-x08.cisco.com (xhc-aln-x08.cisco.com [173.36.12.82])
	by rcdn-core-11.cisco.com (8.14.5/8.14.5) with ESMTP id t45EL90W001066
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 May 2015 14:21:09 GMT
Received: from xmb-aln-x12.cisco.com ([169.254.7.13]) by xhc-aln-x08.cisco.com
	([173.36.12.82]) with mapi id 14.03.0195.001;
	Tue, 5 May 2015 09:21:09 -0500
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5][PATCH] qtbase-native: speed up configure task
Thread-Index: AQHQhz3Vm8SQ3oFrgUW5T9CIW/e7OZ1tbV2Q
Date: Tue, 5 May 2015 14:20:56 +0000
Message-ID: <5940D1D9F240BA44AEF939055CF1358D059B7464@xmb-aln-x12.cisco.com>
References: <1430835231-25126-1-git-send-email-jbriance@cisco.com>
In-Reply-To: <1430835231-25126-1-git-send-email-jbriance@cisco.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.60.62.156]
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtbase-native: speed up configure task
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 May 2015 14:30:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

* Use parallel make to speed up build of qmake during configure task
* Take the opportunity to use clean configure parameters to use
  opensource license instead of "(echo o; echo yes) |" trick.

Signed-off-by: Julien Brianceau <jbriance@cisco.com>
---
 recipes-qt/qt5/qtbase-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-nativ=
e.inc
index 7b44fb7..b6c868d 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -83,7 +83,7 @@ export OE_QMAKE_AR
 export OE_QMAKE_STRIP
=20
 do_configure_prepend() {
-    (echo o; echo yes) | ${S}/configure ${EXTRA_OECONF} || die "Configurin=
g qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+    MAKEFLAGS=3D"${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-lic=
ense ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTR=
A_OECONF}"
     bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configurin=
g qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
=20
--=20
1.9.5



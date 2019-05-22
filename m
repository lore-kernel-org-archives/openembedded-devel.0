Return-Path: <chris.horvath@essvote.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 May 2019 16:27:47 UTC
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 1E3EE7E34A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 16:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=essvote.com; s=omaha.092018;
	c=relaxed/relaxed; 
	q=dns/txt; i=@essvote.com; t=1558541567; x=1561133567;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QukVe6zKdx9dXNejyF5Gmq/42M2zKgZ21mFl2b2isik=;
	b=LCcwQy43uoe73pixQo4SfyFhX3+3YkwCNx659nGIzVKPqFKZdjz1HPnkXMX/21Lt
	VflosGTPtgt1jWH3VD9nkumy7T0XUdhv/u7zvli16ILU1QJOd4tsKOKJDC8HF2RQ
	viwMzoJWTfL7RUaptpB8rboQJ3jHvvEuCIAha6vkrC277wCNFBTcxt/94j/7N0PT
	ZaDK63AkH/8EPoP9M2LyuzRqlIraLc/fiknya+HJLfsjubgjDJExDCn5MLDD2JcM
	BE71fx22gTyy+C5uuEHs/WETosTQON2PkBqesT/djTwHWNINUIGL2iAIO+n9xiHH
	DXo/2h4F2kEHbxi9/D69fg==;
X-AuditID: 0a00029b-713ff700000075a7-50-5ce574fe626a
Received: from ESS-EX02.essvote.corp.local (Unknown_Domain [172.16.130.13])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	88.81.30119.EF475EC5; Wed, 22 May 2019 11:12:46 -0500 (CDT)
Received: from ESS-EX02.essvote.corp.local (172.16.130.13) by
	ESS-EX02.essvote.corp.local (172.16.130.13) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1591.10; Wed, 22 May 2019 12:12:45 -0400
Received: from ESS-EX02.essvote.corp.local ([fe80::4d14:423b:3668:f6f5]) by
	ESS-EX02.essvote.corp.local ([fe80::4d14:423b:3668:f6f5%3]) with mapi
	id 15.01.1591.008; Wed, 22 May 2019 12:12:45 -0400
From: "Horvath, Chris" <chris.horvath@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] lcov: Upgrade 1.11 -> 1.14
Thread-Index: AQHVELkxx02rpieQ0kqsn1MN0VmH3w==
Date: Wed, 22 May 2019 16:12:45 +0000
Message-ID: <20190522161238.75962-1-chris.horvath@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.36.150]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWyRqCJV/dfydMYg8ffVS0uHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujFkT97AU7OequLion7WBcSFnFyMnh4SAicTRFQuZuhi5OIQE
	jjJKnLl+nRnC+cUo0TvrASuEc4JRYnXDTzaQFjYBI4kb/y6wgtgiArES8zbNZAKxmQUMJA7/
	2M4MYgsDjd2/4hwbRI2lxO9ZF5kgbD2JG2ebWEBsFgFVid93LoLN4RWwk1iydDJYPaOAmMT3
	U2ugZopL3HoynwniVAGJJXvOM0PYohIvH/9jhbDlJX5NP84GUQ80f+oUKFtbYtnC18wQ8wUl
	Ts58wjKBUWQWkrGzkLTMQtIyC0nLAkaWVYx8uUZ6qcXFZfklqXrJ+bmbGIEBz8XANHsHY09T
	7CFGAQ5GJR7e8MKnMUKsiWXFlbmHGKU5WJTEeZfy740REkhPLEnNTk0tSC2KLyrNSS0+xMjE
	wQkiuKQaGJlfFxwJ1fvXsJaLyfei5uyoIPl/YvntfBriafVNqfGlTGbM1YJ1ggUXr2eznvVp
	9L4dpRD6//rWmNnLvKsnyXovTrgxs2vK4j3et/R6Vu1vqWv0feDbHcRzyv18+xr9R48O6h76
	w/rykYnjsgnWDuuXH7C5tjAqYNHeYymbbyo+KDq11Mh4mxJLcUaioRZzUXEiAG/Z1L5eAgAA
Subject: [meta-oe][PATCH] lcov: Upgrade 1.11 -> 1.14
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
X-List-Received-Date: Wed, 22 May 2019 16:27:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Upgrade from lcov_1.11.bb to lcov_1.14.bb for GCC 8 support.

Signed-off-by: Chris Horvath <chris.horvath@essvote.com>
---
 meta-oe/recipes-support/lcov/{lcov_1.11.bb =3D> lcov_1.14.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/lcov/{lcov_1.11.bb =3D> lcov_1.14.bb} (87%)
 mode change 100644 =3D> 100755

diff --git a/meta-oe/recipes-support/lcov/lcov_1.11.bb b/meta-oe/recipes-su=
pport/lcov/lcov_1.14.bb
old mode 100644
new mode 100755
similarity index 87%
rename from meta-oe/recipes-support/lcov/lcov_1.11.bb
rename to meta-oe/recipes-support/lcov/lcov_1.14.bb
index 56a018ba5..fd02f4a76
--- a/meta-oe/recipes-support/lcov/lcov_1.11.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.14.bb
@@ -43,10 +43,10 @@ RDEPENDS_${PN} +=3D " \
=20
 SRC_URI =3D "http://downloads.sourceforge.net/ltp/${BP}.tar.gz"
=20
-SRC_URI[md5sum] =3D "e79b799ae3ce149aa924c7520e993024"
-SRC_URI[sha256sum] =3D "c282de8d678ecbfda32ce4b5c85fc02f77c2a39a062f068bd8=
e774d29ddc9bf8"
+SRC_URI[md5sum] =3D "0220d01753469f83921f8f41ae5054c1"
+SRC_URI[sha256sum] =3D "14995699187440e0ae4da57fe3a64adc0a3c5cf14feab971f8=
db38fb7d8f071a"
=20
 do_install() {
-    oe_runmake install PREFIX=3D${D}
+    oe_runmake install PREFIX=3D${D}${prefix} CFG_DIR=3D${D}${sysconfdir}
 }
=20
--=20
2.17.1


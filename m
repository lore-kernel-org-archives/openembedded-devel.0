Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EB3D116F5
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:50:51 +0000 (UTC)
Received: from outbound.ms.icloud.com (outbound.ms.icloud.com [57.103.72.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3700.1764363043692690172
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=ZEZE7PgF;
 spf=pass (domain: subset.ch, ip: 57.103.72.93, mailfrom: patrick@subset.ch)
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-10 (Postfix) with ESMTPS id 7E7EE1800B38;
	Fri, 28 Nov 2025 20:50:42 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1; bh=pBCV0UknVW7hQeN4Fyw6B/cajFiGlC8IcEuztAhXikc=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=ZEZE7PgFQIunczXm4Bo3xrpuIC9BYqHFy7WgdrbaTkHAIVYj9VhnPXnk94lSiuuK0pXkTog0FKAHrD/eQPzL/WLQDkXlCahYZJS8a6bgmh/EDY+VTL1VUtu16cOyEgoTBcQmRWl/CDzVpBaGriko/TYDm302C2fFWDNXTyVC/8mp0lUJK/HlzJLxs3+bjgfv0gxO7qyQwfMSV4/0NuyjEobbBmd2GMz94k5go9NpuQanEYGAYFd7+fDmY7/IFidkaRYZlrOZi3Z7RcMzV+GN4rQWF3B556ysFn93fuAmCOb1biDCavHbXhWiW52YaOnzgllfBQq2t/y06HTgqkvHoA==
mail-alias-created-date: 1663698038540
Received: from desk (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-10 (Postfix) with ESMTPSA id 457D8180026A;
	Fri, 28 Nov 2025 20:50:41 +0000 (UTC)
From: patrick@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-oe][PATCH 2/2] fluentbit: unbundle msgpack, sqlite3 and zstd
Date: Fri, 28 Nov 2025 21:48:26 +0100
Message-ID: <20251128204827.3553598-2-patrick@subset.ch>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128204827.3553598-1-patrick@subset.ch>
References: <20251128204827.3553598-1-patrick@subset.ch>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: qwLBlRCZG-W8VLg8e5H7tnIAkfKO7ULE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDE1NCBTYWx0ZWRfX2ZVisMqbuosC
 n4hA0JxViV4fyKs0bkXWyIrI4e0fVfKStDn6tSJdT24TRLNLeHh+MUVzCI5Yix/zorxUWlQHvW3
 8H5G9gwbzzMotPZW8swbKum06Wme5GZiMDGOiJeWcgp7n8/pXZlVIZmBZBI/ktrXLFwElhyAcYk
 loqXLFb/xbU7u3CwjSuKi4ZKvefSZVZTkMpSibkEXiAtr1P3FTuWUX4Ar0op4evd/HKAjaqhcN9
 798peiukVynCdvKR73SSZDJiCjAqqIUE3GKAwbNJbe/eKl34iQM4CLpocVyPIXMj4vNNa5W0Nf0
 Qf3TJ3URNy1jON7pL+n
X-Authority-Info: v=2.4 cv=IpgTsb/g c=1 sm=1 tr=0 ts=692a0b22 cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=a_U1oVfrAAAA:8 a=OzzykBneInmVyopyB4EA:9
X-Proofpoint-GUID: qwLBlRCZG-W8VLg8e5H7tnIAkfKO7ULE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=822
 malwarescore=0 clxscore=1030 phishscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280154
X-JNJ: AAAAAAABybWyI63rUJcbzZ6Lvmx2udiK6kZ7zw6DPg4irmz4fs9RtT4yn8VW5De7ZaZOPMfAWi5mqhhAeK9qDj0Lf13Ughg97hj3ETJSKHaE5aAvr/l5g3GsYUF3aurgR9E0NBt5GvNsf8KaabgMzcu/DLJVrjOHmoetypC9MNvt9d7jWngZ8doKvHM9uYWHbkROkxb6PErSaEiLwR7AzDKm2ZlSzvq72JC08/k65n6k6OzHuyvWcjWkWZPkTO0TPJnc+TTirv9Lb6Ht39sc4bhXQHRmSLHYyQ3vjpLoUhIEcIWHmvfSwWcog+9oDen/+jag+2gXMPoJ50TgnfQrOwGqWpwb61Z0vl8nHWT6wpkkEWhXq1/vrOUtjKkiOog0b4SkHes7nS3no9zChB+kB8fJtf/w4NOwHYDQTqSl3zcrVfQQiT5aB5d3a0Bf5SrEbfeNtbvRwgNtB8hL4RFdpWBuzCskQ/1SnaQ8gROtVep8ohnLfk1es0FeBjLS2zGrg+4WV4bu+Y/uB6vRWZujD0AXgHhO+hgcZTymzFsUL+zLOMDvXBhQjPdlzV5hT0WEsKu+ACTKYdCXtbc5eqjmz9VWLrRbeoUwKdj2XBWgANwIqYVuPjlzLF2VZSJrFYmGS8E=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122153

From: Patrick Wicki <patrick.wicki@siemens.com>

With https://github.com/fluent/fluent-bit/pull/9572 it is now possible
to unbundle these and use the system libs instead.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
index 279486eee3..2c9b874e50 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
@@ -57,10 +57,11 @@ PACKAGECONFIG ??=3D "\
 PACKAGECONFIG:remove:toolchain-clang =3D "ipo"
=20
 # Use system libs
-PACKAGECONFIG[prefer-system-libs] =3D "-DFLB_PREFER_SYSTEM_LIBS=3DYes,-D=
FLB_PREFER_SYSTEM_LIBS=3DNo, nghttp2 c-ares"
+PACKAGECONFIG[prefer-system-libs] =3D "-DFLB_PREFER_SYSTEM_LIBS=3DYes,-D=
FLB_PREFER_SYSTEM_LIBS=3DNo, nghttp2 c-ares msgpack-c zstd"
 DEPENDS +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'prefer-system-libs=
 backtrace', 'libbacktrace', '', d)}"
 DEPENDS +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'prefer-system-libs=
 jemalloc', 'jemalloc', '', d)}"
 DEPENDS +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'prefer-system-libs=
 luajit', 'luajit', '', d)}"
+DEPENDS +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'prefer-system-libs=
 sqldb', 'sqlite3', '', d)}"
=20
 PACKAGECONFIG[all] =3D "-DFLB_ALL=3DYes,-DFLB_ALL=3DNo"
 PACKAGECONFIG[arrow] =3D "-DFLB_ARROW=3DYes,-DFLB_ARROW=3DNo"
--=20
2.52.0



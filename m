Return-Path: <Sana.Kazi@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEE5CCD184
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 09:06:12 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.81])
 by mx.groups.io with SMTP id smtpd.web10.14306.1759827962629868562
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 02:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=AWpJsz6e;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.81, mailfrom: sana.kazi@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/3FUU4zJ5G+YeVWBKnBlK0Gf/UBcBCRfQ1WqEnM0OO4+X/dcmgfZU/Xau/Ns+/kvQ6oZo/unNBRXdsE6uGQZN1j3HU6gj8ZHo/YJhaMfDzM/c/CgDPpBjzwwGrDc89w4VjQXjwKWHbo6sNr4PAc6rpa7zhVRVzMvZtbxEMYaBtamI5KvYmQa6CD84K3Ez6/uEJyMTVY4Y554FS7/i+o1oyUs66OHud8yuOFzVhzTc/VMY5a8aT79E0yt8QgIoTZYGc/r/JwJcRQzNaTZ//YyqAke2Eoya1eiWn31vH5wYbMFTulILtJa/MyqAJH4dCyOLqCXWSgQ8j3xsnLt+vpFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5zOB72CMq9JNerJDfUpi+KI4HNMOqfZ4VTXpSaUSVs=;
 b=VzhQXmUnRqWB2Glp4v9eXYk0tDOWdJwKoA/v7qiBTMF/F8ALJmYqaQM/7ipLnLkbgQKuyPyhZOyKU0mK4Qgc7SGoEpY+2zr/88b3HsQ9Fy0Dql+NqsU6bgvJvMfCpWyNM2zPgvw9q93qNn/5hXQWwuC62OnbZS59d9EHcnd3b7b0kFozPE1bWpK6Bhkuejbo8bmg29ol9AgKwHpBOTHKsTd8YtbqDjKg5KvVo+aJ9Dxq4fUpWqfEXekIs15VOpiExdI9fknDF8LB1SiY61T5crkh5KxfKvmu7aVtKkV9kS67kEqaoC549oa2eynXlnE8YfeAeGtVkVeG/RoiIY2HwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5zOB72CMq9JNerJDfUpi+KI4HNMOqfZ4VTXpSaUSVs=;
 b=AWpJsz6e3hTsM6atWQBqwJo/GQEOnGzyS6rVXLcfhziSQ6gXU0dCJnM80a/WKSSuykyjbpvebzR7TSpL7c7RcJLZV2eXdOs6Qv56iKfQd/OPTP3sO4mmh8HCaAXqt0xILA3vqWt3EKHbsZgcGfs0jRbAwP++StX5KIS61am8bOaFsmZyDLeOAIcKNlLEx4cH/g68XU7Eq5tLZ/EWS8XLjU/F/dNv2wa2614fTFLYeWlZ5VGkNm/xFYPXesp8rGx+t7FMlnpCdrsLIGWeMAtUAL0jNtZt7IIfewY+TW0EDifupGFq824336gsbrzmcSlF+LjQ9vwiEQKtImwAuvvvaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:19a::20)
 by MAYP287MB3849.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Tue, 7 Oct
 2025 09:05:55 +0000
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95]) by MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95%7]) with mapi id 15.20.9182.015; Tue, 7 Oct 2025
 09:05:55 +0000
From: Sana Kazi <Sana.Kazi@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org,
	sana.kazi@bmwtechworks.in
Subject: [meta-oe][scarthgap][PATCH] cryptsetup: Update the license field
Date: Tue,  7 Oct 2025 14:35:40 +0530
Message-ID: <20251007090540.18253-1-Sana.Kazi@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0122.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::11) To MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:19a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB4602:EE_|MAYP287MB3849:EE_
X-MS-Office365-Filtering-Correlation-Id: 39157897-9677-4e63-018e-08de0580b8db
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?akZrU9W8nW0Bs0BQjWsQGIz+2bkpXe+cJFLVlN/P95oJ1fWnC1SZvG/tmISN?=
 =?us-ascii?Q?CdA8VZCTlO5ltbhtaSF0hASUbLEQKKPsgZUrQK9NGNDxg9xqnIjF1wCEbvL+?=
 =?us-ascii?Q?vFq08aXDGcb5r+iuGLa6WHiawkFpDfSWsGpREEKHSr510yp9xDgcQGeZCRA/?=
 =?us-ascii?Q?gFQqWa/Smsy30hv4dciVstw6/0RVfRraLB5aA5WONcMDZ60Qm+ms/iBTdrKa?=
 =?us-ascii?Q?eYnX/gF3DYnQn813rcMPGyj9bQVIvB0E9/oTe6KF3+vULTASuAW8ucb5qAG5?=
 =?us-ascii?Q?BIHLPb/qSRwjInEvk6CQ7UV4CEHqpkgGv3D+owbtoyvEAlllgfzKF/6Z+3ST?=
 =?us-ascii?Q?p8L8YUcbLfPy4mjZ0tiatNggapJUhfM/w71TXSy1FyfKLfw6KMF6EcknEatF?=
 =?us-ascii?Q?DmlsakRgsH2U4i5r4f2aGtw+tOEv9jyTfDbLUZ9v5SMu9vgoK5yWyUuwKAHO?=
 =?us-ascii?Q?PBtW8oP7YgQdjqi1CsuILmlHut3oxeokZ5DPqDBD7eaAqPdk44J7kQlFgcG6?=
 =?us-ascii?Q?JrI6biuV9iIMz0SkecHrNKbU2L54BpiH3oImH5VNQ5Hyfeh5dBs87fQ1Dish?=
 =?us-ascii?Q?3D6AkvdgROyoaO3WT9+qpWtvass3AGOk0RjhFOdCJBgZydqMi/Y+r0Dv2FDB?=
 =?us-ascii?Q?MPlOkoG8EgzVwQyHx4upwgyaEX5EW6L7MT9uU+v8GDMlMMb7pKtqKAc+sVhS?=
 =?us-ascii?Q?bSdMeLafs1TLrxNDL7Brn5FHsi+Yq+oem3ZQz5UaKg38BpYapno5SjR4nIGp?=
 =?us-ascii?Q?HSe/iCe85PE3lU8db9fiKFVfEOjQd+zfVJYocNqUsDdE+NjfIJl9JmG8Blmh?=
 =?us-ascii?Q?2kkSAmIUtISvabe1sDPL/bfSPoRnfnumfAT5HGGyFs+E5dMMIpMoBVs3nrdl?=
 =?us-ascii?Q?g64uaO4OFD44y2kPksVciRc2Ey5Oswli3E8U7Fyl64LDBhsy5RiV9U4RGlPu?=
 =?us-ascii?Q?GzZptpjCzVCGCSdpP66gyQVIhvAbXbVOrNlBrYXJ7BS/ngYzehezXOeNbExv?=
 =?us-ascii?Q?OEwKLAVe41cTfqnWLQWkvDpy2McpmBy2GByn9F4DBwoZm103ghRJZW6GFijT?=
 =?us-ascii?Q?P6lr5SIm4cQviLzjt5Ury974OjRiN3XudMQSzSgeT0Sh1I65PmExQze4vokX?=
 =?us-ascii?Q?AfXC8v2mZpZPeBQdUJt6/YooYRCooJHK59apZTPCHX3HAtHGVDjnRAFGgWVa?=
 =?us-ascii?Q?xcpj29jymHd4vf7SXkd8rpaxA888Nyh99Xlt317EGUxdDoV+gSpIlewHHcqz?=
 =?us-ascii?Q?bSBRs+mfi1AvivklSgj/6OqbDGGCXkJ3QqinJtVxnrZ+AB4OX9bRGybbSOQh?=
 =?us-ascii?Q?dDBh0+kogn26gSgYkryngXgtRdHTcSCzesfXPD6XsxAT/0KbhjMxon5yvrxE?=
 =?us-ascii?Q?MeEXQmyv/y2BlmokEO2gc2KO/OOfEuKsIIt7KwPfWBzeVL9FEOQHTClgq/Ra?=
 =?us-ascii?Q?meD+GEyJgaI0qTEJdhZ1hzuuOc70Jq+yye0eWgTVRpbe97E2m1AE5g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB4602.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?giB5FeTsslZ34564JFNebqEsaC6dujTJ2N6zn5K9HqETtg0RzW9gXMgaBn4E?=
 =?us-ascii?Q?s02AuWJ+NMhMRyccSY4l42T5A5VCmebeMUWWExwMiA9ATHhvi/r+4INqlmjG?=
 =?us-ascii?Q?nantAiXHP6A+SCnh6LxINEet8IOi3uQQkMBwnxWgqjKacpJCbYvD1uHEH03T?=
 =?us-ascii?Q?Lg/Kd71ft/qpBnz/cdx09i7oT7bFVO1J+cg63YH9DJjjSoabGDxRtSNWwWxV?=
 =?us-ascii?Q?n1fn4lIDTXhmMgG9cnhihtRZkUFiy77diYBv7cOF0E/6wxr9kRFGZuxGQhUm?=
 =?us-ascii?Q?zc8HB8IVohEFfe38CMVhMQ9Ilzv8fCoNzXA8AsP55i3Nw5RE7U7XyEg1JCNG?=
 =?us-ascii?Q?THDJteQDl1/6cA8656enMYM5qwy9rHJwk/pKLQa+5JZidB81CcMhRsM5HeQ5?=
 =?us-ascii?Q?hUD9+B2os1iI7i5gXYBz97uM3ggMDQ3Ot8avIJE/0TzTSuHSajz3Wl8jFeh7?=
 =?us-ascii?Q?gC87s7rEAgqFLV30U/01tNhnz2ERzBa8/IzgzgC/mIzJUtPhYuMYEw7LAN1k?=
 =?us-ascii?Q?jx7mF7lhxLKUmVZU9YXlgwiHZYM6Wsealwx2mjWzwjg5IgBJC26CrK+eBBcr?=
 =?us-ascii?Q?UBk/gWFLBJ8ruRDa4wO9CucOGQauyt+yT1Py5GHcXIrHMKzPaiqQMoYzRwp1?=
 =?us-ascii?Q?7MGjEPTaoYEfvVdqi4KniBlDk0+kLpGuc9nGgvgh6/h2gwh8sc2FW5AKIq4M?=
 =?us-ascii?Q?yGmyHcOnao6oYfih9WIYqVZnBJX0Rd1X09a1oMNCr28GNGJWDZ3EEW205FCA?=
 =?us-ascii?Q?+DIgtIM6eAnHHEJYnCYYSnyBfN3Lwzgx3Ze1pJc7SRiBVbZJsZADXX47gyy/?=
 =?us-ascii?Q?mjPHEYWH2VbkozDJOvhn/N1RJUC4BiZXb6c6L714qHMV2yF/TObSXjD7NvCW?=
 =?us-ascii?Q?LOJkWjC/Kj2iMROwQab3hwVy7lawQDU6s3XIAtQxehQBARY8DtpELB4oc1dO?=
 =?us-ascii?Q?LNFI9zT33b8Uh+cbWo9O7lzDvAthkQQ3xo8hT8saMZElFltOQpU2mamkBn2V?=
 =?us-ascii?Q?at6vL2G2tHhjlUHVY/N9IXkt9SZORYVVn+9TAI84ljcu3O0dWCzEpw3OM8mZ?=
 =?us-ascii?Q?cz5/9mZUadkWJjfwfKo1n3XDEbWXz+UTkbDe4nVs9W3JqJrc1DGhxJH5ShrV?=
 =?us-ascii?Q?xXqa6dIIjuDlNJQDjuYE5Oyc8Sk6hKdqdPRDphW5q8ubpzia6InhZGbiHDfS?=
 =?us-ascii?Q?RnqSkqmHd/x+Fno9SIE4mORwbRffbn7jEXGFuZ16J0gcHDa6u/Ecvwg3sT7W?=
 =?us-ascii?Q?xLrnZhVOrvI1Nl38YSCuxRtSisZYutcCFFYSDJLiPw8OqxQ+TwkyZCLGhkVi?=
 =?us-ascii?Q?v1/vBi3xHaqGaicFSduzgG5JW1LOuFj3SUbnK74fKQDNPwSLvjH9pm+EwVbX?=
 =?us-ascii?Q?PzDh6KW2/mk1D8D8YB4s9GJLrIdvSWKq+ISPGfGkIe8tK448OgRZgTwj09OB?=
 =?us-ascii?Q?SiJQbykeSwPXXeiOUYutrEHB5W81xODJMlUCSKwZh4iYab6mGPApGrVxbkS3?=
 =?us-ascii?Q?d27EQb+5/vskG131xF0tE3fGBgsoLVsBbGrssZJaidJKEQNRvAxnWIwkVfX3?=
 =?us-ascii?Q?qd+EtvJlXiUM3A3Ng2PicAHu6kBwta3o67BwywYZ?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 39157897-9677-4e63-018e-08de0580b8db
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 09:05:54.9894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiJ72r//VvqbGmzSvJgrVk/b+UloHOUoxy5CxxX9/bJoRlw8zvIBY5Wf+Vy84i4AHYbiMsAvT9cAT/MRqp8NKEtXx2OD8HMdpPXS++jzoig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3849
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 09:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120323

The below reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
Therefore, update the correct license.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a4=
4380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb b/meta-o=
e/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
index 504c718b96..711e582809 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
@@ -6,7 +6,7 @@ and can hence offer more features than plain dm-crypt. On t=
he other \
 hand, the header is visible and vulnerable to damage."
 HOMEPAGE =3D "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION =3D "console"
-LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
+LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-e=
xception"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be31232=
6"
=20
 DEPENDS =3D " \
--=20
2.34.1



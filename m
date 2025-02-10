Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFA3C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 13:29:40 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.53])
 by mx.groups.io with SMTP id smtpd.web11.50421.1739194171707354893
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 05:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=P66QB2he;
 spf=pass (domain: prevas.dk, ip: 40.107.247.53, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dElIgTvESmH1jMNIKrXldCeiI0QMCy8+gmdMbJNGayqln1oKiYzdLmUL692XrDreAAKDw1vmLS9wq8lSOuriUbUMtN5Lwwu3j1cA+e5TBbJ/ATI+O1NGTsc7LuYiVPiFhZjvUw8IJE/ICemeCqRTt0QbHvHo7jDUZjL04zysWq9I3aa4w2MaaLHD/zV7Ja60cLoQxEYZHyOp3oPmDidipZWCEaD1ePvw5tXUYuHidqxQ67FDzL2kYQ0nW2mViFTjEjzonQpfxvtVR8cLdIrZ8q7Q/u0yYV7tSBRBa5Kjtsf2SUn+cQpnYuRf6MwuTIUPfkUs9sDCnjEVD/7azymRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUzVN5Sv2sGl3iMot88OOvz3nlA8hFVfyfFM+dQGqLA=;
 b=FlpZnXsgmsVDqRXAUH/jgHzYeSIPR26K275ZKzkJ1HrYOZjqCuzJnLTIrlMoxZuMS1ZM5IzE6LsGthh0UpgBUWMGRN+HhTQD4i9+iJE8bo9Hd+wE4Rj3h75+JWv0cY3KB+pBTKOeeYVV3YxdosKL1rcQzKbIGknal1G/qFshoo4m6A/jI6Ji8OW+U5DNilK6025HNQyX6rJtQzAQp2CsLdzeY0NKQoolvzdYkb7a7gW6MVgS093hzl8Hh+0cyv87Qm+yZCzmKdyV//YktwWGIkT2YaCy5tw7rwGq5Jm8DuWcLc9UjU7W8P9kAhWe0RIlfWI5XgC8IjJ6ZJPIkOTsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUzVN5Sv2sGl3iMot88OOvz3nlA8hFVfyfFM+dQGqLA=;
 b=P66QB2hecHaeGHckqyHvA395IYSzVNpJC7uZkq6OcVV1im5t1d0EREtJWtpOrYVPkhzPQmBNkWTUbHYmw+CYoJzMotkchVqb/ijJ8OQx0jP8wXDknMniY9MuDwgs/C4AoQPrBC/uo1rahIqvAlw/9Mn3AGj/pgNaafXT8YllwRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by VI0PR10MB8933.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:23a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.7; Mon, 10 Feb
 2025 13:29:26 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8445.005; Mon, 10 Feb 2025
 13:29:25 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [meta-oe][PATCH] systemd-netlogd: new recipe
Date: Mon, 10 Feb 2025 14:29:23 +0100
Message-ID: <20250210132923.933209-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0017.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:a::6)
 To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|VI0PR10MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9df96c-7f90-4fe6-3d57-08dd49d6f02d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bDKwoLmybjlY7rxSy0PpCwaRrcqC8zErLgjvNwbptBLfxJw3TGpJHOS4hdVY?=
 =?us-ascii?Q?3M07IHuIB5WSKWPRES12tLsKYtjUk3t74dlUa1JlhmF0IEj3LRzJw90GkTLq?=
 =?us-ascii?Q?wOIfJ/QZFjJNyzVEeUdJTWhmOGgZbQTUkB2lqGHbx7j62zRwZZ+u80EMVZ6g?=
 =?us-ascii?Q?2tXlsqa/4N8h8nz9gNC7YIEcPnX0JAbafeDF5esVwRaRl8aHZdPJ27iokUSs?=
 =?us-ascii?Q?22Jomj8lcw3BNG3QtMmJPDPyYNWg1XNu9mTcEUhMZK2sDM5Ij4u6pAZ+wjtg?=
 =?us-ascii?Q?HZnaIjpVBKvmqhSCGscU4iIFOlRXaOnJ9aWxsX+X8Py4dS0pMxtKyh9OrRzL?=
 =?us-ascii?Q?ZSYKjWdFWjTOv3RMeMJHpH/erg76S4/GHnF7ovPsXuO/8Ecxkf2AbvB+ZivO?=
 =?us-ascii?Q?66OYqEEUE+zx4iXvL2/ad0wqhRQM+SpNcnSlgICpgx4RXTxAbUNHX57W5oCJ?=
 =?us-ascii?Q?G0CxK6yyjfPpNKKuOVBHIXLXwQhVBOTpeGKtK7pER8dRblVq4M8MsAUhPQDK?=
 =?us-ascii?Q?jYUL7nTCEzUKUUFRHlK+JTpW/P9WE/8zzvwDcvhQlvMOriHGTGQAwSXmjTGH?=
 =?us-ascii?Q?T7d9fBBa4TeLOkTczgl8laCIKwpknoztIXjkNaIsLUD6RpvmRvGPEu6Jh8pr?=
 =?us-ascii?Q?MJpyz79EeCOKoP3XIG4r5y3UgAF46Wa6tU/AuZdoSVe3MCf/Gp4K/ZGCUHO3?=
 =?us-ascii?Q?HK7ic6LFTeqfCMrj5RreCLUZcQLX1uGfCfPLfmyeVSEDfvpoml+hHXWNtCjJ?=
 =?us-ascii?Q?bXdJ77bSfgZPa6M4GOO36FHo5/wu8HGJyeOxPrRKTaKh9g0yr+E0g7HmMo/0?=
 =?us-ascii?Q?1tgN0YwM54uMho8o0K1ZILmkHo4Fu3s2oCrCWtlrAvIhV8HHXdBioEQgbcOS?=
 =?us-ascii?Q?nkE47fG0drLUo5kmkfcqVywzl8SQlu1XFWdIDd2z2LXGo/iBsYfAAZRrJ0Ol?=
 =?us-ascii?Q?J6aigwgnjh2eunZf8I2pHjbB3bA3nRPvhAd2BlBOY84+eAZdUt5CxmRMCXcA?=
 =?us-ascii?Q?nwlc8QyHk8vHwMKJLcsETZ+gJZtCUPJWZ9IrBJIOKPnMq2lQWdZJrNzXb7xh?=
 =?us-ascii?Q?7iT/2YnoMzCGYEJBLwj4Hr8oo02FPxiAWUhdyICWI8BO4Atc/sO1QIF68/4A?=
 =?us-ascii?Q?B4aqjcgm7Fn5Cp70wwSPBWQhaO3tbVQtobafR7b3rHoIoHkm0/BMdAb8G7tV?=
 =?us-ascii?Q?04D/pqRjj676FLCPFpuJdac/JDUOEWZaJ+ILd7t+yiGKEferW1CUyZSSUHUK?=
 =?us-ascii?Q?mEYNnT98YvQ/H9EhZZ8EJL+mI5gzNkOt4r9PVFRdSitnD5HAc4coNtX16I3r?=
 =?us-ascii?Q?DVe/aVbv9+gah7AM+1F4GcvzGTdtmY5RgY5AMJ9aoghjPWX5BFrM68adrs8w?=
 =?us-ascii?Q?HVEcxt5da0q/gqxyjhdeDg7C9KWmYLaEDMTRZo6PTtcVaRyLsHfJXcRLk6tb?=
 =?us-ascii?Q?8Nm3Q0jYU8dQ34elnzlTAyIwLRtHMVFx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gqZy3SbosbC/AxlhMr2uz7Gt/yDzaJXPE5RTSNc7bHA8NRyQKbi4ndK3I5Sr?=
 =?us-ascii?Q?+MsGt34N1SZEmA4s73yAnxl9NXv28ptEoGp9Rhh95EWVxs6yfT4u00yJv/4j?=
 =?us-ascii?Q?FQBsMJMTetd60ZlRBn1Q3KMQcIESL7pn6QoClY9DpdkDYteSHwhn20oYFFny?=
 =?us-ascii?Q?juxnqr1b513md0WDPaXhZlnQAY6BwB0S0y0BzpoiicCci8iC6GoB5B8z5TDA?=
 =?us-ascii?Q?3X0iF0IbJQXBoM9Q9oHk9cL96EmK69+nHBh8SxTxTCxGndwIpXTKZhM5aLy2?=
 =?us-ascii?Q?vEPrrQun1D0BkavA7OmI+j4Ks8nX/zD0bDgBY5EFf/pFXNkMougFpvLvtXsG?=
 =?us-ascii?Q?1kSOlwiG+MOsb07cg21TEF6IlpEVk53cUTVsHwMRMfsINuhatKwMjvIOBzMc?=
 =?us-ascii?Q?o+Q12SB8cndDHNVdwit/XtrpGkue6eyh9DTSUuLkr1AQRsjPaVjAGpIim7Za?=
 =?us-ascii?Q?Fu4vVD29jUVvXSK4/kTEqPvwD0OlXcOutbMYz2i4bR8r7b6yy72HSdKVew/j?=
 =?us-ascii?Q?LcZKbtKWWsJxohQp4NQj8jy9djpiI2LDF6IfFaR670uhT1cBw3jqJfO0uuTC?=
 =?us-ascii?Q?zo5vFfULLkjpwz/rDi168uEJTtDPVVxNTVFRWG0OH/uBEEaNLSpD1cdt26eQ?=
 =?us-ascii?Q?5Foqoo0o3kZEatcwk4mWxSf7Bb+lJk8lxJPpOuh4VJgmMlPWytrunFjjvi0t?=
 =?us-ascii?Q?wiWcq/fbHJ3mGOXUVGwyhPpEiHM0Sl8zQgV1OGZ8bmzHhqUfSJEyfG/et7/z?=
 =?us-ascii?Q?gS5HacxxZv1n5p5Ye4GtZUKsFEoZFcd8nFJ+DNJ4jYftj2GVk4axPpilq9M3?=
 =?us-ascii?Q?2NcrzCyzpPe9gQIoqQeHzOMyLq9tfIf5Dy05P6f6slrpC/073GOovvX4Zo7O?=
 =?us-ascii?Q?kpQdeFZTR5UcDntFgdYUlfgzFpjzu1JQb4AMOgPXCYlAhZ9dPUoF5p9esiSx?=
 =?us-ascii?Q?Ngk35EqER8AZ5RK4pUdwdHnPE6EnhkJp51cWsI4GptwVr5AXGzJQCKfNayv/?=
 =?us-ascii?Q?4CF23i9813cIzRU1i31T15vEdBXZ3WSd8jAcuO0uVs2emfqA521d7wzpQEme?=
 =?us-ascii?Q?/MQAevUvAFnQ80rZOOvXjvG+KhA+95SCdomYFdGoV0zbUcXe4GNvOiOaJ0P4?=
 =?us-ascii?Q?BkveEnQzWTETNd6RwWwpxirLh46//hbXnzrWHeAwEg8Ht6lZ2rZ/fGHycZ+i?=
 =?us-ascii?Q?z33RQasvkXBZZxVACJkadWoiRTRsDVOCwr7qc8morzFTN31MyycEqXRJUi+c?=
 =?us-ascii?Q?BJzvkUA4HbylMqhLDFRXicZOQ9tk1Yv7QGKXPkKKmHWNpqPbIaFsViXk3Lwv?=
 =?us-ascii?Q?ovTWF6BVmDhmkx5qXw45VtlESEIO/zE62x42WKPyJy3EGraMD2U7uqgA8vrO?=
 =?us-ascii?Q?T9BF3bEwDOYMA4oQvMs2Zcuovh+P6Q8HoCj0VYaUt2a4KgoB50f4z08CbIhY?=
 =?us-ascii?Q?TpUm/O5IyFi/q3mJ6yCXjWBn4b3r86Jp0+RYuRFJn8UY9bLXPdk7QJSRlrJZ?=
 =?us-ascii?Q?oiGjEhI+HDbtQYrAAGs8dvJA22risTMg1636Ys21NoaxuOqXAh7DKkWEHN28?=
 =?us-ascii?Q?6qnp9AKmlpkodwy92Noa940m23n5OUQkcMfb0qeCLN5aK+p+9e06L93e6gQC?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9df96c-7f90-4fe6-3d57-08dd49d6f02d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 13:29:25.9081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Pft3pe2Z9hzbkuqdJeuj15HSUabbuUOLvMPjQ5biw08yjxypTnU03TsRp2kKbqPEaIpyXU3ALhMeHc1Cw95InO5ipYIc+GWlXzXOXRSppc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8933
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 13:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115403

From: Rasmus Villemoes <ravi@prevas.dk>

In some deployments, the log aggregator collects log messages in the
syslog format, so systemd-journal-upload and friends can not be
used.

systemd-netlogd is a daemon for filling that gap.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
Originally sent to oe-core, but it was suggested the meta-oe might be
a better place for this.

https://lore.kernel.org/openembedded-core/20250207120628.909410-1-ravi@prev=
as.dk/

 .../systemd-netlogd/systemd-netlogd_1.4.4.bb  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/systemd-netlogd/systemd-netlogd=
_1.4.4.bb

diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.=
bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
new file mode 100644
index 0000000000..851817e9be
--- /dev/null
+++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "Forwards messages from the journal to other hosts over the ne=
twork using the Syslog Protocol"
+
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"
+
+SRC_URI =3D "git://github.com/systemd/systemd-netlogd.git;protocol=3Dhttps=
;branch=3Dmain"
+SRCREV =3D "b03cc3b1a75048c7cf19467d8918a4b7320767e6"
+
+inherit meson systemd pkgconfig useradd
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS +=3D "systemd"
+DEPENDS +=3D "openssl"
+DEPENDS +=3D "gperf-native"
+DEPENDS +=3D "python3-sphinx-native"
+
+# systemd-netlogd uses prefix and sysconfdir in a weird way.
+EXTRA_OEMESON +=3D "--prefix ${libdir}/systemd --sysconfdir ${sysconfdir}/=
systemd"
+
+FILES:${PN} +=3D "${libdir}"
+
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM:${PN} =3D "-r systemd-journal"
+USERADD_PARAM:${PN} =3D "--system -d / -M --shell /sbin/nologin -g systemd=
-journal systemd-journal-netlog"
--=20
2.48.1



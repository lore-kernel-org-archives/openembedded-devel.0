Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716D6C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 06:20:59 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24212.1786947658497264077
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 23:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=u7a+t3QW;
 spf=pass (domain: est.tech, ip: 40.107.159.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViA2DFIaLcDG24GG2rK9P/zCe33/Y+nxGWm2otaZ3ZP91/IxQqATvjFu5HLXpgirm2rgHvrXjlLx0UX1lk3pnPonSMmuQIRqnoKC6UeT8Vhkv5FYt5NVm4Wx+60QXVMZ6nTTEt+i3QC3qAqql1XBMFCrwRYC156Xa2pglXu+1B9VuyzLsddMMymudvpVjMjdViOvmI2fHdxjjw/4fSrs6VgaiqeOXy3Yc+huaZ2wyHjZq/lyA1h5b/GzbatoUIOX4SmuZM5PoLxd8ZY4781L1fcHl8wdubeAUPeZOvIaLT8YBr2wiclbdRtkOD5F19fDB6ju41XlUtCpNZK/aCIvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCnXdQSdxbCnM8rJQI6YQYYXnfhbnfjIskbn9HVZ1d8=;
 b=OkUYNz3oRx9HNRmPCivZ1JvkhjXxUvMwR5CHTD/yFtDPTPx8iVJP2eNeGirBipLcPBnIi12RAkAa4OdGkqOA5zRV+6dxIEFcmhx/l6N+cZgl2tT6sZXvAhV8M7YXZsVOQ/XUz7fX+6IXOf/B/TFAAy5rRiq2mMhoHC752UjLOl527diSfLS8zKhfLkjR8DeqySJATZxUALsOOusFAlJigq/ATTgR3Err2mPdt2fXQD6lu7/OzU2RJIMCdZbD3Tg1MADAi3fR+Dq+25Xk8XLFmU26l3W29+AZKKYTj6lS0OLOmjpwNPBkULhiMQMGlk2OHNwfHqx3m1P9hJGPmaKrHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCnXdQSdxbCnM8rJQI6YQYYXnfhbnfjIskbn9HVZ1d8=;
 b=u7a+t3QWZM3R2duRlHflHgSO8GPdZ7dP0oJYsCo7FqxUpXjvpm/3PCp4P/XWCS4UhkA9I2wAHAaLq/NklST7JBzGFMTzDAKhbkmzYQon/NO+wV6ZRiXJMS6DyC9i6jJBGWeieaTZ5AxPXEQi/4A5se0Bx5o5Jm9ayQrRWKGN9xR4ncb6cP2HJrujW3vYV81UEAT/pz1rkqXjgsdBoLtgwID7TabaWuLSqP9xTNjFegxiHAIW7Qn+I6go7F/GOgKPH8BZQI3KrRV1jEBUSmhEcD4sfgg2wYAZQZLOV2MzNBH3QFkGqqe0s8UfnqkTeNuLC2965W7TU0G8sMhv8Uo0wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PAWP189MB2610.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:330::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 06:20:52 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 06:20:52 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 0/2] meta-openembedded: fix trailing whitespace
Date: Mon, 17 Aug 2026 08:20:41 +0200
Message-ID: <20260817062043.43792-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::23) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PAWP189MB2610:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b14398-cf30-48f8-4f41-08defc27b027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	zVBW1Ru1eSYcfFgS6leudRbDsdFl71UcWWpnTnHQ17IVjhzzUJ99zmJLyVfrOCJ16qiaByDLQV9puC1UueeeqvzQi4RxSIMMkiF0awV8r68Dy+EpeGn8YdnX/w3jJXtk1CQgPuw7DI66xATu3Sg+rcIur3BZbRPMw5nM3YOrgHOMQQgLw3iLa6b7fmLjXh9jbktkCog3KXdkPmOnpC8RGDM9olX6MZA25ns/Dy11D5VdHx7ZQRPakaM4+R+j7xyBqG3Qo2H/cqYLoSmVoJLSmtdQXR2q6l2cKClHbDFZq+ywSZnqPtOa9Kbh3+RXo8lSiIjilwoGd3SxabkCYTH4W45swxG9Utg+ktw+LmX6KdiJacJyrks8x4Wg4BTKwveA5n2fzIBNNQWC7MRQwKCc1BYqhZ2Xj/f7xP4g4v/l1NjEEEgTJJB52Z13vU2PJT4tWUVFoYPJIIdXW9HhIPV4Ozihi2z+dS2LLPVrWY9T2ci348nMeVeP4xFSJUbqAngiqtkrm/fsAFMCFgst4KRBGk7Tx5mnghANdS0IwH9tijEfItqNPXQrtTAaJyneLA5vNUnkm2FZx25g4yTiRpsy8kTTO+RYEnxwHzfebqyTV2Os8p8XvL/lJGhoz5ynNef4xzIFWmtOTsR4MpBkfhn3tN5ioPflCNE2vbkWiqAOljU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+kBqCxUgosN9eOUAOGsaREzz8u8oyH74uk/sO+p1oH8NIwFExeb0T6HBfNc0?=
 =?us-ascii?Q?idvRoMwV+F0RH8gVGKPQosiR3c1dwy5ZsSeqYXGXbt+OMaOKkSFnfk9a3070?=
 =?us-ascii?Q?MXJf+oGxwev6VRFuYe4XahvHHMov37nmCvKEoMOOL29kew1SCDqD8FZIJjpU?=
 =?us-ascii?Q?lH47Yp7bKiHOakQR/pt4d991O8cHgN6tTAUGIdxed749IICrdO/kfDvWxeHH?=
 =?us-ascii?Q?FDR23mvkOLdT2UYgmhfwob+l4jM0wJfwjnjdOyqqchdCxvnb3kyHntrDXS9s?=
 =?us-ascii?Q?LXd25ABwSnyKgkqdufIwIvRTBisMqTRx0U4iJ5o5JW76BBrAtq5OqW1qDZzL?=
 =?us-ascii?Q?Tnn8cqdvRgdMfxkf1RSVqZgBc+LrtjW6HW8i49+Y3nMUQksfqOMRJ2S6T4tJ?=
 =?us-ascii?Q?efH1ODTcZZv7TYZ81mhcbJhqKBh9UUYorekdY0tKHo/K8ImKTAtnebZvmYwg?=
 =?us-ascii?Q?Vpl3ZCTWT6aURWHr/yBtCb4ZOcubuN5ZYIUFdfSJYyzBmzijBCVhV7JkedXh?=
 =?us-ascii?Q?mEcJx8EYF1tMUrXz6d6demvFbWEpVflxcV69NVzNLxB8mS46LcoJSX7aSTn/?=
 =?us-ascii?Q?ioksjtqIsKcroOe1Nv/FQDQqwjwchS/0KoM0oqF4URv2tlXvmc+ucwas5ckj?=
 =?us-ascii?Q?wuzWYMQ4nLW+iZ7T3xOIzsaLNZKmOuKMvSuXP7s5oy3R2d3z+qL9dsI1f5Ge?=
 =?us-ascii?Q?6iKC+IplD/LsaaxXVVJg7tkCiAH4TZaOq7/ySPOrURAdITW00gO4SpuAWwJk?=
 =?us-ascii?Q?W2XKG7vHAmWgNXVj1ixilEm/uypQzsebdf9Dea+eFke0fM8N2wl+jAHn/dBs?=
 =?us-ascii?Q?kVAiVqH74Vv5kmkEAREQUAfxAFji0eEQi4UyTskCPfAfMmF7RKqyCJI2qPHx?=
 =?us-ascii?Q?sF3VO8M33TjAe9cnumaQ8GcZ5UzFNL4Bm7iO6vE1KrsZKgNlSArudahoEvd9?=
 =?us-ascii?Q?eCZ1XXeNCoHlZGvGz3etgwLTuwo+ChYnINia8o0gr9u8MGzTmoO/sJxkAvfL?=
 =?us-ascii?Q?pNTLKWNQb50q9uEsVF1dtuyUfGPQMlUS4Ix93IyFDVKfIzk6YxY+rqxfTpNg?=
 =?us-ascii?Q?iMlcpm3pxn5wY/Yndjv2OYPRy/np2ZthmXACQ1kWy6wRYNplVefIDDFqOLT4?=
 =?us-ascii?Q?asVmaXQk0VD5biFpDzTmiczQ0lUiLj78SxmsOhg2prhsNCIZr6O0FO8DraBQ?=
 =?us-ascii?Q?vZfTexjhMcvvjBxbWPZAUt2199Wd9gPE7kZoPqmwaqEqHUAFINrzmvFmXtJI?=
 =?us-ascii?Q?dByQqNOXZEyP/Sh1op1IQHxephsPKDtwj8Jo2V1N4deCLJr0Z1T+yeHJxsgE?=
 =?us-ascii?Q?2rc9uVG5sf3MfevfOeU7M36uyGFIj8T/yd3mE/R2B+2lHUurlT7DUdpjGyxw?=
 =?us-ascii?Q?RJZxccDK9oJ+/FHjArDvzQditwTblhI0X+PPmFRLmo+qfL/fhd4H5PYMMAB2?=
 =?us-ascii?Q?++eHZSRYF955c7cPRy6aGlxEZgB3t2TiVeDvug2KtA/amp2N/siET+BX4cof?=
 =?us-ascii?Q?YJHx/g7hukDJ++LfZ7HtuGa8Illb9zSGeQ1RWolnbwqXHsRNEkSxcxLUw1Ci?=
 =?us-ascii?Q?aKl3NnPCKAxjAujVSLkGvG9IEFleS5W1dSRF/Kqkz44oBcrFWSnCeTYoyhxj?=
 =?us-ascii?Q?jzCnMJrqP6cbsosTiLx5M2WWZi+6tp3+Wkwg67L2suZ7HJjJD6dY/ZTNjjta?=
 =?us-ascii?Q?G3agY4PixJe/5529Gl3uHuzEae+O7WaYOJZ87OEdMUS4q6tuNLffnzdYb4q0?=
 =?us-ascii?Q?YDw5kY4AQ8WT50QNIPuiJckfn6FWnaYlQ5+bnL6gyKE8G/YPju7JKL+mzCqP?=
X-MS-Exchange-AntiSpam-MessageData-1: 9yKm57vAz9bkY48OfJAwATbB+kwpPCCnbqc=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b14398-cf30-48f8-4f41-08defc27b027
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 06:20:52.3772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+pipReIJcId6KFWrpbcTZyyv2Sc+WQzgV8YV5jfr8rvhGv1BinmChAJGvSNNKTDB/JVgG835FKDuwI1mcdRnI/1zdiKEKhRT/L+igzWKx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2610
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 06:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129191

Fix trailing whitespace warnings reported by bitbake during parsing
in meta-oe and meta-multimedia layers.

Whitespace warning will introduce as part below=20
https://patchwork.yoctoproject.org/project/bitbake/patch/20260806112435.251=
28-1-jaipaul.cheernam@est.tech/

Same inline change has been merged in oe-core as well

21 files fixed across 2 patches:
- meta-oe (20 files)
- meta-multimedia (1 file)

Jaipaul Cheernam (2):
  meta-oe: fix trailing whitespace
  meta-multimedia: fix trailing whitespace

 meta-multimedia/conf/layer.conf               |   2 +-
 meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb    |   2 +-
 meta-oe/recipes-connectivity/iwd/iwd_3.12.bb  |   2 +-
 .../wvdial/wvstreams_4.6.1.bb                 |   2 +-
 .../flatbuffers/flatbuffers.bb                |   2 +-
 .../nlohmann-fifo/nlohmann-fifo_git.bb        |   2 +-
 meta-oe/recipes-extended/minio/src_uri.inc    | 204 +++++++++---------
 .../rsyslog/librelp_1.12.0.bb                 |   2 +-
 .../drm-framebuffer/drm-framebuffer_1.0.0.bb  |   2 +-
 .../graphviz/graphviz_15.1.0.bb               |   2 +-
 .../libforms/libforms_1.2.5pre1.bb            |   2 +-
 meta-oe/recipes-support/fftw/fftw_3.3.11.bb   |   2 +-
 meta-oe/recipes-support/lcov/lcov_2.5.bb      |   2 +-
 .../recipes-support/libpcre/libpcre_8.45.bb   |   2 +-
 .../libsimplelog/libsimplelog_1.1.0.bb        |   4 +-
 .../libtinyxml2/libtinyxml2_11.0.0.bb         |   4 +-
 .../openldap/openldap_2.6.13.bb               |   2 +-
 .../recipes-support/pcp/pcp-native_6.3.8.bb   |   6 +-
 meta-oe/recipes-support/pcp/pcp_6.3.8.bb      |   4 +-
 meta-oe/recipes-support/pv/pv_1.11.0.bb       |   2 +-
 .../xorg-xrdp/xorgxrdp_0.10.5.bb              |   2 +-
 21 files changed, 127 insertions(+), 127 deletions(-)



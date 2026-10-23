Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2799.1792745523580117447
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 01:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HRs4izfB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=475686d154=ghanshyam.banaitsanjay@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7Go9G1076099
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 01:52:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2q/RnYr4ngbO7BPL0I1i
	hY2CvUJ1x4Fnq8B+jX440cI=; b=HRs4izfB2V5eK26FvF2MsD3zI2L6NfaQcylo
	ruKrJLbw5szbcsi5Gfel9cjxYDv9XMKsTaTlkY0rhBfFXRDeRKfuYKMfvOEOX7WW
	uSMbbCVIKKC5Mulg4cd3SBZ8+/I7KNPCTFW5qaCPXKiOn/Nh9Q/y4ql5ygU762mD
	A6eqOT5e+jQ2uLQhA325bDA/a28obKy/6q+kgJrmpl5qhVpl96n2j+W5I8LTgxBD
	7fW+3HboKbu2U2pIHN52GftRk3ayzy1k9lDvE9aQ9QflClKT8p02RVxQvecCeix6
	n5GV05UyFuUzd0bPEoVe0cIqteS0uLDpfD/n0E5U0SwlXmpavA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021113.outbound.protection.outlook.com [52.101.62.113])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hf9h12fya-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 01:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGlT7D1Svz/s59Y7Bl1L5eyNGvZm6sOYRbabsOC2xJJXSMwUNXY6sXgj8jPcxAZTMAxK0Spxl1g1yzvLm6kc83WH+3nJosPC8kwdALx+Yi2MHJq6HK6xD8VVzZHqxjmvSo/XILG0k8oXbFW6nyvL0HzpESlEmALXsz5bLBa+6ZZxnO9QfDCw9ScTFIjR9f6BsYJCwtTZ97Qk0hDQt8ak5GftThtPjFMZI1wz0gHxRgPO2UaXlgDsjRmEKD5bW7PoT6SN0tBo3+padtNe9skRd87IEyTxtAtBxhLDeeHN9HIsiG/2ZROmUNo6PrKkME7BsZTHyhUWmOEeyD9c0vb2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2q/RnYr4ngbO7BPL0I1ihY2CvUJ1x4Fnq8B+jX440cI=;
 b=gtBuLx64B+CXT/tte7ojZZJlS4dIJUGMhKFGSRpr8vEz79Cczxv0zIqibNIofwSIqe3oAGpYHp+P1kpYJDf+huxfEQYI0lAZdGPc+ahw1qPR+h5ILZrYM9p6TTnua2fjv9tIway+hlWuRGbJGE7E3rapSsvX46pqOz3q37E13cfAaUCkc3YLot3XtQpv/5tHdEo4YHkyKbD3T43A62guerx8SNpuQ/rleU/3gOgO/REOV/FUNjZvuJInkPSFzZBbST3bJhipj9YOxIZC3GV4tSJ4yzkS+nYE8M415QfVPZeJsaJSwRtqgNrwlN9vBp/CrCmCg6FIASRTLwOhXlZtiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) by CH3PR11MB7345.namprd11.prod.outlook.com
 (2603:10b6:610:14a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 23 Oct
 2026 08:51:12 +0000
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::d71a:4f1c:d4f8:8e5]) by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::d71a:4f1c:d4f8:8e5%8]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 08:51:12 +0000
From: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] php: upgrade 8.5.11 -> 8.5.12
Date: Fri, 23 Oct 2026 14:20:51 +0530
Message-Id: <20261023085051.1417202-1-Ghanshyam.BanaitSanjay@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0193.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::22) To SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF57F27BA08:EE_|CH3PR11MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc908ed-9ab2-41c0-5e7b-08df30e2c9f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|52116014|1800799024|376014|366016|6133799003|261021123027099003|10067099003|18002099003|261022105027099003|261022075727099003|261021121427099003|261009223027099003|11063799006|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info: Tno3+M991bwmA8O9put8uEdTbDnFyjPTfkiHbrgQpT8tZdaFzUzrRwHrjaE8rKQduqE1sD+ekQk64gr6qXZ2hfx5wbkCNIPOPJkhe/0WHArl3RBygLnav9Cm2/FCUA9veGCDK742Qt3H/BEJf83j74vaTVlP+fkHHXPkYP1gVZoVV6F5kFsyVFeXgwnEISO7yWb3z6wGhWhg4egfr2IQMCKVee61+2vxLksvTamNOcjAQS99Pxr2Jk0YamP/bETvljmcSDD21ji0KFM3l6UVUxtU/MS7G/vqr8X+kxsdUYYitqVph/POuMVEBF3BbfO7g7zJTyNM0MSehuGoYoOU71DAP0DvhOmMRNiOqLeZ8qn8SUZe+5BAvD7I2o72ypyRTyMKYoEPoRPbZv3WSkFNgr9QGz0Nh4zDu4V6ECA7sYR8RBkEZFQRiGOb4hdHEUxznQyo6oReFQ+lxToTjnF4SRXzmdHAZY6ZPCjKwIf8EyKPDAQ3IVxvBNn1tACTfGTnC00k9RRcQE+nz+UaLLaGQ0pLXk2S37rmSOxW0MlXzRSMQndo67jiB5/dfBCjDOZLRAoh9EYDSJ+zFiKIDS6MbCT/yPT/QbMunZnQp7kPiWXpdhj1/s96whBV4QE8VR++2RR0Zs6sYBMx2ZzG/bt7XrIFLweszglMlL8TEXddR2LUKqS1u2jH+6RwT+MHdSx59KlY63vcniHw96Vq00fa/FGj/iWgp1RoTIzVROxfL7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF57F27BA08.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(376014)(366016)(6133799003)(261021123027099003)(10067099003)(18002099003)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(11063799006)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0RtufGXHRu6inJuhJVYlNIs76XGjJQQ+6K8IKVoAprxILgecluQCw3QzEGzE?=
 =?us-ascii?Q?sHdIgFc+TusjjYUhSQcfp/FL3Sg9dhT+/JK6ZRKG/WxTlMV9sFTZjywePJqN?=
 =?us-ascii?Q?1XGO62m9do35ENipWx/DM5r3Y2M+9Lv8EnIpmXG7+wlCoOxNyKpey7kdBHH8?=
 =?us-ascii?Q?9gJn6XXbGoh+oYBc7syMfkWvuQZQeFHI7Y4oLuf9wTexEamEUv/9JhmLfcP6?=
 =?us-ascii?Q?ihX+Ftt4dED2t1aFZISlxxbnuYI0Dl2VeOEbaDOquXwmz71Qmv8Z+IIGrwGg?=
 =?us-ascii?Q?Die1OI5G2eRc+sPnApbY9Ah+eAWJeauTeZ3vs8kP/pnJspB+tde3DRS/fad3?=
 =?us-ascii?Q?3WjiuC56iqpgreNt02tMjszQeAGdFuWKPe7aSS/0WeNN6GmqR5rZY4yKlNs3?=
 =?us-ascii?Q?WgXKjlmXmeQtBr/sldztuTo+ZUQP4l91oOz4I+VS4foHq5AdEelzmXGP0yK/?=
 =?us-ascii?Q?XghKn+1QZ842A7/HD/HFYwuQXvwYcX5TTbPD7dZH//nPH1M4v8HWlhsoZIPr?=
 =?us-ascii?Q?KeAT173o+U2jSqJ1j9el7ejfNgWZUK3laaNOZqEP7h4OhKw4N7tAyf9mGq1l?=
 =?us-ascii?Q?o+Fiq4nvvniAPRe8rDlQKrszGJiaEF3LIHMZrcUPdTHOuWFyOOgg4vRaWz2u?=
 =?us-ascii?Q?imTnjDFnukJBa5Ic6hPtqsP5sgt7V1kBVy4PAUKdoZbCxRu3Gi9mVdbirCsR?=
 =?us-ascii?Q?Tr41rV7ECEYt4Tn1j1SOdWQaBzLr+cZHpvbMdCmfHpcyVXzIemh2OGlfdG/+?=
 =?us-ascii?Q?V5WSsS4rfNS80bS9w29wrhOMnWDCo1lSdc7Yv68yU4uLk4rkI+8UFaZLE3Bw?=
 =?us-ascii?Q?sMMcpqk0pEj9oCltTFrt8HLl9+glrcqAK6EmSDzHVbSdk1uqI001bDy6QduY?=
 =?us-ascii?Q?xMTz237Tk+DHCRP3cQ3OBgzdVMDf7GgZKUncgf1bvz5jBfTxIhTVTIVvDF4R?=
 =?us-ascii?Q?0uv1c40yx6wygEkgTKA6PZFGmR3cdkPiVf3PtIzddlCPTdwm7K+XqeG2iBU7?=
 =?us-ascii?Q?Ska/3dEzEuvC+DqqbvrM5YgFhX3nbkPXgrlfhqvHvu7n1r6VbU2XKL9XcH7j?=
 =?us-ascii?Q?TAJbecYMAMjIkCWk+3l/zzqhslfNNyGR0QKNSJx4/LpcPkUU0xc2fctM+FeW?=
 =?us-ascii?Q?UQ+vwK57Hj2RaWO2EfPl/0+DH+k4e9yl2svPKOhKDabN2TjT/xnOA5lQef7H?=
 =?us-ascii?Q?B2Qf+0AZuzNCEyv4Oo5LM3H2UQ9lIBpSIo5yRcssv/Ge+S51CvoCD+aAV0ob?=
 =?us-ascii?Q?hkx08HaPalF6kRdHkcBboG5PLxOoA7tE3LO7q1dhCHqpz+PzWoLNp4SFqtVw?=
 =?us-ascii?Q?1tiMggQ97AVYBeVEn3rQO8SXxs5xnutW5QHFKdZesooIIo8Ql6HAmPSYiI1L?=
 =?us-ascii?Q?kpz9mW0zA8OZ0YFwfur7ftOIYY+jdQqpqkUovpp/DHjR+Tsf0javfVg+cDUa?=
 =?us-ascii?Q?MudO9UMncE8vLzxk4GvpdGkCqBDKKynJt4cZYSH7cM8KAyITxeUrIKFUXu+W?=
 =?us-ascii?Q?TI2Rt1shMfNs8vkqj7uO0BVcEI9QifjElTsj4jSKJaPwP1S6wo6Bf0CgzcxB?=
 =?us-ascii?Q?GOhkhzBtWt0720kDWC3lWdQ4LQVDL37ACAeUfAmV/lEYCiZoNI3wWQQfhMRK?=
 =?us-ascii?Q?AJMdbrq4khU1cgrNsWqLhvSHJUveSFc37EDWvwkM2QBchafQDt6QxyeMhLx4?=
 =?us-ascii?Q?SW6JNlC4m8g2DmVhHye7Mo01e2d3XNgRBIPMyllTT63XhNgEWdwyTn9CabRh?=
 =?us-ascii?Q?b6rQ7rkunOzTxcKMvnEiGvudKes+4gT16B73ZgYG5LApfSjiRoT2?=
X-Exchange-RoutingPolicyChecked: XP6t+g2vHHpeDe3XmRouKlF5I5CYL9XzKaMWyzb4hmld5kCV3KMDVTYiOGB1F7Pa7cQWmTPdmgStK11J5O90tLDik9wJZCaGuRM9SXyZjvB5ej9yF16WLTa8Ac4xk6DsHzNRKgzTMwurKinlFvARfGaQLeKl0D4tcB6u/WPvz4e7XosVQclFrl18q4zDC0YFv3IJBpnePvWO9dXn7wC7TGj+JhpA9IlsmIDrpymcTpizV7+6K7ZxjpDwM6St5ry7RJds468qgyP1zbeE2tFGuQ6hwQN0iFd/mHPf6+h8WiZI1Hq4khBfzA3gVLKuCHcZehPKH7T8hKoYWjkgDrnvCA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc908ed-9ab2-41c0-5e7b-08df30e2c9f9
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF57F27BA08.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 08:51:12.3525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5yPw+EMhnLmcf8L4IWRrfOTsrHX5I7I9d/zJNTE2ceYtJc9ZYtXxwIgE1g5JS0y5aoUGkECXE8oZA0XsHljlXRrO+5mfVnQBsq9PERrqO9CNSAq5R7+ao4DQSi1CTIJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7345
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX7xAAdZY8Kkcl
 X639ReVOMQVyyt0QE0BVl2S/W3MX7NG+2GrxOJUEKeUElscA5IW9uffiQvVuRKHg+j2AGUBhCk2
 aJBjp8RcgbKfB5cvk/r2Os8Kds6SCr8w9jl+453nHzRj/akBhOMMaT7z2Oj4zH5qufyCjnk34ZA
 Tqg31SR7A54lkjboeGGXq+m3mFY0KtDmLtmS/KRkI1baPhilKtXXRrTa6LCDCbi8b3fxSUKHkqZ
 pwDDR/AUXfK8c6u5+FNmND1Ce6V7r1PUByt1Q682fXuJcmD391+5N03ZunHo9BBVa1FvlghuCaF
 o1K4eynagH6lTvwvmMXaIA8Bdb5bcpr1d1rFxgG/i0N3WT0TH15CXlxh0eG9fdYwRGfZTJAUc44
 qcwE1K9c7P4Kx7u+bCUiGaSQv5HbTD6DzplytqqRBpeB4s5qosz8y3Rj4+NEz5h+6W2iUaVzYKm
 t6ftPADDStjAd06XNmg==
X-Authority-Analysis: v=2.4 cv=Eu9HPicA c=1 sm=1 tr=0 ts=6adb2032 cx=c_pps
 a=jFfvzTczVMb1aPrnreMhZA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=67BIL_jfAAAA:8
 a=t7CeM3EgAAAA:8 a=SfrB2k2hksKK9SbRmUwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rjbTnn0d0xTCakAsYQiAbmswYPdukD7J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXxdmEFVrz1Q94
 MZT8mi70s9pyAaXhvMunf3pJALd/xJpPWPAjkItNItxe2bm6bDfzZVSpuM88XRuBUJ8KX/gHsQk
 hsyWUpFnAt6tffl1VbxbvNeo4atkYoMqDkRIVNmmscjsczXi7txg
X-Proofpoint-ORIG-GUID: rjbTnn0d0xTCakAsYQiAbmswYPdukD7J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 08:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131357
Content-Type: text/plain; charset="utf-8"

- CVE-2026-109618 (GHSA-w8hw-w9fx-j79w): RCE via OOM corruption.
  longjmp() on out-of-memory could exit a context where request
  memory was only partially initialized; request shutdown then
  processed the invalid state.

- CVE-2026-109619 (GHSA-6wmf-4rv5-p3rp): RCE via stale global state.
  Request-owned global state could survive after its backing request
  heap was freed and be consumed by a later request on the same
  worker before normal initialization reset it.

Upstream advisory: https://www.php.net/archive/2026.php#2026-10-21-5

Changelog: https://www.php.net/ChangeLog-8.php#8.5.12

Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.11.bb => php_8.5.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.11.bb => php_8.5.12.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.11.bb b/meta-oe/recipes-devtools/php/php_8.5.12.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.11.bb
rename to meta-oe/recipes-devtools/php/php_8.5.12.bb
index 831e926880..f9759cf7a5 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.11.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.12.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "dc940716a8c73e531c0078eecb955d595d321ec2cc9d47149cf0089ea6e18f64"
+SRC_URI[sha256sum] = "ffb60edc437ced63b5137e4984db379a8111c50049c711510d8b958277efc1a8"
 
 CVE_PRODUCT = "php:php php_group:php"
 
-- 
2.40.0


Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F063BC44500
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:09:45 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.172912.1783429779833517028
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 06:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xZa+1qJw;
 spf=pass (domain: est.tech, ip: 52.101.72.16, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMtquzcMFERvPaBlbHWazUaKzO5Fyn9JGabjhOJd5Uuar/JavlodJHiLeJgU2vXgiEvnVWdWR5WKqH5dqHoU+lkWCfHyro1aKQxUGqKDheHcMnGnqwt7+KL8/kntyTFtXB4fEZQdnEfnoW2CHY1ZMNrmQiDYPjTIub3bZi1FUUAx+8KHAxxPbS9fPYp/pPO2bXhOf4sldhrMxMGJXsupIH0Rs937Fo5GsJTh+u9VHdINu/EcZmm+s1l5iUbjzEhlszqFZ4gsSteEeXMSKpRIa8qSq1Vi+BwKvLIz0URuwjNUQNFyOEgfypR3GYHSLUN/b4XzjVAGYGMWorm1wV62Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+hEldXffSj1a6L+BSinHpl10JkZ0vhaITDnSgh1YzQ=;
 b=lnwcF1FgmDtIAPwM/kxVjuNBLHiCm4yc6hrN+0Lej/egqRWRuKuXq2PSJAQgkEszK/ok38+toNmrsOlEAGE7xVlPHml4zrFkE+3j3D7p/Q1lDmQX4xZ/8t75WGHaBCsI07ympvkGSy9GZIkLg/clktw897pZLS8aB9q79qZiHTpwat5/RMgg2J4hiDKRUK/uI+nPFL/fv+dCWVX/K9iJbx+DGH2eve/miN2eAAVY7k2kGgBBbrMyDhZvS5RRxsU9mvMhXQtZY3gxTgpn0bc+McE9Q9PnC2luiKwYOH+zmtZTcaiOP92l2HtytC0oA/pm5aiIoT6IuPtJL3NIlPfTBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+hEldXffSj1a6L+BSinHpl10JkZ0vhaITDnSgh1YzQ=;
 b=xZa+1qJwRhQjAHV9Uy7LfQlwjIuvHwejAExmL76hbpitI0sYp+hvKNjhdJXnIviDlceHdG9mTOPd0FlpZSZKuGcq1eSJ9zKErrr/rD4Z47c5jjnGWj5wJqxy4WW9Oe/qrcHjmvLV/ixHrf6UtqSfbHLrVDd/JPhEc07m+fbs+TCFeyjSDGnzYbNQ9BR3+OeFstsPcM89HI0yztYzXYURmh1kZLsijvGtKXvardYIYFptO1wtBFE77qzqrI6UuoIwdHl2hwXKIHbaDNEDPLytxueabebWQ4pQJdBaANaB+8rJo09wrZGDAiKJc+2uy4oVi8U91aCeUMieHbKmDdnR1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by DB8P189MB1032.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.8; Tue, 7 Jul 2026
 13:09:36 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 13:09:36 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe,scathgap][PATCH] thrift: fix multiple CVEs
Date: Tue,  7 Jul 2026 15:09:34 +0200
Message-ID: <20260707130934.112414-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::14) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|DB8P189MB1032:EE_
X-MS-Office365-Filtering-Correlation-Id: daa39f54-2ece-421d-d83d-08dedc28fe61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|6133799003|29003799003|12006099003|25016099003|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	mMLPsVMDnoe2bgsehuMNCx6oe7CNzibqbMwjMJudzzTFWhZHjaCL+HuNq1LYJTvRaA4CVNJ8O/IouGG+rmqcHy6ML4k3IB7TAlYDOYzY+WOBmBy5zrC4hB28L8OJyAYvZYbDIz8TkvbXjtXPQ2LGhoOdQYKGgrch8VVYfN82f3iRG9N/ie9QpD6zbTmASlnI6lf0A/afObFRxaNSuJz5Yl+uzFic29ZVdAVHmdhV/xmrBHSqB9YEdjKHOt4c66XIcXzE3CvQsmjJlnbt8uTi4uQ0kasrgxneOV4/m9EX8mYP+z6LHw/jeJ8y3jj2mXNYtgAbLJD9aOSfDD7XBT5odirS8lf+OTpR01CTPzF9MBF6WlQJTxbmjM3rRtdmN3jqoo9PNNZn0liaQ8M7YLfDSkHMb2AJaCpo9BtS5Z8A/0XJzbaeWv3aDRWUj1lZRv2h74sOGe1egFG8qWTLNimoLQL1BL4mroBrmGw16RPofRam98jc0DU8Yq72KgwyOa1VbpAUgCVqCUaFHV+JmKQiQeVNsMAa08f7HLFt13yrTRLs5jSRimgVSPp+d+g0ImkJlkaNIa4b/cNXl+HHk8XJxyRY8vi0lpRWP9yynK8a+LAWIDbLA1mTeJCZQlUyA5Y6h206lsIbRfQ4G0VsmVZpGcurap6CwwQKd5qO477OtDc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(6133799003)(29003799003)(12006099003)(25016099003)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vXeZckjxyZMDjfjxn+07yzV8DqZt2jQGvscfCwPRn4q/0VuKbfpG8er9ppHw?=
 =?us-ascii?Q?jrxvjdCjpW6Zvzbk640WS0vKPmCK49F5mC3PcHngD8rlGZmbj+p8QEO7V8W+?=
 =?us-ascii?Q?LMRAE+3AcrtJhpVDbtROy50CpVeIPaWBS93cGt9VCimY2TqOm3fkBKn3uKnn?=
 =?us-ascii?Q?HRjUq/x48qWElwHvVCIksbXJQkdTLcraDLG5gTyk5EWl8Q2sYXQaJd3q2BK3?=
 =?us-ascii?Q?Fq7lSAeUmn3/+A/ERAxWae5inf4Xj+jDF525LsGXRWfWLBWyiDk5slOHmxUY?=
 =?us-ascii?Q?u/x4PkFX1UB+okUMFmAsqZcdevvzZuCuuqRbcBC8fcXHX8UvsPxm8lP4PLBX?=
 =?us-ascii?Q?zESm5AHChzIChvaFmyNjiFCy9VXnrEdCSJKFJAR/s2DMbFNIf9YpjXzR30Jb?=
 =?us-ascii?Q?9DtLQY0a+s0pp/M+bJs9nI76vZK5a7oG02bXNdjLzlcoM2JPFjj2/F1LTu6L?=
 =?us-ascii?Q?YdVCGOjkIsWtUwnnkVwmiaW815daKC16Zm7kqLGsLirQOqM8QPJK3XAMrYFb?=
 =?us-ascii?Q?W+QOf8MZycHKYFaTanGCh7AerIEhn9PfINxz+UmeA6weOF8DT6AJ6Ry0aFMm?=
 =?us-ascii?Q?tbkld/hdXRB4GtDLzg6twDLMd1q8Qm6F+Pi+36MbJ1n/Mi7c8UA0lF4McdZw?=
 =?us-ascii?Q?A76sO+6Gx4D5/xFkAYZ7tsNQNcbpzKOzsERyZWipQmmSKKKOKmkrHpNs+8A8?=
 =?us-ascii?Q?jDmhIs68DSNqtreMDH6scw/Z/zHC+LLLTAC534acLKbDMYWiCaGQgx9SsnzY?=
 =?us-ascii?Q?1ojPgY/Tzox/zghvb4SDMyY+mrJcIVndqZIpe583XebsuUYe5BMbJYszqcO6?=
 =?us-ascii?Q?Vj62trBwsNLN06Vj8P6y/6jSgA1kTKAxOu2YYXQ9Tk08dhQOExXCQcbcJ68v?=
 =?us-ascii?Q?Sl/qdRyEH+Qvnb/93CpJs+dV/4jR8CM7KzZqBG1bBEi8aR+h0UhXy8ZFQ84Y?=
 =?us-ascii?Q?KTzKvR/kJRxeBaX9cAAvcVRxU0WzUqpO+nJ2IvYCD+4CLyRyjNm9e7/2a/Eb?=
 =?us-ascii?Q?VxOILLksWuWEmgLPUzvGF3+kUQJEwP56UFa7OqtQj2+uyGSYE8+ZepDRgobl?=
 =?us-ascii?Q?3qcfTKWb9rHDJ8k3l336ey2UEMgwt2hNLSMDmlsgv0syHOeytqxuIA+IF6on?=
 =?us-ascii?Q?yIEJbz1o6/YEbmKADDl/Yrq4lqaGxLUuk1tLH18dpx5N5OgcXV1fbYWc6xX2?=
 =?us-ascii?Q?gDOjVvOwFGsP/Ee/Fe/JvLS5gVduMN1ivK/izmQFT9gBaZRWY6RC+QN82aP+?=
 =?us-ascii?Q?A4kDDF7J91p+aMAepGPmBvRm6AKcQuFMZxmPCdZfGk0ko1IJfMpvc1ybqGhC?=
 =?us-ascii?Q?U8T+ISeoAEHNhtQnZYJrKM3MDl0dKS4cvR8vU5ZmrrDkZFhsrNHbgSOvwP7O?=
 =?us-ascii?Q?fg1QZijOF5Zd0O81plr7HCMuiZJHuf5fReynMLDMg6ywlYh5MfhyUfi6Wrjn?=
 =?us-ascii?Q?W1XJHNk6Hg5se5eDlvxz1K+IylZU37K/f1NAUni/gT2YKv1B7nlunojPi/0T?=
 =?us-ascii?Q?eLkLIQPxoIurPB8IpxDqYq1gd8ljTeIiAMN7zpo/iCBAyEkrooWq8f0IvBfm?=
 =?us-ascii?Q?ZJ/1cvKf93XzKi08+TpDDq/S9go6VIcwgvwNjOutO9+hQxsavDn9LZnIYFTg?=
 =?us-ascii?Q?iNjTogAJbSTLv5pk2Sxb07whmWs3mvBktOdjDEw6YiNB0rkOMtQ5zalfAEWu?=
 =?us-ascii?Q?CHNxoFc+mpYnHEf6J4znNbItYsvfO3hnrtsC7R6kryUYvB0Z20QY0jceVLLU?=
 =?us-ascii?Q?uC75Im3KIw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: daa39f54-2ece-421d-d83d-08dedc28fe61
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 13:09:35.9705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yszzH41IYp1kzifABbKuSNfKNOzC9xAJIsYqbdf/wXE2yvhj7evo5wetRFuPnMqXZiaw02iOECjexDuqCA956g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 13:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128066

CVE-2026-43868:
  Memory Allocation with Excessive Size Value vulnerability in Apache Thrif=
t.

CVE-2026-43869:
  Improper Validation of Certificate with Host Mismatch vulnerability in Ap=
ache Thrift.
  This CVE only affects the Java client, which is not built by the recipe. =
Marked as
  'not-applicable-config'.
  Upstream commit:
    https://github.com/apache/thrift/commit/a30c552bd0808b7e19f35ad30212ba7=
a9aee8c66

CVE-2026-43870:
  Origin Validation Error, Improper Limitation of a Pathname to a Restricte=
d Directory
  ('Path Traversal'), Improper Neutralization of CRLF Sequences in HTTP Hea=
ders
  ('HTTP Request/Response Splitting'), Uncontrolled Resource Consumption vu=
lnerability
  in Apache Thrift.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../thrift/thrift/CVE-2026-43868.patch        | 1381 +++++++++++++++++
 .../thrift/thrift/CVE-2026-43870.patch        |  127 ++
 .../thrift/thrift_0.20.0.bb                   |    4 +
 3 files changed, 1512 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-438=
68.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-438=
70.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43868.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43868.patch
new file mode 100644
index 0000000000..a4f4aec09e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43868.patch
@@ -0,0 +1,1381 @@
+From ebb9e1ec3d7dea6ade9e98951b7f1dd58ba933a5 Mon Sep 17 00:00:00 2001
+From: Hasnain Lakhani <m.hasnain.lakhani@gmail.com>
+Date: Thu, 17 Jul 2025 19:57:05 -0700
+Subject: [PATCH] [THRIFT-5871] Add message / container size checking for R=
ust
+
+Bring the Rust implementation somewhat up to par with the other implementa=
tions.
+I tried 4-5 different ways to get the "perfect" check but since trait spec=
ialization is not yet stable,
+I was not able to arrive at a solution I'm happy with (code was either ugl=
y, or had runtime overhead).
+
+So for now, we avoid full message size tracking / more precise limit check=
ing, but this is a strong step
+in the right direction.
+
+CVE: CVE-2026-43868
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/42d0b71=
7746a748a50a19e7e7842373488048dc3]
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ lib/rs/src/configuration.rs    | 178 ++++++++++++++++
+ lib/rs/src/lib.rs              |  12 +-
+ lib/rs/src/protocol/binary.rs  | 285 ++++++++++++++++++++++++-
+ lib/rs/src/protocol/compact.rs | 373 ++++++++++++++++++++++++++++++++-
+ lib/rs/src/protocol/mod.rs     |  80 ++++++-
+ lib/rs/src/transport/framed.rs |  27 ++-
+ 6 files changed, 925 insertions(+), 30 deletions(-)
+ create mode 100644 lib/rs/src/configuration.rs
+
+diff --git a/lib/rs/src/configuration.rs b/lib/rs/src/configuration.rs
+new file mode 100644
+index 000000000..0f786f4ee
+--- /dev/null
++++ b/lib/rs/src/configuration.rs
+@@ -0,0 +1,178 @@
++// Licensed to the Apache Software Foundation (ASF) under one
++// or more contributor license agreements. See the NOTICE file
++// distributed with this work for additional information
++// regarding copyright ownership. The ASF licenses this file
++// to you under the Apache License, Version 2.0 (the
++// "License"); you may not use this file except in compliance
++// with the License. You may obtain a copy of the License at
++//
++//   http://www.apache.org/licenses/LICENSE-2.0
++//
++// Unless required by applicable law or agreed to in writing,
++// software distributed under the License is distributed on an
++// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
++// KIND, either express or implied. See the License for the
++// specific language governing permissions and limitations
++// under the License.
++
++/// Configuration for Thrift protocols.
++#[derive(Debug, Clone)]
++pub struct TConfiguration {
++    max_message_size: Option<usize>,
++    max_frame_size: Option<usize>,
++    max_recursion_depth: Option<usize>,
++    max_container_size: Option<usize>,
++    max_string_size: Option<usize>,
++}
++
++impl TConfiguration {
++    // this value is used consistently across all Thrift libraries
++    pub const DEFAULT_MAX_MESSAGE_SIZE: usize =3D 100 * 1024 * 1024;
++
++    // this value is used consistently across all Thrift libraries
++    pub const DEFAULT_MAX_FRAME_SIZE: usize =3D 16_384_000;
++
++    pub const DEFAULT_RECURSION_LIMIT: usize =3D 64;
++
++    pub const DEFAULT_CONTAINER_LIMIT: Option<usize> =3D None;
++
++    pub const DEFAULT_STRING_LIMIT: usize =3D 100 * 1024 * 1024;
++
++    pub fn no_limits() -> Self {
++        Self {
++            max_message_size: None,
++            max_frame_size: None,
++            max_recursion_depth: None,
++            max_container_size: None,
++            max_string_size: None,
++        }
++    }
++
++    pub fn max_message_size(&self) -> Option<usize> {
++        self.max_message_size
++    }
++
++    pub fn max_frame_size(&self) -> Option<usize> {
++        self.max_frame_size
++    }
++
++    pub fn max_recursion_depth(&self) -> Option<usize> {
++        self.max_recursion_depth
++    }
++
++    pub fn max_container_size(&self) -> Option<usize> {
++        self.max_container_size
++    }
++
++    pub fn max_string_size(&self) -> Option<usize> {
++        self.max_string_size
++    }
++
++    pub fn builder() -> TConfigurationBuilder {
++        TConfigurationBuilder::default()
++    }
++}
++
++impl Default for TConfiguration {
++    fn default() -> Self {
++        Self {
++            max_message_size: Some(Self::DEFAULT_MAX_MESSAGE_SIZE),
++            max_frame_size: Some(Self::DEFAULT_MAX_FRAME_SIZE),
++            max_recursion_depth: Some(Self::DEFAULT_RECURSION_LIMIT),
++            max_container_size: Self::DEFAULT_CONTAINER_LIMIT,
++            max_string_size: Some(Self::DEFAULT_STRING_LIMIT),
++        }
++    }
++}
++
++#[derive(Debug, Default)]
++pub struct TConfigurationBuilder {
++    config: TConfiguration,
++}
++
++impl TConfigurationBuilder {
++    pub fn max_message_size(mut self, limit: Option<usize>) -> Self {
++        self.config.max_message_size =3D limit;
++        self
++    }
++
++    pub fn max_frame_size(mut self, limit: Option<usize>) -> Self {
++        self.config.max_frame_size =3D limit;
++        self
++    }
++
++    pub fn max_recursion_depth(mut self, limit: Option<usize>) -> Self {
++        self.config.max_recursion_depth =3D limit;
++        self
++    }
++
++    pub fn max_container_size(mut self, limit: Option<usize>) -> Self {
++        self.config.max_container_size =3D limit;
++        self
++    }
++
++    pub fn max_string_size(mut self, limit: Option<usize>) -> Self {
++        self.config.max_string_size =3D limit;
++        self
++    }
++
++    pub fn build(self) -> crate::Result<TConfiguration> {
++        if let (Some(frame_size), Some(message_size)) =3D
++            (self.config.max_frame_size, self.config.max_message_size)
++        {
++            if frame_size > message_size {
++                // FIXME: This should probably be a different error type.
++                return Err(crate::Error::Application(crate::ApplicationEr=
ror::new(
++                    crate::ApplicationErrorKind::Unknown,
++                    format!(
++                        "Invalid configuration: max_frame_size ({}) canno=
t exceed max_message_size ({})",
++                        frame_size, message_size
++                    ),
++                )));
++            }
++        }
++
++        Ok(self.config)
++    }
++}
++
++#[cfg(test)]
++mod tests {
++    use super::*;
++
++    #[test]
++    fn test_custom_configuration_builder() {
++        let config =3D TConfiguration::builder()
++            .max_message_size(Some(1024))
++            .max_frame_size(Some(512))
++            .max_recursion_depth(Some(10))
++            .max_container_size(Some(100))
++            .max_string_size(Some(256))
++            .build()
++            .unwrap();
++
++        assert_eq!(config.max_message_size(), Some(1024));
++        assert_eq!(config.max_frame_size(), Some(512));
++        assert_eq!(config.max_recursion_depth(), Some(10));
++        assert_eq!(config.max_container_size(), Some(100));
++        assert_eq!(config.max_string_size(), Some(256));
++    }
++
++    #[test]
++    fn test_invalid_configuration() {
++        // Test that builder catches invalid configurations
++        let result =3D TConfiguration::builder()
++            .max_frame_size(Some(1000))
++            .max_message_size(Some(500)) // frame size > message size is =
invalid
++            .build();
++
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Application(e)) =3D> {
++                assert!(e.message.contains("max_frame_size"));
++                assert!(e.message.contains("cannot exceed max_message_siz=
e"));
++            }
++            _ =3D> panic!("Expected Application error"),
++        }
++    }
++}
+diff --git a/lib/rs/src/lib.rs b/lib/rs/src/lib.rs
+index 84c1f9b71..1b80d7cfe 100644
+--- a/lib/rs/src/lib.rs
++++ b/lib/rs/src/lib.rs
+@@ -21,10 +21,11 @@
+ //! Thrift server and client. It is divided into the following modules:
+ //!
+ //! 1. errors
+-//! 2. protocol
+-//! 3. transport
+-//! 4. server
+-//! 5. autogen
++//! 2. configuration
++//! 3. protocol
++//! 4. transport
++//! 5. server
++//! 6. autogen
+ //!
+ //! The modules are layered as shown in the diagram below. The `autogen'd=
`
+ //! layer is generated by the Thrift compiler's Rust plugin. It uses the
+@@ -82,6 +83,9 @@ pub use crate::errors::*;
+ mod autogen;
+ pub use crate::autogen::*;
+=20
++mod configuration;
++pub use crate::configuration::*;
++
+ /// Result type returned by all runtime library functions.
+ ///
+ /// As is convention this is a typedef of `std::result::Result`
+diff --git a/lib/rs/src/protocol/binary.rs b/lib/rs/src/protocol/binary.rs
+index b4b51f682..596285fb9 100644
+--- a/lib/rs/src/protocol/binary.rs
++++ b/lib/rs/src/protocol/binary.rs
+@@ -24,7 +24,7 @@ use super::{
+ };
+ use super::{TOutputProtocol, TOutputProtocolFactory, TSetIdentifier, TStr=
uctIdentifier, TType};
+ use crate::transport::{TReadTransport, TWriteTransport};
+-use crate::{ProtocolError, ProtocolErrorKind};
++use crate::{ProtocolError, ProtocolErrorKind, TConfiguration};
+=20
+ const BINARY_PROTOCOL_VERSION_1: u32 =3D 0x8001_0000;
+=20
+@@ -57,6 +57,8 @@ where
+ {
+     strict: bool,
+     pub transport: T, // FIXME: shouldn't be public
++    config: TConfiguration,
++    recursion_depth: usize,
+ }
+=20
+ impl<T> TBinaryInputProtocol<T>
+@@ -67,8 +69,29 @@ where
+     ///
+     /// Set `strict` to `true` if all incoming messages contain the proto=
col
+     /// version number in the protocol header.
+-    pub fn new(transport: T, strict: bool) -> TBinaryInputProtocol<T> {
+-        TBinaryInputProtocol { strict, transport }
++    pub fn new(transport: T, strict: bool) -> Self {
++        Self::with_config(transport, strict, TConfiguration::default())
++    }
++
++    pub fn with_config(transport: T, strict: bool, config: TConfiguration=
) -> Self {
++        TBinaryInputProtocol {
++            strict,
++            transport,
++            config,
++            recursion_depth: 0,
++        }
++    }
++
++    fn check_recursion_depth(&self) -> crate::Result<()> {
++        if let Some(limit) =3D self.config.max_recursion_depth() {
++            if self.recursion_depth >=3D limit {
++                return Err(crate::Error::Protocol(ProtocolError::new(
++                    ProtocolErrorKind::DepthLimit,
++                    format!("Maximum recursion depth {} exceeded", limit)=
,
++                )));
++            }
++        }
++        Ok(())
+     }
+ }
+=20
+@@ -78,6 +101,7 @@ where
+ {
+     #[allow(clippy::collapsible_if)]
+     fn read_message_begin(&mut self) -> crate::Result<TMessageIdentifier>=
 {
++        // TODO: Once specialization is stable, call the message size tra=
cking here
+         let mut first_bytes =3D vec![0; 4];
+         self.transport.read_exact(&mut first_bytes[..])?;
+=20
+@@ -130,10 +154,13 @@ where
+     }
+=20
+     fn read_struct_begin(&mut self) -> crate::Result<Option<TStructIdenti=
fier>> {
++        self.check_recursion_depth()?;
++        self.recursion_depth +=3D 1;
+         Ok(None)
+     }
+=20
+     fn read_struct_end(&mut self) -> crate::Result<()> {
++        self.recursion_depth -=3D 1;
+         Ok(())
+     }
+=20
+@@ -154,8 +181,28 @@ where
+     }
+=20
+     fn read_bytes(&mut self) -> crate::Result<Vec<u8>> {
+-        let num_bytes =3D self.transport.read_i32::<BigEndian>()? as usiz=
e;
+-        let mut buf =3D vec![0u8; num_bytes];
++        let num_bytes =3D self.transport.read_i32::<BigEndian>()?;
++
++        if num_bytes < 0 {
++            return Err(crate::Error::Protocol(ProtocolError::new(
++                ProtocolErrorKind::NegativeSize,
++                format!("Negative byte array size: {}", num_bytes),
++            )));
++        }
++
++        if let Some(max_size) =3D self.config.max_string_size() {
++            if num_bytes as usize > max_size {
++                return Err(crate::Error::Protocol(ProtocolError::new(
++                    ProtocolErrorKind::SizeLimit,
++                    format!(
++                        "Byte array size {} exceeds maximum allowed size =
of {}",
++                        num_bytes, max_size
++                    ),
++                )));
++            }
++        }
++
++        let mut buf =3D vec![0u8; num_bytes as usize];
+         self.transport
+             .read_exact(&mut buf)
+             .map(|_| buf)
+@@ -206,6 +253,8 @@ where
+     fn read_list_begin(&mut self) -> crate::Result<TListIdentifier> {
+         let element_type: TType =3D self.read_byte().and_then(field_type_=
from_u8)?;
+         let size =3D self.read_i32()?;
++        let min_element_size =3D self.min_serialized_size(element_type);
++        super::check_container_size(&self.config, size, min_element_size)=
?;
+         Ok(TListIdentifier::new(element_type, size))
+     }
+=20
+@@ -216,6 +265,8 @@ where
+     fn read_set_begin(&mut self) -> crate::Result<TSetIdentifier> {
+         let element_type: TType =3D self.read_byte().and_then(field_type_=
from_u8)?;
+         let size =3D self.read_i32()?;
++        let min_element_size =3D self.min_serialized_size(element_type);
++        super::check_container_size(&self.config, size, min_element_size)=
?;
+         Ok(TSetIdentifier::new(element_type, size))
+     }
+=20
+@@ -227,6 +278,12 @@ where
+         let key_type: TType =3D self.read_byte().and_then(field_type_from=
_u8)?;
+         let value_type: TType =3D self.read_byte().and_then(field_type_fr=
om_u8)?;
+         let size =3D self.read_i32()?;
++
++        let key_min_size =3D self.min_serialized_size(key_type);
++        let value_min_size =3D self.min_serialized_size(value_type);
++        let element_size =3D key_min_size + value_min_size;
++        super::check_container_size(&self.config, size, element_size)?;
++
+         Ok(TMapIdentifier::new(key_type, value_type, size))
+     }
+=20
+@@ -240,6 +297,26 @@ where
+     fn read_byte(&mut self) -> crate::Result<u8> {
+         self.transport.read_u8().map_err(From::from)
+     }
++
++    fn min_serialized_size(&self, field_type: TType) -> usize {
++        match field_type {
++            TType::Stop =3D> 1,   // 1 byte minimum
++            TType::Void =3D> 1,   // 1 byte minimum
++            TType::Bool =3D> 1,   // 1 byte
++            TType::I08 =3D> 1,    // 1 byte
++            TType::Double =3D> 8, // 8 bytes
++            TType::I16 =3D> 2,    // 2 bytes
++            TType::I32 =3D> 4,    // 4 bytes
++            TType::I64 =3D> 8,    // 8 bytes
++            TType::String =3D> 4, // 4 bytes for length prefix
++            TType::Struct =3D> 1, // 1 byte minimum (stop field)
++            TType::Map =3D> 4,    // 4 bytes size
++            TType::Set =3D> 4,    // 4 bytes size
++            TType::List =3D> 4,   // 4 bytes size
++            TType::Uuid =3D> 16,  // 16 bytes
++            TType::Utf7 =3D> 1,   // 1 byte
++        }
++    }
+ }
+=20
+ /// Factory for creating instances of `TBinaryInputProtocol`.
+@@ -514,14 +591,13 @@ fn field_type_from_u8(b: u8) -> crate::Result<TType>=
 {
+ #[cfg(test)]
+ mod tests {
+=20
++    use super::*;
+     use crate::protocol::{
+         TFieldIdentifier, TInputProtocol, TListIdentifier, TMapIdentifier=
, TMessageIdentifier,
+         TMessageType, TOutputProtocol, TSetIdentifier, TStructIdentifier,=
 TType,
+     };
+     use crate::transport::{ReadHalf, TBufferChannel, TIoChannel, WriteHal=
f};
+=20
+-    use super::*;
+-
+     #[test]
+     fn must_write_strict_message_call_begin() {
+         let (_, mut o_prot) =3D test_objects(true);
+@@ -759,13 +835,26 @@ mod tests {
+     fn must_round_trip_list_begin() {
+         let (mut i_prot, mut o_prot) =3D test_objects(true);
+=20
+-        let ident =3D TListIdentifier::new(TType::List, 900);
++        let ident =3D TListIdentifier::new(TType::I32, 4);
+         assert!(o_prot.write_list_begin(&ident).is_ok());
++        assert!(o_prot.write_i32(10).is_ok());
++        assert!(o_prot.write_i32(20).is_ok());
++        assert!(o_prot.write_i32(30).is_ok());
++        assert!(o_prot.write_i32(40).is_ok());
++
++        assert!(o_prot.write_list_end().is_ok());
+=20
+         copy_write_buffer_to_read_buffer!(o_prot);
+=20
+         let received_ident =3D assert_success!(i_prot.read_list_begin());
+         assert_eq!(&received_ident, &ident);
++
++        assert_eq!(i_prot.read_i32().unwrap(), 10);
++        assert_eq!(i_prot.read_i32().unwrap(), 20);
++        assert_eq!(i_prot.read_i32().unwrap(), 30);
++        assert_eq!(i_prot.read_i32().unwrap(), 40);
++
++        assert!(i_prot.read_list_end().is_ok());
+     }
+=20
+     #[test]
+@@ -789,14 +878,25 @@ mod tests {
+     fn must_round_trip_set_begin() {
+         let (mut i_prot, mut o_prot) =3D test_objects(true);
+=20
+-        let ident =3D TSetIdentifier::new(TType::I64, 2000);
++        let ident =3D TSetIdentifier::new(TType::I64, 3);
+         assert!(o_prot.write_set_begin(&ident).is_ok());
++        assert!(o_prot.write_i64(123).is_ok());
++        assert!(o_prot.write_i64(456).is_ok());
++        assert!(o_prot.write_i64(789).is_ok());
++
++        assert!(o_prot.write_set_end().is_ok());
+=20
+         copy_write_buffer_to_read_buffer!(o_prot);
+=20
+         let received_ident_result =3D i_prot.read_set_begin();
+         assert!(received_ident_result.is_ok());
+         assert_eq!(&received_ident_result.unwrap(), &ident);
++
++        assert_eq!(i_prot.read_i64().unwrap(), 123);
++        assert_eq!(i_prot.read_i64().unwrap(), 456);
++        assert_eq!(i_prot.read_i64().unwrap(), 789);
++
++        assert!(i_prot.read_set_end().is_ok());
+     }
+=20
+     #[test]
+@@ -820,13 +920,26 @@ mod tests {
+     fn must_round_trip_map_begin() {
+         let (mut i_prot, mut o_prot) =3D test_objects(true);
+=20
+-        let ident =3D TMapIdentifier::new(TType::Map, TType::Set, 100);
++        let ident =3D TMapIdentifier::new(TType::String, TType::I32, 2);
+         assert!(o_prot.write_map_begin(&ident).is_ok());
++        assert!(o_prot.write_string("key1").is_ok());
++        assert!(o_prot.write_i32(100).is_ok());
++        assert!(o_prot.write_string("key2").is_ok());
++        assert!(o_prot.write_i32(200).is_ok());
++
++        assert!(o_prot.write_map_end().is_ok());
+=20
+         copy_write_buffer_to_read_buffer!(o_prot);
+=20
+         let received_ident =3D assert_success!(i_prot.read_map_begin());
+         assert_eq!(&received_ident, &ident);
++
++        assert_eq!(i_prot.read_string().unwrap(), "key1");
++        assert_eq!(i_prot.read_i32().unwrap(), 100);
++        assert_eq!(i_prot.read_string().unwrap(), "key2");
++        assert_eq!(i_prot.read_i32().unwrap(), 200);
++
++        assert!(i_prot.read_map_end().is_ok());
+     }
+=20
+     #[test]
+@@ -963,7 +1076,7 @@ mod tests {
+         TBinaryInputProtocol<ReadHalf<TBufferChannel>>,
+         TBinaryOutputProtocol<WriteHalf<TBufferChannel>>,
+     ) {
+-        let mem =3D TBufferChannel::with_capacity(40, 40);
++        let mem =3D TBufferChannel::with_capacity(200, 200);
+=20
+         let (r_mem, w_mem) =3D mem.split().unwrap();
+=20
+@@ -981,4 +1094,154 @@ mod tests {
+         assert!(write_fn(&mut o_prot).is_ok());
+         assert_eq!(o_prot.transport.write_bytes().len(), 0);
+     }
++
++    #[test]
++    fn must_enforce_recursion_depth_limit() {
++        let mem =3D TBufferChannel::with_capacity(40, 40);
++        let (r_mem, _) =3D mem.split().unwrap();
++
++        let config =3D TConfiguration::builder()
++            .max_recursion_depth(Some(2))
++            .build()
++            .unwrap();
++        let mut i_prot =3D TBinaryInputProtocol::with_config(r_mem, true,=
 config);
++
++        assert!(i_prot.read_struct_begin().is_ok());
++        assert_eq!(i_prot.recursion_depth, 1);
++
++        assert!(i_prot.read_struct_begin().is_ok());
++        assert_eq!(i_prot.recursion_depth, 2);
++
++        let result =3D i_prot.read_struct_begin();
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Protocol(e)) =3D> {
++                assert_eq!(e.kind, ProtocolErrorKind::DepthLimit);
++            }
++            _ =3D> panic!("Expected protocol error with DepthLimit"),
++        }
++
++        assert!(i_prot.read_struct_end().is_ok());
++        assert_eq!(i_prot.recursion_depth, 1);
++        assert!(i_prot.read_struct_end().is_ok());
++        assert_eq!(i_prot.recursion_depth, 0);
++    }
++
++    #[test]
++    fn must_reject_negative_container_sizes() {
++        let mem =3D TBufferChannel::with_capacity(40, 40);
++        let (r_mem, mut w_mem) =3D mem.split().unwrap();
++
++        let mut i_prot =3D TBinaryInputProtocol::new(r_mem, true);
++
++        w_mem.set_readable_bytes(&[0x0F, 0xFF, 0xFF, 0xFF, 0xFF]);
++
++        let result =3D i_prot.read_list_begin();
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Protocol(e)) =3D> {
++                assert_eq!(e.kind, ProtocolErrorKind::NegativeSize);
++            }
++            _ =3D> panic!("Expected protocol error with NegativeSize"),
++        }
++    }
++
++    #[test]
++    fn must_enforce_container_size_limit() {
++        let mem =3D TBufferChannel::with_capacity(40, 40);
++        let (r_mem, mut w_mem) =3D mem.split().unwrap();
++
++        let config =3D TConfiguration::builder()
++            .max_container_size(Some(100))
++            .build()
++            .unwrap();
++
++        let mut i_prot =3D TBinaryInputProtocol::with_config(r_mem, true,=
 config);
++
++        w_mem.set_readable_bytes(&[0x0F, 0x00, 0x00, 0x00, 0xC8]);
++
++        let result =3D i_prot.read_list_begin();
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Protocol(e)) =3D> {
++                assert_eq!(e.kind, ProtocolErrorKind::SizeLimit);
++                assert!(e
++                    .message
++                    .contains("Container size 200 exceeds maximum allowed=
 size of 100"));
++            }
++            _ =3D> panic!("Expected protocol error with SizeLimit"),
++        }
++    }
++
++    #[test]
++    fn must_allow_containers_within_limit() {
++        let mem =3D TBufferChannel::with_capacity(200, 200);
++        let (r_mem, mut w_mem) =3D mem.split().unwrap();
++
++        // Create protocol with container limit of 100
++        let config =3D TConfiguration::builder()
++            .max_container_size(Some(100))
++            .build()
++            .unwrap();
++        let mut i_prot =3D TBinaryInputProtocol::with_config(r_mem, true,=
 config);
++
++        let mut data =3D vec![0x08]; // TType::I32
++        data.extend_from_slice(&5i32.to_be_bytes()); // size =3D 5
++
++        for i in 1i32..=3D5i32 {
++            data.extend_from_slice(&(i * 10).to_be_bytes());
++        }
++
++        w_mem.set_readable_bytes(&data);
++
++        let result =3D i_prot.read_list_begin();
++        assert!(result.is_ok());
++        let list_ident =3D result.unwrap();
++        assert_eq!(list_ident.size, 5);
++        assert_eq!(list_ident.element_type, TType::I32);
++    }
++
++    #[test]
++    fn must_enforce_string_size_limit() {
++        let mem =3D TBufferChannel::with_capacity(100, 100);
++        let (r_mem, mut w_mem) =3D mem.split().unwrap();
++
++        let config =3D TConfiguration::builder()
++            .max_string_size(Some(1000))
++            .build()
++            .unwrap();
++        let mut i_prot =3D TBinaryInputProtocol::with_config(r_mem, true,=
 config);
++
++        w_mem.set_readable_bytes(&[0x00, 0x00, 0x07, 0xD0]);
++
++        let result =3D i_prot.read_string();
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Protocol(e)) =3D> {
++                assert_eq!(e.kind, ProtocolErrorKind::SizeLimit);
++                assert!(e
++                    .message
++                    .contains("Byte array size 2000 exceeds maximum allow=
ed size of 1000"));
++            }
++            _ =3D> panic!("Expected protocol error with SizeLimit"),
++        }
++    }
++
++    #[test]
++    fn must_allow_strings_within_limit() {
++        let mem =3D TBufferChannel::with_capacity(100, 100);
++        let (r_mem, mut w_mem) =3D mem.split().unwrap();
++
++        let config =3D TConfiguration::builder()
++            .max_string_size(Some(1000))
++            .build()
++            .unwrap();
++        let mut i_prot =3D TBinaryInputProtocol::with_config(r_mem, true,=
 config);
++
++        w_mem.set_readable_bytes(&[0x00, 0x00, 0x00, 0x05, b'h', b'e', b'=
l', b'l', b'o']);
++
++        let result =3D i_prot.read_string();
++        assert!(result.is_ok());
++        assert_eq!(result.unwrap(), "hello");
++    }
+ }
+diff --git a/lib/rs/src/protocol/compact.rs b/lib/rs/src/protocol/compact.=
rs
+index c0c43722e..a72243e30 100644
+--- a/lib/rs/src/protocol/compact.rs
++++ b/lib/rs/src/protocol/compact.rs
+@@ -26,6 +26,7 @@ use super::{
+ };
+ use super::{TOutputProtocol, TOutputProtocolFactory, TSetIdentifier, TStr=
uctIdentifier, TType};
+ use crate::transport::{TReadTransport, TWriteTransport};
++use crate::{ProtocolError, ProtocolErrorKind, TConfiguration};
+=20
+ const COMPACT_PROTOCOL_ID: u8 =3D 0x82;
+ const COMPACT_VERSION: u8 =3D 0x01;
+@@ -64,6 +65,10 @@ where
+     pending_read_bool_value: Option<bool>,
+     // Underlying transport used for byte-level operations.
+     transport: T,
++    // Configuration
++    config: TConfiguration,
++    // Current recursion depth
++    recursion_depth: usize,
+ }
+=20
+ impl<T> TCompactInputProtocol<T>
+@@ -72,11 +77,18 @@ where
+ {
+     /// Create a `TCompactInputProtocol` that reads bytes from `transport=
`.
+     pub fn new(transport: T) -> TCompactInputProtocol<T> {
++        Self::with_config(transport, TConfiguration::default())
++    }
++
++    /// Create a `TCompactInputProtocol` with custom configuration.
++    pub fn with_config(transport: T, config: TConfiguration) -> TCompactI=
nputProtocol<T> {
+         TCompactInputProtocol {
+             last_read_field_id: 0,
+             read_field_id_stack: Vec::new(),
+             pending_read_bool_value: None,
+             transport,
++            config,
++            recursion_depth: 0,
+         }
+     }
+=20
+@@ -92,8 +104,23 @@ where
+             self.transport.read_varint::<u32>()? as i32
+         };
+=20
++        let min_element_size =3D self.min_serialized_size(element_type);
++        super::check_container_size(&self.config, element_count, min_elem=
ent_size)?;
++
+         Ok((element_type, element_count))
+     }
++
++    fn check_recursion_depth(&self) -> crate::Result<()> {
++        if let Some(limit) =3D self.config.max_recursion_depth() {
++            if self.recursion_depth >=3D limit {
++                return Err(crate::Error::Protocol(ProtocolError::new(
++                    ProtocolErrorKind::DepthLimit,
++                    format!("Maximum recursion depth {} exceeded", limit)=
,
++                )));
++            }
++        }
++        Ok(())
++    }
+ }
+=20
+ impl<T> TInputProtocol for TCompactInputProtocol<T>
+@@ -101,6 +128,7 @@ where
+     T: TReadTransport,
+ {
+     fn read_message_begin(&mut self) -> crate::Result<TMessageIdentifier>=
 {
++        // TODO: Once specialization is stable, call the message size tra=
cking here
+         let compact_id =3D self.read_byte()?;
+         if compact_id !=3D COMPACT_PROTOCOL_ID {
+             Err(crate::Error::Protocol(crate::ProtocolError {
+@@ -145,12 +173,15 @@ where
+     }
+=20
+     fn read_struct_begin(&mut self) -> crate::Result<Option<TStructIdenti=
fier>> {
++        self.check_recursion_depth()?;
++        self.recursion_depth +=3D 1;
+         self.read_field_id_stack.push(self.last_read_field_id);
+         self.last_read_field_id =3D 0;
+         Ok(None)
+     }
+=20
+     fn read_struct_end(&mut self) -> crate::Result<()> {
++        self.recursion_depth -=3D 1;
+         self.last_read_field_id =3D self
+             .read_field_id_stack
+             .pop()
+@@ -223,6 +254,19 @@ where
+=20
+     fn read_bytes(&mut self) -> crate::Result<Vec<u8>> {
+         let len =3D self.transport.read_varint::<u32>()?;
++
++        if let Some(max_size) =3D self.config.max_string_size() {
++            if len as usize > max_size {
++                return Err(crate::Error::Protocol(ProtocolError::new(
++                    ProtocolErrorKind::SizeLimit,
++                    format!(
++                        "Byte array size {} exceeds maximum allowed size =
of {}",
++                        len, max_size
++                    ),
++                )));
++            }
++        }
++
+         let mut buf =3D vec![0u8; len as usize];
+         self.transport
+             .read_exact(&mut buf)
+@@ -287,6 +331,12 @@ where
+             let type_header =3D self.read_byte()?;
+             let key_type =3D collection_u8_to_type((type_header & 0xF0) >=
> 4)?;
+             let val_type =3D collection_u8_to_type(type_header & 0x0F)?;
++
++            let key_min_size =3D self.min_serialized_size(key_type);
++            let value_min_size =3D self.min_serialized_size(val_type);
++            let element_size =3D key_min_size + value_min_size;
++            super::check_container_size(&self.config, element_count, elem=
ent_size)?;
++
+             Ok(TMapIdentifier::new(key_type, val_type, element_count))
+         }
+     }
+@@ -305,6 +355,30 @@ where
+             .map_err(From::from)
+             .map(|_| buf[0])
+     }
++
++    fn min_serialized_size(&self, field_type: TType) -> usize {
++        compact_protocol_min_serialized_size(field_type)
++    }
++}
++
++pub(crate) fn compact_protocol_min_serialized_size(field_type: TType) -> =
usize {
++    match field_type {
++        TType::Stop =3D> 1,   // 1 byte
++        TType::Void =3D> 1,   // 1 byte
++        TType::Bool =3D> 1,   // 1 byte
++        TType::I08 =3D> 1,    // 1 byte
++        TType::Double =3D> 8, // 8 bytes (not varint encoded)
++        TType::I16 =3D> 1,    // 1 byte minimum (varint)
++        TType::I32 =3D> 1,    // 1 byte minimum (varint)
++        TType::I64 =3D> 1,    // 1 byte minimum (varint)
++        TType::String =3D> 1, // 1 byte minimum for length (varint)
++        TType::Struct =3D> 1, // 1 byte minimum (stop field)
++        TType::Map =3D> 1,    // 1 byte minimum
++        TType::Set =3D> 1,    // 1 byte minimum
++        TType::List =3D> 1,   // 1 byte minimum
++        TType::Uuid =3D> 16,  // 16 bytes
++        TType::Utf7 =3D> 1,   // 1 byte
++    }
+ }
+=20
+ impl<T> io::Seek for TCompactInputProtocol<T>
+@@ -2567,14 +2641,25 @@ mod tests {
+     fn must_round_trip_small_sized_list_begin() {
+         let (mut i_prot, mut o_prot) =3D test_objects();
+=20
+-        let ident =3D TListIdentifier::new(TType::I08, 10);
+-
++        let ident =3D TListIdentifier::new(TType::I32, 3);
+         assert_success!(o_prot.write_list_begin(&ident));
+=20
++        assert_success!(o_prot.write_i32(100));
++        assert_success!(o_prot.write_i32(200));
++        assert_success!(o_prot.write_i32(300));
++
++        assert_success!(o_prot.write_list_end());
++
+         copy_write_buffer_to_read_buffer!(o_prot);
+=20
+         let res =3D assert_success!(i_prot.read_list_begin());
+         assert_eq!(&res, &ident);
++
++        assert_eq!(i_prot.read_i32().unwrap(), 100);
++        assert_eq!(i_prot.read_i32().unwrap(), 200);
++        assert_eq!(i_prot.read_i32().unwrap(), 300);
++
++        assert_success!(i_prot.read_list_end());
+     }
+=20
+     #[test]
+@@ -2594,10 +2679,9 @@ mod tests {
+=20
+     #[test]
+     fn must_round_trip_large_sized_list_begin() {
+-        let (mut i_prot, mut o_prot) =3D test_objects();
++        let (mut i_prot, mut o_prot) =3D test_objects_no_limits();
+=20
+         let ident =3D TListIdentifier::new(TType::Set, 47381);
+-
+         assert_success!(o_prot.write_list_begin(&ident));
+=20
+         copy_write_buffer_to_read_buffer!(o_prot);
+@@ -2626,14 +2710,25 @@ mod tests {
+     fn must_round_trip_small_sized_set_begin() {
+         let (mut i_prot, mut o_prot) =3D test_objects();
+=20
+-        let ident =3D TSetIdentifier::new(TType::I16, 7);
+-
++        let ident =3D TSetIdentifier::new(TType::I16, 3);
+         assert_success!(o_prot.write_set_begin(&ident));
+=20
++        assert_success!(o_prot.write_i16(111));
++        assert_success!(o_prot.write_i16(222));
++        assert_success!(o_prot.write_i16(333));
++
++        assert_success!(o_prot.write_set_end());
++
+         copy_write_buffer_to_read_buffer!(o_prot);
+=20
+         let res =3D assert_success!(i_prot.read_set_begin());
+         assert_eq!(&res, &ident);
++
++        assert_eq!(i_prot.read_i16().unwrap(), 111);
++        assert_eq!(i_prot.read_i16().unwrap(), 222);
++        assert_eq!(i_prot.read_i16().unwrap(), 333);
++
++        assert_success!(i_prot.read_set_end());
+     }
+=20
+     #[test]
+@@ -2652,10 +2747,9 @@ mod tests {
+=20
+     #[test]
+     fn must_round_trip_large_sized_set_begin() {
+-        let (mut i_prot, mut o_prot) =3D test_objects();
++        let (mut i_prot, mut o_prot) =3D test_objects_no_limits();
+=20
+         let ident =3D TSetIdentifier::new(TType::Map, 3_928_429);
+-
+         assert_success!(o_prot.write_set_begin(&ident));
+=20
+         copy_write_buffer_to_read_buffer!(o_prot);
+@@ -2719,10 +2813,9 @@ mod tests {
+=20
+     #[test]
+     fn must_round_trip_map_begin() {
+-        let (mut i_prot, mut o_prot) =3D test_objects();
++        let (mut i_prot, mut o_prot) =3D test_objects_no_limits();
+=20
+         let ident =3D TMapIdentifier::new(TType::Map, TType::List, 1_928_=
349);
+-
+         assert_success!(o_prot.write_map_begin(&ident));
+=20
+         copy_write_buffer_to_read_buffer!(o_prot);
+@@ -2798,7 +2891,7 @@ mod tests {
+         TCompactInputProtocol<ReadHalf<TBufferChannel>>,
+         TCompactOutputProtocol<WriteHalf<TBufferChannel>>,
+     ) {
+-        let mem =3D TBufferChannel::with_capacity(80, 80);
++        let mem =3D TBufferChannel::with_capacity(200, 200);
+=20
+         let (r_mem, w_mem) =3D mem.split().unwrap();
+=20
+@@ -2808,6 +2901,20 @@ mod tests {
+         (i_prot, o_prot)
+     }
+=20
++    fn test_objects_no_limits() -> (
++        TCompactInputProtocol<ReadHalf<TBufferChannel>>,
++        TCompactOutputProtocol<WriteHalf<TBufferChannel>>,
++    ) {
++        let mem =3D TBufferChannel::with_capacity(200, 200);
++
++        let (r_mem, w_mem) =3D mem.split().unwrap();
++
++        let i_prot =3D TCompactInputProtocol::with_config(r_mem, TConfigu=
ration::no_limits());
++        let o_prot =3D TCompactOutputProtocol::new(w_mem);
++
++        (i_prot, o_prot)
++    }
++
+     #[test]
+     fn must_read_write_double() {
+         let (mut i_prot, mut o_prot) =3D test_objects();
+@@ -2841,4 +2948,248 @@ mod tests {
+         assert!(write_fn(&mut o_prot).is_ok());
+         assert_eq!(o_prot.transport.write_bytes().len(), 0);
+     }
++
++    #[test]
++    fn must_enforce_recursion_depth_limit() {
++        let channel =3D TBufferChannel::with_capacity(100, 100);
++
++        // Create a configuration with a small recursion limit
++        let config =3D TConfiguration::builder()
++            .max_recursion_depth(Some(2))
++            .build()
++            .unwrap();
++
++        let mut protocol =3D TCompactInputProtocol::with_config(channel, =
config);
++
++        // First struct - should succeed
++        assert!(protocol.read_struct_begin().is_ok());
++
++        // Second struct - should succeed (at limit)
++        assert!(protocol.read_struct_begin().is_ok());
++
++        // Third struct - should fail (exceeds limit)
++        let result =3D protocol.read_struct_begin();
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Protocol(e)) =3D> {
++                assert_eq!(e.kind, ProtocolErrorKind::DepthLimit);
++            }
++            _ =3D> panic!("Expected protocol error with DepthLimit"),
++        }
++    }
++
++    #[test]
++    fn must_check_container_size_overflow() {
++        // Configure a small message size limit
++        let config =3D TConfiguration::builder()
++            .max_message_size(Some(1000))
++            .max_frame_size(Some(1000))
++            .build()
++            .unwrap();
++        let transport =3D TBufferChannel::with_capacity(100, 0);
++        let mut i_prot =3D TCompactInputProtocol::with_config(transport, =
config);
++
++        // Write a list header that would require more memory than messag=
e size limit
++        // List of 100 UUIDs (16 bytes each) =3D 1600 bytes > 1000 limit
++        i_prot.transport.set_readable_bytes(&[
++            0xFD, // element type UUID (0x0D) | count in next bytes (0xF0=
)
++            0x64, // varint 100
++        ]);
++
++        let result =3D i_prot.read_list_begin();
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Protocol(e)) =3D> {
++                assert_eq!(e.kind, ProtocolErrorKind::SizeLimit);
++                assert!(e
++                    .message
++                    .contains("1600 bytes, exceeding message size limit o=
f 1000"));
++            }
++            _ =3D> panic!("Expected protocol error with SizeLimit"),
++        }
++    }
++
++    #[test]
++    fn must_reject_negative_container_sizes() {
++        let mut channel =3D TBufferChannel::with_capacity(100, 100);
++
++        let mut protocol =3D TCompactInputProtocol::new(channel.clone());
++
++        // Write header with negative size when decoded
++        // In compact protocol, lists/sets use a header byte followed by =
size
++        // We'll use 0x0F for element type and then a varint-encoded nega=
tive number
++        channel.set_readable_bytes(&[
++            0xF0, // Header: 15 in upper nibble (triggers varint read), L=
ist type in lower
++            0xFF, 0xFF, 0xFF, 0xFF, 0x0F, // Varint encoding of -1
++        ]);
++
++        let result =3D protocol.read_list_begin();
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Protocol(e)) =3D> {
++                assert_eq!(e.kind, ProtocolErrorKind::NegativeSize);
++            }
++            _ =3D> panic!("Expected protocol error with NegativeSize"),
++        }
++    }
++
++    #[test]
++    fn must_enforce_container_size_limit() {
++        let channel =3D TBufferChannel::with_capacity(100, 100);
++        let (r_channel, mut w_channel) =3D channel.split().unwrap();
++
++        // Create protocol with explicit container size limit
++        let config =3D TConfiguration::builder()
++            .max_container_size(Some(1000))
++            .build()
++            .unwrap();
++        let mut protocol =3D TCompactInputProtocol::with_config(r_channel=
, config);
++
++        // Write header with large size
++        // Compact protocol: 0xF0 means size >=3D 15 is encoded as varint
++        // Then we write a varint encoding 10000 (exceeds our limit of 10=
00)
++        w_channel.set_readable_bytes(&[
++            0xF0, // Header: 15 in upper nibble (triggers varint read), e=
lement type in lower
++            0x90, 0x4E, // Varint encoding of 10000
++        ]);
++
++        let result =3D protocol.read_list_begin();
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Protocol(e)) =3D> {
++                assert_eq!(e.kind, ProtocolErrorKind::SizeLimit);
++                assert!(e.message.contains("exceeds maximum allowed size"=
));
++            }
++            _ =3D> panic!("Expected protocol error with SizeLimit"),
++        }
++    }
++
++    #[test]
++    fn must_handle_varint_size_overflow() {
++        // Test that compact protocol properly handles varint-encoded siz=
es that would cause overflow
++        let mut channel =3D TBufferChannel::with_capacity(100, 100);
++
++        let mut protocol =3D TCompactInputProtocol::new(channel.clone());
++
++        // Create input that encodes a very large size using varint encod=
ing
++        // 0xFA =3D list header with size >=3D 15 (so size follows as var=
int)
++        // Then multiple 0xFF bytes which in varint encoding create a ver=
y large number
++        channel.set_readable_bytes(&[
++            0xFA, // List header: size >=3D 15, element type =3D 0x0A
++            0xFF, 0xFF, 0xFF, 0xFF, 0x7F, // Varint encoding of a huge nu=
mber
++        ]);
++
++        let result =3D protocol.read_list_begin();
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Protocol(e)) =3D> {
++                // The varint decoder might interpret this as negative, w=
hich is also fine
++                assert!(
++                    e.kind =3D=3D ProtocolErrorKind::SizeLimit
++                        || e.kind =3D=3D ProtocolErrorKind::NegativeSize,
++                    "Expected SizeLimit or NegativeSize but got {:?}",
++                    e.kind
++                );
++            }
++            _ =3D> panic!("Expected protocol error"),
++        }
++    }
++
++    #[test]
++    fn must_enforce_string_size_limit() {
++        let channel =3D TBufferChannel::with_capacity(100, 100);
++        let (r_channel, mut w_channel) =3D channel.split().unwrap();
++
++        // Create protocol with string limit of 100 bytes
++        let config =3D TConfiguration::builder()
++            .max_string_size(Some(100))
++            .build()
++            .unwrap();
++        let mut protocol =3D TCompactInputProtocol::with_config(r_channel=
, config);
++
++        // Write a varint-encoded string size that exceeds the limit
++        w_channel.set_readable_bytes(&[
++            0xC8, 0x01, // Varint encoding of 200
++        ]);
++
++        let result =3D protocol.read_string();
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Protocol(e)) =3D> {
++                assert_eq!(e.kind, ProtocolErrorKind::SizeLimit);
++                assert!(e.message.contains("exceeds maximum allowed size"=
));
++            }
++            _ =3D> panic!("Expected protocol error with SizeLimit"),
++        }
++    }
++
++    #[test]
++    fn must_allow_no_limit_configuration() {
++        let channel =3D TBufferChannel::with_capacity(40, 40);
++
++        let config =3D TConfiguration::no_limits();
++        let mut protocol =3D TCompactInputProtocol::with_config(channel, =
config);
++
++        // Should be able to nest structs deeply without limit
++        for _ in 0..100 {
++            assert!(protocol.read_struct_begin().is_ok());
++        }
++
++        for _ in 0..100 {
++            assert!(protocol.read_struct_end().is_ok());
++        }
++    }
++
++    #[test]
++    fn must_allow_containers_within_limit() {
++        let channel =3D TBufferChannel::with_capacity(200, 200);
++        let (r_channel, mut w_channel) =3D channel.split().unwrap();
++
++        // Create protocol with container limit of 100
++        let config =3D TConfiguration::builder()
++            .max_container_size(Some(100))
++            .build()
++            .unwrap();
++        let mut protocol =3D TCompactInputProtocol::with_config(r_channel=
, config);
++
++        // Write a list with 5 i32 elements (well within limit of 100)
++        // Compact protocol: size < 15 is encoded in header
++        w_channel.set_readable_bytes(&[
++            0x55, // Header: size=3D5, element type=3D5 (i32)
++            // 5 varint-encoded i32 values
++            0x0A, // 10
++            0x14, // 20
++            0x1E, // 30
++            0x28, // 40
++            0x32, // 50
++        ]);
++
++        let result =3D protocol.read_list_begin();
++        assert!(result.is_ok());
++        let list_ident =3D result.unwrap();
++        assert_eq!(list_ident.size, 5);
++        assert_eq!(list_ident.element_type, TType::I32);
++    }
++
++    #[test]
++    fn must_allow_strings_within_limit() {
++        let channel =3D TBufferChannel::with_capacity(100, 100);
++        let (r_channel, mut w_channel) =3D channel.split().unwrap();
++
++        let config =3D TConfiguration::builder()
++            .max_string_size(Some(1000))
++            .build()
++            .unwrap();
++        let mut protocol =3D TCompactInputProtocol::with_config(r_channel=
, config);
++
++        // Write a string "hello" (5 bytes, well within limit)
++        w_channel.set_readable_bytes(&[
++            0x05, // Varint-encoded length: 5
++            b'h', b'e', b'l', b'l', b'o',
++        ]);
++
++        let result =3D protocol.read_string();
++        assert!(result.is_ok());
++        assert_eq!(result.unwrap(), "hello");
++    }
+ }
+diff --git a/lib/rs/src/protocol/mod.rs b/lib/rs/src/protocol/mod.rs
+index 8bbbb3c7c..573978a75 100644
+--- a/lib/rs/src/protocol/mod.rs
++++ b/lib/rs/src/protocol/mod.rs
+@@ -62,7 +62,7 @@ use std::fmt;
+ use std::fmt::{Display, Formatter};
+=20
+ use crate::transport::{TReadTransport, TWriteTransport};
+-use crate::{ProtocolError, ProtocolErrorKind};
++use crate::{ProtocolError, ProtocolErrorKind, TConfiguration};
+=20
+ #[cfg(test)]
+ macro_rules! assert_eq_written_bytes {
+@@ -262,6 +262,15 @@ pub trait TInputProtocol {
+     ///
+     /// This method should **never** be used in generated code.
+     fn read_byte(&mut self) -> crate::Result<u8>;
++
++    /// Get the minimum number of bytes a type will consume on the wire.
++    /// This picks the minimum possible across all protocols (so currentl=
y matches the compact protocol).
++    ///
++    /// This is used for pre-allocation size checks.
++    /// The actual data may be larger (e.g., for strings, lists, etc.).
++    fn min_serialized_size(&self, field_type: TType) -> usize {
++        self::compact::compact_protocol_min_serialized_size(field_type)
++    }
+ }
+=20
+ /// Converts Thrift identifiers, primitives, containers or structs into a
+@@ -444,6 +453,10 @@ where
+     fn read_byte(&mut self) -> crate::Result<u8> {
+         (**self).read_byte()
+     }
++
++    fn min_serialized_size(&self, field_type: TType) -> usize {
++        (**self).min_serialized_size(field_type)
++    }
+ }
+=20
+ impl<P> TOutputProtocol for Box<P>
+@@ -565,7 +578,7 @@ where
+ /// let protocol =3D factory.create(Box::new(channel));
+ /// ```
+ pub trait TInputProtocolFactory {
+-    // Create a `TInputProtocol` that reads bytes from `transport`.
++    /// Create a `TInputProtocol` that reads bytes from `transport`.
+     fn create(&self, transport: Box<dyn TReadTransport + Send>) -> Box<dy=
n TInputProtocol + Send>;
+ }
+=20
+@@ -920,6 +933,69 @@ pub fn verify_required_field_exists<T>(field_name: &s=
tr, field: &Option<T>) -> c
+     }
+ }
+=20
++/// Common container size validation used by all protocols.
++///
++/// Checks that:
++/// - Container size is not negative
++/// - Container size doesn't exceed configured maximum
++/// - Container size * element size doesn't overflow
++/// - Container memory requirements don't exceed message size limit
++pub(crate) fn check_container_size(
++    config: &TConfiguration,
++    container_size: i32,
++    element_size: usize,
++) -> crate::Result<()> {
++    // Check for negative size
++    if container_size < 0 {
++        return Err(crate::Error::Protocol(ProtocolError::new(
++            ProtocolErrorKind::NegativeSize,
++            format!("Negative container size: {}", container_size),
++        )));
++    }
++
++    let size_as_usize =3D container_size as usize;
++
++    // Check against configured max container size
++    if let Some(max_size) =3D config.max_container_size() {
++        if size_as_usize > max_size {
++            return Err(crate::Error::Protocol(ProtocolError::new(
++                ProtocolErrorKind::SizeLimit,
++                format!(
++                    "Container size {} exceeds maximum allowed size of {}=
",
++                    container_size, max_size
++                ),
++            )));
++        }
++    }
++
++    // Check for potential overflow
++    if let Some(min_bytes_needed) =3D size_as_usize.checked_mul(element_s=
ize) {
++        // TODO: When Rust trait specialization stabilizes, we can add mo=
re precise checks
++        // for transports that track exact remaining bytes. For now, we u=
se the message
++        // size limit as a best-effort check.
++        if let Some(max_message_size) =3D config.max_message_size() {
++            if min_bytes_needed > max_message_size {
++                return Err(crate::Error::Protocol(ProtocolError::new(
++                    ProtocolErrorKind::SizeLimit,
++                    format!(
++                        "Container would require {} bytes, exceeding mess=
age size limit of {}",
++                        min_bytes_needed, max_message_size
++                    ),
++                )));
++            }
++        }
++        Ok(())
++    } else {
++        Err(crate::Error::Protocol(ProtocolError::new(
++            ProtocolErrorKind::SizeLimit,
++            format!(
++                "Container size {} with element size {} bytes would resul=
t in overflow",
++                container_size, element_size
++            ),
++        )))
++    }
++}
++
+ /// Extract the field id from a Thrift field identifier.
+ ///
+ /// `field_ident` must *not* have `TFieldIdentifier.field_type` of type `=
TType::Stop`.
+diff --git a/lib/rs/src/transport/framed.rs b/lib/rs/src/transport/framed.=
rs
+index c30ccd9ed..a08a380f4 100644
+--- a/lib/rs/src/transport/framed.rs
++++ b/lib/rs/src/transport/framed.rs
+@@ -21,6 +21,7 @@ use std::io;
+ use std::io::{Read, Write};
+=20
+ use super::{TReadTransport, TReadTransportFactory, TWriteTransport, TWrit=
eTransportFactory};
++use crate::TConfiguration;
+=20
+ /// Default capacity of the read buffer in bytes.
+ const READ_CAPACITY: usize =3D 4096;
+@@ -61,6 +62,7 @@ where
+     pos: usize,
+     cap: usize,
+     chan: C,
++    config: TConfiguration,
+ }
+=20
+ impl<C> TFramedReadTransport<C>
+@@ -81,6 +83,7 @@ where
+             pos: 0,
+             cap: 0,
+             chan: channel,
++            config: TConfiguration::default(),
+         }
+     }
+ }
+@@ -91,7 +94,28 @@ where
+ {
+     fn read(&mut self, b: &mut [u8]) -> io::Result<usize> {
+         if self.cap - self.pos =3D=3D 0 {
+-            let message_size =3D self.chan.read_i32::<BigEndian>()? as us=
ize;
++            let frame_size_bytes =3D self.chan.read_i32::<BigEndian>()?;
++
++            if frame_size_bytes < 0 {
++                return Err(io::Error::new(
++                    io::ErrorKind::InvalidData,
++                    format!("Negative frame size: {}", frame_size_bytes),
++                ));
++            }
++
++            let message_size =3D frame_size_bytes as usize;
++
++            if let Some(max_frame) =3D self.config.max_frame_size() {
++                if message_size > max_frame {
++                    return Err(io::Error::new(
++                        io::ErrorKind::InvalidData,
++                        format!(
++                            "Frame size {} exceeds maximum allowed size o=
f {}",
++                            message_size, max_frame
++                        ),
++                    ));
++                }
++            }
+=20
+             let buf_capacity =3D cmp::max(message_size, READ_CAPACITY);
+             self.buf.resize(buf_capacity, 0);
+@@ -125,7 +149,6 @@ impl TReadTransportFactory for TFramedReadTransportFac=
tory {
+         Box::new(TFramedReadTransport::new(channel))
+     }
+ }
+-
+ /// Transport that writes framed messages.
+ ///
+ /// A `TFramedWriteTransport` maintains a fixed-size internal write buffe=
r. All
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43870.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43870.patch
new file mode 100644
index 0000000000..a4b5ef4835
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43870.patch
@@ -0,0 +1,127 @@
+From 0faaa79330a2864135948186858036676fdbc1b1 Mon Sep 17 00:00:00 2001
+From: Jens Geyer <jensg@apache.org>
+Date: Sat, 11 Apr 2026 12:29:16 +0200
+Subject: [PATCH] Harden Node.js WebSocket server handling Client: nodejs
+
+- Validate origin on WebSocket upgrade using the same CORS rules
+  as HTTP requests
+- Fix path containment check to use trailing separator
+- Replace deprecated new Buffer() with Buffer.alloc()
+- Sanitize interpolated header values in upgrade response
+
+(04)
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+
+This closes #3391
+
+CVE: CVE-2026-43870
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/5e4f01d=
737e4d3845d07dde6da43981feee0cb9a]
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ lib/nodejs/lib/thrift/web_server.js | 32 +++++++++++++++++++++--------
+ 1 file changed, 24 insertions(+), 8 deletions(-)
+
+diff --git a/lib/nodejs/lib/thrift/web_server.js b/lib/nodejs/lib/thrift/w=
eb_server.js
+index a33f47aed..cf88bde1b 100644
+--- a/lib/nodejs/lib/thrift/web_server.js
++++ b/lib/nodejs/lib/thrift/web_server.js
+@@ -26,6 +26,10 @@ var log =3D require('./log');
+=20
+ var MultiplexedProcessor =3D require('./multiplexed_processor').Multiplex=
edProcessor;
+=20
++function sanitizeHeader(value) {
++  return (value || "").replace(/[\r\n]/g, "");
++}
++
+ var TBufferedTransport =3D require('./buffered_transport');
+ var TBinaryProtocol =3D require('./binary_protocol');
+ var InputBufferUnderrunError =3D require('./input_buffer_underrun_error')=
;
+@@ -83,7 +87,7 @@ var wsFrame =3D {
+    * @returns {Buffer} - The WebSocket frame, ready to send
+    */
+   encode: function(data, mask, binEncoding) {
+-      var frame =3D new Buffer(wsFrame.frameSizeFromData(data, mask));
++      var frame =3D Buffer.alloc(wsFrame.frameSizeFromData(data, mask));
+       //Byte 0 - FIN & OPCODE
+       frame[0] =3D wsFrame.fin.FIN +
+           (binEncoding ? wsFrame.frameOpCodes.BIN : wsFrame.frameOpCodes.=
TEXT);
+@@ -162,19 +166,19 @@ var wsFrame =3D {
+       }
+       //MASK
+       if (wsFrame.mask.TO_SERVER =3D=3D (frame[1] & wsFrame.mask.TO_SERVE=
R)) {
+-        result.mask =3D new Buffer(4);
++        result.mask =3D Buffer.alloc(4);
+         frame.copy(result.mask, 0, dataOffset, dataOffset + 4);
+         dataOffset +=3D 4;
+       }
+       //Payload
+-      result.data =3D new Buffer(len);
++      result.data =3D Buffer.alloc(len);
+       frame.copy(result.data, 0, dataOffset, dataOffset+len);
+       if (result.mask) {
+         wsFrame.applyMask(result.data, result.mask);
+       }
+       //Next Frame
+       if (frame.length > dataOffset+len) {
+-        result.nextFrame =3D new Buffer(frame.length - (dataOffset+len));
++        result.nextFrame =3D Buffer.alloc(frame.length - (dataOffset+len)=
);
+         frame.copy(result.nextFrame, 0, dataOffset+len, frame.length);
+       }
+       //Don't forward control frames
+@@ -418,7 +422,8 @@ exports.createWebServer =3D function(options) {
+     var filename =3D path.resolve(path.join(baseDir, uri));
+=20
+     //Ensure the basedir path is not able to be escaped
+-    if (filename.indexOf(baseDir) !=3D 0) {
++    var normalizedBase =3D baseDir.endsWith(path.sep) ? baseDir : baseDir=
 + path.sep;
++    if (filename !=3D=3D baseDir && filename.indexOf(normalizedBase) !=3D=
=3D 0) {
+       response.writeHead(400, "Invalid request path", {});
+       response.end();
+       return;
+@@ -510,6 +515,14 @@ exports.createWebServer =3D function(options) {
+       response.end();
+     }
+   }).on('upgrade', function(request, socket, head) {
++    //Verify CORS origin for WebSocket upgrades
++    if (request.headers.origin && options.cors) {
++      if (!options.cors["*"] && !options.cors[request.headers.origin]) {
++        socket.write("HTTP/1.1 403 Origin not allowed\r\n\r\n");
++        socket.destroy();
++        return;
++      }
++    }
+     //Lookup service
+     var svc;
+     try {
+@@ -521,12 +534,15 @@ exports.createWebServer =3D function(options) {
+     //Perform upgrade
+     var hash =3D crypto.createHash("sha1");
+     hash.update(request.headers['sec-websocket-key'] + "258EAFA5-E914-47D=
A-95CA-C5AB0DC85B11");
++    var origin =3D sanitizeHeader(request.headers.origin);
++    var host =3D sanitizeHeader(request.headers.host);
++    var reqUrl =3D sanitizeHeader(request.url);
+     socket.write("HTTP/1.1 101 Switching Protocols\r\n" +
+                    "Upgrade: websocket\r\n" +
+                    "Connection: Upgrade\r\n" +
+                    "Sec-WebSocket-Accept: " + hash.digest("base64") + "\r=
\n" +
+-                   "Sec-WebSocket-Origin: " + request.headers.origin + "\=
r\n" +
+-                   "Sec-WebSocket-Location: ws://" + request.headers.host=
 + request.url + "\r\n" +
++                   "Sec-WebSocket-Origin: " + origin + "\r\n" +
++                   "Sec-WebSocket-Location: ws://" + host + reqUrl + "\r\=
n" +
+                    "\r\n");
+     //Handle WebSocket traffic
+     var data =3D null;
+@@ -537,7 +553,7 @@ exports.createWebServer =3D function(options) {
+           //Prepend any existing decoded data
+           if (data) {
+             if (result.data) {
+-              var newData =3D new Buffer(data.length + result.data.length=
);
++              var newData =3D Buffer.alloc(data.length + result.data.leng=
th);
+               data.copy(newData);
+               result.data.copy(newData, data.length);
+               result.data =3D newData;
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.20.0.bb
index e4fd07198c..2922dc96e4 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
@@ -12,6 +12,8 @@ SRC_URI =3D "https://archive.apache.org/dist/${BPN}/${PV}=
/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-term=
s.patch \
            file://0001-thrift-pr2755.patch \
            file://0001-THRIFT-5842-Add-missing-cstdint-include-for-int64_t=
-.patch \
+           file://CVE-2026-43868.patch \
+           file://CVE-2026-43870.patch \
            "
 SRC_URI[sha256sum] =3D "b5d8311a779470e1502c027f428a1db542f5c051c8e1280ccd=
2163fa935ff2d6"
=20
@@ -19,6 +21,8 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 CVE_PRODUCT =3D "apache:thrift"
=20
+CVE_STATUS[CVE-2026-43869] =3D "not-applicable-config: The issue is presen=
t in the Java client which is not built"
+
 inherit pkgconfig cmake python3native
=20
 export STAGING_INCDIR
--=20
2.34.1



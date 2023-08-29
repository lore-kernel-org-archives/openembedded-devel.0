Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2A2C83F12
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 11:35:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15128.1693308930399855843
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Aug 2023 04:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tDkfuGqc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7605a3e163=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37TBXOv7014080
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 11:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=bO7sxV9P2wp0cWzb+L8aDjYnFfpwVCrmpVec5wp26Ec=; b=
	tDkfuGqcAjtwOvh2NVzd/+vQcFgF3ImxKzfTTaXaB/wPiXEG1b3INUglVuAUpc6L
	bShmL8VBq2AoE3RZcKgndQ2g8pzQHRBswlT7BDlx8ZfXX6XbJeRdqyxgfC0k0a3Z
	CPq1uXg/DDCczglohnh11jK36pc8vfwPmz151VpknLV4tr6HuI22bACKKdsjDcZk
	lqbCwhB9EVxQb0FLRg9QiFqKJZO4ApymK9qL5MFTwiE1MQ3hHBYnIpHUVOp5etgo
	XR8ZlANwoTX1cX5vvOC2rCRWhNGhogHfBcIIw95GyyduNGjwnc7leNp9uRLj/po5
	rEmmwXER82maJ+EL9+KNaQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c62jc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 11:35:29 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 04:35:26 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][mickledore][PATCH 2/2] nodejs: fix CVE-2022-25883
Date: Tue, 29 Aug 2023 11:35:13 +0000
Message-ID: <20230829113513.276561-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230829113513.276561-1-archana.polampalli@windriver.com>
References: <20230829113513.276561-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: LfLjoFhWTbrlfx9qBKsnvYZHguAO_IFm
X-Proofpoint-GUID: LfLjoFhWTbrlfx9qBKsnvYZHguAO_IFm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_08,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308290099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 11:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104640

Versions of the package semver before 7.5.2 are vulnerable to Regular Expression
Denial of Service (ReDoS) via the function new Range, when untrusted user data is
provided as a range.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-25883

Upstream patches:
https://github.com/npm/node-semver/commit/717534ee353682f3bcf33e60a8af4292626d4441

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/CVE-2022-25883.patch        | 260 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_18.17.1.bb |   1 +
 2 files changed, 261 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch
new file mode 100644
index 000000000..1c9daf714
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch
@@ -0,0 +1,260 @@
+From 717534ee353682f3bcf33e60a8af4292626d4441 Mon Sep 17 00:00:00 2001
+From: Luke Karrys <luke@lukekarrys.com>
+Date: Thu, 15 Jun 2023 12:21:14 -0700
+Subject: [PATCH] fix: better handling of whitespace (#564)
+
+CVE: CVE-2022-25883
+
+Upstream-Status: Backport [https://github.com/npm/node-semver/commit/717534ee353682f3bcf33e60a8af4292626d4441]
+---
+ classes/comparator.js          |  3 +-
+ classes/range.js               | 64 ++++++++++++++++------------
+ classes/semver.js              |  2 +-
+ functions/coerce.js            |  2 +-
+ internal/re.js                 | 11 +++++
+ package.json                   |  2 +-
+ 6 files changed, 53 insertions(+), 31 deletions(-)
+
+diff --git a/classes/comparator.js b/classes/comparator.js
+index 2146c88..3d39c0e 100644
+--- a/classes/comparator.js
++++ b/classes/comparator.js
+@@ -16,6 +16,7 @@ class Comparator {
+       }
+     }
+
++    comp = comp.trim().split(/\s+/).join(' ')
+     debug('comparator', comp, options)
+     this.options = options
+     this.loose = !!options.loose
+@@ -133,7 +134,7 @@ class Comparator {
+ module.exports = Comparator
+
+ const parseOptions = require('../internal/parse-options')
+-const { re, t } = require('../internal/re')
++const { safeRe: re, t } = require('../internal/re')
+ const cmp = require('../functions/cmp')
+ const debug = require('../internal/debug')
+ const SemVer = require('./semver')
+diff --git a/classes/range.js b/classes/range.js
+index d9e866d..53c2540 100644
+--- a/classes/range.js
++++ b/classes/range.js
+@@ -26,19 +26,26 @@ class Range {
+     this.loose = !!options.loose
+     this.includePrerelease = !!options.includePrerelease
+
+-    // First, split based on boolean or ||
++    // First reduce all whitespace as much as possible so we do not have to rely
++    // on potentially slow regexes like \s*. This is then stored and used for
++    // future error messages as well.
+     this.raw = range
+-    this.set = range
++      .trim()
++      .split(/\s+/)
++      .join(' ')
++
++    // First, split on ||
++    this.set = this.raw
+       .split('||')
+       // map the range to a 2d array of comparators
+-      .map(r => this.parseRange(r.trim()))
++      .map(r => this.parseRange(r))
+       // throw out any comparator lists that are empty
+       // this generally means that it was not a valid range, which is allowed
+       // in loose mode, but will still throw if the WHOLE range is invalid.
+       .filter(c => c.length)
+
+     if (!this.set.length) {
+-      throw new TypeError(`Invalid SemVer Range: ${range}`)
++      throw new TypeError(`Invalid SemVer Range: ${this.raw}`)
+     }
+
+     // if we have any that are not the null set, throw out null sets.
+@@ -64,9 +71,7 @@ class Range {
+
+   format () {
+     this.range = this.set
+-      .map((comps) => {
+-        return comps.join(' ').trim()
+-      })
++      .map((comps) => comps.join(' ').trim())
+       .join('||')
+       .trim()
+     return this.range
+@@ -77,8 +82,6 @@ class Range {
+   }
+
+   parseRange (range) {
+-    range = range.trim()
+-
+     // memoize range parsing for performance.
+     // this is a very hot path, and fully deterministic.
+     const memoOpts =
+@@ -105,9 +108,6 @@ class Range {
+     // `^ 1.2.3` => `^1.2.3`
+     range = range.replace(re[t.CARETTRIM], caretTrimReplace)
+
+-    // normalize spaces
+-    range = range.split(/\s+/).join(' ')
+-
+     // At this point, the range is completely trimmed and
+     // ready to be split into comparators.
+
+@@ -203,7 +203,7 @@ const Comparator = require('./comparator')
+ const debug = require('../internal/debug')
+ const SemVer = require('./semver')
+ const {
+-  re,
++  safeRe: re,
+   t,
+   comparatorTrimReplace,
+   tildeTrimReplace,
+@@ -257,10 +257,13 @@ const isX = id => !id || id.toLowerCase() === 'x' || id === '*'
+ // ~1.2.3, ~>1.2.3 --> >=1.2.3 <1.3.0-0
+ // ~1.2.0, ~>1.2.0 --> >=1.2.0 <1.3.0-0
+ // ~0.0.1 --> >=0.0.1 <0.1.0-0
+-const replaceTildes = (comp, options) =>
+-  comp.trim().split(/\s+/).map((c) => {
+-    return replaceTilde(c, options)
+-  }).join(' ')
++const replaceTildes = (comp, options) => {
++  return comp
++    .trim()
++    .split(/\s+/)
++    .map((c) => replaceTilde(c, options))
++    .join(' ')
++}
+
+ const replaceTilde = (comp, options) => {
+   const r = options.loose ? re[t.TILDELOOSE] : re[t.TILDE]
+@@ -298,10 +301,13 @@ const replaceTilde = (comp, options) => {
+ // ^1.2.0 --> >=1.2.0 <2.0.0-0
+ // ^0.0.1 --> >=0.0.1 <0.0.2-0
+ // ^0.1.0 --> >=0.1.0 <0.2.0-0
+-const replaceCarets = (comp, options) =>
+-  comp.trim().split(/\s+/).map((c) => {
+-    return replaceCaret(c, options)
+-  }).join(' ')
++const replaceCarets = (comp, options) => {
++  return comp
++    .trim()
++    .split(/\s+/)
++    .map((c) => replaceCaret(c, options))
++    .join(' ')
++}
+
+ const replaceCaret = (comp, options) => {
+   debug('caret', comp, options)
+@@ -358,9 +364,10 @@ const replaceCaret = (comp, options) => {
+
+ const replaceXRanges = (comp, options) => {
+   debug('replaceXRanges', comp, options)
+-  return comp.split(/\s+/).map((c) => {
+-    return replaceXRange(c, options)
+-  }).join(' ')
++  return comp
++    .split(/\s+/)
++    .map((c) => replaceXRange(c, options))
++    .join(' ')
+ }
+
+ const replaceXRange = (comp, options) => {
+@@ -443,12 +450,15 @@ const replaceXRange = (comp, options) => {
+ const replaceStars = (comp, options) => {
+   debug('replaceStars', comp, options)
+   // Looseness is ignored here.  star is always as loose as it gets!
+-  return comp.trim().replace(re[t.STAR], '')
++  return comp
++    .trim()
++    .replace(re[t.STAR], '')
+ }
+
+ const replaceGTE0 = (comp, options) => {
+   debug('replaceGTE0', comp, options)
+-  return comp.trim()
++  return comp
++    .trim()
+     .replace(re[options.includePrerelease ? t.GTE0PRE : t.GTE0], '')
+ }
+
+@@ -486,7 +496,7 @@ const hyphenReplace = incPr => ($0,
+     to = `<=${to}`
+   }
+
+-  return (`${from} ${to}`).trim()
++  return `${from} ${to}`.trim()
+ }
+
+ const testSet = (set, version, options) => {
+diff --git a/classes/semver.js b/classes/semver.js
+index 99dbe82..e1208fe 100644
+--- a/classes/semver.js
++++ b/classes/semver.js
+@@ -1,6 +1,6 @@
+ const debug = require('../internal/debug')
+ const { MAX_LENGTH, MAX_SAFE_INTEGER } = require('../internal/constants')
+-const { re, t } = require('../internal/re')
++const { safeRe: re, t } = require('../internal/re')
+
+ const parseOptions = require('../internal/parse-options')
+ const { compareIdentifiers } = require('../internal/identifiers')
+diff --git a/functions/coerce.js b/functions/coerce.js
+index 2e01452..febbff9 100644
+--- a/functions/coerce.js
++++ b/functions/coerce.js
+@@ -1,6 +1,6 @@
+ const SemVer = require('../classes/semver')
+ const parse = require('./parse')
+-const { re, t } = require('../internal/re')
++const { safeRe: re, t } = require('../internal/re')
+
+ const coerce = (version, options) => {
+   if (version instanceof SemVer) {
+diff --git a/internal/re.js b/internal/re.js
+index ed88398..f73ef1a 100644
+--- a/internal/re.js
++++ b/internal/re.js
+@@ -4,16 +4,27 @@ exports = module.exports = {}
+
+ // The actual regexps go on exports.re
+ const re = exports.re = []
++const safeRe = exports.safeRe = []
+ const src = exports.src = []
+ const t = exports.t = {}
+ let R = 0
+
+ const createToken = (name, value, isGlobal) => {
++  // Replace all greedy whitespace to prevent regex dos issues. These regex are
++  // used internally via the safeRe object since all inputs in this library get
++  // normalized first to trim and collapse all extra whitespace. The original
++  // regexes are exported for userland consumption and lower level usage. A
++  // future breaking change could export the safer regex only with a note that
++  // all input should have extra whitespace removed.
++  const safe = value
++    .split('\\s*').join('\\s{0,1}')
++    .split('\\s+').join('\\s')
+   const index = R++
+   debug(name, index, value)
+   t[name] = index
+   src[index] = value
+   re[index] = new RegExp(value, isGlobal ? 'g' : undefined)
++  safeRe[index] = new RegExp(safe, isGlobal ? 'g' : undefined)
+ }
+
+ // The following Regular Expressions can be used for tokenizing,
+diff --git a/package.json b/package.json
+index 204e008..7207703 100644
+--- a/package.json
++++ b/package.json
+@@ -37,7 +37,7 @@
+     "range.bnf"
+   ],
+   "tap": {
+-    "check-coverage": true,
++    "timeout": 30,
+     "coverage-map": "map.js",
+     "nyc-arg": [
+       "--exclude",
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
index 402cf5671..359ccab54 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
            file://run-ptest \
+           file://CVE-2022-25883.patch;patchdir=deps/npm/node_modules/semver \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.40.0



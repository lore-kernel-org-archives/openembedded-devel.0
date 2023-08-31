Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C9CC83F10
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 04:58:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10161.1693457896385303225
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 21:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oS7Ci+27;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76075773b5=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37V4nkg0022732
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 21:58:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=bQ7HL
	RSvVsrZ2z1H4BTfaJYfeCdkf+JrydCcLYQxqSQ=; b=oS7Ci+27jBU8/oKbc5+iD
	GIMXibxxJXujx6STSPACzmK8b9u+lzfiMmCp6fBThq1RaH7CGNsYYvnTG0GePqGx
	onDlc37+6vDOvXdXZpX3ThwoG2dgIJ8LOT5hsd+Z2mQ4i6yt/WX03rCcngMrS0yR
	gjE5FFB3Xv6AUFLog/ILCgUkdMKw2uebpFjv+Un0bA1MZTxYchJIZJOVY8Ij7b5h
	hHYzmhWSIF2T7sOBZgrcY6xfhsHZ+/qHQzIr6omDVPYGgp5wLB98aJNP9DDeMmAf
	Vo6x4cIu+8I65bLu+MKUkvugJStsEGB+5wzBSkwxu8ZwlUFLi3SkcewWttzgw1rr
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqcp1cbv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 21:58:15 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 21:58:10 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] nodejs: fix CVE-2022-25883
Date: Thu, 31 Aug 2023 04:57:43 +0000
Message-ID: <20230831045743.505289-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: pFLu5_IDQIEVgt9jScyJ7K-ZKaI4MX_l
X-Proofpoint-GUID: pFLu5_IDQIEVgt9jScyJ7K-ZKaI4MX_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_02,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308310045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 04:58:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104680

Versions of the package semver before 7.5.2 are vulnerable to Regular Expression
Denial of Service (ReDoS) via the function new Range, when untrusted user data is
provided as a range.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-25883

Upstream patches:
https://github.com/npm/node-semver/commit/717534ee353682f3bcf33e60a8af4292626d4441

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/CVE-2022-25883.patch        | 262 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.20.2.bb |   1 +
 2 files changed, 263 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch
new file mode 100644
index 000000000..4c73b556f
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch
@@ -0,0 +1,262 @@
+From 717534ee353682f3bcf33e60a8af4292626d4441 Mon Sep 17 00:00:00 2001
+From: Luke Karrys <luke@lukekarrys.com>
+Date: Thu, 15 Jun 2023 12:21:14 -0700
+Subject: [PATCH] fix: better handling of whitespace (#564)
+
+CVE: CVE-2022-25883
+
+Upstream-Status: Backport [https://github.com/npm/node-semver/commit/717534ee353682f3bcf33e60a8af4292626d4441]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ .../node_modules/semver/classes/comparator.js |  3 +-
+ deps/npm/node_modules/semver/classes/range.js | 64 +++++++++++--------
+ .../npm/node_modules/semver/classes/semver.js |  2 +-
+ .../node_modules/semver/functions/coerce.js   |  2 +-
+ deps/npm/node_modules/semver/internal/re.js   | 11 ++++
+ deps/npm/node_modules/semver/package.json     |  2 +-
+ 6 files changed, 53 insertions(+), 31 deletions(-)
+
+diff --git a/deps/npm/node_modules/semver/classes/comparator.js b/deps/npm/node_modules/semver/classes/comparator.js
+index 62cd204..c909446 100644
+--- a/deps/npm/node_modules/semver/classes/comparator.js
++++ b/deps/npm/node_modules/semver/classes/comparator.js
+@@ -16,6 +16,7 @@ class Comparator {
+       }
+     }
+
++    comp = comp.trim().split(/\s+/).join(' ')
+     debug('comparator', comp, options)
+     this.options = options
+     this.loose = !!options.loose
+@@ -129,7 +130,7 @@ class Comparator {
+ module.exports = Comparator
+
+ const parseOptions = require('../internal/parse-options')
+-const { re, t } = require('../internal/re')
++const { safeRe: re, t } = require('../internal/re')
+ const cmp = require('../functions/cmp')
+ const debug = require('../internal/debug')
+ const SemVer = require('./semver')
+diff --git a/deps/npm/node_modules/semver/classes/range.js b/deps/npm/node_modules/semver/classes/range.js
+index 7dc24bc..8e2e1f9 100644
+--- a/deps/npm/node_modules/semver/classes/range.js
++++ b/deps/npm/node_modules/semver/classes/range.js
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
+     const memoOpts = Object.keys(this.options).join(',')
+@@ -103,9 +106,6 @@ class Range {
+     // `^ 1.2.3` => `^1.2.3`
+     range = range.replace(re[t.CARETTRIM], caretTrimReplace)
+
+-    // normalize spaces
+-    range = range.split(/\s+/).join(' ')
+-
+     // At this point, the range is completely trimmed and
+     // ready to be split into comparators.
+
+@@ -200,7 +200,7 @@ const Comparator = require('./comparator')
+ const debug = require('../internal/debug')
+ const SemVer = require('./semver')
+ const {
+-  re,
++  safeRe: re,
+   t,
+   comparatorTrimReplace,
+   tildeTrimReplace,
+@@ -252,10 +252,13 @@ const isX = id => !id || id.toLowerCase() === 'x' || id === '*'
+ // ~1.2, ~1.2.x, ~>1.2, ~>1.2.x --> >=1.2.0 <1.3.0-0
+ // ~1.2.3, ~>1.2.3 --> >=1.2.3 <1.3.0-0
+ // ~1.2.0, ~>1.2.0 --> >=1.2.0 <1.3.0-0
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
+@@ -291,10 +294,13 @@ const replaceTilde = (comp, options) => {
+ // ^1.2, ^1.2.x --> >=1.2.0 <2.0.0-0
+ // ^1.2.3 --> >=1.2.3 <2.0.0-0
+ // ^1.2.0 --> >=1.2.0 <2.0.0-0
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
+@@ -351,9 +357,10 @@ const replaceCaret = (comp, options) => {
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
+@@ -436,12 +443,15 @@ const replaceXRange = (comp, options) => {
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
+@@ -479,7 +489,7 @@ const hyphenReplace = incPr => ($0,
+     to = `<=${to}`
+   }
+
+-  return (`${from} ${to}`).trim()
++  return `${from} ${to}`.trim()
+ }
+
+ const testSet = (set, version, options) => {
+diff --git a/deps/npm/node_modules/semver/classes/semver.js b/deps/npm/node_modules/semver/classes/semver.js
+index af62955..ad4e877 100644
+--- a/deps/npm/node_modules/semver/classes/semver.js
++++ b/deps/npm/node_modules/semver/classes/semver.js
+@@ -1,6 +1,6 @@
+ const debug = require('../internal/debug')
+ const { MAX_LENGTH, MAX_SAFE_INTEGER } = require('../internal/constants')
+-const { re, t } = require('../internal/re')
++const { safeRe: re, t } = require('../internal/re')
+
+ const parseOptions = require('../internal/parse-options')
+ const { compareIdentifiers } = require('../internal/identifiers')
+diff --git a/deps/npm/node_modules/semver/functions/coerce.js b/deps/npm/node_modules/semver/functions/coerce.js
+index 2e01452..febbff9 100644
+--- a/deps/npm/node_modules/semver/functions/coerce.js
++++ b/deps/npm/node_modules/semver/functions/coerce.js
+@@ -1,6 +1,6 @@
+ const SemVer = require('../classes/semver')
+ const parse = require('./parse')
+-const { re, t } = require('../internal/re')
++const { safeRe: re, t } = require('../internal/re')
+
+ const coerce = (version, options) => {
+   if (version instanceof SemVer) {
+diff --git a/deps/npm/node_modules/semver/internal/re.js b/deps/npm/node_modules/semver/internal/re.js
+index ed88398..f73ef1a 100644
+--- a/deps/npm/node_modules/semver/internal/re.js
++++ b/deps/npm/node_modules/semver/internal/re.js
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
+diff --git a/deps/npm/node_modules/semver/package.json b/deps/npm/node_modules/semver/package.json
+index 7898f59..d8ae619 100644
+--- a/deps/npm/node_modules/semver/package.json
++++ b/deps/npm/node_modules/semver/package.json
+@@ -40,7 +40,7 @@
+     "range.bnf"
+   ],
+   "tap": {
+-    "check-coverage": true,
++    "timeout": 30,
+     "coverage-map": "map.js"
+   },
+   "engines": {
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index 4761bfb14..16593a0fe 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
            file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch \
+           file://CVE-2022-25883.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.40.0



Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326A6C83F01
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 12:52:06 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.16136.1693486318135770772
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Aug 2023 05:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Q04+W7y2;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-590685a3be5so9122397b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693486317; x=1694091117; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TF3DHbdLlwkAmRHD5GxRin6hUG1IJ4sbjqxZ+l4YGGU=;
        b=Q04+W7y2KdDQKEQj5AzfcIWBrBOwyyUeDlWxTdVcVBxsTpSG/tzPLblBkC1VEYQ/Vz
         13/0CNEPD8quHgfnMEl9X+t/cRTGIP99XHp9dQLHw1dCUKWBXu1O60niaz0jLq67VX1E
         VYuXrdDJSvZN6S/lr0g9a50nRxguTak3GyD7m/atKZXWaqvRyeAuv/HkunLzJ8gnfUg5
         9S6XO/xdIaUqb4TMXbpCxQbuTwNaf7b11/XlV0/kt2o3NW9uTR6ewegpDaZKQiGcqgTE
         uj7TnYtpXwahVZ8d5ihRJRCBuL4HdapmwfdF+0yBgm78ksrR1pYwxhK9Z1j6aA/LFZ0W
         n6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693486317; x=1694091117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TF3DHbdLlwkAmRHD5GxRin6hUG1IJ4sbjqxZ+l4YGGU=;
        b=DyOdVJ4rIL01fqMBw6rT+SQ651CE4H8hZ64I+/DkND3tYu4AtG3Z3NRvFUdMd46TaT
         qpTzGsxXEzYCyrGbztgBaNWoAhUIt6xaHr+oi+DFUwTAmBXg+1V/Ja8tONmjpsg9mJsg
         qzP8YvpTxDiHVMg3rjY3Uy29Ko8J3qdHTU472xL0kKA3kIg2kHDnXPuntzjrAFPpmTE1
         wicsdcLRL7tXBoeOB1KqvJdW3c7OuIFTuXpxqunguFEFyZOWD70q5lAYdAoGiWgs51bn
         lV6T+Hhpd7b9dj6nRJnJDq0UgPkcZ6X0Rqzgv5vVEx8S+O6XvGi6MZWJLV227azm/Zqx
         33/A==
X-Gm-Message-State: AOJu0YzIJa3zB39H4ikYv//7wW5N0juauTeBP8Mat4wX9IUQf99TzIta
	leRH2tQyS+CVXu2X7vxV/7Q1yWTHcLw=
X-Google-Smtp-Source: AGHT+IGSTcL6WUSJcUenoVFvgrc1wUvZfQa9l9bpA2s/V4wzrdbciEDidiGyzYJZT8aRm5kxJO0MIA==
X-Received: by 2002:a0d:df05:0:b0:592:9a15:cdf3 with SMTP id i5-20020a0ddf05000000b005929a15cdf3mr5505449ywe.20.1693486317209;
        Thu, 31 Aug 2023 05:51:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:1be8:12b8:a9f1:944c? ([2600:1700:9190:ba10:1be8:12b8:a9f1:944c])
        by smtp.gmail.com with ESMTPSA id b3-20020a0dc003000000b0054f9e7fed7asm384913ywd.137.2023.08.31.05.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 05:51:56 -0700 (PDT)
Message-ID: <442ab424-1899-0369-02bc-c5a5727697ce@gmail.com>
Date: Thu, 31 Aug 2023 08:51:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe][meta-oe][mickledore][PATCH 2/2] nodejs: fix CVE-2022-25883
Content-Language: en-US
To: archana.polampalli@windriver.com,
 openembedded-devel@lists.openembedded.org
Cc: Hari.GPillai@windriver.com
References: <20230829113513.276561-1-archana.polampalli@windriver.com>
 <20230829113513.276561-2-archana.polampalli@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230829113513.276561-2-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 12:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104683



On 8/29/23 7:35 AM, Polampalli, Archana via lists.openembedded.org wrote:
> Versions of the package semver before 7.5.2 are vulnerable to Regular Expression
> Denial of Service (ReDoS) via the function new Range, when untrusted user data is
> provided as a range.

Doesn't this apply to master too as it is @ version 18.17.1?

- Armin
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-25883
>
> Upstream patches:
> https://github.com/npm/node-semver/commit/717534ee353682f3bcf33e60a8af4292626d4441
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>   .../nodejs/nodejs/CVE-2022-25883.patch        | 260 ++++++++++++++++++
>   .../recipes-devtools/nodejs/nodejs_18.17.1.bb |   1 +
>   2 files changed, 261 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch
> new file mode 100644
> index 000000000..1c9daf714
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-25883.patch
> @@ -0,0 +1,260 @@
> +From 717534ee353682f3bcf33e60a8af4292626d4441 Mon Sep 17 00:00:00 2001
> +From: Luke Karrys <luke@lukekarrys.com>
> +Date: Thu, 15 Jun 2023 12:21:14 -0700
> +Subject: [PATCH] fix: better handling of whitespace (#564)
> +
> +CVE: CVE-2022-25883
> +
> +Upstream-Status: Backport [https://github.com/npm/node-semver/commit/717534ee353682f3bcf33e60a8af4292626d4441]
> +---
> + classes/comparator.js          |  3 +-
> + classes/range.js               | 64 ++++++++++++++++------------
> + classes/semver.js              |  2 +-
> + functions/coerce.js            |  2 +-
> + internal/re.js                 | 11 +++++
> + package.json                   |  2 +-
> + 6 files changed, 53 insertions(+), 31 deletions(-)
> +
> +diff --git a/classes/comparator.js b/classes/comparator.js
> +index 2146c88..3d39c0e 100644
> +--- a/classes/comparator.js
> ++++ b/classes/comparator.js
> +@@ -16,6 +16,7 @@ class Comparator {
> +       }
> +     }
> +
> ++    comp = comp.trim().split(/\s+/).join(' ')
> +     debug('comparator', comp, options)
> +     this.options = options
> +     this.loose = !!options.loose
> +@@ -133,7 +134,7 @@ class Comparator {
> + module.exports = Comparator
> +
> + const parseOptions = require('../internal/parse-options')
> +-const { re, t } = require('../internal/re')
> ++const { safeRe: re, t } = require('../internal/re')
> + const cmp = require('../functions/cmp')
> + const debug = require('../internal/debug')
> + const SemVer = require('./semver')
> +diff --git a/classes/range.js b/classes/range.js
> +index d9e866d..53c2540 100644
> +--- a/classes/range.js
> ++++ b/classes/range.js
> +@@ -26,19 +26,26 @@ class Range {
> +     this.loose = !!options.loose
> +     this.includePrerelease = !!options.includePrerelease
> +
> +-    // First, split based on boolean or ||
> ++    // First reduce all whitespace as much as possible so we do not have to rely
> ++    // on potentially slow regexes like \s*. This is then stored and used for
> ++    // future error messages as well.
> +     this.raw = range
> +-    this.set = range
> ++      .trim()
> ++      .split(/\s+/)
> ++      .join(' ')
> ++
> ++    // First, split on ||
> ++    this.set = this.raw
> +       .split('||')
> +       // map the range to a 2d array of comparators
> +-      .map(r => this.parseRange(r.trim()))
> ++      .map(r => this.parseRange(r))
> +       // throw out any comparator lists that are empty
> +       // this generally means that it was not a valid range, which is allowed
> +       // in loose mode, but will still throw if the WHOLE range is invalid.
> +       .filter(c => c.length)
> +
> +     if (!this.set.length) {
> +-      throw new TypeError(`Invalid SemVer Range: ${range}`)
> ++      throw new TypeError(`Invalid SemVer Range: ${this.raw}`)
> +     }
> +
> +     // if we have any that are not the null set, throw out null sets.
> +@@ -64,9 +71,7 @@ class Range {
> +
> +   format () {
> +     this.range = this.set
> +-      .map((comps) => {
> +-        return comps.join(' ').trim()
> +-      })
> ++      .map((comps) => comps.join(' ').trim())
> +       .join('||')
> +       .trim()
> +     return this.range
> +@@ -77,8 +82,6 @@ class Range {
> +   }
> +
> +   parseRange (range) {
> +-    range = range.trim()
> +-
> +     // memoize range parsing for performance.
> +     // this is a very hot path, and fully deterministic.
> +     const memoOpts =
> +@@ -105,9 +108,6 @@ class Range {
> +     // `^ 1.2.3` => `^1.2.3`
> +     range = range.replace(re[t.CARETTRIM], caretTrimReplace)
> +
> +-    // normalize spaces
> +-    range = range.split(/\s+/).join(' ')
> +-
> +     // At this point, the range is completely trimmed and
> +     // ready to be split into comparators.
> +
> +@@ -203,7 +203,7 @@ const Comparator = require('./comparator')
> + const debug = require('../internal/debug')
> + const SemVer = require('./semver')
> + const {
> +-  re,
> ++  safeRe: re,
> +   t,
> +   comparatorTrimReplace,
> +   tildeTrimReplace,
> +@@ -257,10 +257,13 @@ const isX = id => !id || id.toLowerCase() === 'x' || id === '*'
> + // ~1.2.3, ~>1.2.3 --> >=1.2.3 <1.3.0-0
> + // ~1.2.0, ~>1.2.0 --> >=1.2.0 <1.3.0-0
> + // ~0.0.1 --> >=0.0.1 <0.1.0-0
> +-const replaceTildes = (comp, options) =>
> +-  comp.trim().split(/\s+/).map((c) => {
> +-    return replaceTilde(c, options)
> +-  }).join(' ')
> ++const replaceTildes = (comp, options) => {
> ++  return comp
> ++    .trim()
> ++    .split(/\s+/)
> ++    .map((c) => replaceTilde(c, options))
> ++    .join(' ')
> ++}
> +
> + const replaceTilde = (comp, options) => {
> +   const r = options.loose ? re[t.TILDELOOSE] : re[t.TILDE]
> +@@ -298,10 +301,13 @@ const replaceTilde = (comp, options) => {
> + // ^1.2.0 --> >=1.2.0 <2.0.0-0
> + // ^0.0.1 --> >=0.0.1 <0.0.2-0
> + // ^0.1.0 --> >=0.1.0 <0.2.0-0
> +-const replaceCarets = (comp, options) =>
> +-  comp.trim().split(/\s+/).map((c) => {
> +-    return replaceCaret(c, options)
> +-  }).join(' ')
> ++const replaceCarets = (comp, options) => {
> ++  return comp
> ++    .trim()
> ++    .split(/\s+/)
> ++    .map((c) => replaceCaret(c, options))
> ++    .join(' ')
> ++}
> +
> + const replaceCaret = (comp, options) => {
> +   debug('caret', comp, options)
> +@@ -358,9 +364,10 @@ const replaceCaret = (comp, options) => {
> +
> + const replaceXRanges = (comp, options) => {
> +   debug('replaceXRanges', comp, options)
> +-  return comp.split(/\s+/).map((c) => {
> +-    return replaceXRange(c, options)
> +-  }).join(' ')
> ++  return comp
> ++    .split(/\s+/)
> ++    .map((c) => replaceXRange(c, options))
> ++    .join(' ')
> + }
> +
> + const replaceXRange = (comp, options) => {
> +@@ -443,12 +450,15 @@ const replaceXRange = (comp, options) => {
> + const replaceStars = (comp, options) => {
> +   debug('replaceStars', comp, options)
> +   // Looseness is ignored here.  star is always as loose as it gets!
> +-  return comp.trim().replace(re[t.STAR], '')
> ++  return comp
> ++    .trim()
> ++    .replace(re[t.STAR], '')
> + }
> +
> + const replaceGTE0 = (comp, options) => {
> +   debug('replaceGTE0', comp, options)
> +-  return comp.trim()
> ++  return comp
> ++    .trim()
> +     .replace(re[options.includePrerelease ? t.GTE0PRE : t.GTE0], '')
> + }
> +
> +@@ -486,7 +496,7 @@ const hyphenReplace = incPr => ($0,
> +     to = `<=${to}`
> +   }
> +
> +-  return (`${from} ${to}`).trim()
> ++  return `${from} ${to}`.trim()
> + }
> +
> + const testSet = (set, version, options) => {
> +diff --git a/classes/semver.js b/classes/semver.js
> +index 99dbe82..e1208fe 100644
> +--- a/classes/semver.js
> ++++ b/classes/semver.js
> +@@ -1,6 +1,6 @@
> + const debug = require('../internal/debug')
> + const { MAX_LENGTH, MAX_SAFE_INTEGER } = require('../internal/constants')
> +-const { re, t } = require('../internal/re')
> ++const { safeRe: re, t } = require('../internal/re')
> +
> + const parseOptions = require('../internal/parse-options')
> + const { compareIdentifiers } = require('../internal/identifiers')
> +diff --git a/functions/coerce.js b/functions/coerce.js
> +index 2e01452..febbff9 100644
> +--- a/functions/coerce.js
> ++++ b/functions/coerce.js
> +@@ -1,6 +1,6 @@
> + const SemVer = require('../classes/semver')
> + const parse = require('./parse')
> +-const { re, t } = require('../internal/re')
> ++const { safeRe: re, t } = require('../internal/re')
> +
> + const coerce = (version, options) => {
> +   if (version instanceof SemVer) {
> +diff --git a/internal/re.js b/internal/re.js
> +index ed88398..f73ef1a 100644
> +--- a/internal/re.js
> ++++ b/internal/re.js
> +@@ -4,16 +4,27 @@ exports = module.exports = {}
> +
> + // The actual regexps go on exports.re
> + const re = exports.re = []
> ++const safeRe = exports.safeRe = []
> + const src = exports.src = []
> + const t = exports.t = {}
> + let R = 0
> +
> + const createToken = (name, value, isGlobal) => {
> ++  // Replace all greedy whitespace to prevent regex dos issues. These regex are
> ++  // used internally via the safeRe object since all inputs in this library get
> ++  // normalized first to trim and collapse all extra whitespace. The original
> ++  // regexes are exported for userland consumption and lower level usage. A
> ++  // future breaking change could export the safer regex only with a note that
> ++  // all input should have extra whitespace removed.
> ++  const safe = value
> ++    .split('\\s*').join('\\s{0,1}')
> ++    .split('\\s+').join('\\s')
> +   const index = R++
> +   debug(name, index, value)
> +   t[name] = index
> +   src[index] = value
> +   re[index] = new RegExp(value, isGlobal ? 'g' : undefined)
> ++  safeRe[index] = new RegExp(safe, isGlobal ? 'g' : undefined)
> + }
> +
> + // The following Regular Expressions can be used for tokenizing,
> +diff --git a/package.json b/package.json
> +index 204e008..7207703 100644
> +--- a/package.json
> ++++ b/package.json
> +@@ -37,7 +37,7 @@
> +     "range.bnf"
> +   ],
> +   "tap": {
> +-    "check-coverage": true,
> ++    "timeout": 30,
> +     "coverage-map": "map.js",
> +     "nyc-arg": [
> +       "--exclude",
> +--
> +2.40.0
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
> index 402cf5671..359ccab54 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
> @@ -28,6 +28,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>              file://0001-liftoff-Correct-function-signatures.patch \
>              file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
>              file://run-ptest \
> +           file://CVE-2022-25883.patch;patchdir=deps/npm/node_modules/semver \
>              "
>   
>   SRC_URI:append:class-target = " \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104640): https://lists.openembedded.org/g/openembedded-devel/message/104640
> Mute This Topic: https://lists.openembedded.org/mt/101029114/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



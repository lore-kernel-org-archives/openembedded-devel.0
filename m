Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6076.1794517675286258612
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 13:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Se3msm0q;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so241158c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 13:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794517675; x=1795122475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpPCHwlZuJE0J45EkCoewAp2D1ovKyFJH5te6IDyBpk=;
        b=Se3msm0qWrS4zyOVzVXRCXP5YvusRfoKFVYRDGhz3fbfc+UnwdBRN9tib7xe/d3gbk
         n9iCvtnX556qjR3JM6WBcI4QyL7i8CQ7gitSCyvYvJLN+8p3ARGyH8im4rZmd500dSDd
         zMX6FOOoZ9swAArC1pu19KlaWKqMx/53tiTYAlnWt4SaDdFBZxjrCcb5K8Z/U9vfdkdi
         CfFyDif54hvjebei2ti+yCT2KZY+z45mb7ygcpX9N3tG1+AzR4G7uLj6OqxMfHUKnnVs
         2Ma9hugBj2O2y5wxg3lxMwHlIQFlMikiXQE4UiL2grsDWw4olotebV9bwT126y0BG4Gi
         /jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794517675; x=1795122475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UpPCHwlZuJE0J45EkCoewAp2D1ovKyFJH5te6IDyBpk=;
        b=f4EcvQoR7EppPW1MOU9za06trZuNRQ2yvypMtFnm9V8J992np+FiAg0N2pf7mihjkO
         S9QamC1YJmKPirnV1eRxVa77hLj+MGj9HYu4FTstZ7E0RC0613L+a4SQ+g/LPmjF/6yK
         2ygOWYXtUUU90qjKXl2qc0b2j2ZGKtcxw8SggBVn0ERFkF4ESKkArMXNs6e9Zf8dZv63
         OPhDGSfCTGNiOjuuRfuYHScX0aD9TFe0pKfM6o6JlODCN81Zld6iWtSysqVqYqB4zYee
         Oxz61oJUmMKOj4tsr3ihB7bdh05VkHIgH2vWWtHyjPOyq6vLQhehZ+gNgCJEQaRUvBmG
         krIg==
X-Gm-Message-State: APuU4Z8448JtOFzwGbwgSeR42lJujE4F4ajdu0qaZoL2Arf4oGVgpTfo
	XppAQh6KvUGNfC2/x2PhdELoqxkwFmLvN/jG9Gy4iUCy9W3W8sDC2J6zR7V3q7F+oug=
X-Gm-Gg: AYBFou0ljQQwa9ayRQAz0xggEC2PDrsl55EFUf/Crgr6xttO5NiXh8i+HfOxBQ7c5h0
	pLqKtzq3FgI12xM0TDNZ4KLBy93ZUFN5phbJnsyaCZzotnofP4RF6/vbLZ4KpCrIt8CzWtRdORm
	NzJ6Fbu6Qasq+bLsUQvF5/ggF7GEDGkDXwUSad46q4OoSqJEpEJexoGSrFyaqXZcWEn+qRK5hlz
	NNjPVSzzoezv4RPGlVgj7lGPZP8aDSjs4Gxi8xHxWSuD307RddZWRc+fuefcyFUd+uiHNRVprQz
	JodubyOnlakKUJ8Y3PYwOrxhM6ZXQE5y/xqWEsbcOxM2vjRQx9xXDZ0c7NTkAVsvtDQzbmLv2uG
	YFPAH2G7Kz3MsPDG1ru1HBdQ9zW3eKAE4nuuSSTfNGLjI/nV+JSE8H9U5dVlzGC+5nNFEVK6Qlf
	kWKYTSgX+fk6oHthCssEqTpkTFmbzBL7YOeydv13DyyYk+mm/rOV4QEYR/PQ8lwObe6gCfiI6v3
	rNJrQBwe4EuqIfGR3H4hu15Jl+HeWQO/rBr3CwVJPPdIZB/IXNqR8Qt7iPV0cQX7LG5vQS+D2cd
	MXetbxEteTd7Xge77+4CXb+S0Sjg3XV+W/Ee17H71JO8GdmRsqD1AKdKVNbVVRAcDuhksA4P5FB
	jwKGNkrUnnEHUAxb7O4AEGuy+X8pSw0etF9GmWt61nCso788/FtJdqcQIaXpgxEnCllCTnrgpWE
	eg/DONHcQ40ysO0VOEpyDThIpmVESS0DYfPUAKE+Wf83Xamt9WpHgJGuphKHZz49PKgGZ5KiFXF
	MEvlA7SFaDZmKKleb9J1eOky67opAhLhY06WU/OEP5Pxr6oX2gmq+HdQjKks6B9rnoIGd7RUkZb
	nQ66
X-Received: by 2002:a05:701b:4282:20b0:143:5266:48ee with SMTP id a92af1059eb24-1b503191fe6mr688304c88.42.1794517674470;
        Thu, 12 Nov 2026 13:07:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm1800274c88.5.2026.11.12.13.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:07:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/3] hunspell-dictionaries: Fix LICENSE for SPDX
Date: Thu, 12 Nov 2026 13:07:48 -0800
Message-ID: <20261112210749.875657-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112210749.875657-1-khem.raj@oss.qualcomm.com>
References: <20261112210749.875657-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 21:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132215
Content-Type: text/plain; charset="utf-8"

The per-dictionary licenses were set as LICENSE:dictionaries/<lang>
overrides, which never apply since they are not package names, so the
recipe, which installs every dictionary into a single package, was
reported as MIT only. Several of those values were also deprecated SPDX
ids (GPL-2.0, LGPL-2.1, ...) or license refs without a license text
(LicenseRef-BSD, LicenseRef-Other).

Record each dictionary's license in HUNSPELL_DICT_LICENSE, taken from the
"license" field of its upstream package.json with deprecated ids mapped
to their -only equivalents, and set LICENSE to the conjunction of all of
them. Exceptions:

- en-*: "BSD" is not an SPDX id; these use the SCOWL license text, added
  as LicenseRef-SCOWL.
- ru: a BSD-style license with an extra clause, added as
  LicenseRef-hunspell-ru.
- vi: package.json says GPL-2.0, but the license file says GPLv3.
- is: the license file also covers the CC-BY-4.0 hyphenation rules.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../hunspell/hunspell-dictionaries.bb         | 132 +++++++++---------
 1 file changed, 68 insertions(+), 64 deletions(-)

diff --git a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
index 9960e11357..0a055c4027 100644
--- a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
@@ -2,70 +2,74 @@ SUMMARY = "Hunspell dictionaries used by Maliit"
 
 #Provided by Titus Wormer (wooorm) https://github.com/wooorm/dictionaries
 
-LICENSE = "MIT"
-LICENSE:dictionaries/bg = "LGPL-2.1"
-LICENSE:dictionaries/br = "GPL-3.0"
-LICENSE:dictionaries/ca-valencia = "GPL-2.0 AND LGPL-2.1-only"
-LICENSE:dictionaries/ca = "GPL-2.0 AND LGPL-2.1-only"
-LICENSE:dictionaries/cs = "GPL-2.0-only"
-LICENSE:dictionaries/da = "GPL-2.0-only"
-LICENSE:dictionaries/de-AT = "GPL-3.0-only"
-LICENSE:dictionaries/de-CH = "GPL-3.0-only"
-LICENSE:dictionaries/de = "GPL-3.0-only"
-LICENSE:dictionaries/el-polyton = "GPL-2.0-only"
-LICENSE:dictionaries/el = "GPL-2.0-only"
-LICENSE:dictionaries/en-AU = "LGPL-2.0-only"
-LICENSE:dictionaries/en-CA = "MIT AND LicenseRef-BSD"
-LICENSE:dictionaries/en-GB = "LGPL-2.0-only"
-LICENSE:dictionaries/en-US = "MIT AND LicenseRef-BSD"
-LICENSE:dictionaries/en-ZA = "LGPL-2.1"
-LICENSE:dictionaries/eo = "GPL-2.0-only"
-LICENSE:dictionaries/es = "GPL-3.0-only"
-LICENSE:dictionaries/et = "LGPL-2.1-only"
-LICENSE:dictionaries/eu = "GPL-2.0-only"
-LICENSE:dictionaries/fo = "GPL-2.0-only"
-LICENSE:dictionaries/fr = "MPL-2.0"
-LICENSE:dictionaries/fur = "GPL-2.0-only"
-LICENSE:dictionaries/fy = "GPL-3.0-only"
-LICENSE:dictionaries/ga = "GPL-2.0-only"
-LICENSE:dictionaries/gd = "GPL-3.0-only"
-LICENSE:dictionaries/gl = "GPL-3.0-only"
-LICENSE:dictionaries/he = "AGPL-3.0-only"
-LICENSE:dictionaries/hr = "GPL-3.0-only"
-LICENSE:dictionaries/hu = "GPL-2.0-only"
-LICENSE:dictionaries/hy-arevela = "GPL-2.0-only"
-LICENSE:dictionaries/hy-arevmda = "GPL-2.0-only"
-LICENSE:dictionaries/ia = "GPL-3.0-only"
-LICENSE:dictionaries/ie = "Apache-2.0"
-LICENSE:dictionaries/is = "CC-BY-SA-3.0 AND CC-BY-4.0"
-LICENSE:dictionaries/it = "GPL-3.0-only"
-LICENSE:dictionaries/ko = "GPL-2.0-only AND LGPL-2.1-only AND MPL-1.1"
-LICENSE:dictionaries/la = "GPL-3.0-only"
-LICENSE:dictionaries/lb = "EUPL-1.1"
-LICENSE:dictionaries/lt = "LicenseRef-Other"
-LICENSE:dictionaries/ltg = "LGPL-2.1-only"
-LICENSE:dictionaries/lv = "LGPL-2.1-only"
-LICENSE:dictionaries/mk = "GPL-3.0-only"
-LICENSE:dictionaries/mn = "GPL-2.0-only"
-LICENSE:dictionaries/nb = "GPL-2.0-only"
-LICENSE:dictionaries/nds = "GPL-2.0-only"
-LICENSE:dictionaries/ne = "LGPL-2.1-only"
-LICENSE:dictionaries/nl = "LicenseRef-BSD"
-LICENSE:dictionaries/nn = "GPL-2.0-only"
-LICENSE:dictionaries/pl = "GPL-3.0-only"
-LICENSE:dictionaries/pt-BR = "LGPL-2.1"
-LICENSE:dictionaries/pt = "GPL-2.0-only"
-LICENSE:dictionaries/ro = "GPL-2.0-only"
-LICENSE:dictionaries/ru = "LicenseRef-BSD"
-LICENSE:dictionaries/rw = "GPL-3.0-only"
-LICENSE:dictionaries/sk = "GPL-2.0-only"
-LICENSE:dictionaries/sl = "GPL-2.0-only"
-LICENSE:dictionaries/sr-Latn = "LGPL-3.0"
-LICENSE:dictionaries/sr = "LGPL-3.0"
-LICENSE:dictionaries/sv = "LGPL-3.0"
-LICENSE:dictionaries/tr = "MIT"
-LICENSE:dictionaries/uk = "GPL-2.0"
-LICENSE:dictionaries/vi = "GPL-3.0"
+# The single package ships all dictionaries, so it carries all their licenses
+LICENSE = "${@' AND '.join(sorted(set(['(%s)' % l if ' ' in l else l for l in (d.getVarFlags('HUNSPELL_DICT_LICENSE') or dict()).values()])))}"
+HUNSPELL_DICT_LICENSE[bg] = "GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1"
+HUNSPELL_DICT_LICENSE[br] = "GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1"
+HUNSPELL_DICT_LICENSE[ca] = "GPL-2.0-only OR LGPL-2.1-only"
+HUNSPELL_DICT_LICENSE[ca-valencia] = "GPL-2.0-only OR LGPL-2.1-only"
+HUNSPELL_DICT_LICENSE[cs] = "GPL-2.0-only"
+HUNSPELL_DICT_LICENSE[da] = "GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1"
+HUNSPELL_DICT_LICENSE[de] = "GPL-2.0-only OR GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[de-AT] = "GPL-2.0-only OR GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[de-CH] = "GPL-2.0-only OR GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[el] = "GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1"
+HUNSPELL_DICT_LICENSE[el-polyton] = "GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[en-AU] = "MIT AND LicenseRef-SCOWL"
+HUNSPELL_DICT_LICENSE[en-CA] = "MIT AND LicenseRef-SCOWL"
+HUNSPELL_DICT_LICENSE[en-GB] = "MIT AND LicenseRef-SCOWL"
+HUNSPELL_DICT_LICENSE[en-US] = "MIT AND LicenseRef-SCOWL"
+HUNSPELL_DICT_LICENSE[en-ZA] = "LGPL-2.1-only"
+HUNSPELL_DICT_LICENSE[eo] = "GPL-2.0-only"
+HUNSPELL_DICT_LICENSE[es] = "GPL-3.0-only OR LGPL-3.0-only OR MPL-1.1"
+HUNSPELL_DICT_LICENSE[et] = "LGPL-2.1-only"
+HUNSPELL_DICT_LICENSE[eu] = "GPL-2.0-only"
+HUNSPELL_DICT_LICENSE[fo] = "GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1"
+HUNSPELL_DICT_LICENSE[fr] = "MPL-2.0"
+HUNSPELL_DICT_LICENSE[fur] = "GPL-2.0-only"
+HUNSPELL_DICT_LICENSE[fy] = "GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[ga] = "GPL-2.0-only"
+HUNSPELL_DICT_LICENSE[gd] = "GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[gl] = "GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[he] = "AGPL-3.0-only"
+HUNSPELL_DICT_LICENSE[hr] = "LGPL-2.1-only OR SISSL"
+HUNSPELL_DICT_LICENSE[hu] = "GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1"
+HUNSPELL_DICT_LICENSE[hy-arevela] = "GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1"
+HUNSPELL_DICT_LICENSE[hy-arevmda] = "GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1"
+HUNSPELL_DICT_LICENSE[ia] = "GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[ie] = "Apache-2.0"
+HUNSPELL_DICT_LICENSE[is] = "CC-BY-SA-3.0 AND CC-BY-4.0"
+HUNSPELL_DICT_LICENSE[it] = "GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[ko] = "GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1"
+HUNSPELL_DICT_LICENSE[la] = "GPL-2.0-only"
+HUNSPELL_DICT_LICENSE[lb] = "EUPL-1.1"
+HUNSPELL_DICT_LICENSE[lt] = "BSD-3-Clause"
+HUNSPELL_DICT_LICENSE[ltg] = "LGPL-2.1-only"
+HUNSPELL_DICT_LICENSE[lv] = "LGPL-2.1-only"
+HUNSPELL_DICT_LICENSE[mk] = "GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[mn] = "GPL-2.0-only"
+HUNSPELL_DICT_LICENSE[nb] = "GPL-2.0-only"
+HUNSPELL_DICT_LICENSE[nds] = "GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[ne] = "LGPL-2.1-only"
+HUNSPELL_DICT_LICENSE[nl] = "BSD-3-Clause OR CC-BY-3.0"
+HUNSPELL_DICT_LICENSE[nn] = "GPL-2.0-only"
+HUNSPELL_DICT_LICENSE[pl] = "GPL-3.0-only OR LGPL-3.0-only OR MPL-2.0"
+HUNSPELL_DICT_LICENSE[pt] = "GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1"
+HUNSPELL_DICT_LICENSE[pt-BR] = "LGPL-2.1-only"
+HUNSPELL_DICT_LICENSE[ro] = "GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1"
+HUNSPELL_DICT_LICENSE[ru] = "LicenseRef-hunspell-ru"
+HUNSPELL_DICT_LICENSE[rw] = "GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[sk] = "GPL-2.0-only"
+HUNSPELL_DICT_LICENSE[sl] = "GPL-3.0-only OR LGPL-2.1-only"
+HUNSPELL_DICT_LICENSE[sr] = "LGPL-3.0-only"
+HUNSPELL_DICT_LICENSE[sr-Latn] = "LGPL-3.0-only"
+HUNSPELL_DICT_LICENSE[sv] = "LGPL-3.0-only"
+HUNSPELL_DICT_LICENSE[tr] = "MIT"
+HUNSPELL_DICT_LICENSE[uk] = "GPL-3.0-only"
+HUNSPELL_DICT_LICENSE[vi] = "GPL-3.0-only"
+NO_GENERIC_LICENSE[SCOWL] = "dictionaries/en-US/license"
+NO_GENERIC_LICENSE[hunspell-ru] = "dictionaries/ru/license"
+
 LIC_FILES_CHKSUM = " \
     file://dictionaries/bg/license;md5=ab14e2ded1a43b84be9aba2be64b9814 \
     file://dictionaries/br/license;md5=2e046c64edc0a4e47fb3ea614e6c82c4 \

Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206D3C982F9
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:13 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47400.1789991769136100704
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=DfI0kI8J;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout01.t-online.de (Postfix) with SMTP id 309751C42D
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccA-04X1zE0; Mon, 21 Sep 2026 13:55:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 17/24] python3-rouge-score: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:53 +0200
Message-ID: <20260921115500.53770-17-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991718-6DFF8A93-BA26BDA4/0/0 CLEAN NORMAL
X-TOI-MSGID: 0600519d-8fa7-4b6d-9c85-582515886718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=L6Fy5KsFY55NlKQ7mKq056IQGAyravgWzIm7J2Q9sYE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DfI0kI8Jz2dkhpAAgvxWbVLzjmT4qLh0DxEDxU/VtNe44ip8KthxhIWEgFPgDnz87
	 MYt41BwVCHnWD9el4QT8d1irnf7+369+nnSKwmqNLCcd+8/n6VCc6r5MJG6Ebx0Vp2
	 gWVu7xxy3CzjRz2HDJJKsuvIWgcmTJAWMrt+culiTQZxsM9PrDvrB/AWfCAmYFmavi
	 3bWUIrghjM3/ybdb4jp7FmTxB5cH/thzGDAkVcA4AOcM81+H4FgFS0Gp7USj7u5nsJ
	 gzr9mg4LRF4EP10yfTaccP62wWF2OMLK/O3TFi3ngAywtJLBUrw+gJwn202VD2D1Mw
	 plETV6aG/1daA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130151

Patch rouge-score to use the builtins and itertools.zip_longest instead
of the six.moves aliases and the dict methods instead of six.iteritems
and six.iterkeys. The six.ensure_str call sites are all passed str
already.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-drop-the-six-dependency.patch        | 172 ++++++++++++++++++
 .../python3-rouge-score_0.1.2.bb              |   2 +-
 2 files changed, 173 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python3-rouge-score/pyth=
on3-rouge-score/0001-drop-the-six-dependency.patch

diff --git a/meta-python/recipes-devtools/python3-rouge-score/python3-rou=
ge-score/0001-drop-the-six-dependency.patch b/meta-python/recipes-devtool=
s/python3-rouge-score/python3-rouge-score/0001-drop-the-six-dependency.pa=
tch
new file mode 100644
index 0000000000..5a255e8afe
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-scor=
e/0001-drop-the-six-dependency.patch
@@ -0,0 +1,172 @@
+From a383dde2c5c37efb7c55e0a0a9a1a8c7fe56d543 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Sep 2026 13:24:12 +0200
+Subject: [PATCH] drop the six dependency
+
+six is a Python 2 compatibility shim and rouge-score does not need it on
+Python 3: map, range and zip are builtins, zip_longest comes from
+itertools, six.iteritems and six.iterkeys are the dict methods, and the
+six.ensure_str call sites are all passed str already.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ rouge_score/io.py           | 6 ++----
+ rouge_score/rouge_scorer.py | 9 +++------
+ rouge_score/scoring.py      | 6 ++----
+ rouge_score/scoring_test.py | 2 --
+ rouge_score/tokenize.py     | 5 ++---
+ setup.py                    | 1 -
+ 6 files changed, 9 insertions(+), 20 deletions(-)
+
+diff --git a/rouge_score/io.py b/rouge_score/io.py
+index ffd96ef..334b8bb 100644
+--- a/rouge_score/io.py
++++ b/rouge_score/io.py
+@@ -19,11 +19,9 @@ from __future__ import division
+ from __future__ import print_function
+=20
+ import glob
++from itertools import zip_longest
+=20
+ from absl import logging
+-import six
+-from six.moves import zip
+-from six.moves import zip_longest
+=20
+=20
+=20
+@@ -76,7 +74,7 @@ def _open(filepattern, mode=3D"r"):
+ def _record_gen(filename, delimiter):
+   """Opens file and yields records separated by delimiter."""
+   with _open(filename) as f:
+-    records =3D f.read().split(six.ensure_str(delimiter))
++    records =3D f.read().split(delimiter)
+   if records[-1]:
+     # Need a final delimiter at end of file to be able to detect an emp=
ty last
+     # record.
+diff --git a/rouge_score/rouge_scorer.py b/rouge_score/rouge_scorer.py
+index 4c076bf..64bf73a 100644
+--- a/rouge_score/rouge_scorer.py
++++ b/rouge_score/rouge_scorer.py
+@@ -39,9 +39,6 @@ import re
+ from absl import logging
+ import nltk
+ import numpy as np
+-import six
+-from six.moves import map
+-from six.moves import range
+ from rouge_score import scoring
+ from rouge_score import tokenizers
+=20
+@@ -140,7 +137,7 @@ class RougeScorer(scoring.BaseScorer):
+             sents =3D nltk.sent_tokenize(text)
+           else:
+             # Assume sentences are separated by newline.
+-            sents =3D six.ensure_str(text).split("\n")
++            sents =3D text.split("\n")
+           sents =3D [x for x in sents if len(x)]
+           return sents
+=20
+@@ -151,7 +148,7 @@ class RougeScorer(scoring.BaseScorer):
+=20
+         scores =3D _summary_level_lcs(target_tokens_list,
+                                     prediction_tokens_list)
+-      elif re.match(r"rouge[0-9]$", six.ensure_str(rouge_type)):
++      elif re.match(r"rouge[0-9]$", rouge_type):
+         # Rouge from n-grams.
+         n =3D int(rouge_type[5:])
+         if n <=3D 0:
+@@ -321,7 +318,7 @@ def _score_ngrams(target_ngrams, prediction_ngrams):
+   """
+=20
+   intersection_ngrams_count =3D 0
+-  for ngram in six.iterkeys(target_ngrams):
++  for ngram in target_ngrams:
+     intersection_ngrams_count +=3D min(target_ngrams[ngram],
+                                      prediction_ngrams[ngram])
+   target_ngrams_count =3D sum(target_ngrams.values())
+diff --git a/rouge_score/scoring.py b/rouge_score/scoring.py
+index d7d018c..d6f3e5b 100644
+--- a/rouge_score/scoring.py
++++ b/rouge_score/scoring.py
+@@ -27,8 +27,6 @@ import collections
+ from typing import Dict
+=20
+ import numpy as np
+-import six
+-from six.moves import range
+=20
+=20
+ class Score(
+@@ -106,7 +104,7 @@ class BootstrapAggregator(object):
+         representing a score.
+     """
+=20
+-    for score_type, score in six.iteritems(scores):
++    for score_type, score in scores.items():
+       self._scores[score_type].append(score)
+=20
+   def aggregate(self):
+@@ -117,7 +115,7 @@ class BootstrapAggregator(object):
+     """
+=20
+     result =3D {}
+-    for score_type, scores in six.iteritems(self._scores):
++    for score_type, scores in self._scores.items():
+       # Stack scores into a 2-d matrix of (sample, measure).
+       score_matrix =3D np.vstack(tuple(scores))
+       # Percentiles are returned as (interval, measure).
+diff --git a/rouge_score/scoring_test.py b/rouge_score/scoring_test.py
+index 4cb8083..4e6cb9e 100644
+--- a/rouge_score/scoring_test.py
++++ b/rouge_score/scoring_test.py
+@@ -26,8 +26,6 @@ import os
+=20
+ from absl.testing import absltest
+ import numpy as np
+-from six.moves import range
+-from six.moves import zip
+ from rouge_score import rouge_scorer
+ from rouge_score import scoring
+ from rouge_score import test_util
+diff --git a/rouge_score/tokenize.py b/rouge_score/tokenize.py
+index d22abae..61ca0d3 100644
+--- a/rouge_score/tokenize.py
++++ b/rouge_score/tokenize.py
+@@ -19,7 +19,6 @@ from __future__ import division
+ from __future__ import print_function
+=20
+ import re
+-import six
+=20
+=20
+ # Pre-compile regexes that are use often
+@@ -48,12 +47,12 @@ def tokenize(text, stemmer):
+   # Convert everything to lowercase.
+   text =3D text.lower()
+   # Replace any non-alpha-numeric characters with spaces.
+-  text =3D NON_ALPHANUM_RE.sub(" ", six.ensure_str(text))
++  text =3D NON_ALPHANUM_RE.sub(" ", text)
+=20
+   tokens =3D SPACES_RE.split(text)
+   if stemmer:
+     # Only stem words more than 3 characters long.
+-    tokens =3D [six.ensure_str(stemmer.stem(x)) if len(x) > 3 else x
++    tokens =3D [stemmer.stem(x) if len(x) > 3 else x
+               for x in tokens]
+=20
+   # One final check to drop any empty or invalid tokens.
+diff --git a/setup.py b/setup.py
+index c630204..914c4fe 100644
+--- a/setup.py
++++ b/setup.py
+@@ -50,7 +50,6 @@ setuptools.setup(
+         "absl-py",
+         "nltk",
+         "numpy",
+-        "six>=3D1.14.0",
+     ],
+     python_requires=3D">=3D3.7",
+ )
diff --git a/meta-python/recipes-devtools/python3-rouge-score/python3-rou=
ge-score_0.1.2.bb b/meta-python/recipes-devtools/python3-rouge-score/pyth=
on3-rouge-score_0.1.2.bb
index 722956a8e2..246593df83 100644
--- a/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-scor=
e_0.1.2.bb
+++ b/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-scor=
e_0.1.2.bb
@@ -9,11 +9,11 @@ RDEPENDS:${PN} =3D "\
     python3-absl \
     python3-nltk \
     python3-numpy \
-    python3-six (>=3D1.14) \
 "
=20
 inherit setuptools3 pypi
=20
 PYPI_PACKAGE =3D "rouge_score"
=20
+SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "c7d4da2683e68c9abf0135ef915d63a46643666f848e558a=
1b9f7ead17ff0f04"
--=20
2.55.0



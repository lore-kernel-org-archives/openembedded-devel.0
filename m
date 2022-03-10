Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F3EC43217
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:25:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9149.1646918726892099661
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 748C01692
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:26 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A95373FA27
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/9] python3-pystache: remove, unmaintained
Date: Thu, 10 Mar 2022 13:25:16 +0000
Message-Id: <20220310132523.2253188-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310132523.2253188-1-ross.burton@arm.com>
References: <20220310132523.2253188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 13:25:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95924

Pystache hasn't been maintained since 2014.  One maintained alternative
is https://github.com/noahmorrison/chevron.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-python.bb |    1 -
 ...-versions-remove-py2x-and-fix-tests-.patch | 4150 -----------------
 .../python/python3-pystache_0.5.4.bb          |   17 -
 3 files changed, 4168 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pystache/=
0001-Modernize-python-versions-remove-py2x-and-fix-tests-.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pystache_=
0.5.4.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index 86bf6db30b..ae454e789b 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -347,7 +347,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-pyserial \
     python3-pysocks \
     python3-pysonos \
-    python3-pystache \
     python3-pystemd \
     python3-pytest-asyncio \
     python3-pytest-benchmark \
diff --git a/meta-python/recipes-devtools/python/python3-pystache/0001-Mo=
dernize-python-versions-remove-py2x-and-fix-tests-.patch b/meta-python/re=
cipes-devtools/python/python3-pystache/0001-Modernize-python-versions-rem=
ove-py2x-and-fix-tests-.patch
deleted file mode 100644
index d268cc5cd9..0000000000
--- a/meta-python/recipes-devtools/python/python3-pystache/0001-Modernize=
-python-versions-remove-py2x-and-fix-tests-.patch
+++ /dev/null
@@ -1,4150 +0,0 @@
-From 8bb1ac2d81f697598a766714f2c439d78c85d71e Mon Sep 17 00:00:00 2001
-From: Stephen L Arnold <nerdboy@gentoo.org>
-Date: Sat, 7 Nov 2020 12:38:33 -0800
-Subject: [PATCH] Modernize python versions (remove py2x) and fix tests, =
update
- spec
-
-* migrate to github actions for CI, add conda recipe/workflow
-* fix document processing, update pandoc args and history
-* convert doctests and modules to py3
-* convert packaging/setup.py to pep517, keep doc processing
-* cleanup tox cfg, add coverage, readme status
-* add pep8speaks cfg, cleanup warnings, use correct env
-* update setup_description.rst for packaging
-* set version for test release =3D> 0.6.0 and deploy
-
-Upstream-Status: Backport [https://github.com/defunkt/pystache/pull/214]
-Signed-off-by: Stephen L Arnold <nerdboy@gentoo.org>
----
- .coveragerc                               |  38 +++
- .gitchangelog.rc                          | 295 +++++++++++++++++++++
- .github/workflows/ci.yml                  |  73 ++++++
- .github/workflows/conda.yml               |  55 ++++
- .github/workflows/release.yml             |  94 +++++++
- .github/workflows/wheels.yml              |  82 ++++++
- .pep8speaks.yml                           |  15 ++
- HISTORY.md                                |  37 ++-
- MANIFEST.in                               |   8 +-
- README.md                                 | 141 +++++-----
- TODO.md                                   |   5 +-
- conda/meta.yaml                           |  50 ++++
- pyproject.toml                            |   3 +
- pystache/__init__.py                      |   2 +-
- pystache/commands/render.py               |   4 +-
- pystache/common.py                        |  13 +-
- pystache/defaults.py                      |   2 +-
- pystache/loader.py                        |  14 +-
- pystache/parsed.py                        |   6 +-
- pystache/parser.py                        |  20 +-
- pystache/renderengine.py                  |   2 +-
- pystache/renderer.py                      |  22 +-
- pystache/specloader.py                    |   2 +-
- pystache/tests/benchmark.py               |  15 +-
- pystache/tests/common.py                  |  10 +-
- pystache/tests/examples/unicode_output.py |   2 +-
- pystache/tests/main.py                    |  28 +-
- pystache/tests/spectesting.py             |  16 +-
- pystache/tests/test___init__.py           |   4 +-
- pystache/tests/test_commands.py           |   2 +-
- pystache/tests/test_defaults.py           |  18 +-
- pystache/tests/test_examples.py           |  40 +--
- pystache/tests/test_loader.py             |  46 ++--
- pystache/tests/test_pystache.py           |   6 +-
- pystache/tests/test_renderengine.py       | 148 +++++------
- pystache/tests/test_renderer.py           |  86 +++----
- pystache/tests/test_simple.py             |  20 +-
- pystache/tests/test_specloader.py         |  60 ++---
- setup.cfg                                 |  74 +++++-
- setup.py                                  | 134 +---------
- setup_description.rst                     | 297 +++++++++++++---------
- tox.ini                                   | 118 +++++++--
- travis.yml_disabled                       |  52 ++++
- 43 files changed, 1487 insertions(+), 672 deletions(-)
- create mode 100644 .coveragerc
- create mode 100644 .gitchangelog.rc
- create mode 100644 .github/workflows/ci.yml
- create mode 100644 .github/workflows/conda.yml
- create mode 100644 .github/workflows/release.yml
- create mode 100644 .github/workflows/wheels.yml
- create mode 100644 .pep8speaks.yml
- create mode 100644 conda/meta.yaml
- create mode 100644 pyproject.toml
- create mode 100644 travis.yml_disabled
-
-diff --git a/.coveragerc b/.coveragerc
-new file mode 100644
-index 0000000..9a336dd
---- /dev/null
-+++ b/.coveragerc
-@@ -0,0 +1,38 @@
-+# .coveragerc to control coverage.py
-+[run]
-+branch =3D True
-+
-+source =3D pystache
-+
-+omit =3D
-+    .tox/*
-+    setup.py
-+    pystache/tests/*
-+
-+#plugins =3D
-+#    coverage_python_version
-+
-+[report]
-+# must set this to True to see missing
-+#show_missing =3D True
-+
-+# Regexes for lines to exclude from consideration
-+exclude_lines =3D
-+    # Have to re-enable the standard pragma
-+    pragma: no cover
-+
-+    # Don't complain about missing debug-only code:
-+    def __repr__
-+    if self\.debug
-+
-+    # Don't complain if tests don't hit defensive assertion code:
-+    raise AssertionError
-+    raise NotImplementedError
-+
-+    # Don't complain if non-runnable code isn't run:
-+    if 0:
-+
-+ignore_errors =3D True
-+
-+[html]
-+directory =3D cover
-diff --git a/.gitchangelog.rc b/.gitchangelog.rc
-new file mode 100644
-index 0000000..5cf63a0
---- /dev/null
-+++ b/.gitchangelog.rc
-@@ -0,0 +1,295 @@
-+# -*- coding: utf-8; mode: python -*-
-+##
-+## Format
-+##
-+##   ACTION: [AUDIENCE:] COMMIT_MSG [!TAG ...]
-+##
-+## Description
-+##
-+##   ACTION is one of 'chg', 'fix', 'new'
-+##
-+##       Is WHAT the change is about.
-+##
-+##       'chg' is for refactor, small improvement, cosmetic changes...
-+##       'fix' is for bug fixes
-+##       'new' is for new features, big improvement
-+##
-+##   AUDIENCE is optional and one of 'dev', 'usr', 'pkg', 'test', 'doc'
-+##
-+##       Is WHO is concerned by the change.
-+##
-+##       'dev'  is for developpers (API changes, refactors...)
-+##       'usr'  is for final users (UI changes)
-+##       'pkg'  is for packagers   (packaging changes)
-+##       'test' is for testers     (test only related changes)
-+##       'doc'  is for doc guys    (doc only changes)
-+##
-+##   COMMIT_MSG is ... well ... the commit message itself.
-+##
-+##   TAGs are additionnal adjective as 'refactor' 'minor' 'cosmetic'
-+##
-+##       They are preceded with a '!' or a '@' (prefer the former, as t=
he
-+##       latter is wrongly interpreted in github.) Commonly used tags a=
re:
-+##
-+##       'refactor' is obviously for refactoring code only
-+##       'minor' is for a very meaningless change (a typo, adding a com=
ment)
-+##       'cosmetic' is for cosmetic driven change (re-indentation, 80-c=
ol...)
-+##       'wip' is for partial functionality but complete subfunctionali=
ty.
-+##
-+## Example:
-+##
-+##   new: usr: support of bazaar implemented
-+##   chg: re-indentend some lines !cosmetic
-+##   new: dev: updated code to be compatible with last version of kille=
r lib.
-+##   fix: pkg: updated year of licence coverage.
-+##   new: test: added a bunch of test around user usability of feature =
X.
-+##   fix: typo in spelling my name in comment. !minor
-+##
-+##   Please note that multi-line commit message are supported, and only=
 the
-+##   first line will be considered as the "summary" of the commit messa=
ge. So
-+##   tags, and other rules only applies to the summary.  The body of th=
e commit
-+##   message will be displayed in the changelog without reformatting.
-+
-+
-+##
-+## ``ignore_regexps`` is a line of regexps
-+##
-+## Any commit having its full commit message matching any regexp listed=
 here
-+## will be ignored and won't be reported in the changelog.
-+##
-+ignore_regexps =3D [
-+    r'@minor', r'!minor',
-+    r'@cosmetic', r'!cosmetic',
-+    r'@refactor', r'!refactor',
-+    r'@wip', r'!wip',
-+    r'^([cC]hg|[fF]ix|[nN]ew)\s*:\s*[p|P]kg:',
-+    r'^([cC]hg|[fF]ix|[nN]ew)\s*:\s*[d|D]ev:',
-+    r'^(.{3,3}\s*:)?\s*[fF]irst commit.?\s*$',
-+    r'^$',  ## ignore commits with empty messages
-+]
-+
-+
-+## ``section_regexps`` is a list of 2-tuples associating a string label=
 and a
-+## list of regexp
-+##
-+## Commit messages will be classified in sections thanks to this. Secti=
on
-+## titles are the label, and a commit is classified under this section =
if any
-+## of the regexps associated is matching.
-+##
-+## Please note that ``section_regexps`` will only classify commits and =
won't
-+## make any changes to the contents. So you'll probably want to go chec=
k
-+## ``subject_process`` (or ``body_process``) to do some changes to the =
subject,
-+## whenever you are tweaking this variable.
-+##
-+section_regexps =3D [
-+    ('New', [
-+        r'^[nN]ew\s*:\s*((dev|use?r|pkg|test|doc)\s*:\s*)?([^\n]*)$',
-+     ]),
-+    ('Features', [
-+       r'^([nN]ew|[fF]eat)\s*:\s*((dev|use?r|pkg|test|doc)\s*:\s*)?([^\=
n]*)$',
-+     ]),
-+    ('Changes', [
-+        r'^[cC]hg\s*:\s*((dev|use?r|pkg|test|doc)\s*:\s*)?([^\n]*)$',
-+     ]),
-+    ('Fixes', [
-+        r'^[fF]ix\s*:\s*((dev|use?r|pkg|test|doc)\s*:\s*)?([^\n]*)$',
-+     ]),
-+
-+    ('Other', None ## Match all lines
-+     ),
-+]
-+
-+
-+## ``body_process`` is a callable
-+##
-+## This callable will be given the original body and result will
-+## be used in the changelog.
-+##
-+## Available constructs are:
-+##
-+##   - any python callable that take one txt argument and return txt ar=
gument.
-+##
-+##   - ReSub(pattern, replacement): will apply regexp substitution.
-+##
-+##   - Indent(chars=3D"  "): will indent the text with the prefix
-+##     Please remember that template engines gets also to modify the te=
xt and
-+##     will usually indent themselves the text if needed.
-+##
-+##   - Wrap(regexp=3Dr"\n\n"): re-wrap text in separate paragraph to fi=
ll 80-Columns
-+##
-+##   - noop: do nothing
-+##
-+##   - ucfirst: ensure the first letter is uppercase.
-+##     (usually used in the ``subject_process`` pipeline)
-+##
-+##   - final_dot: ensure text finishes with a dot
-+##     (usually used in the ``subject_process`` pipeline)
-+##
-+##   - strip: remove any spaces before or after the content of the stri=
ng
-+##
-+##   - SetIfEmpty(msg=3D"No commit message."): will set the text to
-+##     whatever given ``msg`` if the current text is empty.
-+##
-+## Additionally, you can `pipe` the provided filters, for instance:
-+#body_process =3D Wrap(regexp=3Dr'\n(?=3D\w+\s*:)') | Indent(chars=3D" =
 ")
-+#body_process =3D Wrap(regexp=3Dr'\n(?=3D\w+\s*:)')
-+#body_process =3D noop
-+body_process =3D ReSub(r'((^|\n)[A-Z]\w+(-\w+)*: .*(\n\s+.*)*)+$', r'')=
 | strip
-+
-+
-+## ``subject_process`` is a callable
-+##
-+## This callable will be given the original subject and result will
-+## be used in the changelog.
-+##
-+## Available constructs are those listed in ``body_process`` doc.
-+subject_process =3D (strip |
-+    ReSub(r'^([cC]hg|[fF]ix|[nN]ew)\s*:\s*((dev|use?r|pkg|test|doc)\s*:=
\s*)?([^\n@]*)(@[a-z]+\s+)*$', r'\4') |
-+    SetIfEmpty("No commit message.") | ucfirst | final_dot)
-+
-+
-+## ``tag_filter_regexp`` is a regexp
-+##
-+## Tags that will be used for the changelog must match this regexp.
-+##
-+#tag_filter_regexp =3D r'^v?[0-9]+\.[0-9]+(\.[0-9]+)?$'
-+tag_filter_regexp =3D r'^[0-9]+\.[0-9]+(\.[0-9]+)?$'
-+
-+
-+## ``unreleased_version_label`` is a string or a callable that outputs =
a string
-+##
-+## This label will be used as the changelog Title of the last set of ch=
anges
-+## between last valid tag and HEAD if any.
-+unreleased_version_label =3D "(unreleased)"
-+#unreleased_version_label =3D lambda: swrap(
-+#    ["git", "describe", "--tags"],
-+#shell=3DFalse)
-+
-+
-+## ``output_engine`` is a callable
-+##
-+## This will change the output format of the generated changelog file
-+##
-+## Available choices are:
-+##
-+##   - rest_py
-+##
-+##        Legacy pure python engine, outputs ReSTructured text.
-+##        This is the default.
-+##
-+##   - mustache(<template_name>)
-+##
-+##        Template name could be any of the available templates in
-+##        ``templates/mustache/*.tpl``.
-+##        Requires python package ``pystache``.
-+##        Examples:
-+##           - mustache("markdown")
-+##           - mustache("restructuredtext")
-+##
-+##   - makotemplate(<template_name>)
-+##
-+##        Template name could be any of the available templates in
-+##        ``templates/mako/*.tpl``.
-+##        Requires python package ``mako``.
-+##        Examples:
-+##           - makotemplate("restructuredtext")
-+##
-+#output_engine =3D rest_py
-+#output_engine =3D mustache("restructuredtext")
-+output_engine =3D mustache("markdown")
-+#output_engine =3D makotemplate("restructuredtext")
-+
-+
-+## ``include_merge`` is a boolean
-+##
-+## This option tells git-log whether to include merge commits in the lo=
g.
-+## The default is to include them.
-+include_merge =3D True
-+
-+
-+## ``log_encoding`` is a string identifier
-+##
-+## This option tells gitchangelog what encoding is outputed by ``git lo=
g``.
-+## The default is to be clever about it: it checks ``git config`` for
-+## ``i18n.logOutputEncoding``, and if not found will default to git's o=
wn
-+## default: ``utf-8``.
-+#log_encoding =3D 'utf-8'
-+
-+
-+## ``publish`` is a callable
-+##
-+## Sets what ``gitchangelog`` should do with the output generated by
-+## the output engine. ``publish`` is a callable taking one argument
-+## that is an interator on lines from the output engine.
-+##
-+## Some helper callable are provided:
-+##
-+## Available choices are:
-+##
-+##   - stdout
-+##
-+##        Outputs directly to standard output
-+##        (This is the default)
-+##
-+##   - FileInsertAtFirstRegexMatch(file, pattern, idx=3Dlamda m: m.star=
t(), flags)
-+##
-+##        Creates a callable that will parse given file for the given
-+##        regex pattern and will insert the output in the file.
-+##        ``idx`` is a callable that receive the matching object and
-+##        must return a integer index point where to insert the
-+##        the output in the file. Default is to return the position of
-+##        the start of the matched string.
-+##
-+##   - FileRegexSubst(file, pattern, replace, flags)
-+##
-+##        Apply a replace inplace in the given file. Your regex pattern=
 must
-+##        take care of everything and might be more complex. Check the =
README
-+##        for a complete copy-pastable example.
-+##
-+# publish =3D FileInsertIntoFirstRegexMatch(
-+#     "CHANGELOG.rst",
-+#     r'/(?P<rev>[0-9]+\.[0-9]+(\.[0-9]+)?)\s+\([0-9]+-[0-9]{2}-[0-9]{2=
}\)\n--+\n/',
-+#     idx=3Dlambda m: m.start(1)
-+# )
-+#publish =3D stdout
-+
-+
-+## ``revs`` is a list of callable or a list of string
-+##
-+## callable will be called to resolve as strings and allow dynamical
-+## computation of these. The result will be used as revisions for
-+## gitchangelog (as if directly stated on the command line). This allow=
s
-+## to filter exaclty which commits will be read by gitchangelog.
-+##
-+## To get a full documentation on the format of these strings, please
-+## refer to the ``git rev-list`` arguments. There are many examples.
-+##
-+## Using callables is especially useful, for instance, if you
-+## are using gitchangelog to generate incrementally your changelog.
-+##
-+## Some helpers are provided, you can use them::
-+##
-+##   - FileFirstRegexMatch(file, pattern): will return a callable that =
will
-+##     return the first string match for the given pattern in the given=
 file.
-+##     If you use named sub-patterns in your regex pattern, it'll outpu=
t only
-+##     the string matching the regex pattern named "rev".
-+##
-+##   - Caret(rev): will return the rev prefixed by a "^", which is a
-+##     way to remove the given revision and all its ancestor.
-+##
-+## Please note that if you provide a rev-list on the command line, it'l=
l
-+## replace this value (which will then be ignored).
-+##
-+## If empty, then ``gitchangelog`` will act as it had to generate a ful=
l
-+## changelog.
-+##
-+## The default is to use all commits to make the changelog.
-+#revs =3D ["^1.0.3", ]
-+#revs =3D [
-+#    Caret(
-+#        FileFirstRegexMatch(
-+#            "CHANGELOG.rst",
-+#            r"(?P<rev>[0-9]+\.[0-9]+(\.[0-9]+)?)\s+\([0-9]+-[0-9]{2}-[=
0-9]{2}\)\n--+\n")),
-+#    "HEAD"
-+#]
-+revs =3D []
-diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
-new file mode 100644
-index 0000000..356dd2c
---- /dev/null
-+++ b/.github/workflows/ci.yml
-@@ -0,0 +1,73 @@
-+# This workflow will install Python dependencies, run tests and lint wi=
th a variety of Python versions
-+# For more information see: https://help.github.com/actions/language-an=
d-framework-guides/using-python-with-github-actions
-+
-+name: ci
-+
-+on:
-+  push:
-+    branches: [ master ]
-+  pull_request:
-+    branches: [ master ]
-+
-+jobs:
-+  build:
-+
-+    runs-on: ${{ matrix.os }}
-+    defaults:
-+      run:
-+        shell: bash
-+    env:
-+      OS: ${{ matrix.os }}
-+      PYTHON: ${{ matrix.python-version }}
-+      PYTHONIOENCODING: utf-8
-+      PIP_DOWNLOAD_CACHE: ${{ github.workspace }}/../.pip_download_cach=
e
-+    strategy:
-+      fail-fast: false
-+      matrix:
-+        os: [ubuntu-20.04, macos-latest, windows-latest]
-+        python-version: [3.6, 3.7, 3.8, 3.9]
-+    steps:
-+    - name: Set git crlf/eol
-+      run: |
-+        git config --global core.autocrlf false
-+        git config --global core.eol lf
-+
-+    - uses: actions/checkout@v2
-+      with:
-+        submodules: True
-+
-+    - name: Set up Python ${{ matrix.python-version }}
-+      uses: actions/setup-python@v2
-+      with:
-+        python-version: ${{ matrix.python-version }}
-+
-+    - name: Install dependencies
-+      run: |
-+        python -m pip install --upgrade pip
-+        pip install tox tox-gh-actions
-+
-+    - name: Run tests with coverage
-+      run: |
-+        tox
-+      env:
-+        PLATFORM: ${{ matrix.os }}
-+
-+    - name: Upload coverage to Codecov
-+      uses: codecov/codecov-action@v1
-+      with:
-+        env_vars: OS,PYTHON
-+
-+    - name: Test with specs and pystache-test
-+      run: |
-+        tox -e setup . ext/spec/specs
-+
-+    - name: Check pkg builds
-+      run: |
-+        tox -e deploy
-+
-+    - name: Check docs
-+      if: runner.os =3D=3D 'Linux'
-+      run: |
-+        sudo apt-get -qq update
-+        sudo apt-get install -y pandoc
-+        tox -e docs
-diff --git a/.github/workflows/conda.yml b/.github/workflows/conda.yml
-new file mode 100644
-index 0000000..261f9ad
---- /dev/null
-+++ b/.github/workflows/conda.yml
-@@ -0,0 +1,55 @@
-+name: Conda
-+
-+on:
-+  workflow_dispatch:
-+  pull_request:
-+  push:
-+    branches:
-+      - master
-+
-+jobs:
-+  build:
-+    strategy:
-+      fail-fast: false
-+      matrix:
-+        platform: [ubuntu-18.04, windows-latest, macos-latest]
-+        python-version: [3.6, 3.7, 3.8, 3.9]
-+
-+    runs-on: ${{ matrix.platform }}
-+
-+    # The setup-miniconda action needs this to activate miniconda
-+    defaults:
-+      run:
-+        shell: "bash -l {0}"
-+
-+    steps:
-+      - uses: actions/checkout@v2
-+        with:
-+          fetch-depth: 0
-+
-+      - name: Cache conda
-+        uses: actions/cache@v1
-+        with:
-+          path: ~/conda_pkgs_dir
-+          key: ${{matrix.os}}-conda-pkgs-${{hashFiles('**/conda/meta.ya=
ml')}}
-+
-+      - name: Get conda
-+        uses: conda-incubator/setup-miniconda@v2
-+        with:
-+          python-version: ${{ matrix.python-version }}
-+          channels: conda-forge
-+          channel-priority: strict
-+          use-only-tar-bz2: true
-+          auto-activate-base: true
-+
-+      - name: Prepare
-+        run: conda install conda-build conda-verify
-+
-+      - name: Build
-+        run: conda build conda
-+
-+      - name: Install
-+        run: conda install -c ${CONDA_PREFIX}/conda-bld/ pystache
-+
-+      - name: Test
-+        run: python test_pystache.py
-diff --git a/.github/workflows/release.yml b/.github/workflows/release.y=
ml
-new file mode 100644
-index 0000000..f33c4b5
---- /dev/null
-+++ b/.github/workflows/release.yml
-@@ -0,0 +1,94 @@
-+name: Release
-+
-+on:
-+  push:
-+    # release on tag push
-+    tags:
-+      - '*'
-+
-+jobs:
-+  wheels:
-+
-+    runs-on: ${{ matrix.os }}
-+    defaults:
-+      run:
-+        shell: bash
-+    env:
-+      PYTHONIOENCODING: utf-8
-+    strategy:
-+      fail-fast: false
-+      matrix:
-+        os: [ubuntu-18.04, macos-latest, windows-latest]
-+        python-version: [3.6, 3.7, 3.8, 3.9]
-+        exclude:
-+          - os: windows-latest
-+            python-version: 2.7
-+
-+    steps:
-+    - name: Set git crlf/eol
-+      run: |
-+        git config --global core.autocrlf false
-+        git config --global core.eol lf
-+
-+    - uses: actions/checkout@v2
-+      with:
-+        fetch-depth: 0
-+
-+    - name: Set up Python ${{ matrix.python-version }}
-+      uses: actions/setup-python@v2
-+      with:
-+        python-version: ${{ matrix.python-version }}
-+
-+    - name: Install dependencies
-+      run: |
-+        python -m pip install --upgrade pip wheel
-+        pip install tox tox-gh-actions
-+
-+    - name: Build dist pkgs
-+      run: |
-+        tox -e deploy
-+
-+    - name: Upload artifacts
-+      if: matrix.python-version =3D=3D 3.7 && runner.os =3D=3D 'Linux'
-+      uses: actions/upload-artifact@v2
-+      with:
-+        name: wheels
-+        path: ./dist/*.whl
-+
-+  create_release:
-+    name: Create Release
-+    needs: [wheels]
-+    runs-on: ubuntu-18.04
-+
-+    steps:
-+      - name: Get version
-+        id: get_version
-+        run: |
-+          echo "VERSION=3D${GITHUB_REF/refs\/tags\//}" >> $GITHUB_ENV
-+          echo ${{ env.VERSION }}
-+
-+      - uses: actions/checkout@v2
-+        with:
-+          fetch-depth: 0
-+
-+      # download all artifacts to project dir
-+      - uses: actions/download-artifact@v2
-+
-+      - name: Generate changes file
-+        uses: sarnold/gitchangelog-action@master
-+        with:
-+          github_token: ${{ secrets.GITHUB_TOKEN}}
-+
-+      - name: Create release
-+        id: create_release
-+        uses: softprops/action-gh-release@v1
-+        env:
-+          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
-+        with:
-+          tag_name: ${{ env.VERSION }}
-+          name: Release v${{ env.VERSION }}
-+          body_path: CHANGES.md
-+          draft: false
-+          prerelease: false
-+          files: |
-+            wheels/pystache*.whl
-diff --git a/.github/workflows/wheels.yml b/.github/workflows/wheels.yml
-new file mode 100644
-index 0000000..58f0c5e
---- /dev/null
-+++ b/.github/workflows/wheels.yml
-@@ -0,0 +1,82 @@
-+name: Wheels
-+
-+on:
-+  workflow_dispatch:
-+  pull_request:
-+  #push:
-+    #branches: [ master ]
-+
-+jobs:
-+  build:
-+
-+    runs-on: ${{ matrix.os }}
-+    defaults:
-+      run:
-+        shell: bash
-+    env:
-+      PYTHONIOENCODING: utf-8
-+    strategy:
-+      fail-fast: false
-+      matrix:
-+        os: [ubuntu-18.04, macos-latest, windows-latest]
-+        python-version: [3.6, 3.7, 3.8, 3.9]
-+
-+    steps:
-+      - name: Set git crlf/eol
-+        run: |
-+          git config --global core.autocrlf false
-+          git config --global core.eol lf
-+
-+      - uses: actions/checkout@v2
-+        with:
-+          fetch-depth: 0
-+
-+      - name: Set up Python ${{ matrix.python-version }}
-+        uses: actions/setup-python@v2
-+        with:
-+          python-version: ${{ matrix.python-version }}
-+
-+      - name: Install dependencies
-+        run: |
-+          python -m pip install --upgrade pip wheel
-+          pip install tox tox-gh-actions
-+
-+      - name: Build dist pkgs
-+        run: |
-+          tox -e deploy
-+
-+      - name: Upload artifacts
-+        if: matrix.python-version =3D=3D 3.7 && runner.os =3D=3D 'Linux=
'
-+        uses: actions/upload-artifact@v2
-+        with:
-+          name: wheels
-+          path: ./dist/*.whl
-+
-+  check_artifact:
-+    name: Check wheel artifact
-+    needs: [build]
-+    runs-on: ${{ matrix.os }}
-+    defaults:
-+      run:
-+        shell: bash
-+    env:
-+      PYTHONIOENCODING: utf-8
-+    strategy:
-+      fail-fast: false
-+      matrix:
-+        os: [ubuntu-18.04, macos-latest, windows-latest]
-+        python-version: [3.6, 3.8, 3.9]
-+
-+    steps:
-+      - name: Set up Python ${{ matrix.python-version }}
-+        uses: actions/setup-python@v2
-+        with:
-+          python-version: ${{ matrix.python-version }}
-+
-+      # download all artifacts to project dir
-+      - uses: actions/download-artifact@v2
-+
-+      - name: Check wheel install
-+        run: |
-+          bash -c 'export WHL=3D$(ls wheels/*.whl); python -m pip insta=
ll $WHL'
-+          pystache-test
-diff --git a/.pep8speaks.yml b/.pep8speaks.yml
-new file mode 100644
-index 0000000..e841b66
---- /dev/null
-+++ b/.pep8speaks.yml
-@@ -0,0 +1,15 @@
-+scanner:
-+    linter: flake8  # Other option is pycodestyle
-+
-+no_blank_comment: False  # If True, no comment is made on PR without an=
y errors.
-+descending_issues_order: True  # If True, PEP 8 issues in message will =
be displayed in descending order of line numbers in the file
-+
-+[flake8]
-+exclude =3D
-+    .git,
-+    .github,
-+    __pycache__,
-+    build,
-+    dist
-+
-+max-line-length =3D 110
-diff --git a/HISTORY.md b/HISTORY.md
-index e5b7638..60b6308 100644
---- a/HISTORY.md
-+++ b/HISTORY.md
-@@ -1,7 +1,42 @@
- History
- =3D=3D=3D=3D=3D=3D=3D
-=20
--**Note:** Official support for Python 2.4 will end with Pystache versio=
n 0.6.0.
-+**Note:** Official support for Python 2.7 will end with Pystache versio=
n 0.6.0.
-+
-+0.6.0 (2021-03-04)
-+------------------
-+
-+-   Bump spec versions to latest =3D> v1.1.3
-+-   Modernize python and CI tools, update docs/doctests
-+-   Update unicode conversion test for py3-only
-+-   Add pep8speaks cfg, cleanup warnings
-+-   Remove superfluous setup test/unused imports
-+-   Add conda recipe/CI build
-+
-+0.5.6 (2021-02-28)
-+------------------
-+
-+-   Use correct wheel name in release workflow, limit wheels
-+-   Add install check/test of downloaded wheel
-+-   Update/add ci workflows and tox cfg, bump to next dev0 version
-+
-+0.5.5 (2020-12-16)
-+------------------
-+
-+-   fix document processing, update pandoc args and history
-+-   add release.yml to CI, test env settings
-+-   fix bogus commit message, update versions and tox cf
-+-   add post-test steps for building pkgs with/without doc updates
-+-   add CI build check, fix MANIFEST.in pruning
-+
-+0.5.4-2 (2020-11-09)
-+--------------------
-+
-+-   Merge pull request #1 from sarnold/rebase-up
-+-   Bugfix: test_specloader.py: fix test_find__with_directory on other =
OSs
-+-   Bugfix: pystache/loader.py: remove stray windows line-endings
-+-   fix crufty (and insecure) http urls
-+-   Bugfix: modernize python versions (keep py27) and fix spec_test loa=
d cmd
-=20
- 0.5.4 (2014-07-11)
- ------------------
-diff --git a/MANIFEST.in b/MANIFEST.in
-index bdc64bf..1593143 100644
---- a/MANIFEST.in
-+++ b/MANIFEST.in
-@@ -1,7 +1,4 @@
--include README.md
--include HISTORY.md
--include LICENSE
--include TODO.md
-+include README.md HISTORY.md TODO.md LICENSE
- include setup_description.rst
- include tox.ini
- include test_pystache.py
-@@ -11,3 +8,6 @@ recursive-include pystache/tests *.mustache *.txt
- # We deliberately exclude the gh/ directory because it contains copies
- # of resources needed only for the web page hosted on GitHub (via the
- # gh-pages branch).
-+exclude *.ini *travis*
-+prune gh
-+prune .git*
-diff --git a/README.md b/README.md
-index 54a9608..1203b7a 100644
---- a/README.md
-+++ b/README.md
-@@ -10,11 +10,25 @@ Pystache
- <!-- -->
- <!-- We leave the leading brackets empty here.  Otherwise, unwanted -->
- <!-- caption text shows up in the reST version converted by pandoc. -->
--![](http://defunkt.github.com/pystache/images/logo_phillips.png "mustac=
hioed, monocled snake by David Phillips")
-+[![ci](https://github.com/sarnold/pystache/actions/workflows/ci.yml/bad=
ge.svg)](https://github.com/sarnold/pystache/actions/workflows/ci.yml)
-+[![Conda](https://github.com/sarnold/pystache/actions/workflows/conda.y=
ml/badge.svg)](https://github.com/sarnold/pystache/actions/workflows/cond=
a.yml)
-+[![Wheels](https://github.com/sarnold/pystache/actions/workflows/wheels=
.yml/badge.svg)](https://github.com/sarnold/pystache/actions/workflows/wh=
eels.yml)
-+[![Release](https://github.com/sarnold/pystache/actions/workflows/relea=
se.yml/badge.svg)](https://github.com/sarnold/pystache/actions/workflows/=
release.yml)
-+[![Python](https://img.shields.io/badge/python-3.6+-blue.svg)](https://=
www.python.org/downloads/)
-=20
--![](https://secure.travis-ci.org/defunkt/pystache.png "Travis CI curren=
t build status")
-+[![Latest release](https://img.shields.io/github/v/release/sarnold/pyst=
ache?include_prereleases)](https://github.com/sarnold/pystache/releases/l=
atest)
-+[![License](https://img.shields.io/github/license/sarnold/pystache)](ht=
tps://github.com/sarnold/pystache/blob/master/LICENSE)
-+[![Maintainability](https://api.codeclimate.com/v1/badges/a8fa1bf4638bf=
c6581b6/maintainability)](https://codeclimate.com/github/sarnold/pystache=
/maintainability)
-+[![codecov](https://codecov.io/gh/sarnold/pystache/branch/master/graph/=
badge.svg?token=3D5PZNMZBI6K)](https://codecov.io/gh/sarnold/pystache)
-=20
--[Pystache](http://defunkt.github.com/pystache) is a Python
-+
-+
-+This updated fork of Pystache is currently tested on Python 3.6+ and in
-+Conda, on Linux, Macos, and Windows (Python 2.7 support has been remove=
d).
-+
-+![](gh/images/logo_phillips_small.png "mustachioed, monocled snake by D=
avid Phillips")
-+
-+[Pystache](http://sarnold.github.com/pystache) is a Python
- implementation of [Mustache](http://mustache.github.com/). Mustache is =
a
- framework-agnostic, logic-free templating system inspired by
- [ctemplate](http://code.google.com/p/google-ctemplate/) and
-@@ -27,10 +41,10 @@ provides a good introduction to Mustache's syntax. F=
or a more complete
- (and more current) description of Mustache's behavior, see the official
- [Mustache spec](https://github.com/mustache/spec).
-=20
--Pystache is [semantically versioned](http://semver.org) and can be foun=
d
--on [PyPI](http://pypi.python.org/pypi/pystache). This version of
--Pystache passes all tests in [version
--1.1.2](https://github.com/mustache/spec/tree/v1.1.2) of the spec.
-+Pystache is [semantically versioned](http://semver.org) and older versi=
ons
-+can still be found on [PyPI](http://pypi.python.org/pypi/pystache). Thi=
s
-+version of Pystache now passes all tests in [version
-+1.1.3](https://github.com/mustache/spec/tree/v1.1.3) of the spec.
-=20
-=20
- Requirements
-@@ -38,41 +52,25 @@ Requirements
-=20
- Pystache is tested with--
-=20
---   Python 2.4 (requires simplejson [version
--    2.0.9](http://pypi.python.org/pypi/simplejson/2.0.9) or earlier)
---   Python 2.5 (requires
--    [simplejson](http://pypi.python.org/pypi/simplejson/))
---   Python 2.6
---   Python 2.7
---   Python 3.1
---   Python 3.2
---   Python 3.3
---   [PyPy](http://pypy.org/)
-+-   Python 3.6
-+-   Python 3.7
-+-   Python 3.8
-+-   Python 3.9
-+-   Conda (py36-py39)
-=20
- [Distribute](http://packages.python.org/distribute/) (the setuptools fo=
rk)
--is recommended over [setuptools](http://pypi.python.org/pypi/setuptools=
),
--and is required in some cases (e.g. for Python 3 support).
--If you use [pip](http://www.pip-installer.org/), you probably already s=
atisfy
--this requirement.
-+is no longer required over [setuptools](http://pypi.python.org/pypi/set=
uptools),
-+as the current packaging is now PEP517-compliant.
-=20
- JSON support is needed only for the command-line interface and to run
--the spec tests. We require simplejson for earlier versions of Python
--since Python's [json](http://docs.python.org/library/json.html) module
--was added in Python 2.6.
--
--For Python 2.4 we require an earlier version of simplejson since
--simplejson stopped officially supporting Python 2.4 in simplejson
--version 2.1.0. Earlier versions of simplejson can be installed manually=
,
--as follows:
-+the spec tests; PyYAML can still be used (see the Develop section).
-=20
--    pip install 'simplejson<2.1.0'
--
--Official support for Python 2.4 will end with Pystache version 0.6.0.
-+Official support for Python 2 will end with Pystache version 0.6.0.
-=20
- Install It
- ----------
-=20
--    pip install pystache
-+    pip install -U pystache -f https://github.com/sarnold/pystache/rele=
ases/
-=20
- And test it--
-=20
-@@ -85,12 +83,12 @@ Use It
- ------
-=20
-     >>> import pystache
--    >>> print pystache.render('Hi {{person}}!', {'person': 'Mom'})
-+    >>> print(pystache.render('Hi {{person}}!', {'person': 'Mom'}))
-     Hi Mom!
-=20
- You can also create dedicated view classes to hold your view logic.
-=20
--Here's your view class (in .../examples/readme.py):
-+Here's your view class (in ../pystache/tests/examples/readme.py):
-=20
-     class SayHello(object):
-         def to(self):
-@@ -109,7 +107,7 @@ directory as your class definition):
- Pull it together:
-=20
-     >>> renderer =3D pystache.Renderer()
--    >>> print renderer.render(hello)
-+    >>> print(renderer.render(hello))
-     Hello, Pizza!
-=20
- For greater control over rendering (e.g. to specify a custom template
-@@ -117,22 +115,22 @@ directory), use the `Renderer` class like above. O=
ne can pass attributes
- to the Renderer class constructor or set them on a Renderer instance. T=
o
- customize template loading on a per-view basis, subclass `TemplateSpec`=
.
- See the docstrings of the
--[Renderer](https://github.com/defunkt/pystache/blob/master/pystache/ren=
derer.py)
-+[Renderer](https://github.com/sarnold/pystache/blob/master/pystache/ren=
derer.py)
- class and
--[TemplateSpec](https://github.com/defunkt/pystache/blob/master/pystache=
/template_spec.py)
-+[TemplateSpec](https://github.com/sarnold/pystache/blob/master/pystache=
/template_spec.py)
- class for more information.
-=20
- You can also pre-parse a template:
-=20
-     >>> parsed =3D pystache.parse(u"Hey {{#who}}{{.}}!{{/who}}")
--    >>> print parsed
--    [u'Hey ', _SectionNode(key=3Du'who', index_begin=3D12, index_end=3D=
18, parsed=3D[_EscapeNode(key=3Du'.'), u'!'])]
-+    >>> print(parsed)
-+    ['Hey ', _SectionNode(key=3D'who', index_begin=3D12, index_end=3D18=
, parsed=3D[_EscapeNode(key=3D'.'), '!'])]
-=20
- And then:
-=20
--    >>> print renderer.render(parsed, {'who': 'Pops'})
-+    >>> print(renderer.render(parsed, {'who': 'Pops'}))
-     Hey Pops!
--    >>> print renderer.render(parsed, {'who': 'you'})
-+    >>> print(renderer.render(parsed, {'who': 'you'}))
-     Hey you!
-=20
- Python 3
-@@ -194,15 +192,16 @@ To test from a source distribution (without instal=
ling)--
-     python test_pystache.py
-=20
- To test Pystache with multiple versions of Python (with a single
--command!), you can use [tox](http://pypi.python.org/pypi/tox):
-+command!) and different platforms, you can use [tox](http://pypi.python=
.org/pypi/tox):
-+
-+    pip install tox
-+    tox -e setup
-=20
--    pip install 'virtualenv<1.8'  # Version 1.8 dropped support for Pyt=
hon 2.4.
--    pip install 'tox<1.4'  # Version 1.4 dropped support for Python 2.4=
.
--    tox
-+To run tests on multiple versions with coverage, run:
-=20
--If you do not have all Python versions listed in `tox.ini`--
-+    tox -e py38-linux,py39-linux  # for example
-=20
--    tox -e py26,py32  # for example
-+(substitute your platform above, eg, macos or windows)
-=20
- The source distribution tests also include doctests and tests from the
- Mustache spec. To include tests from the Mustache spec in your test
-@@ -217,57 +216,33 @@ parses the json files. To install PyYAML--
-=20
-     pip install pyyaml
-=20
-+Once the submodule is available, you can run the full test set with:
-+
-+    tox -e setup . ext/spec/specs
-+
- To run a subset of the tests, you can use
- [nose](http://somethingaboutorange.com/mrl/projects/nose/0.11.1/testing=
.html):
-=20
-     pip install nose
-     nosetests --tests pystache/tests/test_context.py:GetValueTests.test=
_dictionary__key_present
-=20
--### Using Python 3 with Pystache from source
--
--Pystache is written in Python 2 and must be converted to Python 3 prior=
 to
--using it with Python 3.  The installation process (and tox) do this
--automatically.
-=20
--To convert the code to Python 3 manually (while using Python 3)--
-+Mailing List (old)
-+------------------
-=20
--    python setup.py build
--
--This writes the converted code to a subdirectory called `build`.
--By design, Python 3 builds
--[cannot](https://bitbucket.org/tarek/distribute/issue/292/allow-use_2to=
3-with-python-2)
--be created from Python 2.
--
--To convert the code without using setup.py, you can use
--[2to3](http://docs.python.org/library/2to3.html) as follows (two steps)=
--
--
--    2to3 --write --nobackups --no-diffs --doctests_only pystache
--    2to3 --write --nobackups --no-diffs pystache
--
--This converts the code (and doctests) in place.
--
--To `import pystache` from a source distribution while using Python 3, b=
e
--sure that you are importing from a directory containing a converted
--version of the code (e.g. from the `build` directory after converting),
--and not from the original (unconverted) source directory.  Otherwise, y=
ou will
--get a syntax error.  You can help prevent this by not running the Pytho=
n
--IDE from the project directory when importing Pystache while using Pyth=
on 3.
--
--
--Mailing List
--------------
--
--There is a [mailing list](http://librelist.com/browser/pystache/). Note
-+There is(was) a [mailing list](http://librelist.com/browser/pystache/).=
 Note
- that there is a bit of a delay between posting a message and seeing it
- appear in the mailing list archive.
-=20
- Credits
- -------
-=20
--    >>> context =3D { 'author': 'Chris Wanstrath', 'maintainer': 'Chris=
 Jerdonek' }
--    >>> print pystache.render("Author: {{author}}\nMaintainer: {{mainta=
iner}}", context)
-+    >>> import pystache
-+    >>> context =3D { 'author': 'Chris Wanstrath', 'maintainer': 'Chris=
 Jerdonek','refurbisher': 'Steve Arnold' }
-+    >>> print(pystache.render("Author: {{author}}\nMaintainer: {{mainta=
iner}}\nRefurbisher: {{refurbisher}}", context))
-     Author: Chris Wanstrath
-     Maintainer: Chris Jerdonek
-+    Refurbisher: Steve Arnold
-=20
- Pystache logo by [David Phillips](http://davidphillips.us/) is licensed
- under a [Creative Commons Attribution-ShareAlike 3.0 Unported
-diff --git a/TODO.md b/TODO.md
-index cd82417..76853a4 100644
---- a/TODO.md
-+++ b/TODO.md
-@@ -6,11 +6,10 @@ In development branch:
- * Figure out a way to suppress center alignment of images in reST outpu=
t.
- * Add a unit test for the change made in 7ea8e7180c41.  This is with re=
gard
-   to not requiring spec tests when running tests from a downloaded sdis=
t.
--* End support for Python 2.4.
--* Add Python 3.3 to tox file (after deprecating 2.4).
-+* End support for Python 2.7 (done as of 03/03/21 - SA)
-+* Release 0.6.0 on github, make a pypi account (SA)
- * Turn the benchmarking script at pystache/tests/benchmark.py into a co=
mmand
-   in pystache/commands, or make it a subcommand of one of the existing
-   commands (i.e. using a command argument).
- * Provide support for logging in at least one of the commands.
--* Make sure command parsing to pystache-test doesn't break with Python =
2.4 and earlier.
- * Combine pystache-test with the main command.
-diff --git a/conda/meta.yaml b/conda/meta.yaml
-new file mode 100644
-index 0000000..e7f4fd9
---- /dev/null
-+++ b/conda/meta.yaml
-@@ -0,0 +1,50 @@
-+{% set name =3D "pystache" %}
-+{% set version =3D "0.6.0.dev0" %}
-+
-+package:
-+  name: {{ name|lower }}
-+  version: {{ version }}
-+
-+source:
-+  path: ..
-+
-+build:
-+  number: 0
-+  script: {{ PYTHON }} -m pip install . --no-deps --ignore-installed -v=
vv
-+  noarch: python
-+  entry_points:
-+    - pystache =3D pystache.commands.render:main
-+    - pystache-test =3D pystache.commands.test:main
-+
-+requirements:
-+  build:
-+    - python
-+    - setuptools
-+
-+  run:
-+    - python
-+
-+test:
-+  imports:
-+    - pystache
-+    - pystache.commands
-+    - pystache.tests
-+    - pystache.tests.data
-+    - pystache.tests.data.locator
-+    - pystache.tests.examples
-+
-+  commands:
-+    - pystache --help
-+    - pystache-test
-+
-+
-+about:
-+  home: https://github.com/sarnold/pystache
-+  license: MIT
-+  license_family: MIT
-+  license_file: LICENSE
-+  summary: Mustache for Python
-+
-+extra:
-+  recipe-maintainers:
-+    - sarnold
-diff --git a/pyproject.toml b/pyproject.toml
-new file mode 100644
-index 0000000..2f21011
---- /dev/null
-+++ b/pyproject.toml
-@@ -0,0 +1,3 @@
-+[build-system]
-+requires =3D ["setuptools>=3D40.8.0", "wheel"]
-+build-backend =3D "setuptools.build_meta"
-diff --git a/pystache/__init__.py b/pystache/__init__.py
-index 4cf2434..5edc1c5 100644
---- a/pystache/__init__.py
-+++ b/pystache/__init__.py
-@@ -10,4 +10,4 @@ from pystache.init import parse, render, Renderer, Tem=
plateSpec
-=20
- __all__ =3D ['parse', 'render', 'Renderer', 'TemplateSpec']
-=20
--__version__ =3D '0.5.4'  # Also change in setup.py.
-+__version__ =3D '0.6.0'
-diff --git a/pystache/commands/render.py b/pystache/commands/render.py
-index 1a9c309..9c913e7 100644
---- a/pystache/commands/render.py
-+++ b/pystache/commands/render.py
-@@ -22,7 +22,7 @@ except:
-         from sys import exc_info
-         ex_type, ex_value, tb =3D exc_info()
-         new_ex =3D Exception("%s: %s" % (ex_type.__name__, ex_value))
--        raise new_ex.__class__, new_ex, tb
-+        raise new_ex.__class__(new_ex).with_traceback(tb)
-=20
- # The optparse module is deprecated in Python 2.7 in favor of argparse.
- # However, argparse is not available in Python 2.6 and earlier.
-@@ -88,7 +88,7 @@ def main(sys_argv=3Dsys.argv):
-         context =3D json.loads(context)
-=20
-     rendered =3D renderer.render(template, context)
--    print rendered
-+    print(rendered)
-=20
-=20
- if __name__=3D=3D'__main__':
-diff --git a/pystache/common.py b/pystache/common.py
-index fb266dd..0e9b091 100644
---- a/pystache/common.py
-+++ b/pystache/common.py
-@@ -5,17 +5,12 @@ Exposes functionality needed throughout the project.
-=20
- """
-=20
--from sys import version_info
-=20
- def _get_string_types():
--    # TODO: come up with a better solution for this.  One of the issues=
 here
--    #   is that in Python 3 there is no common base class for unicode s=
trings
--    #   and byte strings, and 2to3 seems to convert all of "str", "unic=
ode",
--    #   and "basestring" to Python 3's "str".
--    if version_info < (3, ):
--         return basestring
--    # The latter evaluates to "bytes" in Python 3 -- even after convers=
ion by 2to3.
--    return (unicode, type(u"a".encode('utf-8')))
-+    """
-+    Return the Python3 string type (no more python2)
-+    """
-+    return (str, type("a".encode('utf-8')))
-=20
-=20
- _STRING_TYPES =3D _get_string_types()
-diff --git a/pystache/defaults.py b/pystache/defaults.py
-index bcfdf4c..2fab0e0 100644
---- a/pystache/defaults.py
-+++ b/pystache/defaults.py
-@@ -39,7 +39,7 @@ STRING_ENCODING =3D sys.getdefaultencoding()
- FILE_ENCODING =3D sys.getdefaultencoding()
-=20
- # The delimiters to start with when parsing.
--DELIMITERS =3D (u'{{', u'}}')
-+DELIMITERS =3D ('{{', '}}')
-=20
- # How to handle missing tags when rendering a template.
- MISSING_TAGS =3D MissingTags.ignore
-diff --git a/pystache/loader.py b/pystache/loader.py
-index d4a7e53..ea01d17 100644
---- a/pystache/loader.py
-+++ b/pystache/loader.py
-@@ -6,6 +6,7 @@ This module provides a Loader class for locating and rea=
ding templates.
- """
-=20
- import os
-+import platform
- import sys
-=20
- from pystache import common
-@@ -24,7 +25,7 @@ def _make_to_unicode():
-         """
-         if encoding is None:
-             encoding =3D defaults.STRING_ENCODING
--        return unicode(s, encoding, defaults.DECODE_ERRORS)
-+        return str(s, encoding, defaults.DECODE_ERRORS)
-     return to_unicode
-=20
-=20
-@@ -86,7 +87,7 @@ class Loader(object):
-     def _make_locator(self):
-         return Locator(extension=3Dself.extension)
-=20
--    def unicode(self, s, encoding=3DNone):
-+    def str(self, s, encoding=3DNone):
-         """
-         Convert a string to unicode using the given encoding, and retur=
n it.
-=20
-@@ -104,8 +105,8 @@ class Loader(object):
-             Defaults to None.
-=20
-         """
--        if isinstance(s, unicode):
--            return unicode(s)
-+        if isinstance(s, str):
-+            return str(s)
-=20
-         return self.to_unicode(s, encoding)
-=20
-@@ -118,8 +119,9 @@ class Loader(object):
-=20
-         if encoding is None:
-             encoding =3D self.file_encoding
--
--        return self.unicode(b, encoding)
-+        if platform.system() =3D=3D "Windows":
-+            return self.str(b, encoding).replace('\r', '')
-+        return self.str(b, encoding)
-=20
-     def load_file(self, file_name):
-         """
-diff --git a/pystache/parsed.py b/pystache/parsed.py
-index 372d96c..75d417d 100644
---- a/pystache/parsed.py
-+++ b/pystache/parsed.py
-@@ -41,10 +41,10 @@ class ParsedTemplate(object):
-         """
-         # We avoid use of the ternary operator for Python 2.4 support.
-         def get_unicode(node):
--            if type(node) is unicode:
-+            if type(node) is str:
-                 return node
-             return node.render(engine, context)
--        parts =3D map(get_unicode, self._parse_tree)
-+        parts =3D list(map(get_unicode, self._parse_tree))
-         s =3D ''.join(parts)
-=20
--        return unicode(s)
-+        return str(s)
-diff --git a/pystache/parser.py b/pystache/parser.py
-index c6a171f..1afd50a 100644
---- a/pystache/parser.py
-+++ b/pystache/parser.py
-@@ -11,8 +11,8 @@ from pystache import defaults
- from pystache.parsed import ParsedTemplate
-=20
-=20
--END_OF_LINE_CHARACTERS =3D [u'\r', u'\n']
--NON_BLANK_RE =3D re.compile(ur'^(.)', re.M)
-+END_OF_LINE_CHARACTERS =3D ['\r', '\n']
-+NON_BLANK_RE =3D re.compile(r'^(.)', re.M)
-=20
-=20
- # TODO: add some unit tests for this.
-@@ -30,12 +30,12 @@ def parse(template, delimiters=3DNone):
-=20
-     Examples:
-=20
--    >>> parsed =3D parse(u"Hey {{#who}}{{name}}!{{/who}}")
--    >>> print str(parsed).replace('u', '')  # This is a hack to get the=
 test to pass both in Python 2 and 3.
-+    >>> parsed =3D parse("Hey {{#who}}{{name}}!{{/who}}")
-+    >>> print(str(parsed).replace('u', ''))  # This is an old hack.
-     ['Hey ', _SectionNode(key=3D'who', index_begin=3D12, index_end=3D21=
, parsed=3D[_EscapeNode(key=3D'name'), '!'])]
-=20
-     """
--    if type(template) is not unicode:
-+    if type(template) is not str:
-         raise Exception("Template is not unicode: %s" % type(template))
-     parser =3D _Parser(delimiters)
-     return parser.parse(template)
-@@ -94,7 +94,7 @@ class _CommentNode(object):
-         return _format(self)
-=20
-     def render(self, engine, context):
--        return u''
-+        return ''
-=20
-=20
- class _ChangeNode(object):
-@@ -106,7 +106,7 @@ class _ChangeNode(object):
-         return _format(self)
-=20
-     def render(self, engine, context):
--        return u''
-+        return ''
-=20
-=20
- class _EscapeNode(object):
-@@ -147,7 +147,7 @@ class _PartialNode(object):
-     def render(self, engine, context):
-         template =3D engine.resolve_partial(self.key)
-         # Indent before rendering.
--        template =3D re.sub(NON_BLANK_RE, self.indent + ur'\1', templat=
e)
-+        template =3D re.sub(NON_BLANK_RE, self.indent + r'\1', template=
)
-=20
-         return engine.render(template, context)
-=20
-@@ -168,7 +168,7 @@ class _InvertedNode(object):
-         # Note that lambdas are considered truthy for inverted sections
-         # per the spec.
-         if data:
--            return u''
-+            return ''
-         return self.parsed_section.render(engine, context)
-=20
-=20
-@@ -218,7 +218,7 @@ class _SectionNode(object):
-             parts.append(self.parsed.render(engine, context))
-             context.pop()
-=20
--        return unicode(''.join(parts))
-+        return str(''.join(parts))
-=20
-=20
- class _Parser(object):
-diff --git a/pystache/renderengine.py b/pystache/renderengine.py
-index c797b17..2f1e341 100644
---- a/pystache/renderengine.py
-+++ b/pystache/renderengine.py
-@@ -160,7 +160,7 @@ class RenderEngine(object):
-         if not is_string(val):
-             # In case the template is an integer, for example.
-             val =3D self.to_str(val)
--        if type(val) is not unicode:
-+        if type(val) is not str:
-             val =3D self.literal(val)
-         return self.render(val, context, delimiters)
-=20
-diff --git a/pystache/renderer.py b/pystache/renderer.py
-index ff6a90c..064f040 100644
---- a/pystache/renderer.py
-+++ b/pystache/renderer.py
-@@ -32,7 +32,7 @@ class Renderer(object):
-     >>> partials =3D {'partial': 'Hello, {{thing}}!'}
-     >>> renderer =3D Renderer(partials=3Dpartials)
-     >>> # We apply print to make the test work in Python 3 after 2to3.
--    >>> print renderer.render('{{>partial}}', {'thing': 'world'})
-+    >>> print(renderer.render('{{>partial}}', {'thing': 'world'}))
-     Hello, world!
-=20
-     To customize string coercion (e.g. to render False values as ''), o=
ne can
-@@ -130,7 +130,7 @@ class Renderer(object):
-         if string_encoding is None:
-             string_encoding =3D defaults.STRING_ENCODING
-=20
--        if isinstance(search_dirs, basestring):
-+        if isinstance(search_dirs, str):
-             search_dirs =3D [search_dirs]
-=20
-         self._context =3D None
-@@ -177,16 +177,16 @@ class Renderer(object):
-         """
-         # We type-check to avoid "TypeError: decoding Unicode is not su=
pported".
-         # We avoid the Python ternary operator for Python 2.4 support.
--        if isinstance(s, unicode):
-+        if isinstance(s, str):
-             return s
--        return self.unicode(s)
-+        return self.str(s)
-=20
-     def _to_unicode_hard(self, s):
-         """
-         Convert a basestring to a string with type unicode (not subclas=
s).
-=20
-         """
--        return unicode(self._to_unicode_soft(s))
-+        return str(self._to_unicode_soft(s))
-=20
-     def _escape_to_unicode(self, s):
-         """
-@@ -195,9 +195,9 @@ class Renderer(object):
-         Returns a unicode string (not subclass).
-=20
-         """
--        return unicode(self.escape(self._to_unicode_soft(s)))
-+        return str(self.escape(self._to_unicode_soft(s)))
-=20
--    def unicode(self, b, encoding=3DNone):
-+    def str(self, b, encoding=3DNone):
-         """
-         Convert a byte string to unicode, using string_encoding and dec=
ode_errors.
-=20
-@@ -222,7 +222,7 @@ class Renderer(object):
-=20
-         # TODO: Wrap UnicodeDecodeErrors with a message about setting
-         # the string_encoding and decode_errors attributes.
--        return unicode(b, encoding, self.decode_errors)
-+        return str(b, encoding, self.decode_errors)
-=20
-     def _make_loader(self):
-         """
-@@ -230,7 +230,7 @@ class Renderer(object):
-=20
-         """
-         return Loader(file_encoding=3Dself.file_encoding, extension=3Ds=
elf.file_extension,
--                      to_unicode=3Dself.unicode, search_dirs=3Dself.sea=
rch_dirs)
-+                      to_unicode=3Dself.str, search_dirs=3Dself.search_=
dirs)
-=20
-     def _make_load_template(self):
-         """
-@@ -299,7 +299,7 @@ class Renderer(object):
-             try:
-                 return load_partial(name)
-             except TemplateNotFoundError:
--                return u''
-+                return ''
-=20
-         return resolve_partial
-=20
-@@ -316,7 +316,7 @@ class Renderer(object):
-             try:
-                 return context_get(stack, name)
-             except KeyNotFoundError:
--                return u''
-+                return ''
-=20
-         return resolve_context
-=20
-diff --git a/pystache/specloader.py b/pystache/specloader.py
-index 3a77d4c..a82d52a 100644
---- a/pystache/specloader.py
-+++ b/pystache/specloader.py
-@@ -83,7 +83,7 @@ class SpecLoader(object):
-=20
-         """
-         if spec.template is not None:
--            return self.loader.unicode(spec.template, spec.template_enc=
oding)
-+            return self.loader.str(spec.template, spec.template_encodin=
g)
-=20
-         path =3D self._find(spec)
-=20
-diff --git a/pystache/tests/benchmark.py b/pystache/tests/benchmark.py
-index d46e973..6cb54f8 100755
---- a/pystache/tests/benchmark.py
-+++ b/pystache/tests/benchmark.py
-@@ -13,6 +13,13 @@ tests/benchmark.py 10000
- import sys
- from timeit import Timer
-=20
-+try:
-+    import chevron as pystache
-+    print('Using module: chevron')
-+except (ImportError):
-+    import pystache
-+    print('Using module: pystache')
-+
- import pystache
-=20
- # TODO: make the example realistic.
-@@ -76,17 +83,17 @@ def main(sys_argv):
-     args =3D sys_argv[1:]
-     count =3D int(args[0])
-=20
--    print "Benchmarking: %sx" % count
--    print
-+    print("Benchmarking: %sx" % count)
-+    print()
-=20
-     for example in examples:
-=20
-         test =3D make_test_function(example)
-=20
-         t =3D Timer(test,)
--        print min(t.repeat(repeat=3D3, number=3Dcount))
-+        print(min(t.repeat(repeat=3D3, number=3Dcount)))
-=20
--    print "Done"
-+    print("Done")
-=20
-=20
- if __name__ =3D=3D '__main__':
-diff --git a/pystache/tests/common.py b/pystache/tests/common.py
-index 222e14f..12b76b5 100644
---- a/pystache/tests/common.py
-+++ b/pystache/tests/common.py
-@@ -72,8 +72,8 @@ def _find_files(root_dir, should_include):
-     #   http://docs.python.org/library/os.html#os.walk
-     for dir_path, dir_names, file_names in os.walk(root_dir):
-         new_paths =3D [os.path.join(dir_path, file_name) for file_name =
in file_names]
--        new_paths =3D filter(is_module, new_paths)
--        new_paths =3D filter(should_include, new_paths)
-+        new_paths =3D list(filter(is_module, new_paths))
-+        new_paths =3D list(filter(should_include, new_paths))
-         paths.extend(new_paths)
-=20
-     return paths
-@@ -183,7 +183,7 @@ class AssertExceptionMixin:
-         try:
-             callable(*args, **kwds)
-             raise Exception("Expected exception: %s: %s" % (exception_t=
ype, repr(msg)))
--        except exception_type, err:
-+        except exception_type as err:
-             self.assertEqual(str(err), msg)
-=20
-=20
-@@ -228,10 +228,10 @@ class Attachable(object):
-     """
-     def __init__(self, **kwargs):
-         self.__args__ =3D kwargs
--        for arg, value in kwargs.iteritems():
-+        for arg, value in kwargs.items():
-             setattr(self, arg, value)
-=20
-     def __repr__(self):
-         return "%s(%s)" % (self.__class__.__name__,
-                            ", ".join("%s=3D%s" % (k, repr(v))
--                                     for k, v in self.__args__.iteritem=
s()))
-+                                     for k, v in self.__args__.items())=
)
-diff --git a/pystache/tests/examples/unicode_output.py b/pystache/tests/=
examples/unicode_output.py
-index da0e1d2..7bdea36 100644
---- a/pystache/tests/examples/unicode_output.py
-+++ b/pystache/tests/examples/unicode_output.py
-@@ -8,4 +8,4 @@ TODO: add a docstring.
- class UnicodeOutput(object):
-=20
-     def name(self):
--        return u'Henri Poincar=C3=A9'
-+        return 'Henri Poincar=C3=A9'
-diff --git a/pystache/tests/main.py b/pystache/tests/main.py
-index 8af6b2e..17f2fb2 100644
---- a/pystache/tests/main.py
-+++ b/pystache/tests/main.py
-@@ -88,7 +88,7 @@ def main(sys_argv):
-=20
-     """
-     # TODO: use logging module
--    print "pystache: running tests: argv: %s" % repr(sys_argv)
-+    print("pystache: running tests: argv: %s" % repr(sys_argv))
-=20
-     should_source_exist =3D False
-     spec_test_dir =3D None
-@@ -131,11 +131,9 @@ def main(sys_argv):
-         module_names =3D _discover_test_modules(PACKAGE_DIR)
-         sys_argv.extend(module_names)
-         if project_dir is not None:
--            # Add the current module for unit tests contained here (e.g=
.
--            # to include SetupTests).
-+            # Add the current module for unit tests contained here
-             sys_argv.append(__name__)
-=20
--    SetupTests.project_dir =3D project_dir
-=20
-     extra_tests =3D make_extra_tests(project_dir, spec_test_dir)
-     test_program_class =3D make_test_program_class(extra_tests)
-@@ -166,25 +164,3 @@ def _discover_test_modules(package_dir):
-         raise Exception("No unit-test modules found--\n  in %s" % packa=
ge_dir)
-=20
-     return names
--
--
--class SetupTests(TestCase):
--
--    """Tests about setup.py."""
--
--    project_dir =3D None
--
--    def test_version(self):
--        """
--        Test that setup.py's version matches the package's version.
--
--        """
--        original_path =3D list(sys.path)
--
--        sys.path.insert(0, self.project_dir)
--
--        try:
--            from setup import VERSION
--            self.assertEqual(VERSION, pystache.__version__)
--        finally:
--            sys.path =3D original_path
-diff --git a/pystache/tests/spectesting.py b/pystache/tests/spectesting.=
py
-index ec8a08d..2dd57e8 100644
---- a/pystache/tests/spectesting.py
-+++ b/pystache/tests/spectesting.py
-@@ -37,7 +37,7 @@ except ImportError:
-             from sys import exc_info
-             ex_type, ex_value, tb =3D exc_info()
-             new_ex =3D Exception("%s: %s" % (ex_type.__name__, ex_value=
))
--            raise new_ex.__class__, new_ex, tb
-+            raise new_ex.__class__(new_ex).with_traceback(tb)
-     file_extension =3D 'json'
-     parser =3D json
- else:
-@@ -62,7 +62,7 @@ def get_spec_tests(spec_test_dir):
-=20
-     """
-     # TODO: use logging module instead.
--    print "pystache: spec tests: using %s" % _get_parser_info()
-+    print("pystache: spec tests: using %s" % _get_parser_info())
-=20
-     cases =3D []
-=20
-@@ -103,7 +103,7 @@ def _read_spec_tests(path):
-=20
-     """
-     b =3D common.read(path)
--    u =3D unicode(b, encoding=3DFILE_ENCODING)
-+    u =3D str(b, encoding=3DFILE_ENCODING)
-     spec_data =3D parse(u)
-     tests =3D spec_data['tests']
-=20
-@@ -133,7 +133,7 @@ def _convert_children(node):
-         return
-     # Otherwise, node is a dict, so attempt the conversion.
-=20
--    for key in node.keys():
-+    for key in list(node.keys()):
-         val =3D node[key]
-=20
-         if not isinstance(val, dict) or val.get('__tag__') !=3D 'code':
-@@ -158,9 +158,9 @@ def _deserialize_spec_test(data, file_path):
-     context =3D data['data']
-     description =3D data['desc']
-     # PyYAML seems to leave ASCII strings as byte strings.
--    expected =3D unicode(data['expected'])
-+    expected =3D str(data['expected'])
-     # TODO: switch to using dict.get().
--    partials =3D data.has_key('partials') and data['partials'] or {}
-+    partials =3D 'partials' in data and data['partials'] or {}
-     template =3D data['template']
-     test_name =3D data['name']
-=20
-@@ -237,8 +237,8 @@ def parse(u):
-         value =3D loader.construct_mapping(node)
-         return eval(value['python'], {})
-=20
--    yaml.add_constructor(u'!code', code_constructor)
--    return yaml.load(u)
-+    yaml.add_constructor('!code', code_constructor)
-+    return yaml.full_load(u)
-=20
-=20
- class SpecTestBase(unittest.TestCase, AssertStringMixin):
-diff --git a/pystache/tests/test___init__.py b/pystache/tests/test___ini=
t__.py
-index eae42c1..63d2c3b 100644
---- a/pystache/tests/test___init__.py
-+++ b/pystache/tests/test___init__.py
-@@ -6,9 +6,9 @@ Tests of __init__.py.
- """
-=20
- # Calling "import *" is allowed only at the module level.
--GLOBALS_INITIAL =3D globals().keys()
-+GLOBALS_INITIAL =3D list(globals().keys())
- from pystache import *
--GLOBALS_PYSTACHE_IMPORTED =3D globals().keys()
-+GLOBALS_PYSTACHE_IMPORTED =3D list(globals().keys())
-=20
- import unittest
-=20
-diff --git a/pystache/tests/test_commands.py b/pystache/tests/test_comma=
nds.py
-index 2529d25..34fe8ba 100644
---- a/pystache/tests/test_commands.py
-+++ b/pystache/tests/test_commands.py
-@@ -39,7 +39,7 @@ class CommandsTestCase(unittest.TestCase):
-=20
-         """
-         actual =3D self.callScript("Hi {{thing}}", '{"thing": "world"}'=
)
--        self.assertEqual(actual, u"Hi world\n")
-+        self.assertEqual(actual, "Hi world\n")
-=20
-     def tearDown(self):
-         sys.stdout =3D ORIGINAL_STDOUT
-diff --git a/pystache/tests/test_defaults.py b/pystache/tests/test_defau=
lts.py
-index c78ea7c..5399bb0 100644
---- a/pystache/tests/test_defaults.py
-+++ b/pystache/tests/test_defaults.py
-@@ -31,37 +31,37 @@ class DefaultsConfigurableTestCase(unittest.TestCase=
, AssertStringMixin):
-             self.saved[e] =3D getattr(pystache.defaults, e)
-=20
-     def tearDown(self):
--        for key, value in self.saved.items():
-+        for key, value in list(self.saved.items()):
-             setattr(pystache.defaults, key, value)
-=20
-     def test_tag_escape(self):
-         """Test that changes to defaults.TAG_ESCAPE take effect."""
--        template =3D u"{{foo}}"
-+        template =3D "{{foo}}"
-         context =3D {'foo': '<'}
-         actual =3D pystache.render(template, context)
--        self.assertString(actual, u"&lt;")
-+        self.assertString(actual, "&lt;")
-=20
-         pystache.defaults.TAG_ESCAPE =3D lambda u: u
-         actual =3D pystache.render(template, context)
--        self.assertString(actual, u"<")
-+        self.assertString(actual, "<")
-=20
-     def test_delimiters(self):
-         """Test that changes to defaults.DELIMITERS take effect."""
--        template =3D u"[[foo]]{{foo}}"
-+        template =3D "[[foo]]{{foo}}"
-         context =3D {'foo': 'FOO'}
-         actual =3D pystache.render(template, context)
--        self.assertString(actual, u"[[foo]]FOO")
-+        self.assertString(actual, "[[foo]]FOO")
-=20
-         pystache.defaults.DELIMITERS =3D ('[[', ']]')
-         actual =3D pystache.render(template, context)
--        self.assertString(actual, u"FOO{{foo}}")
-+        self.assertString(actual, "FOO{{foo}}")
-=20
-     def test_missing_tags(self):
-         """Test that changes to defaults.MISSING_TAGS take effect."""
--        template =3D u"{{foo}}"
-+        template =3D "{{foo}}"
-         context =3D {}
-         actual =3D pystache.render(template, context)
--        self.assertString(actual, u"")
-+        self.assertString(actual, "")
-=20
-         pystache.defaults.MISSING_TAGS =3D 'strict'
-         self.assertRaises(pystache.context.KeyNotFoundError,
-diff --git a/pystache/tests/test_examples.py b/pystache/tests/test_examp=
les.py
-index 5c9f74d..9f93de3 100644
---- a/pystache/tests/test_examples.py
-+++ b/pystache/tests/test_examples.py
-@@ -7,15 +7,15 @@ TODO: add a docstring.
-=20
- import unittest
-=20
--from examples.comments import Comments
--from examples.double_section import DoubleSection
--from examples.escaped import Escaped
--from examples.unescaped import Unescaped
--from examples.template_partial import TemplatePartial
--from examples.delimiters import Delimiters
--from examples.unicode_output import UnicodeOutput
--from examples.unicode_input import UnicodeInput
--from examples.nested_context import NestedContext
-+from .examples.comments import Comments
-+from .examples.double_section import DoubleSection
-+from .examples.escaped import Escaped
-+from .examples.unescaped import Unescaped
-+from .examples.template_partial import TemplatePartial
-+from .examples.delimiters import Delimiters
-+from .examples.unicode_output import UnicodeOutput
-+from .examples.unicode_input import UnicodeInput
-+from .examples.nested_context import NestedContext
- from pystache import Renderer
- from pystache.tests.common import EXAMPLES_DIR
- from pystache.tests.common import AssertStringMixin
-@@ -29,34 +29,34 @@ class TestView(unittest.TestCase, AssertStringMixin)=
:
-         self.assertString(actual, expected)
-=20
-     def test_comments(self):
--        self._assert(Comments(), u"<h1>A Comedy of Errors</h1>")
-+        self._assert(Comments(), "<h1>A Comedy of Errors</h1>")
-=20
-     def test_double_section(self):
--        self._assert(DoubleSection(), u"* first\n* second\n* third")
-+        self._assert(DoubleSection(), "* first\n* second\n* third")
-=20
-     def test_unicode_output(self):
-         renderer =3D Renderer()
-         actual =3D renderer.render(UnicodeOutput())
--        self.assertString(actual, u'<p>Name: Henri Poincar=C3=A9</p>')
-+        self.assertString(actual, '<p>Name: Henri Poincar=C3=A9</p>')
-=20
-     def test_unicode_input(self):
-         renderer =3D Renderer()
-         actual =3D renderer.render(UnicodeInput())
--        self.assertString(actual, u'abcd=C3=A9')
-+        self.assertString(actual, 'abcd=C3=A9')
-=20
-     def test_escaping(self):
--        self._assert(Escaped(), u"<h1>Bear &gt; Shark</h1>")
-+        self._assert(Escaped(), "<h1>Bear &gt; Shark</h1>")
-=20
-     def test_literal(self):
-         renderer =3D Renderer()
-         actual =3D renderer.render(Unescaped())
--        self.assertString(actual, u"<h1>Bear > Shark</h1>")
-+        self.assertString(actual, "<h1>Bear > Shark</h1>")
-=20
-     def test_template_partial(self):
-         renderer =3D Renderer(search_dirs=3DEXAMPLES_DIR)
-         actual =3D renderer.render(TemplatePartial(renderer=3Drenderer)=
)
-=20
--        self.assertString(actual, u"""<h1>Welcome</h1>
-+        self.assertString(actual, """<h1>Welcome</h1>
- Again, Welcome!""")
-=20
-     def test_template_partial_extension(self):
-@@ -65,7 +65,7 @@ Again, Welcome!""")
-         view =3D TemplatePartial(renderer=3Drenderer)
-=20
-         actual =3D renderer.render(view)
--        self.assertString(actual, u"""Welcome
-+        self.assertString(actual, """Welcome
- -------
-=20
- ## Again, Welcome! ##""")
-@@ -73,7 +73,7 @@ Again, Welcome!""")
-     def test_delimiters(self):
-         renderer =3D Renderer()
-         actual =3D renderer.render(Delimiters())
--        self.assertString(actual, u"""\
-+        self.assertString(actual, """\
- * It worked the first time.
- * And it worked the second time.
- * Then, surprisingly, it worked the third time.
-@@ -82,7 +82,7 @@ Again, Welcome!""")
-     def test_nested_context(self):
-         renderer =3D Renderer()
-         actual =3D renderer.render(NestedContext(renderer))
--        self.assertString(actual, u"one and foo and two")
-+        self.assertString(actual, "one and foo and two")
-=20
-     def test_nested_context_is_available_in_view(self):
-         renderer =3D Renderer()
-@@ -91,7 +91,7 @@ Again, Welcome!""")
-         view.template =3D '{{#herp}}{{#derp}}{{nested_context_in_view}}=
{{/derp}}{{/herp}}'
-=20
-         actual =3D renderer.render(view)
--        self.assertString(actual, u'it works!')
-+        self.assertString(actual, 'it works!')
-=20
-     def test_partial_in_partial_has_access_to_grand_parent_context(self=
):
-         renderer =3D Renderer(search_dirs=3DEXAMPLES_DIR)
-diff --git a/pystache/tests/test_loader.py b/pystache/tests/test_loader.=
py
-index f2c2187..315daff 100644
---- a/pystache/tests/test_loader.py
-+++ b/pystache/tests/test_loader.py
-@@ -55,23 +55,23 @@ class LoaderTests(unittest.TestCase, AssertStringMix=
in, SetupDefaults):
-=20
-     def test_init__to_unicode__default(self):
-         loader =3D Loader()
--        self.assertRaises(TypeError, loader.to_unicode, u"abc")
-+        self.assertRaises(TypeError, loader.to_unicode, "abc")
-=20
-         decode_errors =3D defaults.DECODE_ERRORS
-         string_encoding =3D defaults.STRING_ENCODING
-=20
--        nonascii =3D u'abcd=C3=A9'.encode('utf-8')
-+        nonascii =3D 'abcd=C3=A9'.encode('utf-8')
-=20
-         loader =3D Loader()
-         self.assertRaises(UnicodeDecodeError, loader.to_unicode, nonasc=
ii)
-=20
-         defaults.DECODE_ERRORS =3D 'ignore'
-         loader =3D Loader()
--        self.assertString(loader.to_unicode(nonascii), u'abcd')
-+        self.assertString(loader.to_unicode(nonascii), 'abcd')
-=20
-         defaults.STRING_ENCODING =3D 'utf-8'
-         loader =3D Loader()
--        self.assertString(loader.to_unicode(nonascii), u'abcd=C3=A9')
-+        self.assertString(loader.to_unicode(nonascii), 'abcd=C3=A9')
-=20
-=20
-     def _get_path(self, filename):
-@@ -83,9 +83,9 @@ class LoaderTests(unittest.TestCase, AssertStringMixin=
, SetupDefaults):
-=20
-         """
-         loader =3D Loader()
--        actual =3D loader.unicode("foo")
-+        actual =3D loader.str("foo")
-=20
--        self.assertString(actual, u"foo")
-+        self.assertString(actual, "foo")
-=20
-     def test_unicode__basic__input_unicode(self):
-         """
-@@ -93,24 +93,24 @@ class LoaderTests(unittest.TestCase, AssertStringMix=
in, SetupDefaults):
-=20
-         """
-         loader =3D Loader()
--        actual =3D loader.unicode(u"foo")
-+        actual =3D loader.str("foo")
-=20
--        self.assertString(actual, u"foo")
-+        self.assertString(actual, "foo")
-=20
-     def test_unicode__basic__input_unicode_subclass(self):
-         """
-         Test unicode(): default arguments with unicode-subclass input.
-=20
-         """
--        class UnicodeSubclass(unicode):
-+        class UnicodeSubclass(str):
-             pass
-=20
--        s =3D UnicodeSubclass(u"foo")
-+        s =3D UnicodeSubclass("foo")
-=20
-         loader =3D Loader()
--        actual =3D loader.unicode(s)
-+        actual =3D loader.str(s)
-=20
--        self.assertString(actual, u"foo")
-+        self.assertString(actual, "foo")
-=20
-     def test_unicode__to_unicode__attribute(self):
-         """
-@@ -119,16 +119,16 @@ class LoaderTests(unittest.TestCase, AssertStringM=
ixin, SetupDefaults):
-         """
-         loader =3D Loader()
-=20
--        non_ascii =3D u'abcd=C3=A9'.encode('utf-8')
--        self.assertRaises(UnicodeDecodeError, loader.unicode, non_ascii=
)
-+        non_ascii =3D 'abcd=C3=A9'.encode('utf-8')
-+        self.assertRaises(UnicodeDecodeError, loader.str, non_ascii)
-=20
-         def to_unicode(s, encoding=3DNone):
-             if encoding is None:
-                 encoding =3D 'utf-8'
--            return unicode(s, encoding)
-+            return str(s, encoding)
-=20
-         loader.to_unicode =3D to_unicode
--        self.assertString(loader.unicode(non_ascii), u"abcd=C3=A9")
-+        self.assertString(loader.str(non_ascii), "abcd=C3=A9")
-=20
-     def test_unicode__encoding_argument(self):
-         """
-@@ -137,12 +137,12 @@ class LoaderTests(unittest.TestCase, AssertStringM=
ixin, SetupDefaults):
-         """
-         loader =3D Loader()
-=20
--        non_ascii =3D u'abcd=C3=A9'.encode('utf-8')
-+        non_ascii =3D 'abcd=C3=A9'.encode('utf-8')
-=20
--        self.assertRaises(UnicodeDecodeError, loader.unicode, non_ascii=
)
-+        self.assertRaises(UnicodeDecodeError, loader.str, non_ascii)
-=20
--        actual =3D loader.unicode(non_ascii, encoding=3D'utf-8')
--        self.assertString(actual, u'abcd=C3=A9')
-+        actual =3D loader.str(non_ascii, encoding=3D'utf-8')
-+        self.assertString(actual, 'abcd=C3=A9')
-=20
-     # TODO: check the read() unit tests.
-     def test_read(self):
-@@ -153,7 +153,7 @@ class LoaderTests(unittest.TestCase, AssertStringMix=
in, SetupDefaults):
-         loader =3D Loader()
-         path =3D self._get_path('ascii.mustache')
-         actual =3D loader.read(path)
--        self.assertString(actual, u'ascii: abc')
-+        self.assertString(actual, 'ascii: abc')
-=20
-     def test_read__file_encoding__attribute(self):
-         """
-@@ -167,7 +167,7 @@ class LoaderTests(unittest.TestCase, AssertStringMix=
in, SetupDefaults):
-=20
-         loader.file_encoding =3D 'utf-8'
-         actual =3D loader.read(path)
--        self.assertString(actual, u'non-ascii: =C3=A9')
-+        self.assertString(actual, 'non-ascii: =C3=A9')
-=20
-     def test_read__encoding__argument(self):
-         """
-@@ -180,7 +180,7 @@ class LoaderTests(unittest.TestCase, AssertStringMix=
in, SetupDefaults):
-         self.assertRaises(UnicodeDecodeError, loader.read, path)
-=20
-         actual =3D loader.read(path, encoding=3D'utf-8')
--        self.assertString(actual, u'non-ascii: =C3=A9')
-+        self.assertString(actual, 'non-ascii: =C3=A9')
-=20
-     def test_read__to_unicode__attribute(self):
-         """
-diff --git a/pystache/tests/test_pystache.py b/pystache/tests/test_pysta=
che.py
-index 5447f8d..cf5d6af 100644
---- a/pystache/tests/test_pystache.py
-+++ b/pystache/tests/test_pystache.py
-@@ -71,14 +71,14 @@ class PystacheTests(unittest.TestCase):
-         template =3D "{{#stats}}({{key}} & {{value}}){{/stats}}"
-         stats =3D []
-         stats.append({'key': 123, 'value': ['something']})
--        stats.append({'key': u"chris", 'value': 0.900})
-+        stats.append({'key': "chris", 'value': 0.900})
-         context =3D { 'stats': stats }
-         self._assert_rendered(self.non_strings_expected, template, cont=
ext)
-=20
-     def test_unicode(self):
-         template =3D 'Name: {{name}}; Age: {{age}}'
--        context =3D {'name': u'Henri Poincar=C3=A9', 'age': 156 }
--        self._assert_rendered(u'Name: Henri Poincar=C3=A9; Age: 156', t=
emplate, context)
-+        context =3D {'name': 'Henri Poincar=C3=A9', 'age': 156}
-+        self._assert_rendered('Name: Henri Poincar=C3=A9; Age: 156', te=
mplate, context)
-=20
-     def test_sections(self):
-         template =3D """<ul>{{#users}}<li>{{name}}</li>{{/users}}</ul>"=
""
-diff --git a/pystache/tests/test_renderengine.py b/pystache/tests/test_r=
enderengine.py
-index db916f7..ed604c5 100644
---- a/pystache/tests/test_renderengine.py
-+++ b/pystache/tests/test_renderengine.py
-@@ -33,11 +33,11 @@ def mock_literal(s):
-       s: a byte string or unicode string.
-=20
-     """
--    if isinstance(s, unicode):
-+    if isinstance(s, str):
-         # Strip off unicode super classes, if present.
--        u =3D unicode(s)
-+        u =3D str(s)
-     else:
--        u =3D unicode(s, encoding=3D'ascii')
-+        u =3D str(s, encoding=3D'ascii')
-=20
-     # We apply upper() to make sure we are actually using our custom
-     # function in the tests
-@@ -94,17 +94,17 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         engine =3D kwargs.get('engine', self._engine())
-=20
-         if partials is not None:
--            engine.resolve_partial =3D lambda key: unicode(partials[key=
])
-+            engine.resolve_partial =3D lambda key: str(partials[key])
-=20
-         context =3D ContextStack(*context)
-=20
-         # RenderEngine.render() only accepts unicode template strings.
--        actual =3D engine.render(unicode(template), context)
-+        actual =3D engine.render(str(template), context)
-=20
-         self.assertString(actual=3Dactual, expected=3Dexpected)
-=20
-     def test_render(self):
--        self._assert_render(u'Hi Mom', 'Hi {{person}}', {'person': 'Mom=
'})
-+        self._assert_render('Hi Mom', 'Hi {{person}}', {'person': 'Mom'=
})
-=20
-     def test__resolve_partial(self):
-         """
-@@ -112,10 +112,10 @@ class RenderTests(unittest.TestCase, AssertStringM=
ixin, AssertExceptionMixin):
-=20
-         """
-         engine =3D self._engine()
--        partials =3D {'partial': u"{{person}}"}
-+        partials =3D {'partial': "{{person}}"}
-         engine.resolve_partial =3D lambda key: partials[key]
-=20
--        self._assert_render(u'Hi Mom', 'Hi {{>partial}}', {'person': 'M=
om'}, engine=3Dengine)
-+        self._assert_render('Hi Mom', 'Hi {{>partial}}', {'person': 'Mo=
m'}, engine=3Dengine)
-=20
-     def test__literal(self):
-         """
-@@ -125,13 +125,13 @@ class RenderTests(unittest.TestCase, AssertStringM=
ixin, AssertExceptionMixin):
-         engine =3D self._engine()
-         engine.literal =3D lambda s: s.upper()
-=20
--        self._assert_render(u'BAR', '{{{foo}}}', {'foo': 'bar'}, engine=
=3Dengine)
-+        self._assert_render('BAR', '{{{foo}}}', {'foo': 'bar'}, engine=3D=
engine)
-=20
-     def test_literal__sigil(self):
-         template =3D "<h1>{{& thing}}</h1>"
-         context =3D {'thing': 'Bear > Giraffe'}
-=20
--        expected =3D u"<h1>Bear > Giraffe</h1>"
-+        expected =3D "<h1>Bear > Giraffe</h1>"
-=20
-         self._assert_render(expected, template, context)
-=20
-@@ -143,7 +143,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         engine =3D self._engine()
-         engine.escape =3D lambda s: "**" + s
-=20
--        self._assert_render(u'**bar', '{{foo}}', {'foo': 'bar'}, engine=
=3Dengine)
-+        self._assert_render('**bar', '{{foo}}', {'foo': 'bar'}, engine=3D=
engine)
-=20
-     def test__escape_does_not_call_literal(self):
-         """
-@@ -157,7 +157,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D 'literal: {{{foo}}} escaped: {{foo}}'
-         context =3D {'foo': 'bar'}
-=20
--        self._assert_render(u'literal: BAR escaped: **bar', template, c=
ontext, engine=3Dengine)
-+        self._assert_render('literal: BAR escaped: **bar', template, co=
ntext, engine=3Dengine)
-=20
-     def test__escape_preserves_unicode_subclasses(self):
-         """
-@@ -167,7 +167,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         variable value is markupsafe.Markup when escaping.
-=20
-         """
--        class MyUnicode(unicode):
-+        class MyUnicode(str):
-             pass
-=20
-         def escape(s):
-@@ -182,7 +182,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D '{{foo1}} {{foo2}}'
-         context =3D {'foo1': MyUnicode('bar'), 'foo2': 'bar'}
-=20
--        self._assert_render(u'**bar bar**', template, context, engine=3D=
engine)
-+        self._assert_render('**bar bar**', template, context, engine=3D=
engine)
-=20
-     # Custom to_str for testing purposes.
-     def _to_str(self, val):
-@@ -197,9 +197,9 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D '{{value}}'
-         context =3D {'value': None}
-=20
--        self._assert_render(u'None', template, context, engine=3Dengine=
)
-+        self._assert_render('None', template, context, engine=3Dengine)
-         engine.to_str =3D self._to_str
--        self._assert_render(u'', template, context, engine=3Dengine)
-+        self._assert_render('', template, context, engine=3Dengine)
-=20
-     def test_to_str__lambda(self):
-         """Test the to_str attribute for a lambda."""
-@@ -207,9 +207,9 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D '{{value}}'
-         context =3D {'value': lambda: None}
-=20
--        self._assert_render(u'None', template, context, engine=3Dengine=
)
-+        self._assert_render('None', template, context, engine=3Dengine)
-         engine.to_str =3D self._to_str
--        self._assert_render(u'', template, context, engine=3Dengine)
-+        self._assert_render('', template, context, engine=3Dengine)
-=20
-     def test_to_str__section_list(self):
-         """Test the to_str attribute for a section list."""
-@@ -217,9 +217,9 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D '{{#list}}{{.}}{{/list}}'
-         context =3D {'list': [None, None]}
-=20
--        self._assert_render(u'NoneNone', template, context, engine=3Den=
gine)
-+        self._assert_render('NoneNone', template, context, engine=3Deng=
ine)
-         engine.to_str =3D self._to_str
--        self._assert_render(u'', template, context, engine=3Dengine)
-+        self._assert_render('', template, context, engine=3Dengine)
-=20
-     def test_to_str__section_lambda(self):
-         # TODO: add a test for a "method with an arity of 1".
-@@ -239,7 +239,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D '{{text}} {{int}} {{{int}}}'
-         context =3D {'int': 100, 'text': 'foo'}
-=20
--        self._assert_render(u'FOO 100 100', template, context, engine=3D=
engine)
-+        self._assert_render('FOO 100 100', template, context, engine=3D=
engine)
-=20
-     def test_tag__output_not_interpolated(self):
-         """
-@@ -248,7 +248,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         """
-         template =3D '{{template}}: {{planet}}'
-         context =3D {'template': '{{planet}}', 'planet': 'Earth'}
--        self._assert_render(u'{{planet}}: Earth', template, context)
-+        self._assert_render('{{planet}}: Earth', template, context)
-=20
-     def test_tag__output_not_interpolated__section(self):
-         """
-@@ -257,7 +257,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         """
-         template =3D '{{test}}'
-         context =3D {'test': '{{#hello}}'}
--        self._assert_render(u'{{#hello}}', template, context)
-+        self._assert_render('{{#hello}}', template, context)
-=20
-     ## Test interpolation with "falsey" values
-     #
-@@ -268,17 +268,17 @@ class RenderTests(unittest.TestCase, AssertStringM=
ixin, AssertExceptionMixin):
-     def test_interpolation__falsey__zero(self):
-         template =3D '{{.}}'
-         context =3D 0
--        self._assert_render(u'0', template, context)
-+        self._assert_render('0', template, context)
-=20
-     def test_interpolation__falsey__none(self):
-         template =3D '{{.}}'
-         context =3D None
--        self._assert_render(u'None', template, context)
-+        self._assert_render('None', template, context)
-=20
-     def test_interpolation__falsey__zero(self):
-         template =3D '{{.}}'
-         context =3D False
--        self._assert_render(u'False', template, context)
-+        self._assert_render('False', template, context)
-=20
-     # Built-in types:
-     #
-@@ -310,7 +310,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         Check tag interpolation with a built-in type: string.
-=20
-         """
--        self._assert_builtin_type('abc', 'upper', 'ABC', u'xyz')
-+        self._assert_builtin_type('abc', 'upper', 'ABC', 'xyz')
-=20
-     def test_interpolation__built_in_type__integer(self):
-         """
-@@ -324,7 +324,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         #
-         # we need to resort to built-in attributes (double-underscored)=
 on
-         # the integer type.
--        self._assert_builtin_type(15, '__neg__', -15, u'999')
-+        self._assert_builtin_type(15, '__neg__', -15, '999')
-=20
-     def test_interpolation__built_in_type__list(self):
-         """
-@@ -338,7 +338,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-=20
-         template =3D '{{#section}}{{%s}}{{/section}}' % attr_name
-         context =3D {'section': item, attr_name: 7}
--        self._assert_render(u'7', template, context)
-+        self._assert_render('7', template, context)
-=20
-     # This test is also important for testing 2to3.
-     def test_interpolation__nonascii_nonunicode(self):
-@@ -347,8 +347,8 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-=20
-         """
-         template =3D '{{nonascii}}'
--        context =3D {'nonascii': u'abcd=C3=A9'.encode('utf-8')}
--        self._assert_render(u'abcd=C3=A9', template, context)
-+        context =3D {'nonascii': 'abcd=C3=A9'.encode('utf-8')}
-+        self._assert_render('abcd=C3=A9', template, context)
-=20
-     def test_implicit_iterator__literal(self):
-         """
-@@ -358,7 +358,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D """{{#test}}{{{.}}}{{/test}}"""
-         context =3D {'test': ['<', '>']}
-=20
--        self._assert_render(u'<>', template, context)
-+        self._assert_render('<>', template, context)
-=20
-     def test_implicit_iterator__escaped(self):
-         """
-@@ -368,7 +368,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D """{{#test}}{{.}}{{/test}}"""
-         context =3D {'test': ['<', '>']}
-=20
--        self._assert_render(u'&lt;&gt;', template, context)
-+        self._assert_render('&lt;&gt;', template, context)
-=20
-     def test_literal__in_section(self):
-         """
-@@ -378,7 +378,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D '{{#test}}1 {{{less_than}}} 2{{/test}}'
-         context =3D {'test': {'less_than': '<'}}
-=20
--        self._assert_render(u'1 < 2', template, context)
-+        self._assert_render('1 < 2', template, context)
-=20
-     def test_literal__in_partial(self):
-         """
-@@ -389,11 +389,11 @@ class RenderTests(unittest.TestCase, AssertStringM=
ixin, AssertExceptionMixin):
-         partials =3D {'partial': '1 {{{less_than}}} 2'}
-         context =3D {'less_than': '<'}
-=20
--        self._assert_render(u'1 < 2', template, context, partials=3Dpar=
tials)
-+        self._assert_render('1 < 2', template, context, partials=3Dpart=
ials)
-=20
-     def test_partial(self):
-         partials =3D {'partial': "{{person}}"}
--        self._assert_render(u'Hi Mom', 'Hi {{>partial}}', {'person': 'M=
om'}, partials=3Dpartials)
-+        self._assert_render('Hi Mom', 'Hi {{>partial}}', {'person': 'Mo=
m'}, partials=3Dpartials)
-=20
-     def test_partial__context_values(self):
-         """
-@@ -406,7 +406,9 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         partials =3D {'partial': 'unescaped: {{{foo}}} escaped: {{foo}}=
'}
-         context =3D {'foo': '<'}
-=20
--        self._assert_render(u'unescaped: < escaped: &lt;', template, co=
ntext, engine=3Dengine, partials=3Dpartials)
-+        self._assert_render(
-+            'unescaped: < escaped: &lt;',
-+            template, context, engine=3Dengine, partials=3Dpartials)
-=20
-     ## Test cases related specifically to lambdas.
-=20
-@@ -417,8 +419,8 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-=20
-         """
-         template =3D '{{#nonascii}}{{.}}{{/nonascii}}'
--        context =3D {'nonascii': u'abcd=C3=A9'.encode('utf-8')}
--        self._assert_render(u'abcd=C3=A9', template, context)
-+        context =3D {'nonascii': 'abcd=C3=A9'.encode('utf-8')}
-+        self._assert_render('abcd=C3=A9', template, context)
-=20
-     # This test is also important for testing 2to3.
-     def test_lambda__returning_nonascii_nonunicode(self):
-@@ -427,8 +429,8 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-=20
-         """
-         template =3D '{{lambda}}'
--        context =3D {'lambda': lambda: u'abcd=C3=A9'.encode('utf-8')}
--        self._assert_render(u'abcd=C3=A9', template, context)
-+        context =3D {'lambda': lambda: 'abcd=C3=A9'.encode('utf-8')}
-+        self._assert_render('abcd=C3=A9', template, context)
-=20
-     ## Test cases related specifically to sections.
-=20
-@@ -440,7 +442,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D '{{/section}}'
-         try:
-             self._assert_render(None, template)
--        except ParsingError, err:
-+        except ParsingError as err:
-             self.assertEqual(str(err), "Section end tag mismatch: secti=
on !=3D None")
-=20
-     def test_section__end_tag_mismatch(self):
-@@ -451,7 +453,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D '{{#section_start}}{{/section_end}}'
-         try:
-             self._assert_render(None, template)
--        except ParsingError, err:
-+        except ParsingError as err:
-             self.assertEqual(str(err), "Section end tag mismatch: secti=
on_end !=3D section_start")
-=20
-     def test_section__context_values(self):
-@@ -464,7 +466,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D '{{#test}}unescaped: {{{foo}}} escaped: {{foo}}{{/=
test}}'
-         context =3D {'test': {'foo': '<'}}
-=20
--        self._assert_render(u'unescaped: < escaped: &lt;', template, co=
ntext, engine=3Dengine)
-+        self._assert_render('unescaped: < escaped: &lt;', template, con=
text, engine=3Dengine)
-=20
-     def test_section__context_precedence(self):
-         """
-@@ -473,7 +475,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         """
-         template =3D '{{entree}} : {{#vegetarian}}{{entree}}{{/vegetari=
an}}'
-         context =3D {'entree': 'chicken', 'vegetarian': {'entree': 'bea=
ns and rice'}}
--        self._assert_render(u'chicken : beans and rice', template, cont=
ext)
-+        self._assert_render('chicken : beans and rice', template, conte=
xt)
-=20
-     def test_section__list_referencing_outer_context(self):
-         """
-@@ -491,7 +493,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-=20
-         template =3D "{{#list}}{{greeting}} {{name}}, {{/list}}"
-=20
--        self._assert_render(u"Hi Al, Hi Bob, ", template, context)
-+        self._assert_render("Hi Al, Hi Bob, ", template, context)
-=20
-     def test_section__output_not_interpolated(self):
-         """
-@@ -500,7 +502,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         """
-         template =3D '{{#section}}{{template}}{{/section}}: {{planet}}'
-         context =3D {'section': True, 'template': '{{planet}}', 'planet=
': 'Earth'}
--        self._assert_render(u'{{planet}}: Earth', template, context)
-+        self._assert_render('{{planet}}: Earth', template, context)
-=20
-     # TODO: have this test case added to the spec.
-     def test_section__string_values_not_lists(self):
-@@ -511,7 +513,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D '{{#section}}foo{{/section}}'
-         context =3D {'section': '123'}
-         # If strings were interpreted as lists, this would give "foofoo=
foo".
--        self._assert_render(u'foo', template, context)
-+        self._assert_render('foo', template, context)
-=20
-     def test_section__nested_truthy(self):
-         """
-@@ -525,7 +527,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         """
-         template =3D '| A {{#bool}}B {{#bool}}C{{/bool}} D{{/bool}} E |=
'
-         context =3D {'bool': True}
--        self._assert_render(u'| A B C D E |', template, context)
-+        self._assert_render('| A B C D E |', template, context)
-=20
-     def test_section__nested_with_same_keys(self):
-         """
-@@ -537,16 +539,16 @@ class RenderTests(unittest.TestCase, AssertStringM=
ixin, AssertExceptionMixin):
-         # Start with an easier, working case.
-         template =3D '{{#x}}{{#z}}{{y}}{{/z}}{{/x}}'
-         context =3D {'x': {'z': {'y': 1}}}
--        self._assert_render(u'1', template, context)
-+        self._assert_render('1', template, context)
-=20
-         template =3D '{{#x}}{{#x}}{{y}}{{/x}}{{/x}}'
-         context =3D {'x': {'x': {'y': 1}}}
--        self._assert_render(u'1', template, context)
-+        self._assert_render('1', template, context)
-=20
-     def test_section__lambda(self):
-         template =3D '{{#test}}Mom{{/test}}'
-         context =3D {'test': (lambda text: 'Hi %s' % text)}
--        self._assert_render(u'Hi Mom', template, context)
-+        self._assert_render('Hi Mom', template, context)
-=20
-     # This test is also important for testing 2to3.
-     def test_section__lambda__returning_nonascii_nonunicode(self):
-@@ -555,8 +557,8 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-=20
-         """
-         template =3D '{{#lambda}}{{/lambda}}'
--        context =3D {'lambda': lambda text: u'abcd=C3=A9'.encode('utf-8=
')}
--        self._assert_render(u'abcd=C3=A9', template, context)
-+        context =3D {'lambda': lambda text: 'abcd=C3=A9'.encode('utf-8'=
)}
-+        self._assert_render('abcd=C3=A9', template, context)
-=20
-     def test_section__lambda__returning_nonstring(self):
-         """
-@@ -565,7 +567,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         """
-         template =3D '{{#lambda}}foo{{/lambda}}'
-         context =3D {'lambda': lambda text: len(text)}
--        self._assert_render(u'3', template, context)
-+        self._assert_render('3', template, context)
-=20
-     def test_section__iterable(self):
-         """
-@@ -575,10 +577,10 @@ class RenderTests(unittest.TestCase, AssertStringM=
ixin, AssertExceptionMixin):
-         template =3D '{{#iterable}}{{.}}{{/iterable}}'
-=20
-         context =3D {'iterable': (i for i in range(3))}  # type 'genera=
tor'
--        self._assert_render(u'012', template, context)
-+        self._assert_render('012', template, context)
-=20
--        context =3D {'iterable': xrange(4)}  # type 'xrange'
--        self._assert_render(u'0123', template, context)
-+        context =3D {'iterable': range(4)}  # type 'xrange'
-+        self._assert_render('0123', template, context)
-=20
-         d =3D {'foo': 0, 'bar': 0}
-         # We don't know what order of keys we'll be given, but from the
-@@ -586,8 +588,8 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         #  "If items(), keys(), values(), iteritems(), iterkeys(), and
-         #   itervalues() are called with no intervening modifications t=
o
-         #   the dictionary, the lists will directly correspond."
--        expected =3D u''.join(d.keys())
--        context =3D {'iterable': d.iterkeys()}  # type 'dictionary-keyi=
terator'
-+        expected =3D ''.join(list(d.keys()))
-+        context =3D {'iterable': iter(d.keys())}  # type 'dictionary-ke=
yiterator'
-         self._assert_render(expected, template, context)
-=20
-     def test_section__lambda__tag_in_output(self):
-@@ -605,7 +607,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         """
-         template =3D '{{#test}}Hi {{person}}{{/test}}'
-         context =3D {'person': 'Mom', 'test': (lambda text: text + " :)=
")}
--        self._assert_render(u'Hi Mom :)', template, context)
-+        self._assert_render('Hi Mom :)', template, context)
-=20
-     def test_section__lambda__list(self):
-         """
-@@ -621,7 +623,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-                    'lambdas': [lambda text: "~{{%s}}~" % text,
-                                lambda text: "#{{%s}}#" % text]}
-=20
--        self._assert_render(u'<~bar~#bar#>', template, context)
-+        self._assert_render('<~bar~#bar#>', template, context)
-=20
-     def test_section__lambda__mixed_list(self):
-         """
-@@ -636,7 +638,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         context =3D {'foo': 'bar',
-                    'lambdas': [lambda text: "~{{%s}}~" % text, 1]}
-=20
--        self._assert_render(u'<~bar~foo>', template, context)
-+        self._assert_render('<~bar~foo>', template, context)
-=20
-     def test_section__lambda__not_on_context_stack(self):
-         """
-@@ -653,7 +655,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         """
-         context =3D {'foo': 'bar', 'lambda': (lambda text: "{{.}}")}
-         template =3D '{{#foo}}{{#lambda}}blah{{/lambda}}{{/foo}}'
--        self._assert_render(u'bar', template, context)
-+        self._assert_render('bar', template, context)
-=20
-     def test_section__lambda__no_reinterpolation(self):
-         """
-@@ -670,15 +672,15 @@ class RenderTests(unittest.TestCase, AssertStringM=
ixin, AssertExceptionMixin):
-         """
-         template =3D '{{#planet}}{{#lambda}}dot{{/lambda}}{{/planet}}'
-         context =3D {'planet': 'Earth', 'dot': '~{{.}}~', 'lambda': (la=
mbda text: "#{{%s}}#" % text)}
--        self._assert_render(u'#~{{.}}~#', template, context)
-+        self._assert_render('#~{{.}}~#', template, context)
-=20
-     def test_comment__multiline(self):
-         """
-         Check that multiline comments are permitted.
-=20
-         """
--        self._assert_render(u'foobar', 'foo{{! baz }}bar')
--        self._assert_render(u'foobar', 'foo{{! \nbaz }}bar')
-+        self._assert_render('foobar', 'foo{{! baz }}bar')
-+        self._assert_render('foobar', 'foo{{! \nbaz }}bar')
-=20
-     def test_custom_delimiters__sections(self):
-         """
-@@ -689,7 +691,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         """
-         template =3D '{{=3D[[ ]]=3D}}[[#foo]]bar[[/foo]]'
-         context =3D {'foo': True}
--        self._assert_render(u'bar', template, context)
-+        self._assert_render('bar', template, context)
-=20
-     def test_custom_delimiters__not_retroactive(self):
-         """
-@@ -698,7 +700,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         Test case for issue #35: https://github.com/defunkt/pystache/is=
sues/35
-=20
-         """
--        expected =3D u' {{foo}} '
-+        expected =3D ' {{foo}} '
-         self._assert_render(expected, '{{=3D$ $=3D}} {{foo}} ')
-         self._assert_render(expected, '{{=3D$ $=3D}} {{foo}} $=3D{{ }}=3D=
$')  # was yielding u'  '.
-=20
-@@ -713,7 +715,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         template =3D 'Hello, {{person.name}}. I see you are {{person.de=
tails.age}}.'
-         person =3D Attachable(name=3D'Biggles', details=3D{'age': 42})
-         context =3D {'person': person}
--        self._assert_render(u'Hello, Biggles. I see you are 42.', templ=
ate, context)
-+        self._assert_render('Hello, Biggles. I see you are 42.', templa=
te, context)
-=20
-     def test_dot_notation__multiple_levels(self):
-         """
-@@ -722,7 +724,7 @@ class RenderTests(unittest.TestCase, AssertStringMix=
in, AssertExceptionMixin):
-         """
-         template =3D """Hello, Mr. {{person.name.lastname}}.
-         I see you're back from {{person.travels.last.country.city}}."""
--        expected =3D u"""Hello, Mr. Pither.
-+        expected =3D """Hello, Mr. Pither.
-         I see you're back from Cornwall."""
-         context =3D {'person': {'name': {'firstname': 'unknown', 'lastn=
ame': 'Pither'},
-                             'travels': {'last': {'country': {'city': 'C=
ornwall'}}},
-@@ -758,10 +760,10 @@ class RenderTests(unittest.TestCase, AssertStringM=
ixin, AssertExceptionMixin):
-         context =3D {'a': {'b': 'A.B'}, 'c': {'a': 'A'} }
-=20
-         template =3D '{{a.b}}'
--        self._assert_render(u'A.B', template, context)
-+        self._assert_render('A.B', template, context)
-=20
-         template =3D '{{#c}}{{a}}{{/c}}'
--        self._assert_render(u'A', template, context)
-+        self._assert_render('A', template, context)
-=20
-         template =3D '{{#c}}{{a.b}}{{/c}}'
-         self.assertException(KeyNotFoundError, "Key %(unicode)s'a.b' no=
t found: missing %(unicode)s'b'" %
-diff --git a/pystache/tests/test_renderer.py b/pystache/tests/test_rende=
rer.py
-index 0dbe0d9..e0d2448 100644
---- a/pystache/tests/test_renderer.py
-+++ b/pystache/tests/test_renderer.py
-@@ -10,7 +10,7 @@ import os
- import sys
- import unittest
-=20
--from examples.simple import Simple
-+from .examples.simple import Simple
- from pystache import Renderer
- from pystache import TemplateSpec
- from pystache.common import TemplateNotFoundError
-@@ -33,7 +33,7 @@ def _make_renderer():
- def mock_unicode(b, encoding=3DNone):
-     if encoding is None:
-         encoding =3D 'ascii'
--    u =3D unicode(b, encoding=3Dencoding)
-+    u =3D str(b, encoding=3Dencoding)
-     return u.upper()
-=20
-=20
-@@ -197,13 +197,13 @@ class RendererTests(unittest.TestCase, AssertStrin=
gMixin):
-=20
-         """
-         renderer =3D self._renderer()
--        b =3D u"=C3=A9".encode('utf-8')
-+        b =3D "=C3=A9".encode('utf-8')
-=20
-         renderer.string_encoding =3D "ascii"
--        self.assertRaises(UnicodeDecodeError, renderer.unicode, b)
-+        self.assertRaises(UnicodeDecodeError, renderer.str, b)
-=20
-         renderer.string_encoding =3D "utf-8"
--        self.assertEqual(renderer.unicode(b), u"=C3=A9")
-+        self.assertEqual(renderer.str(b), "=C3=A9")
-=20
-     def test_unicode__decode_errors(self):
-         """
-@@ -212,14 +212,14 @@ class RendererTests(unittest.TestCase, AssertStrin=
gMixin):
-         """
-         renderer =3D self._renderer()
-         renderer.string_encoding =3D "ascii"
--        b =3D u"d=C3=A9f".encode('utf-8')
-+        b =3D "d=C3=A9f".encode('utf-8')
-=20
-         renderer.decode_errors =3D "ignore"
--        self.assertEqual(renderer.unicode(b), "df")
-+        self.assertEqual(renderer.str(b), "df")
-=20
-         renderer.decode_errors =3D "replace"
-         # U+FFFD is the official Unicode replacement character.
--        self.assertEqual(renderer.unicode(b), u'd\ufffd\ufffdf')
-+        self.assertEqual(renderer.str(b), u'd\ufffd\ufffdf')
-=20
-     ## Test the _make_loader() method.
-=20
-@@ -243,7 +243,7 @@ class RendererTests(unittest.TestCase, AssertStringM=
ixin):
-         renderer =3D self._renderer()
-         renderer.file_encoding =3D 'enc'
-         renderer.file_extension =3D 'ext'
--        renderer.unicode =3D unicode_
-+        renderer.str =3D unicode_
-=20
-         loader =3D renderer._make_loader()
-=20
-@@ -260,12 +260,12 @@ class RendererTests(unittest.TestCase, AssertStrin=
gMixin):
-         """
-         renderer =3D self._renderer()
-         rendered =3D renderer.render('foo')
--        self.assertEqual(type(rendered), unicode)
-+        self.assertEqual(type(rendered), str)
-=20
-     def test_render__unicode(self):
-         renderer =3D self._renderer()
--        actual =3D renderer.render(u'foo')
--        self.assertEqual(actual, u'foo')
-+        actual =3D renderer.render('foo')
-+        self.assertEqual(actual, 'foo')
-=20
-     def test_render__str(self):
-         renderer =3D self._renderer()
-@@ -274,8 +274,8 @@ class RendererTests(unittest.TestCase, AssertStringM=
ixin):
-=20
-     def test_render__non_ascii_character(self):
-         renderer =3D self._renderer()
--        actual =3D renderer.render(u'Poincar=C3=A9')
--        self.assertEqual(actual, u'Poincar=C3=A9')
-+        actual =3D renderer.render('Poincar=C3=A9')
-+        self.assertEqual(actual, 'Poincar=C3=A9')
-=20
-     def test_render__context(self):
-         """
-@@ -326,7 +326,7 @@ class RendererTests(unittest.TestCase, AssertStringM=
ixin):
-=20
-         """
-         renderer =3D _make_renderer()
--        template =3D u"d=C3=A9f".encode("utf-8")
-+        template =3D "d=C3=A9f".encode("utf-8")
-=20
-         # Check that decode_errors and string_encoding are both respect=
ed.
-         renderer.decode_errors =3D 'ignore'
-@@ -334,7 +334,7 @@ class RendererTests(unittest.TestCase, AssertStringM=
ixin):
-         self.assertEqual(renderer.render(template), "df")
-=20
-         renderer.string_encoding =3D 'utf_8'
--        self.assertEqual(renderer.render(template), u"d=C3=A9f")
-+        self.assertEqual(renderer.render(template), "d=C3=A9f")
-=20
-     def test_make_resolve_partial(self):
-         """
-@@ -347,7 +347,7 @@ class RendererTests(unittest.TestCase, AssertStringM=
ixin):
-=20
-         actual =3D resolve_partial('foo')
-         self.assertEqual(actual, 'bar')
--        self.assertEqual(type(actual), unicode, "RenderEngine requires =
that "
-+        self.assertEqual(type(actual), str, "RenderEngine requires that=
 "
-             "resolve_partial return unicode strings.")
-=20
-     def test_make_resolve_partial__unicode(self):
-@@ -362,7 +362,7 @@ class RendererTests(unittest.TestCase, AssertStringM=
ixin):
-         self.assertEqual(resolve_partial("partial"), "foo")
-=20
-         # Now with a value that is already unicode.
--        renderer.partials =3D {'partial': u'foo'}
-+        renderer.partials =3D {'partial': 'foo'}
-         resolve_partial =3D renderer._make_resolve_partial()
-         # If the next line failed, we would get the following error:
-         #   TypeError: decoding Unicode is not supported
-@@ -373,7 +373,7 @@ class RendererTests(unittest.TestCase, AssertStringM=
ixin):
-         data_dir =3D get_data_path()
-         renderer =3D Renderer(search_dirs=3Ddata_dir)
-         actual =3D renderer.render_name("say_hello", to=3D'foo')
--        self.assertString(actual, u"Hello, foo")
-+        self.assertString(actual, "Hello, foo")
-=20
-     def test_render_path(self):
-         """
-@@ -412,7 +412,7 @@ class RendererTests(unittest.TestCase, AssertStringM=
ixin):
-=20
-         spec =3D Spec()
-         actual =3D renderer.render(spec)
--        self.assertString(actual, u'hello, world')
-+        self.assertString(actual, 'hello, world')
-=20
-     def test_render__view(self):
-         """
-@@ -484,7 +484,7 @@ class Renderer_MakeRenderEngineTests(unittest.TestCa=
se, AssertStringMixin, Asser
-         Check that resolve_partial returns unicode (and not a subclass)=
.
-=20
-         """
--        class MyUnicode(unicode):
-+        class MyUnicode(str):
-             pass
-=20
-         renderer =3D Renderer()
-@@ -495,12 +495,12 @@ class Renderer_MakeRenderEngineTests(unittest.Test=
Case, AssertStringMixin, Asser
-=20
-         actual =3D engine.resolve_partial('str')
-         self.assertEqual(actual, "foo")
--        self.assertEqual(type(actual), unicode)
-+        self.assertEqual(type(actual), str)
-=20
-         # Check that unicode subclasses are not preserved.
-         actual =3D engine.resolve_partial('subclass')
-         self.assertEqual(actual, "abc")
--        self.assertEqual(type(actual), unicode)
-+        self.assertEqual(type(actual), str)
-=20
-     def test__resolve_partial__not_found(self):
-         """
-@@ -512,7 +512,7 @@ class Renderer_MakeRenderEngineTests(unittest.TestCa=
se, AssertStringMixin, Asser
-         engine =3D renderer._make_render_engine()
-         resolve_partial =3D engine.resolve_partial
-=20
--        self.assertString(resolve_partial('foo'), u'')
-+        self.assertString(resolve_partial('foo'), '')
-=20
-     def test__resolve_partial__not_found__missing_tags_strict(self):
-         """
-@@ -539,7 +539,7 @@ class Renderer_MakeRenderEngineTests(unittest.TestCa=
se, AssertStringMixin, Asser
-         engine =3D renderer._make_render_engine()
-         resolve_partial =3D engine.resolve_partial
-=20
--        self.assertString(resolve_partial('foo'), u'')
-+        self.assertString(resolve_partial('foo'), '')
-=20
-     def test__resolve_partial__not_found__partials_dict__missing_tags_s=
trict(self):
-         """
-@@ -566,12 +566,12 @@ class Renderer_MakeRenderEngineTests(unittest.Test=
Case, AssertStringMixin, Asser
-=20
-         """
-         renderer =3D self._make_renderer()
--        renderer.unicode =3D mock_unicode
-+        renderer.str =3D mock_unicode
-=20
-         engine =3D renderer._make_render_engine()
-         literal =3D engine.literal
-=20
--        b =3D u"foo".encode("ascii")
-+        b =3D "foo".encode("ascii")
-         self.assertEqual(literal(b), "FOO")
-=20
-     def test__literal__handles_unicode(self):
-@@ -585,7 +585,7 @@ class Renderer_MakeRenderEngineTests(unittest.TestCa=
se, AssertStringMixin, Asser
-         engine =3D renderer._make_render_engine()
-         literal =3D engine.literal
-=20
--        self.assertEqual(literal(u"foo"), "foo")
-+        self.assertEqual(literal("foo"), "foo")
-=20
-     def test__literal__returns_unicode(self):
-         """
-@@ -598,16 +598,16 @@ class Renderer_MakeRenderEngineTests(unittest.Test=
Case, AssertStringMixin, Asser
-         engine =3D renderer._make_render_engine()
-         literal =3D engine.literal
-=20
--        self.assertEqual(type(literal("foo")), unicode)
-+        self.assertEqual(type(literal("foo")), str)
-=20
--        class MyUnicode(unicode):
-+        class MyUnicode(str):
-             pass
-=20
-         s =3D MyUnicode("abc")
-=20
-         self.assertEqual(type(s), MyUnicode)
--        self.assertTrue(isinstance(s, unicode))
--        self.assertEqual(type(literal(s)), unicode)
-+        self.assertTrue(isinstance(s, str))
-+        self.assertEqual(type(literal(s)), str)
-=20
-     ## Test the engine's escape attribute.
-=20
-@@ -630,12 +630,12 @@ class Renderer_MakeRenderEngineTests(unittest.Test=
Case, AssertStringMixin, Asser
-=20
-         """
-         renderer =3D Renderer()
--        renderer.unicode =3D mock_unicode
-+        renderer.str =3D mock_unicode
-=20
-         engine =3D renderer._make_render_engine()
-         escape =3D engine.escape
-=20
--        b =3D u"foo".encode('ascii')
-+        b =3D "foo".encode('ascii')
-         self.assertEqual(escape(b), "FOO")
-=20
-     def test__escape__has_access_to_original_unicode_subclass(self):
-@@ -644,16 +644,16 @@ class Renderer_MakeRenderEngineTests(unittest.Test=
Case, AssertStringMixin, Asser
-=20
-         """
-         renderer =3D Renderer()
--        renderer.escape =3D lambda s: unicode(type(s).__name__)
-+        renderer.escape =3D lambda s: str(type(s).__name__)
-=20
-         engine =3D renderer._make_render_engine()
-         escape =3D engine.escape
-=20
--        class MyUnicode(unicode):
-+        class MyUnicode(str):
-             pass
-=20
--        self.assertEqual(escape(u"foo".encode('ascii')), unicode.__name=
__)
--        self.assertEqual(escape(u"foo"), unicode.__name__)
-+        self.assertEqual(escape("foo".encode('ascii')), str.__name__)
-+        self.assertEqual(escape("foo"), str.__name__)
-         self.assertEqual(escape(MyUnicode("foo")), MyUnicode.__name__)
-=20
-     def test__escape__returns_unicode(self):
-@@ -667,17 +667,17 @@ class Renderer_MakeRenderEngineTests(unittest.Test=
Case, AssertStringMixin, Asser
-         engine =3D renderer._make_render_engine()
-         escape =3D engine.escape
-=20
--        self.assertEqual(type(escape("foo")), unicode)
-+        self.assertEqual(type(escape("foo")), str)
-=20
-         # Check that literal doesn't preserve unicode subclasses.
--        class MyUnicode(unicode):
-+        class MyUnicode(str):
-             pass
-=20
-         s =3D MyUnicode("abc")
-=20
-         self.assertEqual(type(s), MyUnicode)
--        self.assertTrue(isinstance(s, unicode))
--        self.assertEqual(type(escape(s)), unicode)
-+        self.assertTrue(isinstance(s, str))
-+        self.assertEqual(type(escape(s)), str)
-=20
-     ## Test the missing_tags attribute.
-=20
-@@ -706,7 +706,7 @@ class Renderer_MakeRenderEngineTests(unittest.TestCa=
se, AssertStringMixin, Asser
-         stack =3D ContextStack({'foo': 'bar'})
-=20
-         self.assertEqual('bar', engine.resolve_context(stack, 'foo'))
--        self.assertString(u'', engine.resolve_context(stack, 'missing')=
)
-+        self.assertString('', engine.resolve_context(stack, 'missing'))
-=20
-     def test__resolve_context__missing_tags_strict(self):
-         """
-diff --git a/pystache/tests/test_simple.py b/pystache/tests/test_simple.=
py
-index 07b059f..b88bf35 100644
---- a/pystache/tests/test_simple.py
-+++ b/pystache/tests/test_simple.py
-@@ -2,11 +2,11 @@ import unittest
-=20
- import pystache
- from pystache import Renderer
--from examples.nested_context import NestedContext
--from examples.complex import Complex
--from examples.lambdas import Lambdas
--from examples.template_partial import TemplatePartial
--from examples.simple import Simple
-+from .examples.nested_context import NestedContext
-+from .examples.complex import Complex
-+from .examples.lambdas import Lambdas
-+from .examples.template_partial import TemplatePartial
-+from .examples.simple import Simple
-=20
- from pystache.tests.common import EXAMPLES_DIR
- from pystache.tests.common import AssertStringMixin
-@@ -20,7 +20,7 @@ class TestSimple(unittest.TestCase, AssertStringMixin)=
:
-         view.template =3D '{{#foo}}{{thing1}} and {{thing2}} and {{oute=
r_thing}}{{/foo}}{{^foo}}Not foo!{{/foo}}'
-=20
-         actual =3D renderer.render(view)
--        self.assertString(actual, u"one and foo and two")
-+        self.assertString(actual, "one and foo and two")
-=20
-     def test_looping_and_negation_context(self):
-         template =3D '{{#item}}{{header}}: {{name}} {{/item}}{{^item}} =
Shouldnt see me{{/item}}'
-@@ -40,7 +40,7 @@ class TestSimple(unittest.TestCase, AssertStringMixin)=
:
-=20
-         renderer =3D Renderer()
-         actual =3D renderer.render(view)
--        self.assertString(actual, u'bar !=3D bar. oh, it does!')
-+        self.assertString(actual, 'bar !=3D bar. oh, it does!')
-=20
-     def test_rendering_partial(self):
-         renderer =3D Renderer(search_dirs=3DEXAMPLES_DIR)
-@@ -49,11 +49,11 @@ class TestSimple(unittest.TestCase, AssertStringMixi=
n):
-         view.template =3D '{{>inner_partial}}'
-=20
-         actual =3D renderer.render(view)
--        self.assertString(actual, u'Again, Welcome!')
-+        self.assertString(actual, 'Again, Welcome!')
-=20
-         view.template =3D '{{#looping}}{{>inner_partial}} {{/looping}}'
-         actual =3D renderer.render(view)
--        self.assertString(actual, u"Again, Welcome! Again, Welcome! Aga=
in, Welcome! ")
-+        self.assertString(actual, "Again, Welcome! Again, Welcome! Agai=
n, Welcome! ")
-=20
-     def test_non_existent_value_renders_blank(self):
-         view =3D Simple()
-@@ -77,7 +77,7 @@ class TestSimple(unittest.TestCase, AssertStringMixin)=
:
-         view =3D TemplatePartial(renderer=3Drenderer)
-=20
-         actual =3D renderer.render(view)
--        self.assertString(actual, u"""Welcome
-+        self.assertString(actual, """Welcome
- -------
-=20
- ## Again, Welcome! ##""")
-diff --git a/pystache/tests/test_specloader.py b/pystache/tests/test_spe=
cloader.py
-index cacc0fc..dcdc55f 100644
---- a/pystache/tests/test_specloader.py
-+++ b/pystache/tests/test_specloader.py
-@@ -9,11 +9,11 @@ import os.path
- import sys
- import unittest
-=20
--import examples
--from examples.simple import Simple
--from examples.complex import Complex
--from examples.lambdas import Lambdas
--from examples.inverted import Inverted, InvertedLists
-+from . import examples
-+from .examples.simple import Simple
-+from .examples.complex import Complex
-+from .examples.lambdas import Lambdas
-+from .examples.inverted import Inverted, InvertedLists
- from pystache import Renderer
- from pystache import TemplateSpec
- from pystache.common import TemplateNotFoundError
-@@ -70,7 +70,7 @@ class ViewTestCase(unittest.TestCase, AssertStringMixi=
n):
-         renderer2 =3D Renderer(search_dirs=3DEXAMPLES_DIR)
-=20
-         actual =3D renderer1.render(spec)
--        self.assertString(actual, u"Partial: ")
-+        self.assertString(actual, "Partial: ")
-=20
-         actual =3D renderer2.render(spec)
-         self.assertEqual(actual, "Partial: No tags...")
-@@ -79,7 +79,7 @@ class ViewTestCase(unittest.TestCase, AssertStringMixi=
n):
-         renderer =3D Renderer()
-         actual =3D renderer.render(Simple())
-=20
--        self.assertString(actual, u"Hi pizza!")
-+        self.assertString(actual, "Hi pizza!")
-=20
-     def test_non_callable_attributes(self):
-         view =3D Simple()
-@@ -92,7 +92,7 @@ class ViewTestCase(unittest.TestCase, AssertStringMixi=
n):
-     def test_complex(self):
-         renderer =3D Renderer()
-         actual =3D renderer.render(Complex())
--        self.assertString(actual, u"""\
-+        self.assertString(actual, """\
- <h1>Colors</h1>
- <ul>
- <li><strong>red</strong></li>
-@@ -111,7 +111,7 @@ class ViewTestCase(unittest.TestCase, AssertStringMi=
xin):
-=20
-         renderer =3D Renderer()
-         actual =3D renderer.render(view)
--        self.assertString(actual, u'nopqrstuvwxyz')
-+        self.assertString(actual, 'nopqrstuvwxyz')
-=20
-     def test_higher_order_lambda(self):
-         view =3D Lambdas()
-@@ -119,7 +119,7 @@ class ViewTestCase(unittest.TestCase, AssertStringMi=
xin):
-=20
-         renderer =3D Renderer()
-         actual =3D renderer.render(view)
--        self.assertString(actual, u'abcdefghijklmnopqrstuvwxyz')
-+        self.assertString(actual, 'abcdefghijklmnopqrstuvwxyz')
-=20
-     def test_partials_with_lambda(self):
-         view =3D Lambdas()
-@@ -127,7 +127,7 @@ class ViewTestCase(unittest.TestCase, AssertStringMi=
xin):
-=20
-         renderer =3D Renderer(search_dirs=3DEXAMPLES_DIR)
-         actual =3D renderer.render(view)
--        self.assertEqual(actual, u'nopqrstuvwxyz')
-+        self.assertEqual(actual, 'nopqrstuvwxyz')
-=20
-     def test_hierarchical_partials_with_lambdas(self):
-         view =3D Lambdas()
-@@ -135,12 +135,12 @@ class ViewTestCase(unittest.TestCase, AssertString=
Mixin):
-=20
-         renderer =3D Renderer(search_dirs=3DEXAMPLES_DIR)
-         actual =3D renderer.render(view)
--        self.assertString(actual, u'nopqrstuvwxyznopqrstuvwxyz')
-+        self.assertString(actual, 'nopqrstuvwxyznopqrstuvwxyz')
-=20
-     def test_inverted(self):
-         renderer =3D Renderer()
-         actual =3D renderer.render(Inverted())
--        self.assertString(actual, u"""one, two, three, empty list""")
-+        self.assertString(actual, """one, two, three, empty list""")
-=20
-     def test_accessing_properties_on_parent_object_from_child_objects(s=
elf):
-         parent =3D Thing()
-@@ -152,12 +152,12 @@ class ViewTestCase(unittest.TestCase, AssertString=
Mixin):
-         renderer =3D Renderer()
-         actual =3D renderer.render(view, {'parent': parent})
-=20
--        self.assertString(actual, u'derp')
-+        self.assertString(actual, 'derp')
-=20
-     def test_inverted_lists(self):
-         renderer =3D Renderer()
-         actual =3D renderer.render(InvertedLists())
--        self.assertString(actual, u"""one, two, three, empty list""")
-+        self.assertString(actual, """one, two, three, empty list""")
-=20
-=20
- def _make_specloader():
-@@ -176,7 +176,7 @@ def _make_specloader():
-         """
-         if encoding is None:
-             encoding =3D 'ascii'
--        return unicode(s, encoding, 'strict')
-+        return str(s, encoding, 'strict')
-=20
-     loader =3D Loader(file_encoding=3D'ascii', to_unicode=3Dto_unicode)
-     return SpecLoader(loader=3Dloader)
-@@ -222,7 +222,7 @@ class SpecLoaderTests(unittest.TestCase, AssertIsMix=
in, AssertStringMixin,
-         custom.template =3D "abc"
-=20
-         spec_loader =3D self._make_specloader()
--        self._assert_template(spec_loader, custom, u"abc")
-+        self._assert_template(spec_loader, custom, "abc")
-=20
-     def test_load__template__type_unicode(self):
-         """
-@@ -230,10 +230,10 @@ class SpecLoaderTests(unittest.TestCase, AssertIsM=
ixin, AssertStringMixin,
-=20
-         """
-         custom =3D TemplateSpec()
--        custom.template =3D u"abc"
-+        custom.template =3D "abc"
-=20
-         spec_loader =3D self._make_specloader()
--        self._assert_template(spec_loader, custom, u"abc")
-+        self._assert_template(spec_loader, custom, "abc")
-=20
-     def test_load__template__unicode_non_ascii(self):
-         """
-@@ -241,10 +241,10 @@ class SpecLoaderTests(unittest.TestCase, AssertIsM=
ixin, AssertStringMixin,
-=20
-         """
-         custom =3D TemplateSpec()
--        custom.template =3D u"=C3=A9"
-+        custom.template =3D "=C3=A9"
-=20
-         spec_loader =3D self._make_specloader()
--        self._assert_template(spec_loader, custom, u"=C3=A9")
-+        self._assert_template(spec_loader, custom, "=C3=A9")
-=20
-     def test_load__template__with_template_encoding(self):
-         """
-@@ -252,14 +252,14 @@ class SpecLoaderTests(unittest.TestCase, AssertIsM=
ixin, AssertStringMixin,
-=20
-         """
-         custom =3D TemplateSpec()
--        custom.template =3D u'=C3=A9'.encode('utf-8')
-+        custom.template =3D '=C3=A9'.encode('utf-8')
-=20
-         spec_loader =3D self._make_specloader()
-=20
--        self.assertRaises(UnicodeDecodeError, self._assert_template, sp=
ec_loader, custom, u'=C3=A9')
-+        self.assertRaises(UnicodeDecodeError, self._assert_template, sp=
ec_loader, custom, '=C3=A9')
-=20
-         custom.template_encoding =3D 'utf-8'
--        self._assert_template(spec_loader, custom, u'=C3=A9')
-+        self._assert_template(spec_loader, custom, '=C3=A9')
-=20
-     # TODO: make this test complete.
-     def test_load__template__correct_loader(self):
-@@ -279,10 +279,10 @@ class SpecLoaderTests(unittest.TestCase, AssertIsM=
ixin, AssertStringMixin,
-                 self.encoding =3D None
-=20
-             # Overrides the existing method.
--            def unicode(self, s, encoding=3DNone):
-+            def str(self, s, encoding=3DNone):
-                 self.s =3D s
-                 self.encoding =3D encoding
--                return u"foo"
-+                return "foo"
-=20
-         loader =3D MockLoader()
-         custom_loader =3D SpecLoader()
-@@ -293,7 +293,7 @@ class SpecLoaderTests(unittest.TestCase, AssertIsMix=
in, AssertStringMixin,
-         view.template_encoding =3D "encoding-foo"
-=20
-         # Check that our unicode() above was called.
--        self._assert_template(custom_loader, view, u'foo')
-+        self._assert_template(custom_loader, view, 'foo')
-         self.assertEqual(loader.s, "template-foo")
-         self.assertEqual(loader.encoding, "encoding-foo")
-=20
-@@ -410,7 +410,7 @@ class TemplateSpecTests(unittest.TestCase, AssertPat=
hsMixin):
-         loader =3D self._make_loader()
-         actual =3D loader.load(custom)
-=20
--        self.assertEqual(type(actual), unicode)
-+        self.assertEqual(type(actual), str)
-         self.assertEqual(actual, expected)
-=20
-     def test_get_template(self):
-@@ -420,7 +420,7 @@ class TemplateSpecTests(unittest.TestCase, AssertPat=
hsMixin):
-         """
-         view =3D SampleView()
-=20
--        self._assert_get_template(view, u"ascii: abc")
-+        self._assert_get_template(view, "ascii: abc")
-=20
-     def test_get_template__template_encoding(self):
-         """
-@@ -432,4 +432,4 @@ class TemplateSpecTests(unittest.TestCase, AssertPat=
hsMixin):
-         self.assertRaises(UnicodeDecodeError, self._assert_get_template=
, view, 'foo')
-=20
-         view.template_encoding =3D 'utf-8'
--        self._assert_get_template(view, u"non-ascii: =C3=A9")
-+        self._assert_get_template(view, "non-ascii: =C3=A9")
-diff --git a/setup.cfg b/setup.cfg
-index 861a9f5..f6f1279 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -1,5 +1,71 @@
--[egg_info]
--tag_build =3D=20
--tag_date =3D 0
--tag_svn_revision =3D 0
-+[metadata]
-+name =3D pystache
-+version =3D attr: pystache.__version__
-+author =3D Chris Wanstrath
-+author_email =3D chris@ozmm.org
-+maintainer =3D Steve Arnold
-+maintainer_email =3D nerdboy@gentoo.org
-+description =3D Mustache for Python
-+url =3D https://github.com/sarnold/pystache
-+license =3D MIT
-+license_files =3D LICENSE
-+classifiers =3D
-+    Development Status :: 4 - Beta
-+    Intended Audience :: Developers
-+    License :: OSI Approved :: MIT License
-+    Programming Language :: Python :: 3
-+    Programming Language :: Python :: 3.6
-+    Programming Language :: Python :: 3.7
-+    Programming Language :: Python :: 3.8
-+    Programming Language :: Python :: 3.9
-=20
-+[options]
-+python_requires =3D >=3D3.6
-+zip_safe =3D True
-+include_package_data =3D True
-+packages =3D find:
-+
-+[options.package_data]
-+* =3D *.mustache, *.txt
-+
-+[options.entry_points]
-+console_scripts =3D
-+    pystache=3Dpystache.commands.render:main
-+    pystache-test=3Dpystache.commands.test:main
-+
-+[options.extras_require]
-+test =3D
-+    nose
-+
-+cov =3D
-+    coverage
-+
-+[bdist_wheel]
-+universal =3D 0
-+
-+[check-manifest]
-+ignore =3D
-+    .codeclimate.yml
-+    .gitattributes
-+    .coveragerc
-+    .gitignore
-+    .pep8speaks.yml
-+    codecov.yml
-+
-+[flake8]
-+exclude =3D
-+    .git,
-+    __pycache__,
-+    build,
-+    dist
-+
-+max-line-length =3D 110
-+
-+[nosetests]
-+traverse-namespace =3D 1
-+verbosity =3D 3
-+with-coverage =3D 1
-+with-doctest =3D 1
-+doctest-extension =3D rst
-+cover-package =3D pystache
-+cover-xml =3D 1
-diff --git a/setup.py b/setup.py
-index 0d99aae..f0b7d7f 100644
---- a/setup.py
-+++ b/setup.py
-@@ -28,7 +28,7 @@ it on the PyPI project page.  If PyPI finds any issues=
, it will render it
- instead as plain-text, which we do not want.
-=20
- To check in advance that PyPI will accept and parse the reST file as HT=
ML,
--you can use the rst2html program installed by the docutils package
-+you can use the rst2html.py program installed by the docutils package
- (http://docutils.sourceforge.net/).  To install docutils:
-=20
-     $ pip install docutils
-@@ -89,30 +89,7 @@ import os
- import shutil
- import sys
-=20
--
--py_version =3D sys.version_info
--
--# distutils does not seem to support the following setup() arguments.
--# It displays a UserWarning when setup() is passed those options:
--#
--#  * entry_points
--#  * install_requires
--#
--# distribute works with Python 2.3.5 and above:
--#
--#   http://packages.python.org/distribute/setuptools.html#building-and-=
distributing-packages-with-distribute
--#
--if py_version < (2, 3, 5):
--    # TODO: this might not work yet.
--    import distutils as dist
--    from distutils import core
--    setup =3D core.setup
--else:
--    import setuptools as dist
--    setup =3D dist.setup
--
--
--VERSION =3D '0.5.4'  # Also change in pystache/__init__.py.
-+from setuptools import setup
-=20
- FILE_ENCODING =3D 'utf-8'
-=20
-@@ -126,22 +103,6 @@ TEMP_EXTENSION =3D '.temp'
-=20
- PREP_COMMAND =3D 'prep'
-=20
--CLASSIFIERS =3D (
--    'Development Status :: 4 - Beta',
--    'License :: OSI Approved :: MIT License',
--    'Programming Language :: Python',
--    'Programming Language :: Python :: 2',
--    'Programming Language :: Python :: 2.4',
--    'Programming Language :: Python :: 2.5',
--    'Programming Language :: Python :: 2.6',
--    'Programming Language :: Python :: 2.7',
--    'Programming Language :: Python :: 3',
--    'Programming Language :: Python :: 3.1',
--    'Programming Language :: Python :: 3.2',
--    'Programming Language :: Python :: 3.3',
--    'Programming Language :: Python :: Implementation :: PyPy',
--)
--
- # Comments in reST begin with two dots.
- RST_LONG_DESCRIPTION_INTRO =3D """\
- .. Do not edit this file.  This file is auto-generated for PyPI by setu=
p.py
-@@ -221,7 +182,7 @@ def convert_md_to_rst(md_path, rst_temp_path):
-=20
-     """
-     # Pandoc uses the UTF-8 character encoding for both input and outpu=
t.
--    command =3D "pandoc --write=3Drst --output=3D%s %s" % (rst_temp_pat=
h, md_path)
-+    command =3D "pandoc -f markdown-smart --write=3Drst --output=3D%s %=
s" % (rst_temp_path, md_path)
-     print("converting with pandoc: %s to %s\n-->%s" % (md_path, rst_tem=
p_path,
-                                                        command))
-=20
-@@ -308,65 +269,9 @@ Run the following command and commit the changes--
-     os.system('python setup.py sdist upload')
-=20
-=20
--# We use the package simplejson for older Python versions since Python
--# does not contain the module json before 2.6:
--#
--#   http://docs.python.org/library/json.html
--#
--# Moreover, simplejson stopped officially support for Python 2.4 in ver=
sion 2.1.0:
--#
--#   https://github.com/simplejson/simplejson/blob/master/CHANGES.txt
--#
--requires =3D []
--if py_version < (2, 5):
--    requires.append('simplejson<2.1')
--elif py_version < (2, 6):
--    requires.append('simplejson')
--
--INSTALL_REQUIRES =3D requires
--
--# TODO: decide whether to use find_packages() instead.  I'm not sure th=
at
--#   find_packages() is available with distutils, for example.
--PACKAGES =3D [
--    'pystache',
--    'pystache.commands',
--    # The following packages are only for testing.
--    'pystache.tests',
--    'pystache.tests.data',
--    'pystache.tests.data.locator',
--    'pystache.tests.examples',
--]
--
--
--# The purpose of this function is to follow the guidance suggested here=
:
--#
--#   http://packages.python.org/distribute/python3.html#note-on-compatib=
ility-with-setuptools
--#
--# The guidance is for better compatibility when using setuptools (e.g. =
with
--# earlier versions of Python 2) instead of Distribute, because of new
--# keyword arguments to setup() that setuptools may not recognize.
--def get_extra_args():
--    """
--    Return a dictionary of extra args to pass to setup().
--
--    """
--    extra =3D {}
--    # TODO: it might be more correct to check whether we are using
--    #   Distribute instead of setuptools, since use_2to3 doesn't take
--    #   effect when using Python 2, even when using Distribute.
--    if py_version >=3D (3, ):
--        # Causes 2to3 to be run during the build step.
--        extra['use_2to3'] =3D True
--
--    return extra
--
--
- def main(sys_argv):
-=20
-     # TODO: use the logging module instead of printing.
--    # TODO: include the following in a verbose mode.
--    sys.stderr.write("pystache: using: version %s of %s\n" % (repr(dist=
.__version__), repr(dist)))
--
-     command =3D sys_argv[-1]
-=20
-     if command =3D=3D 'publish':
-@@ -377,35 +282,10 @@ def main(sys_argv):
-         sys.exit()
-=20
-     long_description =3D read(RST_DESCRIPTION_PATH)
--    template_files =3D ['*.mustache', '*.txt']
--    extra_args =3D get_extra_args()
--
--    setup(name=3D'pystache',
--          version=3DVERSION,
--          license=3D'MIT',
--          description=3D'Mustache for Python',
--          long_description=3Dlong_description,
--          author=3D'Chris Wanstrath',
--          author_email=3D'chris@ozmm.org',
--          maintainer=3D'Chris Jerdonek',
--          maintainer_email=3D'chris.jerdonek@gmail.com',
--          url=3D'http://github.com/defunkt/pystache',
--          install_requires=3DINSTALL_REQUIRES,
--          packages=3DPACKAGES,
--          package_data =3D {
--              # Include template files so tests can be run.
--              'pystache.tests.data': template_files,
--              'pystache.tests.data.locator': template_files,
--              'pystache.tests.examples': template_files,
--          },
--          entry_points =3D {
--            'console_scripts': [
--                'pystache=3Dpystache.commands.render:main',
--                'pystache-test=3Dpystache.commands.test:main',
--            ],
--          },
--          classifiers =3D CLASSIFIERS,
--          **extra_args
-+
-+    setup(
-+        long_description=3Dlong_description,
-+        long_description_content_type=3D'text/x-rst',
-     )
-=20
-=20
-diff --git a/setup_description.rst b/setup_description.rst
-index 724c457..d7f1bc0 100644
---- a/setup_description.rst
-+++ b/setup_description.rst
-@@ -4,13 +4,17 @@
- Pystache
- =3D=3D=3D=3D=3D=3D=3D=3D
-=20
--.. figure:: http://defunkt.github.com/pystache/images/logo_phillips.png
--   :alt: mustachioed, monocled snake by David Phillips
-+|ci| |Conda| |Wheels| |Release| |Python|
-=20
--.. figure:: https://secure.travis-ci.org/defunkt/pystache.png
--   :alt: Travis CI current build status
-+|Latest release| |License| |Maintainability| |codecov|
-=20
--`Pystache <http://defunkt.github.com/pystache>`__ is a Python
-+This updated fork of Pystache is currently tested on Python 3.6+ and in
-+Conda, on Linux, Macos, and Windows (Python 2.7 support has been
-+removed).
-+
-+|image9|
-+
-+`Pystache <http://sarnold.github.com/pystache>`__ is a Python
- implementation of `Mustache <http://mustache.github.com/>`__. Mustache
- is a framework-agnostic, logic-free templating system inspired by
- `ctemplate <http://code.google.com/p/google-ctemplate/>`__ and
-@@ -23,62 +27,45 @@ page provides a good introduction to Mustache's synt=
ax. For a more
- complete (and more current) description of Mustache's behavior, see the
- official `Mustache spec <https://github.com/mustache/spec>`__.
-=20
--Pystache is `semantically versioned <http://semver.org>`__ and can be
--found on `PyPI <http://pypi.python.org/pypi/pystache>`__. This version
--of Pystache passes all tests in `version
--1.1.2 <https://github.com/mustache/spec/tree/v1.1.2>`__ of the spec.
-+Pystache is `semantically versioned <http://semver.org>`__ and older
-+versions can still be found on
-+`PyPI <http://pypi.python.org/pypi/pystache>`__. This version of
-+Pystache now passes all tests in `version
-+1.1.3 <https://github.com/mustache/spec/tree/v1.1.3>`__ of the spec.
-=20
- Requirements
- ------------
-=20
- Pystache is tested with--
-=20
---  Python 2.4 (requires simplejson `version
--   2.0.9 <http://pypi.python.org/pypi/simplejson/2.0.9>`__ or earlier)
---  Python 2.5 (requires
--   `simplejson <http://pypi.python.org/pypi/simplejson/>`__)
---  Python 2.6
---  Python 2.7
---  Python 3.1
---  Python 3.2
---  Python 3.3
---  `PyPy <http://pypy.org/>`__
-+-  Python 3.6
-+-  Python 3.7
-+-  Python 3.8
-+-  Python 3.9
-+-  Conda (py36-py39)
-=20
- `Distribute <http://packages.python.org/distribute/>`__ (the setuptools
--fork) is recommended over
--`setuptools <http://pypi.python.org/pypi/setuptools>`__, and is require=
d
--in some cases (e.g. for Python 3 support). If you use
--`pip <http://www.pip-installer.org/>`__, you probably already satisfy
--this requirement.
-+fork) is no longer required over
-+`setuptools <http://pypi.python.org/pypi/setuptools>`__, as the current
-+packaging is now PEP517-compliant.
-=20
- JSON support is needed only for the command-line interface and to run
--the spec tests. We require simplejson for earlier versions of Python
--since Python's `json <http://docs.python.org/library/json.html>`__
--module was added in Python 2.6.
--
--For Python 2.4 we require an earlier version of simplejson since
--simplejson stopped officially supporting Python 2.4 in simplejson
--version 2.1.0. Earlier versions of simplejson can be installed manually=
,
--as follows:
--
--::
--
--    pip install 'simplejson<2.1.0'
-+the spec tests; PyYAML can still be used (see the Develop section).
-=20
--Official support for Python 2.4 will end with Pystache version 0.6.0.
-+Official support for Python 2 will end with Pystache version 0.6.0.
-=20
- Install It
- ----------
-=20
- ::
-=20
--    pip install pystache
-+   pip install -U pystache -f https://github.com/sarnold/pystache/relea=
ses/
-=20
- And test it--
-=20
- ::
-=20
--    pystache-test
-+   pystache-test
-=20
- To install and test from source (e.g. from GitHub), see the Develop
- section.
-@@ -88,68 +75,68 @@ Use It
-=20
- ::
-=20
--    >>> import pystache
--    >>> print pystache.render('Hi {{person}}!', {'person': 'Mom'})
--    Hi Mom!
-+   >>> import pystache
-+   >>> print(pystache.render('Hi {{person}}!', {'person': 'Mom'}))
-+   Hi Mom!
-=20
- You can also create dedicated view classes to hold your view logic.
-=20
--Here's your view class (in .../examples/readme.py):
-+Here's your view class (in ../pystache/tests/examples/readme.py):
-=20
- ::
-=20
--    class SayHello(object):
--        def to(self):
--            return "Pizza"
-+   class SayHello(object):
-+       def to(self):
-+           return "Pizza"
-=20
- Instantiating like so:
-=20
- ::
-=20
--    >>> from pystache.tests.examples.readme import SayHello
--    >>> hello =3D SayHello()
-+   >>> from pystache.tests.examples.readme import SayHello
-+   >>> hello =3D SayHello()
-=20
--Then your template, say\_hello.mustache (by default in the same
--directory as your class definition):
-+Then your template, say_hello.mustache (by default in the same director=
y
-+as your class definition):
-=20
- ::
-=20
--    Hello, {{to}}!
-+   Hello, {{to}}!
-=20
- Pull it together:
-=20
- ::
-=20
--    >>> renderer =3D pystache.Renderer()
--    >>> print renderer.render(hello)
--    Hello, Pizza!
-+   >>> renderer =3D pystache.Renderer()
-+   >>> print(renderer.render(hello))
-+   Hello, Pizza!
-=20
- For greater control over rendering (e.g. to specify a custom template
- directory), use the ``Renderer`` class like above. One can pass
- attributes to the Renderer class constructor or set them on a Renderer
- instance. To customize template loading on a per-view basis, subclass
- ``TemplateSpec``. See the docstrings of the
--`Renderer <https://github.com/defunkt/pystache/blob/master/pystache/ren=
derer.py>`__
-+`Renderer <https://github.com/sarnold/pystache/blob/master/pystache/ren=
derer.py>`__
- class and
--`TemplateSpec <https://github.com/defunkt/pystache/blob/master/pystache=
/template_spec.py>`__
-+`TemplateSpec <https://github.com/sarnold/pystache/blob/master/pystache=
/template_spec.py>`__
- class for more information.
-=20
- You can also pre-parse a template:
-=20
- ::
-=20
--    >>> parsed =3D pystache.parse(u"Hey {{#who}}{{.}}!{{/who}}")
--    >>> print parsed
--    [u'Hey ', _SectionNode(key=3Du'who', index_begin=3D12, index_end=3D=
18, parsed=3D[_EscapeNode(key=3Du'.'), u'!'])]
-+   >>> parsed =3D pystache.parse(u"Hey {{#who}}{{.}}!{{/who}}")
-+   >>> print(parsed)
-+   ['Hey ', _SectionNode(key=3D'who', index_begin=3D12, index_end=3D18,=
 parsed=3D[_EscapeNode(key=3D'.'), '!'])]
-=20
- And then:
-=20
- ::
-=20
--    >>> print renderer.render(parsed, {'who': 'Pops'})
--    Hey Pops!
--    >>> print renderer.render(parsed, {'who': 'you'})
--    Hey you!
-+   >>> print(renderer.render(parsed, {'who': 'Pops'}))
-+   Hey Pops!
-+   >>> print(renderer.render(parsed, {'who': 'you'}))
-+   Hey you!
-=20
- Python 3
- --------
-@@ -211,22 +198,24 @@ To test from a source distribution (without instal=
ling)--
-=20
- ::
-=20
--    python test_pystache.py
-+   python test_pystache.py
-=20
- To test Pystache with multiple versions of Python (with a single
--command!), you can use `tox <http://pypi.python.org/pypi/tox>`__:
-+command!) and different platforms, you can use
-+`tox <http://pypi.python.org/pypi/tox>`__:
-=20
- ::
-=20
--    pip install 'virtualenv<1.8'  # Version 1.8 dropped support for Pyt=
hon 2.4.
--    pip install 'tox<1.4'  # Version 1.4 dropped support for Python 2.4=
.
--    tox
-+   pip install tox
-+   tox -e setup
-=20
--If you do not have all Python versions listed in ``tox.ini``--
-+To run tests on multiple versions with coverage, run:
-=20
- ::
-=20
--    tox -e py26,py32  # for example
-+   tox -e py38-linux,py39-linux  # for example
-+
-+(substitute your platform above, eg, macos or windows)
-=20
- The source distribution tests also include doctests and tests from the
- Mustache spec. To include tests from the Mustache spec in your test
-@@ -234,8 +223,8 @@ runs:
-=20
- ::
-=20
--    git submodule init
--    git submodule update
-+   git submodule init
-+   git submodule update
-=20
- The test harness parses the spec's (more human-readable) yaml files if
- `PyYAML <http://pypi.python.org/pypi/PyYAML>`__ is present. Otherwise,
-@@ -243,94 +232,113 @@ it parses the json files. To install PyYAML--
-=20
- ::
-=20
--    pip install pyyaml
-+   pip install pyyaml
-+
-+Once the submodule is available, you can run the full test set with:
-+
-+::
-+
-+   tox -e setup . ext/spec/specs
-=20
- To run a subset of the tests, you can use
- `nose <http://somethingaboutorange.com/mrl/projects/nose/0.11.1/testing=
.html>`__:
-=20
- ::
-=20
--    pip install nose
--    nosetests --tests pystache/tests/test_context.py:GetValueTests.test=
_dictionary__key_present
-+   pip install nose
-+   nosetests --tests pystache/tests/test_context.py:GetValueTests.test_=
dictionary__key_present
-=20
--Using Python 3 with Pystache from source
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-+Mailing List (old)
-+------------------
-=20
--Pystache is written in Python 2 and must be converted to Python 3 prior
--to using it with Python 3. The installation process (and tox) do this
--automatically.
-+There is(was) a `mailing
-+list <http://librelist.com/browser/pystache/>`__. Note that there is a
-+bit of a delay between posting a message and seeing it appear in the
-+mailing list archive.
-=20
--To convert the code to Python 3 manually (while using Python 3)--
-+Credits
-+-------
-=20
- ::
-=20
--    python setup.py build
-+   >>> import pystache
-+   >>> context =3D { 'author': 'Chris Wanstrath', 'maintainer': 'Chris =
Jerdonek','refurbisher': 'Steve Arnold' }
-+   >>> print(pystache.render("Author: {{author}}\nMaintainer: {{maintai=
ner}}\nRefurbisher: {{refurbisher}}", context))
-+   Author: Chris Wanstrath
-+   Maintainer: Chris Jerdonek
-+   Refurbisher: Steve Arnold
-=20
--This writes the converted code to a subdirectory called ``build``. By
--design, Python 3 builds
--`cannot <https://bitbucket.org/tarek/distribute/issue/292/allow-use_2to=
3-with-python-2>`__
--be created from Python 2.
-+Pystache logo by `David Phillips <http://davidphillips.us/>`__ is
-+licensed under a `Creative Commons Attribution-ShareAlike 3.0 Unported
-+License <http://creativecommons.org/licenses/by-sa/3.0/deed.en_US>`__.
-+|image10|
-=20
--To convert the code without using setup.py, you can use
--`2to3 <http://docs.python.org/library/2to3.html>`__ as follows (two
--steps)--
-+History
-+=3D=3D=3D=3D=3D=3D=3D
-=20
--::
-+**Note:** Official support for Python 2.7 will end with Pystache versio=
n
-+0.6.0.
-=20
--    2to3 --write --nobackups --no-diffs --doctests_only pystache
--    2to3 --write --nobackups --no-diffs pystache
-+0.6.0 (2021-03-04)
-+------------------
-=20
--This converts the code (and doctests) in place.
-+-  Bump spec versions to latest =3D> v1.1.3
-+-  Modernize python and CI tools, update docs/doctests
-+-  Update unicode conversion test for py3-only
-+-  Add pep8speaks cfg, cleanup warnings
-+-  Remove superfluous setup test/unused imports
-+-  Add conda recipe/CI build
-=20
--To ``import pystache`` from a source distribution while using Python 3,
--be sure that you are importing from a directory containing a converted
--version of the code (e.g. from the ``build`` directory after
--converting), and not from the original (unconverted) source directory.
--Otherwise, you will get a syntax error. You can help prevent this by no=
t
--running the Python IDE from the project directory when importing
--Pystache while using Python 3.
-+.. _section-1:
-=20
--Mailing List
--------------
-+0.5.6 (2021-02-28)
-+------------------
-=20
--There is a `mailing list <http://librelist.com/browser/pystache/>`__.
--Note that there is a bit of a delay between posting a message and seein=
g
--it appear in the mailing list archive.
-+-  Use correct wheel name in release workflow, limit wheels
-+-  Add install check/test of downloaded wheel
-+-  Update/add ci workflows and tox cfg, bump to next dev0 version
-=20
--Credits
---------
-+.. _section-2:
-=20
--::
-+0.5.5 (2020-12-16)
-+------------------
-=20
--    >>> context =3D { 'author': 'Chris Wanstrath', 'maintainer': 'Chris=
 Jerdonek' }
--    >>> print pystache.render("Author: {{author}}\nMaintainer: {{mainta=
iner}}", context)
--    Author: Chris Wanstrath
--    Maintainer: Chris Jerdonek
-+-  fix document processing, update pandoc args and history
-+-  add release.yml to CI, test env settings
-+-  fix bogus commit message, update versions and tox cf
-+-  add post-test steps for building pkgs with/without doc updates
-+-  add CI build check, fix MANIFEST.in pruning
-=20
--Pystache logo by `David Phillips <http://davidphillips.us/>`__ is
--licensed under a `Creative Commons Attribution-ShareAlike 3.0 Unported
--License <http://creativecommons.org/licenses/by-sa/3.0/deed.en_US>`__.
--|image0|
-+.. _section-3:
-=20
--History
--=3D=3D=3D=3D=3D=3D=3D
-+0.5.4-2 (2020-11-09)
-+--------------------
-=20
--**Note:** Official support for Python 2.4 will end with Pystache versio=
n
--0.6.0.
-+-  Merge pull request #1 from sarnold/rebase-up
-+-  Bugfix: test_specloader.py: fix test_find__with_directory on other
-+   OSs
-+-  Bugfix: pystache/loader.py: remove stray windows line-endings
-+-  fix crufty (and insecure) http urls
-+-  Bugfix: modernize python versions (keep py27) and fix spec_test load
-+   cmd
-+
-+.. _section-4:
-=20
- 0.5.4 (2014-07-11)
- ------------------
-=20
- -  Bugfix: made test with filenames OS agnostic (issue #162).
-=20
-+.. _section-5:
-+
- 0.5.3 (2012-11-03)
- ------------------
-=20
- -  Added ability to customize string coercion (e.g. to have None render
-    as ``''``) (issue #130).
---  Added Renderer.render\_name() to render a template by name (issue
-+-  Added Renderer.render_name() to render a template by name (issue
-    #122).
---  Added TemplateSpec.template\_path to specify an absolute path to a
-+-  Added TemplateSpec.template_path to specify an absolute path to a
-    template (issue #41).
- -  Added option of raising errors on missing tags/partials:
-    ``Renderer(missing_tags=3D'strict')`` (issue #110).
-@@ -355,6 +363,8 @@ History
- -  More robust handling of byte strings in Python 3.
- -  Added Creative Commons license for David Phillips's logo.
-=20
-+.. _section-6:
-+
- 0.5.2 (2012-05-03)
- ------------------
-=20
-@@ -367,16 +377,20 @@ History
-    context stack (issue #113).
- -  Bugfix: lists of lambdas for sections were not rendered (issue #114)=
.
-=20
-+.. _section-7:
-+
- 0.5.1 (2012-04-24)
- ------------------
-=20
- -  Added support for Python 3.1 and 3.2.
- -  Added tox support to test multiple Python versions.
- -  Added test script entry point: pystache-test.
---  Added \_\_version\_\_ package attribute.
-+-  Added \__version_\_ package attribute.
- -  Test harness now supports both YAML and JSON forms of Mustache spec.
- -  Test harness no longer requires nose.
-=20
-+.. _section-8:
-+
- 0.5.0 (2012-04-03)
- ------------------
-=20
-@@ -435,11 +449,15 @@ Bug fixes:
- -  Passing ``**kwargs`` to ``Template()`` with no context no longer
-    raises an exception.
-=20
-+.. _section-9:
-+
- 0.4.1 (2012-03-25)
- ------------------
-=20
- -  Added support for Python 2.4. [wangtz, jvantuyl]
-=20
-+.. _section-10:
-+
- 0.4.0 (2011-01-12)
- ------------------
-=20
-@@ -447,19 +465,25 @@ Bug fixes:
- -  Add support for inverted lists
- -  Decoupled template loading
-=20
-+.. _section-11:
-+
- 0.3.1 (2010-05-07)
- ------------------
-=20
- -  Fix package
-=20
-+.. _section-12:
-+
- 0.3.0 (2010-05-03)
- ------------------
-=20
---  View.template\_path can now hold a list of path
-+-  View.template_path can now hold a list of path
- -  Add {{& blah}} as an alias for {{{ blah }}}
- -  Higher Order Sections
- -  Inverted sections
-=20
-+.. _section-13:
-+
- 0.2.0 (2010-02-15)
- ------------------
-=20
-@@ -473,12 +497,16 @@ Bug fixes:
-    [enaeseth]
- -  Template file encoding awareness. [enaeseth]
-=20
-+.. _section-14:
-+
- 0.1.1 (2009-11-13)
- ------------------
-=20
- -  Ensure we're dealing with strings, always
- -  Tests can be run by executing the test file directly
-=20
-+.. _section-15:
-+
- 0.1.0 (2009-11-12)
- ------------------
-=20
-@@ -510,4 +538,23 @@ CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN AC=
TION OF CONTRACT,
- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
- SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-=20
--.. |image0| image:: http://i.creativecommons.org/l/by-sa/3.0/88x31.png
-+.. |ci| image:: https://github.com/sarnold/pystache/actions/workflows/c=
i.yml/badge.svg
-+   :target: https://github.com/sarnold/pystache/actions/workflows/ci.ym=
l
-+.. |Conda| image:: https://github.com/sarnold/pystache/actions/workflow=
s/conda.yml/badge.svg
-+   :target: https://github.com/sarnold/pystache/actions/workflows/conda=
.yml
-+.. |Wheels| image:: https://github.com/sarnold/pystache/actions/workflo=
ws/wheels.yml/badge.svg
-+   :target: https://github.com/sarnold/pystache/actions/workflows/wheel=
s.yml
-+.. |Release| image:: https://github.com/sarnold/pystache/actions/workfl=
ows/release.yml/badge.svg
-+   :target: https://github.com/sarnold/pystache/actions/workflows/relea=
se.yml
-+.. |Python| image:: https://img.shields.io/badge/python-3.6+-blue.svg
-+   :target: https://www.python.org/downloads/
-+.. |Latest release| image:: https://img.shields.io/github/v/release/sar=
nold/pystache?include_prereleases
-+   :target: https://github.com/sarnold/pystache/releases/latest
-+.. |License| image:: https://img.shields.io/github/license/sarnold/pyst=
ache
-+   :target: https://github.com/sarnold/pystache/blob/master/LICENSE
-+.. |Maintainability| image:: https://api.codeclimate.com/v1/badges/a8fa=
1bf4638bfc6581b6/maintainability
-+   :target: https://codeclimate.com/github/sarnold/pystache/maintainabi=
lity
-+.. |codecov| image:: https://codecov.io/gh/sarnold/pystache/branch/mast=
er/graph/badge.svg?token=3D5PZNMZBI6K
-+   :target: https://codecov.io/gh/sarnold/pystache
-+.. |image9| image:: gh/images/logo_phillips_small.png
-+.. |image10| image:: http://i.creativecommons.org/l/by-sa/3.0/88x31.png
-diff --git a/tox.ini b/tox.ini
-index d1eaebf..66c4515 100644
---- a/tox.ini
-+++ b/tox.ini
-@@ -1,36 +1,110 @@
--# A tox configuration file to test across multiple Python versions.
--#
--#   http://pypi.python.org/pypi/tox
--#
- [tox]
--# Tox 1.4 drops py24 and adds py33.  In the current version, we want to
--# support 2.4, so we can't simultaneously support 3.3.
--envlist =3D py24,py25,py26,py27,py27-yaml,py27-noargs,py31,py32,pypy
-+envlist =3D py{36,37,38,39}-{linux,macos,windows}
-+skip_missing_interpreters =3D true
-+isolated_build =3D true
-+#skipsdist =3D true
-+
-+[gh-actions]
-+python =3D
-+    3.6: py36
-+    3.7: py37
-+    3.8: py38
-+    3.9: py39
-+
-+[gh-actions:env]
-+PLATFORM =3D
-+    ubuntu-18.04: linux
-+    macos-latest: macos
-+    windows-latest: windows
-=20
- [testenv]
-+passenv =3D CI PYTHON PYTHONIOENCODING
-+
-+deps =3D
-+    pip>=3D20.0.1
-+    nose
-+    coverage
-+
-+commands =3D
-+    nosetests -sx . {posargs}
-+
-+[testenv:bare]
- # Change the working directory so that we don't import the pystache loc=
ated
- # in the original location.
-+deps =3D
-+    pip>=3D20.0.1
-+    -e .
-+
- changedir =3D
-     {envbindir}
-+
- commands =3D
--    pystache-test {toxinidir}
-+    pystache-test
-+
-+[testenv:bench]
-+passenv =3D CI PYTHON PYTHONIOENCODING
-=20
--# Check that the spec tests work with PyYAML.
--[testenv:py27-yaml]
--basepython =3D
--    python2.7
- deps =3D
--    PyYAML
--changedir =3D
--    {envbindir}
-+    pip>=3D20.0.1
-+    # uncomment for comparison, posargs expects a number, eg, 10000
-+    #chevron
-+
-+commands_pre =3D
-+    pip install .
-+
- commands =3D
--    pystache-test {toxinidir}
-+    python pystache/tests/benchmark.py {posargs}
-+
-+[testenv:setup]
-+passenv =3D CI PYTHON PYTHONIOENCODING
-+
-+deps =3D
-+    pyyaml
-+    twine
-+
-+commands =3D
-+    python setup.py install
-+    twine check dist/*
-+    pystache-test {posargs}
-+
-+[testenv:deploy]
-+passenv =3D CI PYTHON PYTHONIOENCODING
-+allowlist_externals =3D bash
-+
-+deps =3D
-+    pip>=3D19.0.1
-+    wheel
-+    pep517
-+    twine
-+
-+commands =3D
-+    python -m pep517.build .
-+    twine check dist/*
-+
-+[testenv:check]
-+passenv =3D CI PYTHON PYTHONIOENCODING
-+skip_install =3D true
-+
-+allowlist_externals =3D bash
-+
-+deps =3D
-+    pip>=3D20.0.1
-=20
--# Check that pystache-test works from an install with no arguments.
--[testenv:py27-noargs]
--basepython =3D
--    python2.7
--changedir =3D
--    {envbindir}
- commands =3D
-+    bash -c 'export WHL_FILE=3D$(ls dist/*.whl); \
-+        python -m pip install $WHL_FILE'
-     pystache-test
-+
-+[testenv:docs]
-+passenv =3D CI PYTHON PYTHONIOENCODING
-+allowlist_externals =3D bash
-+
-+deps =3D
-+    pip>=3D19.0.1
-+    wheel
-+    docutils
-+    # apt/emerge pandoc first
-+
-+commands =3D
-+    python setup.py prep
-+    bash -c 'python setup.py --long-description | rst2html.py -v --no-r=
aw > out.html'
-diff --git a/travis.yml_disabled b/travis.yml_disabled
-new file mode 100644
-index 0000000..f0b4042
---- /dev/null
-+++ b/travis.yml_disabled
-@@ -0,0 +1,52 @@
-+dist: xenial
-+language: python
-+
-+# Travis CI has no plans to support Jython and no longer supports Pytho=
n 2.5.
-+python:
-+  - "2.7"
-+  - "3.5"
-+  - "3.6"
-+  - "3.7"
-+  - "3.8"
-+  - "3.9-dev"
-+  - "nightly"
-+
-+matrix:
-+  fast_finish: true
-+  include:
-+    - os: osx
-+      # osx is goofy, ``python`` is always py2, images mutate fast
-+      language: shell
-+      before_install:
-+        - pip3 install --upgrade pip wheel
-+      install:
-+        - python3 setup.py install
-+      script:
-+        - pystache-test . ext/spec/specs
-+    - os: windows
-+      # windows is even goofier, install path is different for python/p=
ython3
-+      # but either way you get python3 and the cmd is always ``python``=
  o.O=20
-+      # (also versions mutuate like bacteria)
-+      language: shell
-+      before_install:
-+        - choco install python3 --params "/InstallDir:C:\\Python"
-+        - python -m pip install --upgrade pip wheel
-+      env: PATH=3D"/c/Python:/c/Python/Scripts:$PATH"
-+      install:
-+        - python setup.py install
-+      script:
-+        - pystache-test . ext/spec/specs
-+  allow_failures:
-+    - python: "nightly"
-+
-+# command to install dependencies
-+install:
-+  - pip install --upgrade pip
-+  - pip install codecov
-+
-+script:
-+  - python setup.py install
-+  # Include the spec tests directory for Mustache spec tests and the
-+  # project directory for doctests.
-+  - pystache-test . ext/spec/specs
-+  #- tox
---=20
-2.33.0
-
diff --git a/meta-python/recipes-devtools/python/python3-pystache_0.5.4.b=
b b/meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb
deleted file mode 100644
index 0ae5a19115..0000000000
--- a/meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY =3D "Python implementation of Mustache"
-HOMEPAGE =3D "https://github.com/defunkt/pystache"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deb4417802c56384aac71b34505528=
a60"
-
-SRC_URI +=3D "file://0001-Modernize-python-versions-remove-py2x-and-fix-=
tests-.patch"
-
-SRC_URI[md5sum] =3D "485885e67a0f6411d5252e69b20a35ca"
-SRC_URI[sha256sum] =3D "f7bbc265fb957b4d6c7c042b336563179444ab313fb93a71=
9759111eabd3b85a"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} +=3D " \
-    ${PYTHON_PN}-netserver \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1



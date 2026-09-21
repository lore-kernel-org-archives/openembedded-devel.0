Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4DDC98300
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:12 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47401.1789991769376761731
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=p+QsA8QW;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout01.t-online.de (Postfix) with SMTP id 4CF021C44A
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8ccB-04X1zH0; Mon, 21 Sep 2026 13:55:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 20/24] python3-transitions: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:56 +0200
Message-ID: <20260921115500.53770-20-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991719-EFFFCA93-5803F209/0/0 CLEAN NORMAL
X-TOI-MSGID: c3455ae1-0c56-4fe5-8d20-a03d86c757ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991722; i=f_l_k@t-online.de;
	bh=Kfk8ClS6+zTIOkCdNrY0R12JQH5f7/oOHoG6hytEI4A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=p+QsA8QWGB4kMIzAH+fq6tUpOxtUd2QWtthxi6R30EMEDZSvhbwoV+3YiYvQUzmUB
	 zwaEKexx2UdYMgy7LmsVYh4m9wZwjf5WR1iUDFF3DBhz0eUy5nI91KI+hcJe9Jb20J
	 dqP3FV3MCWaRqejTAaI4++5HvqDuY/co+nlToPoFNHzOFC0Ade4AGtWk7pg6/3FxvB
	 1VGSdmdSCr6joQhN8p0ASUE4a07krQpZaRCqqHUFx4jvY2Y76MA6o1Upm/cG5Wmel1
	 hcy7eGHxbZWZdhGINA7OMhEgYMaQVc3iZItDp4USlXa+GGJ/66ObwWXJd1Ola8gjby
	 B30WxfLhSjBgw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130152

Patch transitions to use the Python 3 equivalents of the six helpers and
drop the runtime dependency.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-drop-the-six-dependency.patch        | 237 ++++++++++++++++++
 .../python/python3-transitions_0.9.3.bb       |   3 +-
 2 files changed, 239 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-transitio=
ns/0001-drop-the-six-dependency.patch

diff --git a/meta-python/recipes-devtools/python/python3-transitions/0001=
-drop-the-six-dependency.patch b/meta-python/recipes-devtools/python/pyth=
on3-transitions/0001-drop-the-six-dependency.patch
new file mode 100644
index 0000000000..a9011565ab
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-transitions/0001-drop-t=
he-six-dependency.patch
@@ -0,0 +1,237 @@
+From 28d8f0047b18afc5b9a9822c548fb20cc676b97b Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Sep 2026 13:06:58 +0200
+Subject: [PATCH] drop the six dependency
+
+six is a Python 2 compatibility shim. string_types, iteritems and
+add_metaclass have direct Python 3 equivalents, so the state machine
+keeps its behaviour without the dependency.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ requirements.txt                        | 1 -
+ setup.py                                | 3 +--
+ transitions/core.py                     | 5 ++---
+ transitions/extensions/diagrams_base.py | 4 +---
+ transitions/extensions/factory.py       | 3 +--
+ transitions/extensions/markup.py        | 7 +++----
+ transitions/extensions/nesting.py       | 19 +++++++++----------
+ 7 files changed, 17 insertions(+), 25 deletions(-)
+
+diff --git a/requirements.txt b/requirements.txt
+index ffe2fce..e69de29 100644
+--- a/requirements.txt
++++ b/requirements.txt
+@@ -1 +0,0 @@
+-six
+diff --git a/setup.py b/setup.py
+index 680e12a..2c9932a 100644
+--- a/setup.py
++++ b/setup.py
+@@ -43,8 +43,7 @@ setup(
+         "transitions.tests": ["data/*"],
+     },
+     include_package_data=3DTrue,
+-    install_requires=3D["six"],
+-    extras_require=3Dextras_require,
++        extras_require=3Dextras_require,
+     tests_require=3Dtests_require,
+     license=3D"MIT",
+     download_url=3D"https://github.com/pytransitions/transitions/archiv=
e/%s.tar.gz"
+diff --git a/transitions/core.py b/transitions/core.py
+index 8eaa3dc..42f3c1a 100644
+--- a/transitions/core.py
++++ b/transitions/core.py
+@@ -31,7 +31,6 @@ import warnings
+=20
+ from collections import OrderedDict, defaultdict, deque
+ from functools import partial
+-from six import string_types
+=20
+ _LOGGER =3D logging.getLogger(__name__)
+ _LOGGER.addHandler(logging.NullHandler())
+@@ -838,7 +837,7 @@ class Machine(object):
+         states =3D listify(states)
+=20
+         for state in states:
+-            if isinstance(state, (string_types, Enum)):
++            if isinstance(state, (str, Enum)):
+                 state =3D self._create_state(
+                     state, on_enter=3Don_enter, on_exit=3Don_exit,
+                     ignore_invalid_triggers=3Dignore, **kwargs)
+@@ -1205,7 +1204,7 @@ class Machine(object):
+         Returns:
+             callable function resolved from string or func
+         """
+-        if isinstance(func, string_types):
++        if isinstance(func, str):
+             try:
+                 func =3D getattr(event_data.model, func)
+                 if not callable(func):  # if a property or some other n=
ot callable attribute was passed
+diff --git a/transitions/extensions/diagrams_base.py b/transitions/exten=
sions/diagrams_base.py
+index e97bd06..6ead5c6 100644
+--- a/transitions/extensions/diagrams_base.py
++++ b/transitions/extensions/diagrams_base.py
+@@ -8,14 +8,12 @@
+ import copy
+ import abc
+ import logging
+-import six
+=20
+ _LOGGER =3D logging.getLogger(__name__)
+ _LOGGER.addHandler(logging.NullHandler())
+=20
+=20
+-@six.add_metaclass(abc.ABCMeta)
+-class BaseGraph(object):
++class BaseGraph(object, metaclass=3Dabc.ABCMeta):
+     """Provides the common foundation for graphs generated either with =
pygraphviz or graphviz. This abstract class
+     should not be instantiated directly. Use .(py)graphviz.(Nested)Grap=
h instead.
+     Attributes:
+diff --git a/transitions/extensions/factory.py b/transitions/extensions/=
factory.py
+index e56541c..83b2f19 100644
+--- a/transitions/extensions/factory.py
++++ b/transitions/extensions/factory.py
+@@ -9,7 +9,6 @@
+=20
+ from functools import partial
+ import itertools
+-from six import iteritems
+=20
+ from ..core import Machine, Transition
+=20
+@@ -78,7 +77,7 @@ class LockedGraphMachine(GraphMachine, LockedMachine):
+                 ", ".join(itertools.chain(
+                     (str(_) for _ in func.args[1:]),
+                     ("%s=3D%s" % (key, value)
+-                     for key, value in iteritems(func.keywords if func.=
keywords else {})))))
++                     for key, value in (func.keywords if func.keywords =
else {}).items()))))
+         return GraphMachine.format_references(func)
+=20
+=20
+diff --git a/transitions/extensions/markup.py b/transitions/extensions/m=
arkup.py
+index 6961826..f974589 100644
+--- a/transitions/extensions/markup.py
++++ b/transitions/extensions/markup.py
+@@ -12,7 +12,6 @@ import importlib
+ import itertools
+ import numbers
+=20
+-from six import string_types, iteritems
+=20
+ try:
+     # Enums are supported for Python 3.4+ and Python 2.7 with enum34 pa=
ckage installed
+@@ -143,7 +142,7 @@ class MarkupMachine(Machine):
+                 ", ".join(itertools.chain(
+                     (str(_) for _ in func.args),
+                     ("%s=3D%s" % (key, value)
+-                     for key, value in iteritems(func.keywords if func.=
keywords else {})))))
++                     for key, value in (func.keywords if func.keywords =
else {}).items()))))
+         return str(func)
+=20
+     def _convert_states_and_transitions(self, root):
+@@ -236,7 +235,7 @@ class HierarchicalMarkupMachine(MarkupMachine, Hiera=
rchicalMachine):
+=20
+ def rep(func, format_references=3DNone):
+     """Return a string representation for `func`."""
+-    if isinstance(func, string_types):
++    if isinstance(func, str):
+         return func
+     if isinstance(func, numbers.Number):
+         return str(func)
+@@ -249,7 +248,7 @@ def _convert(obj, attributes, format_references):
+         val =3D getattr(obj, key, False)
+         if not val:
+             continue
+-        if isinstance(val, string_types):
++        if isinstance(val, str):
+             definition[key] =3D val
+         elif val is True:
+             definition[key] =3D True
+diff --git a/transitions/extensions/nesting.py b/transitions/extensions/=
nesting.py
+index b115363..4566cb0 100644
+--- a/transitions/extensions/nesting.py
++++ b/transitions/extensions/nesting.py
+@@ -24,7 +24,6 @@ except ImportError:  # pragma: no cover
+     class EnumMeta:  # type: ignore
+         """This is just an EnumMeta stub for Python 2 and Python 3.3 an=
d before without Enum support."""
+=20
+-from six import string_types
+=20
+ from ..core import State, Machine, Transition, Event, listify, MachineE=
rror, EventData
+=20
+@@ -417,7 +416,7 @@ class HierarchicalMachine(Machine):
+         )
+=20
+     def __call__(self, to_scope=3DNone):
+-        if isinstance(to_scope, string_types):
++        if isinstance(to_scope, str):
+             state_name =3D to_scope.split(self.state_cls.separator)[0]
+             state =3D self.states[state_name]
+             to_scope =3D (state, state.states, state.events, self.prefi=
x_path + [state_name])
+@@ -451,7 +450,7 @@ class HierarchicalMachine(Machine):
+         if hasattr(initial_name, 'name'):
+             initial_name =3D initial_name.name
+         # initial states set by add_model or machine might contain init=
ial states themselves.
+-        if isinstance(initial_name, string_types):
++        if isinstance(initial_name, str):
+             initial_states =3D self._resolve_initial(models, initial_na=
me.split(self.state_cls.separator))
+         # when initial is set to a (parallel) state, we accept it as it=
 is
+         else:
+@@ -516,7 +515,7 @@ class HierarchicalMachine(Machine):
+                     state =3D {'name': state, 'children': state.value}
+                 elif isinstance(state.value, dict):
+                     state =3D dict(name=3Dstate, **state.value)
+-            if isinstance(state, string_types):
++            if isinstance(state, str):
+                 self._add_string_state(state, on_enter, on_exit, ignore=
, remap, **kwargs)
+             elif isinstance(state, Enum):
+                 self._add_enum_state(state, on_enter, on_exit, ignore, =
remap, **kwargs)
+@@ -643,7 +642,7 @@ class HierarchicalMachine(Machine):
+         """
+         if isinstance(state, Enum):
+             state =3D self._get_enum_path(state)
+-        elif isinstance(state, string_types):
++        elif isinstance(state, str):
+             state =3D state.split(self.state_cls.separator)
+         if not hint:
+             state =3D copy.copy(state)
+@@ -695,11 +694,11 @@ class HierarchicalMachine(Machine):
+         """
+         with self():
+             source_path =3D [] if source =3D=3D "*" \
+-                else source.split(self.state_cls.separator) if isinstan=
ce(source, string_types) \
++                else source.split(self.state_cls.separator) if isinstan=
ce(source, str) \
+                 else self._get_enum_path(source) if isinstance(source, =
Enum) \
+                 else self._get_state_path(source)
+             dest_path =3D [] if dest =3D=3D "*" \
+-                else dest.split(self.state_cls.separator) if isinstance=
(dest, string_types) \
++                else dest.split(self.state_cls.separator) if isinstance=
(dest, str) \
+                 else self._get_enum_path(dest) if isinstance(dest, Enum=
) \
+                 else self._get_state_path(dest)
+             matches =3D self.get_nested_transitions(trigger, source_pat=
h, dest_path)
+@@ -745,11 +744,11 @@ class HierarchicalMachine(Machine):
+         """
+         with self():
+             source_path =3D [] if source =3D=3D "*" \
+-                else source.split(self.state_cls.separator) if isinstan=
ce(source, string_types) \
++                else source.split(self.state_cls.separator) if isinstan=
ce(source, str) \
+                 else self._get_enum_path(source) if isinstance(source, =
Enum) \
+                 else self._get_state_path(source)
+             dest_path =3D [] if dest =3D=3D "*" \
+-                else dest.split(self.state_cls.separator) if isinstance=
(dest, string_types) \
++                else dest.split(self.state_cls.separator) if isinstance=
(dest, str) \
+                 else self._get_enum_path(dest) if isinstance(dest, Enum=
) \
+                 else self._get_state_path(dest)
+             self._remove_nested_transitions(trigger, source_path, dest_=
path)
+@@ -1169,7 +1168,7 @@ class HierarchicalMachine(Machine):
+                 self._init_state(substate)
+=20
+     def _recursive_initial(self, value):
+-        if isinstance(value, string_types):
++        if isinstance(value, str):
+             path =3D value.split(self.state_cls.separator, 1)
+             if len(path) > 1:
+                 state_name, suffix =3D path
diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.9.=
3.bb b/meta-python/recipes-devtools/python/python3-transitions_0.9.3.bb
index 6a54d3a79a..6bf78f2b9f 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.9.3.bb
@@ -4,8 +4,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dde0a0876a688a4=
483bfafa764773ab39"
=20
 inherit pypi setuptools3
=20
+SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "881fb75bb1654ed55d86060bb067f2c716f8e155f57bb73f=
d444e53713aafec8"
=20
-RDEPENDS:${PN} +=3D "python3-six python3-logging"
+RDEPENDS:${PN} +=3D "python3-logging"
=20
 BBCLASSEXTEND =3D "native"
\ No newline at end of file
--=20
2.55.0



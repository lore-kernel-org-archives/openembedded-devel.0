Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C282C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 04:04:16 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.16382.1665547452498342967
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Oct 2022 21:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jm12bBJn;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665547450; i=@fujitsu.com;
	bh=288MgClIzE7Ba+zdAzxMKZGYgww7OjX9h4REwCeBqdY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jm12bBJnPEH6OR9TaiYi6dabn8E582bQHsy7VJHhKNCXTRTnPlSmh+p3j8ngBatyb
	 vGuh/MaTZ9PlIKe+EYTXlV1lfdpuuMISsDjZ6tMsgTR4YQr4sasv9Bc4mktNBiBrqT
	 aINxTshdGnqiProwVAVgbdry1dAFkWwI/lGQkGfb9E/G5+5ii37y39xktqHi3U3GVR
	 TOkIlB9ZltaPh313ZzMUGbz9cgYzHCnnVsR7AqNiRZtHaXks7XOBU9zWlSW6w0O9/S
	 GLFvEiT9BGmeBGpwKVb02gNFNX1aJWrmUhtJjnluDqgxPWgYj9s6QLgnPC9xfvAmZF
	 a5m3a+BWsiRWQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSXenjVu
  ywfolOhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bPlasZC2YmVUx4tI+9gXGZSxcjF4eQwBNG
  iZPnbzFBONeZJLrm7mPrYuQEcvYwSqx/EANiswmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSwQLrFp/hQmEJtFQFXibNNfxi5GDg5eASeJyW/dQcISAgoSUx6+B2vlFRCUODnzCQvEGA
  mJgy9eMEPUKErMvtzMAmFXSMya1cYEYatJXD23iXkCI/8sJO2zkLQvYGRaxWidVJSZnlGSm5i
  Zo2toYKBraGiqa2mma2iml1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yTopeXWrKJERiU
  KcUJAjsY9+77pXeIUZKDSUmUV6XHNVmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO9PS7dkIcGi1
  PTUirTMHGCEwKQlOHiURHgVLIDSvMUFibnFmekQqVOMuhxTZ//bzyzEkpeflyolzvvfCqhIAK
  QoozQPbgQsWi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub9BLKKJzOvBG7TK6AjmICOOHn
  VCeSIkkSElFQDk1GVxPzN3y2u73rQuPjqpB+it1ds3/ri2va4Y4d3xXZYlJzyNXT95T5zx2Yp
  +a2/HJj08qx1qjlWrpK8FqCgZsUR8OO5gFPNtJLldz3LZOeLOLyN5jqUHZj2dkmo+q4bc3/fc
  Di9dXOT4/q/X6PFLY4rd64LO3TG8Xh94gH9J7FTtx9q7f/kXbrmg92h9DfLX79bmrhhvonv3t
  zUIgHf/PJohrwlEhtW3nu6xONUvFvCsj2H7qj+77+8V9WoXn9b5LGFT6fOPJ2488b0gP2c//+
  dkLholzXveuy5tTrdiUsEZ6uG2Cgv2P8zi3FT+yux7Q9F3K/vEK7hmqd38ve+fIGgPYeUd/49
  83/CHZOZt2adVWIpzkg01GIuKk4EADjrxkhRAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-728.messagelabs.com!1665547449!184990!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32257 invoked from network); 12 Oct 2022 04:04:09 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Oct 2022 04:04:09 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1EB941000CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 05:04:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 11DA91000C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 05:04:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 12 Oct 2022 05:04:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] Add nativesdk-systemd-systemctl as dependency of dnf-plugin-tui
Date: Wed, 12 Oct 2022 12:03:49 +0800
Message-ID: <1665547429-23508-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 04:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99142

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../systemd/nativesdk-systemd-systemctl.bb    |  17 +
 .../systemd/systemd-systemctl/systemctl       | 340 ++++++++++++++++++
 2 files changed, 357 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
 create mode 100755 meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl

diff --git a/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
new file mode 100644
index 0000000000..7ac21aa260
--- /dev/null
+++ b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Wrapper for enabling systemd services"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r6"
+
+inherit nativesdk
+
+SRC_URI = "file://systemctl"
+
+S = "${WORKDIR}"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
+}
diff --git a/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl b/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
new file mode 100755
index 0000000000..6324319a45
--- /dev/null
+++ b/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
@@ -0,0 +1,340 @@
+#!/usr/bin/env python3
+"""systemctl: subset of systemctl used for image construction
+
+Mask/preset systemd units
+"""
+
+import argparse
+import fnmatch
+import os
+import re
+import sys
+
+from collections import namedtuple
+from pathlib import Path
+
+version = 1.0
+
+ROOT = Path("/")
+SYSCONFDIR = Path("etc")
+BASE_LIBDIR = Path("lib")
+LIBDIR = Path("usr", "lib")
+
+locations = list()
+
+
+class SystemdFile():
+    """Class representing a single systemd configuration file"""
+    def __init__(self, root, path):
+        self.sections = dict()
+        self._parse(root, path)
+        dirname = os.path.basename(path.name) + ".d"
+        for location in locations:
+            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):                
+                self._parse(root, path2)
+
+    def _parse(self, root, path):
+        """Parse a systemd syntax configuration file
+
+        Args:
+            path: A pathlib.Path object pointing to the file
+
+        """
+        skip_re = re.compile(r"^\s*([#;]|$)")
+        section_re = re.compile(r"^\s*\[(?P<section>.*)\]")
+        kv_re = re.compile(r"^\s*(?P<key>[^\s]+)\s*=\s*(?P<value>.*)")
+        section = None
+
+        if path.is_symlink():
+            try:
+                path.resolve()
+            except FileNotFoundError:
+                # broken symlink, try relative to root
+                path = root / Path(os.readlink(str(path))).relative_to(ROOT)
+
+        with path.open() as f:
+            for line in f:
+                if skip_re.match(line):
+                    continue
+
+                line = line.strip()
+                m = section_re.match(line)
+                if m:
+                    if m.group('section') not in self.sections:
+                        section = dict()
+                        self.sections[m.group('section')] = section
+                    else:
+                        section = self.sections[m.group('section')]
+                    continue
+
+                while line.endswith("\\"):
+                    line += f.readline().rstrip("\n")
+
+                m = kv_re.match(line)
+                k = m.group('key')
+                v = m.group('value')
+                if k not in section:
+                    section[k] = list()
+                section[k].extend(v.split())
+
+    def get(self, section, prop):
+        """Get a property from section
+
+        Args:
+            section: Section to retrieve property from
+            prop: Property to retrieve
+
+        Returns:
+            List representing all properties of type prop in section.
+
+        Raises:
+            KeyError: if ``section`` or ``prop`` not found
+        """
+        return self.sections[section][prop]
+
+
+class Presets():
+    """Class representing all systemd presets"""
+    def __init__(self, scope, root):
+        self.directives = list()
+        self._collect_presets(scope, root)
+
+    def _parse_presets(self, presets):
+        """Parse presets out of a set of preset files"""
+        skip_re = re.compile(r"^\s*([#;]|$)")
+        directive_re = re.compile(r"^\s*(?P<action>enable|disable)\s+(?P<unit_name>(.+))")
+
+        Directive = namedtuple("Directive", "action unit_name")
+        for preset in presets:
+            with preset.open() as f:
+                for line in f:
+                    m = directive_re.match(line)
+                    if m:
+                        directive = Directive(action=m.group('action'),
+                                              unit_name=m.group('unit_name'))
+                        self.directives.append(directive)
+                    elif skip_re.match(line):
+                        pass
+                    else:
+                        sys.exit("Unparsed preset line in {}".format(preset))
+
+    def _collect_presets(self, scope, root):
+        """Collect list of preset files"""
+        presets = dict()
+        for location in locations:
+            paths = (root / location / scope).glob("*.preset")
+            for path in paths:
+                # earlier names override later ones
+                if path.name not in presets:
+                    presets[path.name] = path
+
+        self._parse_presets([v for k, v in sorted(presets.items())])
+
+    def state(self, unit_name):
+        """Return state of preset for unit_name
+
+        Args:
+            presets: set of presets
+            unit_name: name of the unit
+
+        Returns:
+            None: no matching preset
+            `enable`: unit_name is enabled
+            `disable`: unit_name is disabled
+        """
+        for directive in self.directives:
+            if fnmatch.fnmatch(unit_name, directive.unit_name):
+                return directive.action
+
+        return None
+
+
+def add_link(path, target):
+    try:
+        path.parent.mkdir(parents=True)
+    except FileExistsError:
+        pass
+    if not path.is_symlink():
+        print("ln -s {} {}".format(target, path))
+        path.symlink_to(target)
+
+
+class SystemdUnitNotFoundError(Exception):
+    def __init__(self, path, unit):
+        self.path = path
+        self.unit = unit
+
+
+class SystemdUnit():
+    def __init__(self, root, unit):
+        self.root = root
+        self.unit = unit
+        self.config = None
+
+    def _path_for_unit(self, unit):
+        for location in locations:
+            path = self.root / location / "system" / unit
+            if path.exists() or path.is_symlink():
+                return path
+
+        raise SystemdUnitNotFoundError(self.root, unit)
+
+    def _process_deps(self, config, service, location, prop, dirstem):
+        systemdir = self.root / SYSCONFDIR / "systemd" / "system"
+
+        target = ROOT / location.relative_to(self.root)
+        try:
+            for dependent in config.get('Install', prop):
+                wants = systemdir / "{}.{}".format(dependent, dirstem) / service
+                add_link(wants, target)
+
+        except KeyError:
+            pass
+
+    def enable(self, caller_unit=None):
+        # if we're enabling an instance, first extract the actual instance
+        # then figure out what the template unit is
+        template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.unit)
+        if template:
+            instance = template.group('instance')
+            unit = re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
+        else:
+            instance = None
+            unit = self.unit
+
+        path = self._path_for_unit(unit)
+
+        if path.is_symlink():
+            # ignore aliases
+            return
+
+        config = SystemdFile(self.root, path)
+        if instance == "":
+            try:
+                default_instance = config.get('Install', 'DefaultInstance')[0]
+            except KeyError:
+                # no default instance, so nothing to enable
+                return
+
+            service = self.unit.replace("@.",
+                                        "@{}.".format(default_instance))
+        else:
+            service = self.unit
+
+        self._process_deps(config, service, path, 'WantedBy', 'wants')
+        self._process_deps(config, service, path, 'RequiredBy', 'requires')
+
+        try:
+            for also in config.get('Install', 'Also'):
+                try:
+                    if caller_unit != also:
+                        SystemdUnit(self.root, also).enable(unit)
+                except SystemdUnitNotFoundError as e:
+                    sys.exit("Error: Systemctl also enable issue with  %s (%s)" % (service, e.unit))
+
+        except KeyError:
+            pass
+
+        systemdir = self.root / SYSCONFDIR / "systemd" / "system"
+        target = ROOT / path.relative_to(self.root)
+        try:
+            for dest in config.get('Install', 'Alias'):
+                alias = systemdir / dest
+                add_link(alias, target)
+
+        except KeyError:
+            pass
+
+    def mask(self):
+        systemdir = self.root / SYSCONFDIR / "systemd" / "system"
+        add_link(systemdir / self.unit, "/dev/null")
+
+
+def collect_services(root):
+    """Collect list of service files"""
+    services = set()
+    for location in locations:
+        paths = (root / location / "system").glob("*")
+        for path in paths:
+            if path.is_dir():
+                continue
+            services.add(path.name)
+
+    return services
+
+
+def preset_all(root):
+    presets = Presets('system-preset', root)
+    services = collect_services(root)
+
+    for service in services:
+        state = presets.state(service)
+
+        if state == "enable" or state is None:
+            try:
+                SystemdUnit(root, service).enable()
+            except SystemdUnitNotFoundError:
+                sys.exit("Error: Systemctl preset_all issue in %s" % service)
+
+    # If we populate the systemd links we also create /etc/machine-id, which
+    # allows systemd to boot with the filesystem read-only before generating
+    # a real value and then committing it back.
+    #
+    # For the stateless configuration, where /etc is generated at runtime
+    # (for example on a tmpfs), this script shouldn't run at all and we
+    # allow systemd to completely populate /etc.
+    (root / SYSCONFDIR / "machine-id").touch()
+
+
+def main():
+    if sys.version_info < (3, 4, 0):
+        sys.exit("Python 3.4 or greater is required")
+
+    parser = argparse.ArgumentParser()
+    parser.add_argument('command', nargs='?', choices=['enable', 'mask',
+                                                     'preset-all'])
+    parser.add_argument('service', nargs=argparse.REMAINDER)
+    parser.add_argument('--root')
+    parser.add_argument('--preset-mode',
+                        choices=['full', 'enable-only', 'disable-only'],
+                        default='full')
+
+    args = parser.parse_args()
+
+    root = Path(args.root) if args.root else ROOT
+
+    locations.append(SYSCONFDIR / "systemd")
+    # Handle the usrmerge case by ignoring /lib when it's a symlink
+    if not (root / BASE_LIBDIR).is_symlink():
+        locations.append(BASE_LIBDIR / "systemd")
+    locations.append(LIBDIR / "systemd")
+
+    command = args.command
+    if not command:
+        parser.print_help()
+        return 0
+
+    if command == "mask":
+        for service in args.service:
+            try:
+                SystemdUnit(root, service).mask()
+            except SystemdUnitNotFoundError as e:
+                sys.exit("Error: Systemctl main mask issue in %s (%s)" % (service, e.unit))
+    elif command == "enable":
+        for service in args.service:
+            try:
+                SystemdUnit(root, service).enable()
+            except SystemdUnitNotFoundError as e:
+                sys.exit("Error: Systemctl main enable issue in %s (%s)" % (service, e.unit))
+    elif command == "preset-all":
+        if len(args.service) != 0:
+            sys.exit("Too many arguments.")
+        if args.preset_mode != "enable-only":
+            sys.exit("Only enable-only is supported as preset-mode.")
+        preset_all(root)
+    else:
+        raise RuntimeError()
+
+
+if __name__ == '__main__':
+    main()
-- 
2.25.1



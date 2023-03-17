Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09731C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 07:25:57 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.13882.1679037954770921077
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Mar 2023 00:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z4CD4tBn;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id o12so16791253edb.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 00:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679037953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6Pzt6SfbNdSiPD0i+OSBDQEefTdoyTC4FtImzSJtho=;
        b=Z4CD4tBnRvEObpQ6SvuDD4qelKknvpZ0v0tGpIUY79YHHPD4hWuPxjO4J8Y9VETqou
         r3XzAECeU3aZwt3hsvz/KEd7F4GZ6EiUt8G5xgWCSYxz77g5EujnshHyqP9tKzPrpiDV
         lFe7h5UEgThn32JMrXAdRFMUW7BQpeZWNnO+f5q2/xUY8LyNBCDkaLUCmWiDsx+DyMsB
         Fe9RuFtSgm5qOi1s9sACJG73PinMIGNTYNzHeZu1gPNLotKl7e6E/W+OCg3QI5njww+f
         jFfyQZaOz0vzsklD+2edbRdDrq7ci6sOpmytpa3itGSSjDqUe7Ho9vKdhGVGJijLGncQ
         ng3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679037953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6Pzt6SfbNdSiPD0i+OSBDQEefTdoyTC4FtImzSJtho=;
        b=F/uzXMkUY1YsJkj0iysA8xVZWLl21D7+rTXmNtsgP7GJk7642j7vbXjVf/jmrbEqJj
         /9K9iG6WnY4L8bPCP1blJrtmw2hK5WgwmlY3+E1eOLZARGfD0oKutULG1QftuwGn0vzC
         UEhnmVU3fNYRgJ3KA2kxV4KEHQkxowt8BAmQscCawHK1rZxZ50YE7PibLgJtUyrJBJmu
         MWoERY+AbFWcsbdOsp8rswLiV56W9uUaHuqCaAWSK6RXnPZaLc2o/+C/pFdI9B/uQ93a
         dp0hDYlNHUAMZrNitVIDoczCrabVPVOr/lDXp5KAChsyZjmpYnBxN/nnPfZVpqHBzcMy
         3Niw==
X-Gm-Message-State: AO0yUKUkaYdLYsYxcD5K3MCAbWYeJ977l5t10KVmOKfGagOAKEY04XyU
	KHDW16DlbaSzeVleJxxHq1cLFA+DVOYlxQ==
X-Google-Smtp-Source: AK7set88bln0JU34Wq97GlGmL2PjYHzkPjR340vk/UAgRPDdJgymujm40C6xUR+82/oS3NNsDmoNFw==
X-Received: by 2002:a17:906:da85:b0:931:1ccb:7360 with SMTP id xh5-20020a170906da8500b009311ccb7360mr4459569ejb.39.1679037952992;
        Fri, 17 Mar 2023 00:25:52 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id zc14-20020a170906988e00b00927f6c799e6sm621864ejb.132.2023.03.17.00.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 00:25:52 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v2 4/4] python3-meson-python: New recipe
Date: Fri, 17 Mar 2023 08:25:47 +0100
Message-Id: <20230317072547.1031123-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317072547.1031123-1-zboszor@gmail.com>
References: <20230317072547.1031123-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 07:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101589

Used by inherit python_mesonpy.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../remove-hardcoded-setup-args.patch         | 123 ++++++++++++++++++
 .../use-installed-mesonpy.patch               |   9 ++
 .../python3-meson-python_0.13.0.pre0.bb       |  28 ++++
 3 files changed, 160 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-meson-python/remove-hardcoded-setup-args.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-meson-python/use-installed-mesonpy.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-meson-python_0.13.0.pre0.bb

diff --git a/meta-python/recipes-devtools/python/python3-meson-python/remove-hardcoded-setup-args.patch b/meta-python/recipes-devtools/python/python3-meson-python/remove-hardcoded-setup-args.patch
new file mode 100644
index 000000000..3edda85dc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-meson-python/remove-hardcoded-setup-args.patch
@@ -0,0 +1,123 @@
+--- meson_python-0.13.0.pre0/mesonpy/__init__.py.old	1970-01-01 01:00:00.000000000 +0100
++++ meson_python-0.13.0.pre0/mesonpy/__init__.py	2023-03-13 21:26:52.263117416 +0100
+@@ -669,8 +669,6 @@
+         self._build_dir = pathlib.Path(build_dir).absolute() if build_dir else (self._working_dir / 'build')
+         self._editable_verbose = editable_verbose
+         self._install_dir = self._working_dir / 'install'
+-        self._meson_native_file = self._source_dir / '.mesonpy-native-file.ini'
+-        self._meson_cross_file = self._source_dir / '.mesonpy-cross-file.ini'
+         self._meson_args: MesonArgs = collections.defaultdict(list)
+         self._env = os.environ.copy()
+ 
+@@ -679,32 +677,6 @@
+         if ninja_path is not None:
+             self._env.setdefault('NINJA', str(ninja_path))
+ 
+-        # setuptools-like ARCHFLAGS environment variable support
+-        if sysconfig.get_platform().startswith('macosx-'):
+-            archflags = self._env.get('ARCHFLAGS')
+-            if archflags is not None:
+-                arch, *other = filter(None, (x.strip() for x in archflags.split('-arch')))
+-                if other:
+-                    raise ConfigError(f'Multi-architecture builds are not supported but $ARCHFLAGS={archflags!r}')
+-                macver, _, nativearch = platform.mac_ver()
+-                if arch != nativearch:
+-                    x = self._env.setdefault('_PYTHON_HOST_PLATFORM', f'macosx-{macver}-{arch}')
+-                    if not x.endswith(arch):
+-                        raise ConfigError(f'$ARCHFLAGS={archflags!r} and $_PYTHON_HOST_PLATFORM={x!r} do not agree')
+-                    family = 'aarch64' if arch == 'arm64' else arch
+-                    cross_file_data = textwrap.dedent(f'''
+-                        [binaries]
+-                        c = ['cc', '-arch', {arch!r}]
+-                        cpp = ['c++', '-arch', {arch!r}]
+-                        [host_machine]
+-                        system = 'Darwin'
+-                        cpu = {arch!r}
+-                        cpu_family = {family!r}
+-                        endian = 'little'
+-                    ''')
+-                    self._meson_cross_file.write_text(cross_file_data)
+-                    self._meson_args['setup'].extend(('--cross-file', os.fspath(self._meson_cross_file)))
+-
+         # load config -- PEP 621 support is optional
+         self._config = tomllib.loads(self._source_dir.joinpath('pyproject.toml').read_text())
+         self._pep621 = 'project' in self._config
+@@ -749,19 +721,6 @@
+             [binaries]
+             python = '{sys.executable}'
+         ''')
+-        native_file_mismatch = (
+-            not self._meson_native_file.exists()
+-            or self._meson_native_file.read_text() != native_file_data
+-        )
+-        if native_file_mismatch:
+-            try:
+-                self._meson_native_file.write_text(native_file_data)
+-            except OSError:
+-                # if there are permission errors or something else in the source
+-                # directory, put the native file in the working directory instead
+-                # (this won't survive multiple calls -- Meson will have to be reconfigured)
+-                self._meson_native_file = self._working_dir / '.mesonpy-native-file.ini'
+-                self._meson_native_file.write_text(native_file_data)
+ 
+         # Don't reconfigure if build directory doesn't have meson-private/coredata.data
+         # (means something went wrong)
+@@ -784,7 +743,7 @@
+     def _proc(self, *args: str) -> None:
+         """Invoke a subprocess."""
+         print('{cyan}{bold}+ {}{reset}'.format(' '.join(args), **_STYLES))
+-        r = subprocess.run(list(args), env=self._env, cwd=self._build_dir)
++        r = subprocess.run(' '.join(list(args)).split(), env=self._env, cwd=self._build_dir)
+         if r.returncode != 0:
+             raise SystemExit(r.returncode)
+ 
+@@ -800,22 +759,6 @@
+         """
+         sys_paths = mesonpy._introspection.SYSCONFIG_PATHS
+         setup_args = [
+-            f'--prefix={sys.base_prefix}',
+-            os.fspath(self._source_dir),
+-            os.fspath(self._build_dir),
+-            f'--native-file={os.fspath(self._meson_native_file)}',
+-            # TODO: Allow configuring these arguments
+-            '-Ddebug=false',
+-            '-Doptimization=2',
+-
+-            # XXX: This should not be needed, but Meson is using the wrong paths
+-            #      in some scenarios, like on macOS.
+-            #      https://github.com/mesonbuild/meson-python/pull/87#discussion_r1047041306
+-            '--python.purelibdir',
+-            sys_paths['purelib'],
+-            '--python.platlibdir',
+-            sys_paths['platlib'],
+-
+             # user args
+             *self._meson_args['setup'],
+         ]
+@@ -905,8 +848,7 @@
+         editable_verbose: bool = False,
+     ) -> Iterator[Project]:
+         """Creates a project instance pointing to a temporary working directory."""
+-        with tempfile.TemporaryDirectory(prefix='.mesonpy-', dir=os.fspath(source_dir)) as tmpdir:
+-            yield cls(source_dir, tmpdir, build_dir, meson_args, editable_verbose)
++        yield cls(source_dir, build_dir, build_dir, meson_args, editable_verbose)
+ 
+     @functools.lru_cache()
+     def _info(self, name: str) -> Dict[str, Any]:
+@@ -1105,15 +1047,7 @@
+         for key, value in config_settings.items()
+     }
+ 
+-    builddir_value = config_settings.get('builddir', {})
+-    if len(builddir_value) > 0:
+-        if len(builddir_value) != 1:
+-            raise ConfigError('Only one value for configuration entry "builddir" can be specified')
+-        builddir = builddir_value[0]
+-        if not isinstance(builddir, str):
+-            raise ConfigError(f'Configuration entry "builddir" should be a string not {type(builddir)}')
+-    else:
+-        builddir = None
++    builddir = os.environ.get('MESONPY_BUILD')
+ 
+     def _validate_string_collection(key: str) -> None:
+         assert isinstance(config_settings, Mapping)
diff --git a/meta-python/recipes-devtools/python/python3-meson-python/use-installed-mesonpy.patch b/meta-python/recipes-devtools/python/python3-meson-python/use-installed-mesonpy.patch
new file mode 100644
index 000000000..64c2c304c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-meson-python/use-installed-mesonpy.patch
@@ -0,0 +1,9 @@
+--- meson_python-0.13.0.pre0/pyproject.toml.old	2023-03-14 08:55:19.092987968 +0100
++++ meson_python-0.13.0.pre0/pyproject.toml	2023-03-14 08:55:40.108672980 +0100
+@@ -1,6 +1,5 @@
+ [build-system]
+ build-backend = 'mesonpy'
+-backend-path = ['.']
+ requires = [
+   'meson>=0.63.3',
+   'pyproject-metadata>=0.7.1',
diff --git a/meta-python/recipes-devtools/python/python3-meson-python_0.13.0.pre0.bb b/meta-python/recipes-devtools/python/python3-meson-python_0.13.0.pre0.bb
new file mode 100644
index 000000000..a113408d7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-meson-python_0.13.0.pre0.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Meson Python build backend (PEP 517)"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d580b27e67cc0892a5b005b0be114b60"
+
+DEPENDS = " \
+	meson-native ninja-native python3-ninja-native \
+	python3-pyproject-metadata-native \
+	python3-patchelf-native \
+"
+
+PYPI_PACKAGE = "meson_python"
+
+inherit pypi python_mesonpy
+SRC_URI[sha256sum] = "8d537a0304709c31c11ffa34872a62a4c06a6a6c24fc862b7fb4306f3e881b95"
+
+DEPENDS:remove:class-native = "python3-meson-python-native"
+
+SRC_URI:append:class-native = "file://remove-hardcoded-setup-args.patch"
+SRC_URI:append:class-nativesdk = "file://use-installed-mesonpy.patch"
+SRC_URI:append:class-target = "file://use-installed-mesonpy.patch"
+
+RDEPENDS:${PN} = " \
+	meson ninja python3-ninja \
+	python3-pyproject-metadata \
+	python3-patchelf \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2



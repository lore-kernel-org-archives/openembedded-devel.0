Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D19FC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 17:20:47 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.161.1665595234371969631
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 10:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R7mBuqaQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: quaresma.jose@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id 204so17098702pfx.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 10:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jEvFaglD6OS5dk3E3LweNkAaU7+njquSarWcMNedMtg=;
        b=R7mBuqaQnDD73KUDE4fJnZpxdhLtZqIxqtUB6dh11o54LCh4xvahX2YJ3o7A9TaBYF
         aYnThpQjSmOkiyMAMS4v0UPXM/rykPvBiEdywL4CChsyQorvym594+m+wMd04x7Iomxn
         IYdBhmPXOS//vuOL5snyVTF5MfmAeyEY0Ad3HA6PDpytFS+n7XOxiR01ZpVNhE8nozzD
         L2TG2pkGDwR4ZZz4tSO5xqNenHTsmhd512VRWn3DpXSJdD9e5aMz6LjWL1+ZiCt+DA2H
         WRes/pikOlvfdQ7R1HRfHE0JiQowP+iRN6vNTPn5Lx814iExct7UIR5nyPxTzDmAB78q
         VyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEvFaglD6OS5dk3E3LweNkAaU7+njquSarWcMNedMtg=;
        b=T7woPIFmuR6YxaHS0zXRr6wbfY44VGgGlXNNawaRIsocN9+Wmu2ij8nRB7IxrTCLCT
         gJAyzv/4UyulZad7oEkJkfKHxiNGSp3jUj4JHTLOxOq1HQYSFZ5xtZaoNcBYueaglXWn
         15TyOWwMWd4tG7owziX1ergmCjR+lDZBacWzCxHtW9elRnDAmO9hebRy+Iyzr3W7cf1K
         nNI4vsufxzmbRRuad40ckCqGigmvPhFzW1V0vUi8pQpD1N7xyaMh/fpypWOVHKNrofOf
         +U+GtW8UvBkKAgA36d0pAO927ZnrgYbp/9knd0XtwlhMd7PHHoER6vDJwv64fqkZRa/4
         mzfw==
X-Gm-Message-State: ACrzQf2sBDQH1sbC5NaKjvNd9wc9HB2f5mjLqEqQsoOGFtSFo+91uQY7
	9+lRAY9guTgKarmy6UjdLtB/WzEICl4wEhUbCCk=
X-Google-Smtp-Source: AMsMyM4ytptpyMBba7/Ze3ZHw8AlzZnGDMoxclwrm4yQ+4KRaeEd0t64UunyJgN4Qy5A1SPenPMVSBCerfWMu+gZ2z8=
X-Received: by 2002:a05:6a00:cc8:b0:541:5de7:fcd2 with SMTP id
 b8-20020a056a000cc800b005415de7fcd2mr31273989pfv.25.1665595233288; Wed, 12
 Oct 2022 10:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <1665547429-23508-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1665547429-23508-1-git-send-email-wangmy@fujitsu.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 12 Oct 2022 18:20:22 +0100
Message-ID: <CANPvuRm1e0ahSFda7VOqpKG-OB-g-8xza7E5_X-csm4QTAr=9Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe] Add nativesdk-systemd-systemctl as dependency of dnf-plugin-tui
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000385a7205ead99c55"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 17:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99146

--000000000000385a7205ead99c55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi wangmy,

wangmy <wangmy@fujitsu.com> escreveu no dia quarta, 12/10/2022 =C3=A0(s) 05=
:04:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../systemd/nativesdk-systemd-systemctl.bb    |  17 +
>  .../systemd/systemd-systemctl/systemctl       | 340 ++++++++++++++++++
>  2 files changed, 357 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/systemd/
> nativesdk-systemd-systemctl.bb
>  create mode 100755
> meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
>
> diff --git a/meta-oe/recipes-devtools/systemd/
> nativesdk-systemd-systemctl.bb b/meta-oe/recipes-devtools/systemd/
> nativesdk-systemd-systemctl.bb
> new file mode 100644
> index 0000000000..7ac21aa260
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Wrapper for enabling systemd services"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20"
> +
> +PR =3D "r6"
>

Why is this recipe starting with the package release 6 ?

Jose


> +
> +inherit nativesdk
> +
> +SRC_URI =3D "file://systemctl"
> +
> +S =3D "${WORKDIR}"
> +
> +do_install() {
> +       install -d ${D}${bindir}
> +       install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
> +}
> diff --git a/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
> b/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
> new file mode 100755
> index 0000000000..6324319a45
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
> @@ -0,0 +1,340 @@
> +#!/usr/bin/env python3
> +"""systemctl: subset of systemctl used for image construction
> +
> +Mask/preset systemd units
> +"""
> +
> +import argparse
> +import fnmatch
> +import os
> +import re
> +import sys
> +
> +from collections import namedtuple
> +from pathlib import Path
> +
> +version =3D 1.0
> +
> +ROOT =3D Path("/")
> +SYSCONFDIR =3D Path("etc")
> +BASE_LIBDIR =3D Path("lib")
> +LIBDIR =3D Path("usr", "lib")
> +
> +locations =3D list()
> +
> +
> +class SystemdFile():
> +    """Class representing a single systemd configuration file"""
> +    def __init__(self, root, path):
> +        self.sections =3D dict()
> +        self._parse(root, path)
> +        dirname =3D os.path.basename(path.name) + ".d"
> +        for location in locations:
> +            for path2 in sorted((root / location / "system" /
> dirname).glob("*.conf")):
> +                self._parse(root, path2)
> +
> +    def _parse(self, root, path):
> +        """Parse a systemd syntax configuration file
> +
> +        Args:
> +            path: A pathlib.Path object pointing to the file
> +
> +        """
> +        skip_re =3D re.compile(r"^\s*([#;]|$)")
> +        section_re =3D re.compile(r"^\s*\[(?P<section>.*)\]")
> +        kv_re =3D re.compile(r"^\s*(?P<key>[^\s]+)\s*=3D\s*(?P<value>.*)=
")
> +        section =3D None
> +
> +        if path.is_symlink():
> +            try:
> +                path.resolve()
> +            except FileNotFoundError:
> +                # broken symlink, try relative to root
> +                path =3D root /
> Path(os.readlink(str(path))).relative_to(ROOT)
> +
> +        with path.open() as f:
> +            for line in f:
> +                if skip_re.match(line):
> +                    continue
> +
> +                line =3D line.strip()
> +                m =3D section_re.match(line)
> +                if m:
> +                    if m.group('section') not in self.sections:
> +                        section =3D dict()
> +                        self.sections[m.group('section')] =3D section
> +                    else:
> +                        section =3D self.sections[m.group('section')]
> +                    continue
> +
> +                while line.endswith("\\"):
> +                    line +=3D f.readline().rstrip("\n")
> +
> +                m =3D kv_re.match(line)
> +                k =3D m.group('key')
> +                v =3D m.group('value')
> +                if k not in section:
> +                    section[k] =3D list()
> +                section[k].extend(v.split())
> +
> +    def get(self, section, prop):
> +        """Get a property from section
> +
> +        Args:
> +            section: Section to retrieve property from
> +            prop: Property to retrieve
> +
> +        Returns:
> +            List representing all properties of type prop in section.
> +
> +        Raises:
> +            KeyError: if ``section`` or ``prop`` not found
> +        """
> +        return self.sections[section][prop]
> +
> +
> +class Presets():
> +    """Class representing all systemd presets"""
> +    def __init__(self, scope, root):
> +        self.directives =3D list()
> +        self._collect_presets(scope, root)
> +
> +    def _parse_presets(self, presets):
> +        """Parse presets out of a set of preset files"""
> +        skip_re =3D re.compile(r"^\s*([#;]|$)")
> +        directive_re =3D
> re.compile(r"^\s*(?P<action>enable|disable)\s+(?P<unit_name>(.+))")
> +
> +        Directive =3D namedtuple("Directive", "action unit_name")
> +        for preset in presets:
> +            with preset.open() as f:
> +                for line in f:
> +                    m =3D directive_re.match(line)
> +                    if m:
> +                        directive =3D Directive(action=3Dm.group('action=
'),
> +
> unit_name=3Dm.group('unit_name'))
> +                        self.directives.append(directive)
> +                    elif skip_re.match(line):
> +                        pass
> +                    else:
> +                        sys.exit("Unparsed preset line in
> {}".format(preset))
> +
> +    def _collect_presets(self, scope, root):
> +        """Collect list of preset files"""
> +        presets =3D dict()
> +        for location in locations:
> +            paths =3D (root / location / scope).glob("*.preset")
> +            for path in paths:
> +                # earlier names override later ones
> +                if path.name not in presets:
> +                    presets[path.name] =3D path
> +
> +        self._parse_presets([v for k, v in sorted(presets.items())])
> +
> +    def state(self, unit_name):
> +        """Return state of preset for unit_name
> +
> +        Args:
> +            presets: set of presets
> +            unit_name: name of the unit
> +
> +        Returns:
> +            None: no matching preset
> +            `enable`: unit_name is enabled
> +            `disable`: unit_name is disabled
> +        """
> +        for directive in self.directives:
> +            if fnmatch.fnmatch(unit_name, directive.unit_name):
> +                return directive.action
> +
> +        return None
> +
> +
> +def add_link(path, target):
> +    try:
> +        path.parent.mkdir(parents=3DTrue)
> +    except FileExistsError:
> +        pass
> +    if not path.is_symlink():
> +        print("ln -s {} {}".format(target, path))
> +        path.symlink_to(target)
> +
> +
> +class SystemdUnitNotFoundError(Exception):
> +    def __init__(self, path, unit):
> +        self.path =3D path
> +        self.unit =3D unit
> +
> +
> +class SystemdUnit():
> +    def __init__(self, root, unit):
> +        self.root =3D root
> +        self.unit =3D unit
> +        self.config =3D None
> +
> +    def _path_for_unit(self, unit):
> +        for location in locations:
> +            path =3D self.root / location / "system" / unit
> +            if path.exists() or path.is_symlink():
> +                return path
> +
> +        raise SystemdUnitNotFoundError(self.root, unit)
> +
> +    def _process_deps(self, config, service, location, prop, dirstem):
> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> +
> +        target =3D ROOT / location.relative_to(self.root)
> +        try:
> +            for dependent in config.get('Install', prop):
> +                wants =3D systemdir / "{}.{}".format(dependent, dirstem)=
 /
> service
> +                add_link(wants, target)
> +
> +        except KeyError:
> +            pass
> +
> +    def enable(self, caller_unit=3DNone):
> +        # if we're enabling an instance, first extract the actual instan=
ce
> +        # then figure out what the template unit is
> +        template =3D re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.unit=
)
> +        if template:
> +            instance =3D template.group('instance')
> +            unit =3D re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
> +        else:
> +            instance =3D None
> +            unit =3D self.unit
> +
> +        path =3D self._path_for_unit(unit)
> +
> +        if path.is_symlink():
> +            # ignore aliases
> +            return
> +
> +        config =3D SystemdFile(self.root, path)
> +        if instance =3D=3D "":
> +            try:
> +                default_instance =3D config.get('Install',
> 'DefaultInstance')[0]
> +            except KeyError:
> +                # no default instance, so nothing to enable
> +                return
> +
> +            service =3D self.unit.replace("@.",
> +                                        "@{}.".format(default_instance))
> +        else:
> +            service =3D self.unit
> +
> +        self._process_deps(config, service, path, 'WantedBy', 'wants')
> +        self._process_deps(config, service, path, 'RequiredBy',
> 'requires')
> +
> +        try:
> +            for also in config.get('Install', 'Also'):
> +                try:
> +                    if caller_unit !=3D also:
> +                        SystemdUnit(self.root, also).enable(unit)
> +                except SystemdUnitNotFoundError as e:
> +                    sys.exit("Error: Systemctl also enable issue with  %=
s
> (%s)" % (service, e.unit))
> +
> +        except KeyError:
> +            pass
> +
> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> +        target =3D ROOT / path.relative_to(self.root)
> +        try:
> +            for dest in config.get('Install', 'Alias'):
> +                alias =3D systemdir / dest
> +                add_link(alias, target)
> +
> +        except KeyError:
> +            pass
> +
> +    def mask(self):
> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> +        add_link(systemdir / self.unit, "/dev/null")
> +
> +
> +def collect_services(root):
> +    """Collect list of service files"""
> +    services =3D set()
> +    for location in locations:
> +        paths =3D (root / location / "system").glob("*")
> +        for path in paths:
> +            if path.is_dir():
> +                continue
> +            services.add(path.name)
> +
> +    return services
> +
> +
> +def preset_all(root):
> +    presets =3D Presets('system-preset', root)
> +    services =3D collect_services(root)
> +
> +    for service in services:
> +        state =3D presets.state(service)
> +
> +        if state =3D=3D "enable" or state is None:
> +            try:
> +                SystemdUnit(root, service).enable()
> +            except SystemdUnitNotFoundError:
> +                sys.exit("Error: Systemctl preset_all issue in %s" %
> service)
> +
> +    # If we populate the systemd links we also create /etc/machine-id,
> which
> +    # allows systemd to boot with the filesystem read-only before
> generating
> +    # a real value and then committing it back.
> +    #
> +    # For the stateless configuration, where /etc is generated at runtim=
e
> +    # (for example on a tmpfs), this script shouldn't run at all and we
> +    # allow systemd to completely populate /etc.
> +    (root / SYSCONFDIR / "machine-id").touch()
> +
> +
> +def main():
> +    if sys.version_info < (3, 4, 0):
> +        sys.exit("Python 3.4 or greater is required")
> +
> +    parser =3D argparse.ArgumentParser()
> +    parser.add_argument('command', nargs=3D'?', choices=3D['enable', 'ma=
sk',
> +                                                     'preset-all'])
> +    parser.add_argument('service', nargs=3Dargparse.REMAINDER)
> +    parser.add_argument('--root')
> +    parser.add_argument('--preset-mode',
> +                        choices=3D['full', 'enable-only', 'disable-only'=
],
> +                        default=3D'full')
> +
> +    args =3D parser.parse_args()
> +
> +    root =3D Path(args.root) if args.root else ROOT
> +
> +    locations.append(SYSCONFDIR / "systemd")
> +    # Handle the usrmerge case by ignoring /lib when it's a symlink
> +    if not (root / BASE_LIBDIR).is_symlink():
> +        locations.append(BASE_LIBDIR / "systemd")
> +    locations.append(LIBDIR / "systemd")
> +
> +    command =3D args.command
> +    if not command:
> +        parser.print_help()
> +        return 0
> +
> +    if command =3D=3D "mask":
> +        for service in args.service:
> +            try:
> +                SystemdUnit(root, service).mask()
> +            except SystemdUnitNotFoundError as e:
> +                sys.exit("Error: Systemctl main mask issue in %s (%s)" %
> (service, e.unit))
> +    elif command =3D=3D "enable":
> +        for service in args.service:
> +            try:
> +                SystemdUnit(root, service).enable()
> +            except SystemdUnitNotFoundError as e:
> +                sys.exit("Error: Systemctl main enable issue in %s (%s)"
> % (service, e.unit))
> +    elif command =3D=3D "preset-all":
> +        if len(args.service) !=3D 0:
> +            sys.exit("Too many arguments.")
> +        if args.preset_mode !=3D "enable-only":
> +            sys.exit("Only enable-only is supported as preset-mode.")
> +        preset_all(root)
> +    else:
> +        raise RuntimeError()
> +
> +
> +if __name__ =3D=3D '__main__':
> +    main()
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99142):
> https://lists.openembedded.org/g/openembedded-devel/message/99142
> Mute This Topic: https://lists.openembedded.org/mt/94275098/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000385a7205ead99c55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi wangmy,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">wangmy &lt;<a href=3D"mailto:wangmy@fujitsu=
.com">wangmy@fujitsu.com</a>&gt; escreveu no dia quarta, 12/10/2022 =C3=A0(=
s) 05:04:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed=
-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_b=
lank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../systemd/<a href=3D"http://nativesdk-systemd-systemctl.bb" rel=3D"=
noreferrer" target=3D"_blank">nativesdk-systemd-systemctl.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 17 +<br>
=C2=A0.../systemd/systemd-systemctl/systemctl=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
40 ++++++++++++++++++<br>
=C2=A02 files changed, 357 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/systemd/<a href=3D"http:/=
/nativesdk-systemd-systemctl.bb" rel=3D"noreferrer" target=3D"_blank">nativ=
esdk-systemd-systemctl.bb</a><br>
=C2=A0create mode 100755 meta-oe/recipes-devtools/systemd/systemd-systemctl=
/systemctl<br>
<br>
diff --git a/meta-oe/recipes-devtools/systemd/<a href=3D"http://nativesdk-s=
ystemd-systemctl.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-systemd=
-systemctl.bb</a> b/meta-oe/recipes-devtools/systemd/<a href=3D"http://nati=
vesdk-systemd-systemctl.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-=
systemd-systemctl.bb</a><br>
new file mode 100644<br>
index 0000000000..7ac21aa260<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/systemd/<a href=3D"http://nativesdk-systemd-=
systemctl.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-systemd-system=
ctl.bb</a><br>
@@ -0,0 +1,17 @@<br>
+SUMMARY =3D &quot;Wrapper for enabling systemd services&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9c=
fbcb788c80a0384361b4de20420&quot;<br>
+<br>
+PR =3D &quot;r6&quot;<br></blockquote><div><br></div><div>Why is this reci=
pe starting with the package release 6 ?<br></div><div><br></div><div>Jose<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+inherit nativesdk<br>
+<br>
+SRC_URI =3D &quot;file://systemctl&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/systemctl ${D}${bind=
ir}<br>
+}<br>
diff --git a/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl b=
/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl<br>
new file mode 100755<br>
index 0000000000..6324319a45<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl<br>
@@ -0,0 +1,340 @@<br>
+#!/usr/bin/env python3<br>
+&quot;&quot;&quot;systemctl: subset of systemctl used for image constructi=
on<br>
+<br>
+Mask/preset systemd units<br>
+&quot;&quot;&quot;<br>
+<br>
+import argparse<br>
+import fnmatch<br>
+import os<br>
+import re<br>
+import sys<br>
+<br>
+from collections import namedtuple<br>
+from pathlib import Path<br>
+<br>
+version =3D 1.0<br>
+<br>
+ROOT =3D Path(&quot;/&quot;)<br>
+SYSCONFDIR =3D Path(&quot;etc&quot;)<br>
+BASE_LIBDIR =3D Path(&quot;lib&quot;)<br>
+LIBDIR =3D Path(&quot;usr&quot;, &quot;lib&quot;)<br>
+<br>
+locations =3D list()<br>
+<br>
+<br>
+class SystemdFile():<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Class representing a single systemd config=
uration file&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, root, path):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sections =3D dict()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._parse(root, path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dirname =3D os.path.basename(<a href=3D"http:/=
/path.name" rel=3D"noreferrer" target=3D"_blank">path.name</a>) + &quot;.d&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for location in locations:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for path2 in sorted((root / loca=
tion / &quot;system&quot; / dirname).glob(&quot;*.conf&quot;)):=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._parse(root, =
path2)<br>
+<br>
+=C2=A0 =C2=A0 def _parse(self, root, path):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Parse a systemd syntax confi=
guration file<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Args:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path: A pathlib.Path object poin=
ting to the file<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_re =3D re.compile(r&quot;^\s*([#;]|$)&quo=
t;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 section_re =3D re.compile(r&quot;^\s*\[(?P&lt;=
section&gt;.*)\]&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kv_re =3D re.compile(r&quot;^\s*(?P&lt;key&gt;=
[^\s]+)\s*=3D\s*(?P&lt;value&gt;.*)&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 section =3D None<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if path.is_symlink():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path.resolve()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except FileNotFoundError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # broken symlink, =
try relative to root<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D root / Pa=
th(os.readlink(str(path))).relative_to(ROOT)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with path.open() as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if skip_re.match(l=
ine):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D line.stri=
p()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D section_re.m=
atch(line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m=
.group(&#39;section&#39;) not in self.sections:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 section =3D dict()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self.sections[m.group(&#39;section&#39;)] =3D section<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 section =3D self.sections[m.group(&#39;section&#39;)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while line.endswit=
h(&quot;\\&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line=
 +=3D f.readline().rstrip(&quot;\n&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D kv_re.match(=
line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k =3D m.group(&#39=
;key&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D m.group(&#39=
;value&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if k not in sectio=
n:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sect=
ion[k] =3D list()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 section[k].extend(=
v.split())<br>
+<br>
+=C2=A0 =C2=A0 def get(self, section, prop):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Get a property from section<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Args:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 section: Section to retrieve pro=
perty from<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prop: Property to retrieve<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Returns:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 List representing all properties=
 of type prop in section.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Raises:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KeyError: if ``section`` or ``pr=
op`` not found<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.sections[section][prop]<br>
+<br>
+<br>
+class Presets():<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Class representing all systemd presets&quo=
t;&quot;&quot;<br>
+=C2=A0 =C2=A0 def __init__(self, scope, root):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.directives =3D list()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._collect_presets(scope, root)<br>
+<br>
+=C2=A0 =C2=A0 def _parse_presets(self, presets):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Parse presets out of a set o=
f preset files&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_re =3D re.compile(r&quot;^\s*([#;]|$)&quo=
t;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 directive_re =3D re.compile(r&quot;^\s*(?P&lt;=
action&gt;enable|disable)\s+(?P&lt;unit_name&gt;(.+))&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Directive =3D namedtuple(&quot;Directive&quot;=
, &quot;action unit_name&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for preset in presets:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with preset.open() as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =
=3D directive_re.match(line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 directive =3D Directive(action=3Dm.group(&#39;action&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 unit_name=3Dm.group(&#39;unit_name&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self.directives.append(directive)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif=
 skip_re.match(line):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sys.exit(&quot;Unparsed preset line in {}&quot;.format(preset))<=
br>
+<br>
+=C2=A0 =C2=A0 def _collect_presets(self, scope, root):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Collect list of preset files=
&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 presets =3D dict()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for location in locations:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 paths =3D (root / location / sco=
pe).glob(&quot;*.preset&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for path in paths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # earlier names ov=
erride later ones<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http=
://path.name" rel=3D"noreferrer" target=3D"_blank">path.name</a> not in pre=
sets:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pres=
ets[<a href=3D"http://path.name" rel=3D"noreferrer" target=3D"_blank">path.=
name</a>] =3D path<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._parse_presets([v for k, v in sorted(pres=
ets.items())])<br>
+<br>
+=C2=A0 =C2=A0 def state(self, unit_name):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Return state of preset for u=
nit_name<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Args:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 presets: set of presets<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unit_name: name of the unit<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Returns:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 None: no matching preset<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `enable`: unit_name is enabled<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `disable`: unit_name is disabled=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for directive in self.directives:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if fnmatch.fnmatch(unit_name, di=
rective.unit_name):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return directive.a=
ction<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+<br>
+def add_link(path, target):<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 path.parent.mkdir(parents=3DTrue)<br>
+=C2=A0 =C2=A0 except FileExistsError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+=C2=A0 =C2=A0 if not path.is_symlink():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;ln -s {} {}&quot;.format(target, p=
ath))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 path.symlink_to(target)<br>
+<br>
+<br>
+class SystemdUnitNotFoundError(Exception):<br>
+=C2=A0 =C2=A0 def __init__(self, path, unit):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.path =3D path<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.unit =3D unit<br>
+<br>
+<br>
+class SystemdUnit():<br>
+=C2=A0 =C2=A0 def __init__(self, root, unit):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.root =3D root<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.unit =3D unit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.config =3D None<br>
+<br>
+=C2=A0 =C2=A0 def _path_for_unit(self, unit):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for location in locations:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D self.root / location / =
&quot;system&quot; / unit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if path.exists() or path.is_syml=
ink():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return path<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise SystemdUnitNotFoundError(self.root, unit=
)<br>
+<br>
+=C2=A0 =C2=A0 def _process_deps(self, config, service, location, prop, dir=
stem):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemdir =3D self.root / SYSCONFDIR / &quot;s=
ystemd&quot; / &quot;system&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target =3D ROOT / location.relative_to(self.ro=
ot)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dependent in config.get(&#39=
;Install&#39;, prop):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wants =3D systemdi=
r / &quot;{}.{}&quot;.format(dependent, dirstem) / service<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_link(wants, ta=
rget)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br>
+=C2=A0 =C2=A0 def enable(self, caller_unit=3DNone):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # if we&#39;re enabling an instance, first ext=
ract the actual instance<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # then figure out what the template unit is<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 template =3D re.match(r&quot;[^@]+@(?P&lt;inst=
ance&gt;[^\.]*)\.&quot;, self.unit)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if template:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 instance =3D template.group(&#39=
;instance&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unit =3D re.sub(r&quot;@[^\.]*\.=
&quot;, &quot;@.&quot;, self.unit, 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 instance =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unit =3D self.unit<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D self._path_for_unit(unit)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if path.is_symlink():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # ignore aliases<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D SystemdFile(self.root, path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if instance =3D=3D &quot;&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_instance =
=3D config.get(&#39;Install&#39;, &#39;DefaultInstance&#39;)[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # no default insta=
nce, so nothing to enable<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 service =3D self.unit.replace(&q=
uot;@.&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;@{=
}.&quot;.format(default_instance))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 service =3D self.unit<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._process_deps(config, service, path, &#39=
;WantedBy&#39;, &#39;wants&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._process_deps(config, service, path, &#39=
;RequiredBy&#39;, &#39;requires&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for also in config.get(&#39;Inst=
all&#39;, &#39;Also&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c=
aller_unit !=3D also:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 SystemdUnit(self.root, also).enable(unit)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except SystemdUnit=
NotFoundError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.=
exit(&quot;Error: Systemctl also enable issue with=C2=A0 %s (%s)&quot; % (s=
ervice, e.unit))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemdir =3D self.root / SYSCONFDIR / &quot;s=
ystemd&quot; / &quot;system&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target =3D ROOT / path.relative_to(self.root)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dest in config.get(&#39;Inst=
all&#39;, &#39;Alias&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alias =3D systemdi=
r / dest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_link(alias, ta=
rget)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br>
+=C2=A0 =C2=A0 def mask(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemdir =3D self.root / SYSCONFDIR / &quot;s=
ystemd&quot; / &quot;system&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 add_link(systemdir / self.unit, &quot;/dev/nul=
l&quot;)<br>
+<br>
+<br>
+def collect_services(root):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Collect list of service files&quot;&quot;&=
quot;<br>
+=C2=A0 =C2=A0 services =3D set()<br>
+=C2=A0 =C2=A0 for location in locations:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 paths =3D (root / location / &quot;system&quot=
;).glob(&quot;*&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for path in paths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if path.is_dir():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 services.add(<a href=3D"http://p=
ath.name" rel=3D"noreferrer" target=3D"_blank">path.name</a>)<br>
+<br>
+=C2=A0 =C2=A0 return services<br>
+<br>
+<br>
+def preset_all(root):<br>
+=C2=A0 =C2=A0 presets =3D Presets(&#39;system-preset&#39;, root)<br>
+=C2=A0 =C2=A0 services =3D collect_services(root)<br>
+<br>
+=C2=A0 =C2=A0 for service in services:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 state =3D presets.state(service)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if state =3D=3D &quot;enable&quot; or state is=
 None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SystemdUnit(root, =
service).enable()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except SystemdUnitNotFoundError:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(&quot;Err=
or: Systemctl preset_all issue in %s&quot; % service)<br>
+<br>
+=C2=A0 =C2=A0 # If we populate the systemd links we also create /etc/machi=
ne-id, which<br>
+=C2=A0 =C2=A0 # allows systemd to boot with the filesystem read-only befor=
e generating<br>
+=C2=A0 =C2=A0 # a real value and then committing it back.<br>
+=C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 # For the stateless configuration, where /etc is generated a=
t runtime<br>
+=C2=A0 =C2=A0 # (for example on a tmpfs), this script shouldn&#39;t run at=
 all and we<br>
+=C2=A0 =C2=A0 # allow systemd to completely populate /etc.<br>
+=C2=A0 =C2=A0 (root / SYSCONFDIR / &quot;machine-id&quot;).touch()<br>
+<br>
+<br>
+def main():<br>
+=C2=A0 =C2=A0 if sys.version_info &lt; (3, 4, 0):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(&quot;Python 3.4 or greater is requir=
ed&quot;)<br>
+<br>
+=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser()<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;command&#39;, nargs=3D&#39;?&#39;, =
choices=3D[&#39;enable&#39;, &#39;mask&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;preset-all&#39;])<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;service&#39;, nargs=3Dargparse.REMA=
INDER)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--root&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--preset-mode&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 choices=3D[&#39;full&#39;, &#39;enable-only&#39;, &#39;disable-o=
nly&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 default=3D&#39;full&#39;)<br>
+<br>
+=C2=A0 =C2=A0 args =3D parser.parse_args()<br>
+<br>
+=C2=A0 =C2=A0 root =3D Path(args.root) if args.root else ROOT<br>
+<br>
+=C2=A0 =C2=A0 locations.append(SYSCONFDIR / &quot;systemd&quot;)<br>
+=C2=A0 =C2=A0 # Handle the usrmerge case by ignoring /lib when it&#39;s a =
symlink<br>
+=C2=A0 =C2=A0 if not (root / BASE_LIBDIR).is_symlink():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 locations.append(BASE_LIBDIR / &quot;systemd&q=
uot;)<br>
+=C2=A0 =C2=A0 locations.append(LIBDIR / &quot;systemd&quot;)<br>
+<br>
+=C2=A0 =C2=A0 command =3D args.command<br>
+=C2=A0 =C2=A0 if not command:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.print_help()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
+<br>
+=C2=A0 =C2=A0 if command =3D=3D &quot;mask&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for service in args.service:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SystemdUnit(root, =
service).mask()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except SystemdUnitNotFoundError =
as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(&quot;Err=
or: Systemctl main mask issue in %s (%s)&quot; % (service, e.unit))<br>
+=C2=A0 =C2=A0 elif command =3D=3D &quot;enable&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for service in args.service:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SystemdUnit(root, =
service).enable()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except SystemdUnitNotFoundError =
as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(&quot;Err=
or: Systemctl main enable issue in %s (%s)&quot; % (service, e.unit))<br>
+=C2=A0 =C2=A0 elif command =3D=3D &quot;preset-all&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(args.service) !=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(&quot;Too many argument=
s.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if args.preset_mode !=3D &quot;enable-only&quo=
t;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(&quot;Only enable-only =
is supported as preset-mode.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 preset_all(root)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise RuntimeError()<br>
+<br>
+<br>
+if __name__ =3D=3D &#39;__main__&#39;:<br>
+=C2=A0 =C2=A0 main()<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99142): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99142" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99142</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94275098/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94275098/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000385a7205ead99c55--


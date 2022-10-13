Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE41C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 15:36:23 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.9021.1665675376940340320
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Oct 2022 08:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mImq+Pv/;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-134072c15c1so2741501fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x28wvnpaK5M/ZHMgp9VG9y8r8okjteik65vT56YoZNQ=;
        b=mImq+Pv/GKmauD5/jHkMdY+IYJ+3f8INpkZ0RKiNog54WSNoZnEkF+HKRXdYa7Aw15
         kQT35LaAjupmfQOUOhbLUq9CCSmd6PtkePLxft7ATQ9fXHPFYXeXe+LxiAgx4cX1E5+i
         iKSMMAqk1K5xSsCbf3O6YKFkOf0wp18ngxpVtNiKJWkk+BoSdcmmJASVcdvHEVcu5ECg
         M+7CYg6ZhcNq1KDt5TOcvKhLsPXPF56s7Swln5Gsd2eJvmDXBpE5EJENVNJhI+pQEwf2
         HtSs5CVs6E9/QzyS5vBuBLxscbDFGain0RIS30aVyJdduke4Nwir2xCAJPwZ4zprSYHJ
         1yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x28wvnpaK5M/ZHMgp9VG9y8r8okjteik65vT56YoZNQ=;
        b=dX0mswtF0B2ApJM7v7PizJKql+Bne3K1LfuK+bmfYGfku0odQTPCSC+hZaqBw8Amyw
         hRTNNWl6VHzrIyVAMo3/fyIX3bKaKpwMpCMq3+p6Y29mrQckSbUMNK1FiGVW0jjVBuTv
         4HawT12AFPyqhZQ4A80XWH8RMOrpXqGgC+KmAcQI6J49UishE/NY7xXluE3mQHJpvjMH
         lqN1DcUxjbYTCJtolBp6NXwCDe06EiWOlWnE0mHTBFTURimHP6LDBuZ0b1hGF5Lw9yN1
         yvmXFwj8QDB1IEFG9yDX+mOWrzmZcOoXMhOISsaINdTc5lqXZSqt/MFC7sz+ajUz8jXt
         34fQ==
X-Gm-Message-State: ACrzQf2bkEsF7b1QVmpmeTx7XKzCLa80li0TRkj6+86I8H8mKAzwLs1A
	CjkQHxOYG/DzvMJ24nkRIvjOp0WOU1RG/G6eRg4=
X-Google-Smtp-Source: AMsMyM5m0ZP1tkha0rSEZwV9pz20l1OqzZyA0tj+Ng8/n0DaqygcWgOoqVztqVraiIXkmcwdV3s1Nk0cq4MZnoQAJ3s=
X-Received: by 2002:a05:6870:d1c8:b0:132:1239:2550 with SMTP id
 b8-20020a056870d1c800b0013212392550mr5834165oac.55.1665675376066; Thu, 13 Oct
 2022 08:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <1665547429-23508-1-git-send-email-wangmy@fujitsu.com>
 <CANPvuRm1e0ahSFda7VOqpKG-OB-g-8xza7E5_X-csm4QTAr=9Q@mail.gmail.com>
 <CAMKF1sq3tZLuvT+4yeoCui6COj5x58hrApw4COpemz7UjmSkHw@mail.gmail.com> <F57949F9-AAC0-4F69-9942-4829C9B296B2@arm.com>
In-Reply-To: <F57949F9-AAC0-4F69-9942-4829C9B296B2@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2022 08:35:49 -0700
Message-ID: <CAMKF1sqcF9GT6q-8H=JQZgRx93ayvL6XghP-pCRiLsvHOXp=qw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] Add nativesdk-systemd-systemctl as dependency of dnf-plugin-tui
To: Ross Burton <Ross.Burton@arm.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, wangmy <wangmy@fujitsu.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 15:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99161

On Thu, Oct 13, 2022 at 3:10 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> What=E2=80=99s the difference between this python implementation of syste=
mctl, and the shell implementation that=E2=80=99s already in oe-core in sys=
temd-systemctl-native?
>
> Looks like pointless duplication to me.  If the Python implementation her=
e is better, then it should be in core.

agreed. Although its perhaps better to soak it a bit, I thought here.

>
> Also, why would a nativesdk DNF need to manage systemd units?

>
> Ross
>
> > On 12 Oct 2022, at 23:27, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Wed, Oct 12, 2022 at 10:20 AM Jose Quaresma <quaresma.jose@gmail.com=
> wrote:
> >>
> >> Hi wangmy,
> >>
> >> wangmy <wangmy@fujitsu.com> escreveu no dia quarta, 12/10/2022 =C3=A0(=
s) 05:04:
> >>>
> >>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> >>> ---
> >>> .../systemd/nativesdk-systemd-systemctl.bb    |  17 +
> >>> .../systemd/systemd-systemctl/systemctl       | 340 +++++++++++++++++=
+
> >>> 2 files changed, 357 insertions(+)
> >>> create mode 100644 meta-oe/recipes-devtools/systemd/nativesdk-systemd=
-systemctl.bb
> >>> create mode 100755 meta-oe/recipes-devtools/systemd/systemd-systemctl=
/systemctl
> >>>
> >>> diff --git a/meta-oe/recipes-devtools/systemd/nativesdk-systemd-syste=
mctl.bb b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
> >>> new file mode 100644
> >>> index 0000000000..7ac21aa260
> >>> --- /dev/null
> >>> +++ b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
> >>> @@ -0,0 +1,17 @@
> >>> +SUMMARY =3D "Wrapper for enabling systemd services"
> >>> +
> >>> +LICENSE =3D "MIT"
> >>> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9=
cfbcb788c80a0384361b4de20420"
> >>> +
> >>> +PR =3D "r6"
> >>
> >>
> >> Why is this recipe starting with the package release 6 ?
> >>
> >
> > Right, I have fixed it before accepting.
> >
> >> Jose
> >>
> >>>
> >>> +
> >>> +inherit nativesdk
> >>> +
> >>> +SRC_URI =3D "file://systemctl"
> >>> +
> >>> +S =3D "${WORKDIR}"
> >>> +
> >>> +do_install() {
> >>> +       install -d ${D}${bindir}
> >>> +       install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
> >>> +}
> >>> diff --git a/meta-oe/recipes-devtools/systemd/systemd-systemctl/syste=
mctl b/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
> >>> new file mode 100755
> >>> index 0000000000..6324319a45
> >>> --- /dev/null
> >>> +++ b/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
> >>> @@ -0,0 +1,340 @@
> >>> +#!/usr/bin/env python3
> >>> +"""systemctl: subset of systemctl used for image construction
> >>> +
> >>> +Mask/preset systemd units
> >>> +"""
> >>> +
> >>> +import argparse
> >>> +import fnmatch
> >>> +import os
> >>> +import re
> >>> +import sys
> >>> +
> >>> +from collections import namedtuple
> >>> +from pathlib import Path
> >>> +
> >>> +version =3D 1.0
> >>> +
> >>> +ROOT =3D Path("/")
> >>> +SYSCONFDIR =3D Path("etc")
> >>> +BASE_LIBDIR =3D Path("lib")
> >>> +LIBDIR =3D Path("usr", "lib")
> >>> +
> >>> +locations =3D list()
> >>> +
> >>> +
> >>> +class SystemdFile():
> >>> +    """Class representing a single systemd configuration file"""
> >>> +    def __init__(self, root, path):
> >>> +        self.sections =3D dict()
> >>> +        self._parse(root, path)
> >>> +        dirname =3D os.path.basename(path.name) + ".d"
> >>> +        for location in locations:
> >>> +            for path2 in sorted((root / location / "system" / dirnam=
e).glob("*.conf")):
> >>> +                self._parse(root, path2)
> >>> +
> >>> +    def _parse(self, root, path):
> >>> +        """Parse a systemd syntax configuration file
> >>> +
> >>> +        Args:
> >>> +            path: A pathlib.Path object pointing to the file
> >>> +
> >>> +        """
> >>> +        skip_re =3D re.compile(r"^\s*([#;]|$)")
> >>> +        section_re =3D re.compile(r"^\s*\[(?P<section>.*)\]")
> >>> +        kv_re =3D re.compile(r"^\s*(?P<key>[^\s]+)\s*=3D\s*(?P<value=
>.*)")
> >>> +        section =3D None
> >>> +
> >>> +        if path.is_symlink():
> >>> +            try:
> >>> +                path.resolve()
> >>> +            except FileNotFoundError:
> >>> +                # broken symlink, try relative to root
> >>> +                path =3D root / Path(os.readlink(str(path))).relativ=
e_to(ROOT)
> >>> +
> >>> +        with path.open() as f:
> >>> +            for line in f:
> >>> +                if skip_re.match(line):
> >>> +                    continue
> >>> +
> >>> +                line =3D line.strip()
> >>> +                m =3D section_re.match(line)
> >>> +                if m:
> >>> +                    if m.group('section') not in self.sections:
> >>> +                        section =3D dict()
> >>> +                        self.sections[m.group('section')] =3D sectio=
n
> >>> +                    else:
> >>> +                        section =3D self.sections[m.group('section')=
]
> >>> +                    continue
> >>> +
> >>> +                while line.endswith("\\"):
> >>> +                    line +=3D f.readline().rstrip("\n")
> >>> +
> >>> +                m =3D kv_re.match(line)
> >>> +                k =3D m.group('key')
> >>> +                v =3D m.group('value')
> >>> +                if k not in section:
> >>> +                    section[k] =3D list()
> >>> +                section[k].extend(v.split())
> >>> +
> >>> +    def get(self, section, prop):
> >>> +        """Get a property from section
> >>> +
> >>> +        Args:
> >>> +            section: Section to retrieve property from
> >>> +            prop: Property to retrieve
> >>> +
> >>> +        Returns:
> >>> +            List representing all properties of type prop in section=
.
> >>> +
> >>> +        Raises:
> >>> +            KeyError: if ``section`` or ``prop`` not found
> >>> +        """
> >>> +        return self.sections[section][prop]
> >>> +
> >>> +
> >>> +class Presets():
> >>> +    """Class representing all systemd presets"""
> >>> +    def __init__(self, scope, root):
> >>> +        self.directives =3D list()
> >>> +        self._collect_presets(scope, root)
> >>> +
> >>> +    def _parse_presets(self, presets):
> >>> +        """Parse presets out of a set of preset files"""
> >>> +        skip_re =3D re.compile(r"^\s*([#;]|$)")
> >>> +        directive_re =3D re.compile(r"^\s*(?P<action>enable|disable)=
\s+(?P<unit_name>(.+))")
> >>> +
> >>> +        Directive =3D namedtuple("Directive", "action unit_name")
> >>> +        for preset in presets:
> >>> +            with preset.open() as f:
> >>> +                for line in f:
> >>> +                    m =3D directive_re.match(line)
> >>> +                    if m:
> >>> +                        directive =3D Directive(action=3Dm.group('ac=
tion'),
> >>> +                                              unit_name=3Dm.group('u=
nit_name'))
> >>> +                        self.directives.append(directive)
> >>> +                    elif skip_re.match(line):
> >>> +                        pass
> >>> +                    else:
> >>> +                        sys.exit("Unparsed preset line in {}".format=
(preset))
> >>> +
> >>> +    def _collect_presets(self, scope, root):
> >>> +        """Collect list of preset files"""
> >>> +        presets =3D dict()
> >>> +        for location in locations:
> >>> +            paths =3D (root / location / scope).glob("*.preset")
> >>> +            for path in paths:
> >>> +                # earlier names override later ones
> >>> +                if path.name not in presets:
> >>> +                    presets[path.name] =3D path
> >>> +
> >>> +        self._parse_presets([v for k, v in sorted(presets.items())])
> >>> +
> >>> +    def state(self, unit_name):
> >>> +        """Return state of preset for unit_name
> >>> +
> >>> +        Args:
> >>> +            presets: set of presets
> >>> +            unit_name: name of the unit
> >>> +
> >>> +        Returns:
> >>> +            None: no matching preset
> >>> +            `enable`: unit_name is enabled
> >>> +            `disable`: unit_name is disabled
> >>> +        """
> >>> +        for directive in self.directives:
> >>> +            if fnmatch.fnmatch(unit_name, directive.unit_name):
> >>> +                return directive.action
> >>> +
> >>> +        return None
> >>> +
> >>> +
> >>> +def add_link(path, target):
> >>> +    try:
> >>> +        path.parent.mkdir(parents=3DTrue)
> >>> +    except FileExistsError:
> >>> +        pass
> >>> +    if not path.is_symlink():
> >>> +        print("ln -s {} {}".format(target, path))
> >>> +        path.symlink_to(target)
> >>> +
> >>> +
> >>> +class SystemdUnitNotFoundError(Exception):
> >>> +    def __init__(self, path, unit):
> >>> +        self.path =3D path
> >>> +        self.unit =3D unit
> >>> +
> >>> +
> >>> +class SystemdUnit():
> >>> +    def __init__(self, root, unit):
> >>> +        self.root =3D root
> >>> +        self.unit =3D unit
> >>> +        self.config =3D None
> >>> +
> >>> +    def _path_for_unit(self, unit):
> >>> +        for location in locations:
> >>> +            path =3D self.root / location / "system" / unit
> >>> +            if path.exists() or path.is_symlink():
> >>> +                return path
> >>> +
> >>> +        raise SystemdUnitNotFoundError(self.root, unit)
> >>> +
> >>> +    def _process_deps(self, config, service, location, prop, dirstem=
):
> >>> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> >>> +
> >>> +        target =3D ROOT / location.relative_to(self.root)
> >>> +        try:
> >>> +            for dependent in config.get('Install', prop):
> >>> +                wants =3D systemdir / "{}.{}".format(dependent, dirs=
tem) / service
> >>> +                add_link(wants, target)
> >>> +
> >>> +        except KeyError:
> >>> +            pass
> >>> +
> >>> +    def enable(self, caller_unit=3DNone):
> >>> +        # if we're enabling an instance, first extract the actual in=
stance
> >>> +        # then figure out what the template unit is
> >>> +        template =3D re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.=
unit)
> >>> +        if template:
> >>> +            instance =3D template.group('instance')
> >>> +            unit =3D re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
> >>> +        else:
> >>> +            instance =3D None
> >>> +            unit =3D self.unit
> >>> +
> >>> +        path =3D self._path_for_unit(unit)
> >>> +
> >>> +        if path.is_symlink():
> >>> +            # ignore aliases
> >>> +            return
> >>> +
> >>> +        config =3D SystemdFile(self.root, path)
> >>> +        if instance =3D=3D "":
> >>> +            try:
> >>> +                default_instance =3D config.get('Install', 'DefaultI=
nstance')[0]
> >>> +            except KeyError:
> >>> +                # no default instance, so nothing to enable
> >>> +                return
> >>> +
> >>> +            service =3D self.unit.replace("@.",
> >>> +                                        "@{}.".format(default_instan=
ce))
> >>> +        else:
> >>> +            service =3D self.unit
> >>> +
> >>> +        self._process_deps(config, service, path, 'WantedBy', 'wants=
')
> >>> +        self._process_deps(config, service, path, 'RequiredBy', 'req=
uires')
> >>> +
> >>> +        try:
> >>> +            for also in config.get('Install', 'Also'):
> >>> +                try:
> >>> +                    if caller_unit !=3D also:
> >>> +                        SystemdUnit(self.root, also).enable(unit)
> >>> +                except SystemdUnitNotFoundError as e:
> >>> +                    sys.exit("Error: Systemctl also enable issue wit=
h  %s (%s)" % (service, e.unit))
> >>> +
> >>> +        except KeyError:
> >>> +            pass
> >>> +
> >>> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> >>> +        target =3D ROOT / path.relative_to(self.root)
> >>> +        try:
> >>> +            for dest in config.get('Install', 'Alias'):
> >>> +                alias =3D systemdir / dest
> >>> +                add_link(alias, target)
> >>> +
> >>> +        except KeyError:
> >>> +            pass
> >>> +
> >>> +    def mask(self):
> >>> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
> >>> +        add_link(systemdir / self.unit, "/dev/null")
> >>> +
> >>> +
> >>> +def collect_services(root):
> >>> +    """Collect list of service files"""
> >>> +    services =3D set()
> >>> +    for location in locations:
> >>> +        paths =3D (root / location / "system").glob("*")
> >>> +        for path in paths:
> >>> +            if path.is_dir():
> >>> +                continue
> >>> +            services.add(path.name)
> >>> +
> >>> +    return services
> >>> +
> >>> +
> >>> +def preset_all(root):
> >>> +    presets =3D Presets('system-preset', root)
> >>> +    services =3D collect_services(root)
> >>> +
> >>> +    for service in services:
> >>> +        state =3D presets.state(service)
> >>> +
> >>> +        if state =3D=3D "enable" or state is None:
> >>> +            try:
> >>> +                SystemdUnit(root, service).enable()
> >>> +            except SystemdUnitNotFoundError:
> >>> +                sys.exit("Error: Systemctl preset_all issue in %s" %=
 service)
> >>> +
> >>> +    # If we populate the systemd links we also create /etc/machine-i=
d, which
> >>> +    # allows systemd to boot with the filesystem read-only before ge=
nerating
> >>> +    # a real value and then committing it back.
> >>> +    #
> >>> +    # For the stateless configuration, where /etc is generated at ru=
ntime
> >>> +    # (for example on a tmpfs), this script shouldn't run at all and=
 we
> >>> +    # allow systemd to completely populate /etc.
> >>> +    (root / SYSCONFDIR / "machine-id").touch()
> >>> +
> >>> +
> >>> +def main():
> >>> +    if sys.version_info < (3, 4, 0):
> >>> +        sys.exit("Python 3.4 or greater is required")
> >>> +
> >>> +    parser =3D argparse.ArgumentParser()
> >>> +    parser.add_argument('command', nargs=3D'?', choices=3D['enable',=
 'mask',
> >>> +                                                     'preset-all'])
> >>> +    parser.add_argument('service', nargs=3Dargparse.REMAINDER)
> >>> +    parser.add_argument('--root')
> >>> +    parser.add_argument('--preset-mode',
> >>> +                        choices=3D['full', 'enable-only', 'disable-o=
nly'],
> >>> +                        default=3D'full')
> >>> +
> >>> +    args =3D parser.parse_args()
> >>> +
> >>> +    root =3D Path(args.root) if args.root else ROOT
> >>> +
> >>> +    locations.append(SYSCONFDIR / "systemd")
> >>> +    # Handle the usrmerge case by ignoring /lib when it's a symlink
> >>> +    if not (root / BASE_LIBDIR).is_symlink():
> >>> +        locations.append(BASE_LIBDIR / "systemd")
> >>> +    locations.append(LIBDIR / "systemd")
> >>> +
> >>> +    command =3D args.command
> >>> +    if not command:
> >>> +        parser.print_help()
> >>> +        return 0
> >>> +
> >>> +    if command =3D=3D "mask":
> >>> +        for service in args.service:
> >>> +            try:
> >>> +                SystemdUnit(root, service).mask()
> >>> +            except SystemdUnitNotFoundError as e:
> >>> +                sys.exit("Error: Systemctl main mask issue in %s (%s=
)" % (service, e.unit))
> >>> +    elif command =3D=3D "enable":
> >>> +        for service in args.service:
> >>> +            try:
> >>> +                SystemdUnit(root, service).enable()
> >>> +            except SystemdUnitNotFoundError as e:
> >>> +                sys.exit("Error: Systemctl main enable issue in %s (=
%s)" % (service, e.unit))
> >>> +    elif command =3D=3D "preset-all":
> >>> +        if len(args.service) !=3D 0:
> >>> +            sys.exit("Too many arguments.")
> >>> +        if args.preset_mode !=3D "enable-only":
> >>> +            sys.exit("Only enable-only is supported as preset-mode."=
)
> >>> +        preset_all(root)
> >>> +    else:
> >>> +        raise RuntimeError()
> >>> +
> >>> +
> >>> +if __name__ =3D=3D '__main__':
> >>> +    main()
> >>> --
> >>> 2.25.1
> >>>
> >>>
> >>>
> >>>
> >>
> >>
> >> --
> >> Best regards,
> >>
> >> Jos=C3=A9 Quaresma
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#99151): https://lists.openembedded.org/g/openembedd=
ed-devel/message/99151
> > Mute This Topic: https://lists.openembedded.org/mt/94275098/6875888
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


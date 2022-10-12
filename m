Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61A8C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 22:27:57 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web12.912.1665613676597508811
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 15:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LMjoKJmG;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-132b8f6f1b2so342759fac.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 15:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEx6Ah+DqUU56Mirj0aoja91adTfBeKf0TuAZS3imOE=;
        b=LMjoKJmGmzP5FZI4e7n0JeH7ulXhvRr4N3Bdlok6x7m7lXMuhs9vchOnEGrOCuzsYK
         qOFtfLIlK749n1kD21tRzxVvRu2qMUgPvke0abDWA7PitIUBIZRP5I6WrJLGelQjEuOm
         ystRUOmzyQnHEM/rrgZ8J/mZhysv7RiaGfztGBm3ckIP2SiE0rfMyVIGP+D4o6RdNLen
         mT2Vy26FzYTOg18/k3zZsGv4aKnhcqW+sOb2E5IztaEksuIhBPo828i/G49V8m26abBf
         yJCK8MEveALml+TuD3lgAFoAix8LuWAaEyYU20lgVsnWT0YKBg385TP2BphhfR92zPJM
         zUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEx6Ah+DqUU56Mirj0aoja91adTfBeKf0TuAZS3imOE=;
        b=EGLqDJOr/8SYyPlgqNixuukuxMFBmMK8Q8QwQdIrzK+8QPbtuCVXzHuA1t6a5qZRaW
         5HQoDOY2xw1AYFlrgdzdGRyzOoSoLNSgTWN/BBNnqab2913LTGQQfjcfLOuuyonHDvac
         Bm3Z6BITfjcjgzCEv8vnhWzwPefy6gq7nLLOnUg2Rs+0/A9q32KuZEomNM+S7GBzTeM+
         kt9xepCzAyzUyI+GdEIgb2IEPtmoQSjoWeylVM7Q/1dVwYZcEhOpj01dIHBgSIRLKUr5
         /tqkxipkF8e7XbxC3TZj0hIFXDBlgq5eMP1up43RbHZhJbkqXWHP9qqUDVRcliSnfNF5
         gBSQ==
X-Gm-Message-State: ACrzQf2bDxEGfHr4EI/Lfd+i5weKINR2gCMQmMiZt0jYl2/2AQ0lEHzK
	JwnWOUbcpctJdCVOtffxymsoAfoQ5H/VzBK2Ayc=
X-Google-Smtp-Source: AMsMyM7N4GZPOmjn66t0CclmxfVbIFIMDljlJ3cK4ViiKYFuPygOxj7cyLZwLNJS2bhfQJLpLbeGhMvr/coHsKNQXlM=
X-Received: by 2002:a05:6870:d1c8:b0:132:1239:2550 with SMTP id
 b8-20020a056870d1c800b0013212392550mr3753632oac.55.1665613675743; Wed, 12 Oct
 2022 15:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <1665547429-23508-1-git-send-email-wangmy@fujitsu.com> <CANPvuRm1e0ahSFda7VOqpKG-OB-g-8xza7E5_X-csm4QTAr=9Q@mail.gmail.com>
In-Reply-To: <CANPvuRm1e0ahSFda7VOqpKG-OB-g-8xza7E5_X-csm4QTAr=9Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2022 15:27:29 -0700
Message-ID: <CAMKF1sq3tZLuvT+4yeoCui6COj5x58hrApw4COpemz7UjmSkHw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] Add nativesdk-systemd-systemctl as dependency of dnf-plugin-tui
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 22:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99151

On Wed, Oct 12, 2022 at 10:20 AM Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>
> Hi wangmy,
>
> wangmy <wangmy@fujitsu.com> escreveu no dia quarta, 12/10/2022 =C3=A0(s) =
05:04:
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>  .../systemd/nativesdk-systemd-systemctl.bb    |  17 +
>>  .../systemd/systemd-systemctl/systemctl       | 340 ++++++++++++++++++
>>  2 files changed, 357 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/systemd/nativesdk-systemd-s=
ystemctl.bb
>>  create mode 100755 meta-oe/recipes-devtools/systemd/systemd-systemctl/s=
ystemctl
>>
>> diff --git a/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemct=
l.bb b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
>> new file mode 100644
>> index 0000000000..7ac21aa260
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/systemd/nativesdk-systemd-systemctl.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY =3D "Wrapper for enabling systemd services"
>> +
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfb=
cb788c80a0384361b4de20420"
>> +
>> +PR =3D "r6"
>
>
> Why is this recipe starting with the package release 6 ?
>

Right, I have fixed it before accepting.

> Jose
>
>>
>> +
>> +inherit nativesdk
>> +
>> +SRC_URI =3D "file://systemctl"
>> +
>> +S =3D "${WORKDIR}"
>> +
>> +do_install() {
>> +       install -d ${D}${bindir}
>> +       install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
>> +}
>> diff --git a/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemct=
l b/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
>> new file mode 100755
>> index 0000000000..6324319a45
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
>> @@ -0,0 +1,340 @@
>> +#!/usr/bin/env python3
>> +"""systemctl: subset of systemctl used for image construction
>> +
>> +Mask/preset systemd units
>> +"""
>> +
>> +import argparse
>> +import fnmatch
>> +import os
>> +import re
>> +import sys
>> +
>> +from collections import namedtuple
>> +from pathlib import Path
>> +
>> +version =3D 1.0
>> +
>> +ROOT =3D Path("/")
>> +SYSCONFDIR =3D Path("etc")
>> +BASE_LIBDIR =3D Path("lib")
>> +LIBDIR =3D Path("usr", "lib")
>> +
>> +locations =3D list()
>> +
>> +
>> +class SystemdFile():
>> +    """Class representing a single systemd configuration file"""
>> +    def __init__(self, root, path):
>> +        self.sections =3D dict()
>> +        self._parse(root, path)
>> +        dirname =3D os.path.basename(path.name) + ".d"
>> +        for location in locations:
>> +            for path2 in sorted((root / location / "system" / dirname).=
glob("*.conf")):
>> +                self._parse(root, path2)
>> +
>> +    def _parse(self, root, path):
>> +        """Parse a systemd syntax configuration file
>> +
>> +        Args:
>> +            path: A pathlib.Path object pointing to the file
>> +
>> +        """
>> +        skip_re =3D re.compile(r"^\s*([#;]|$)")
>> +        section_re =3D re.compile(r"^\s*\[(?P<section>.*)\]")
>> +        kv_re =3D re.compile(r"^\s*(?P<key>[^\s]+)\s*=3D\s*(?P<value>.*=
)")
>> +        section =3D None
>> +
>> +        if path.is_symlink():
>> +            try:
>> +                path.resolve()
>> +            except FileNotFoundError:
>> +                # broken symlink, try relative to root
>> +                path =3D root / Path(os.readlink(str(path))).relative_t=
o(ROOT)
>> +
>> +        with path.open() as f:
>> +            for line in f:
>> +                if skip_re.match(line):
>> +                    continue
>> +
>> +                line =3D line.strip()
>> +                m =3D section_re.match(line)
>> +                if m:
>> +                    if m.group('section') not in self.sections:
>> +                        section =3D dict()
>> +                        self.sections[m.group('section')] =3D section
>> +                    else:
>> +                        section =3D self.sections[m.group('section')]
>> +                    continue
>> +
>> +                while line.endswith("\\"):
>> +                    line +=3D f.readline().rstrip("\n")
>> +
>> +                m =3D kv_re.match(line)
>> +                k =3D m.group('key')
>> +                v =3D m.group('value')
>> +                if k not in section:
>> +                    section[k] =3D list()
>> +                section[k].extend(v.split())
>> +
>> +    def get(self, section, prop):
>> +        """Get a property from section
>> +
>> +        Args:
>> +            section: Section to retrieve property from
>> +            prop: Property to retrieve
>> +
>> +        Returns:
>> +            List representing all properties of type prop in section.
>> +
>> +        Raises:
>> +            KeyError: if ``section`` or ``prop`` not found
>> +        """
>> +        return self.sections[section][prop]
>> +
>> +
>> +class Presets():
>> +    """Class representing all systemd presets"""
>> +    def __init__(self, scope, root):
>> +        self.directives =3D list()
>> +        self._collect_presets(scope, root)
>> +
>> +    def _parse_presets(self, presets):
>> +        """Parse presets out of a set of preset files"""
>> +        skip_re =3D re.compile(r"^\s*([#;]|$)")
>> +        directive_re =3D re.compile(r"^\s*(?P<action>enable|disable)\s+=
(?P<unit_name>(.+))")
>> +
>> +        Directive =3D namedtuple("Directive", "action unit_name")
>> +        for preset in presets:
>> +            with preset.open() as f:
>> +                for line in f:
>> +                    m =3D directive_re.match(line)
>> +                    if m:
>> +                        directive =3D Directive(action=3Dm.group('actio=
n'),
>> +                                              unit_name=3Dm.group('unit=
_name'))
>> +                        self.directives.append(directive)
>> +                    elif skip_re.match(line):
>> +                        pass
>> +                    else:
>> +                        sys.exit("Unparsed preset line in {}".format(pr=
eset))
>> +
>> +    def _collect_presets(self, scope, root):
>> +        """Collect list of preset files"""
>> +        presets =3D dict()
>> +        for location in locations:
>> +            paths =3D (root / location / scope).glob("*.preset")
>> +            for path in paths:
>> +                # earlier names override later ones
>> +                if path.name not in presets:
>> +                    presets[path.name] =3D path
>> +
>> +        self._parse_presets([v for k, v in sorted(presets.items())])
>> +
>> +    def state(self, unit_name):
>> +        """Return state of preset for unit_name
>> +
>> +        Args:
>> +            presets: set of presets
>> +            unit_name: name of the unit
>> +
>> +        Returns:
>> +            None: no matching preset
>> +            `enable`: unit_name is enabled
>> +            `disable`: unit_name is disabled
>> +        """
>> +        for directive in self.directives:
>> +            if fnmatch.fnmatch(unit_name, directive.unit_name):
>> +                return directive.action
>> +
>> +        return None
>> +
>> +
>> +def add_link(path, target):
>> +    try:
>> +        path.parent.mkdir(parents=3DTrue)
>> +    except FileExistsError:
>> +        pass
>> +    if not path.is_symlink():
>> +        print("ln -s {} {}".format(target, path))
>> +        path.symlink_to(target)
>> +
>> +
>> +class SystemdUnitNotFoundError(Exception):
>> +    def __init__(self, path, unit):
>> +        self.path =3D path
>> +        self.unit =3D unit
>> +
>> +
>> +class SystemdUnit():
>> +    def __init__(self, root, unit):
>> +        self.root =3D root
>> +        self.unit =3D unit
>> +        self.config =3D None
>> +
>> +    def _path_for_unit(self, unit):
>> +        for location in locations:
>> +            path =3D self.root / location / "system" / unit
>> +            if path.exists() or path.is_symlink():
>> +                return path
>> +
>> +        raise SystemdUnitNotFoundError(self.root, unit)
>> +
>> +    def _process_deps(self, config, service, location, prop, dirstem):
>> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
>> +
>> +        target =3D ROOT / location.relative_to(self.root)
>> +        try:
>> +            for dependent in config.get('Install', prop):
>> +                wants =3D systemdir / "{}.{}".format(dependent, dirstem=
) / service
>> +                add_link(wants, target)
>> +
>> +        except KeyError:
>> +            pass
>> +
>> +    def enable(self, caller_unit=3DNone):
>> +        # if we're enabling an instance, first extract the actual insta=
nce
>> +        # then figure out what the template unit is
>> +        template =3D re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.uni=
t)
>> +        if template:
>> +            instance =3D template.group('instance')
>> +            unit =3D re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
>> +        else:
>> +            instance =3D None
>> +            unit =3D self.unit
>> +
>> +        path =3D self._path_for_unit(unit)
>> +
>> +        if path.is_symlink():
>> +            # ignore aliases
>> +            return
>> +
>> +        config =3D SystemdFile(self.root, path)
>> +        if instance =3D=3D "":
>> +            try:
>> +                default_instance =3D config.get('Install', 'DefaultInst=
ance')[0]
>> +            except KeyError:
>> +                # no default instance, so nothing to enable
>> +                return
>> +
>> +            service =3D self.unit.replace("@.",
>> +                                        "@{}.".format(default_instance)=
)
>> +        else:
>> +            service =3D self.unit
>> +
>> +        self._process_deps(config, service, path, 'WantedBy', 'wants')
>> +        self._process_deps(config, service, path, 'RequiredBy', 'requir=
es')
>> +
>> +        try:
>> +            for also in config.get('Install', 'Also'):
>> +                try:
>> +                    if caller_unit !=3D also:
>> +                        SystemdUnit(self.root, also).enable(unit)
>> +                except SystemdUnitNotFoundError as e:
>> +                    sys.exit("Error: Systemctl also enable issue with  =
%s (%s)" % (service, e.unit))
>> +
>> +        except KeyError:
>> +            pass
>> +
>> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
>> +        target =3D ROOT / path.relative_to(self.root)
>> +        try:
>> +            for dest in config.get('Install', 'Alias'):
>> +                alias =3D systemdir / dest
>> +                add_link(alias, target)
>> +
>> +        except KeyError:
>> +            pass
>> +
>> +    def mask(self):
>> +        systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
>> +        add_link(systemdir / self.unit, "/dev/null")
>> +
>> +
>> +def collect_services(root):
>> +    """Collect list of service files"""
>> +    services =3D set()
>> +    for location in locations:
>> +        paths =3D (root / location / "system").glob("*")
>> +        for path in paths:
>> +            if path.is_dir():
>> +                continue
>> +            services.add(path.name)
>> +
>> +    return services
>> +
>> +
>> +def preset_all(root):
>> +    presets =3D Presets('system-preset', root)
>> +    services =3D collect_services(root)
>> +
>> +    for service in services:
>> +        state =3D presets.state(service)
>> +
>> +        if state =3D=3D "enable" or state is None:
>> +            try:
>> +                SystemdUnit(root, service).enable()
>> +            except SystemdUnitNotFoundError:
>> +                sys.exit("Error: Systemctl preset_all issue in %s" % se=
rvice)
>> +
>> +    # If we populate the systemd links we also create /etc/machine-id, =
which
>> +    # allows systemd to boot with the filesystem read-only before gener=
ating
>> +    # a real value and then committing it back.
>> +    #
>> +    # For the stateless configuration, where /etc is generated at runti=
me
>> +    # (for example on a tmpfs), this script shouldn't run at all and we
>> +    # allow systemd to completely populate /etc.
>> +    (root / SYSCONFDIR / "machine-id").touch()
>> +
>> +
>> +def main():
>> +    if sys.version_info < (3, 4, 0):
>> +        sys.exit("Python 3.4 or greater is required")
>> +
>> +    parser =3D argparse.ArgumentParser()
>> +    parser.add_argument('command', nargs=3D'?', choices=3D['enable', 'm=
ask',
>> +                                                     'preset-all'])
>> +    parser.add_argument('service', nargs=3Dargparse.REMAINDER)
>> +    parser.add_argument('--root')
>> +    parser.add_argument('--preset-mode',
>> +                        choices=3D['full', 'enable-only', 'disable-only=
'],
>> +                        default=3D'full')
>> +
>> +    args =3D parser.parse_args()
>> +
>> +    root =3D Path(args.root) if args.root else ROOT
>> +
>> +    locations.append(SYSCONFDIR / "systemd")
>> +    # Handle the usrmerge case by ignoring /lib when it's a symlink
>> +    if not (root / BASE_LIBDIR).is_symlink():
>> +        locations.append(BASE_LIBDIR / "systemd")
>> +    locations.append(LIBDIR / "systemd")
>> +
>> +    command =3D args.command
>> +    if not command:
>> +        parser.print_help()
>> +        return 0
>> +
>> +    if command =3D=3D "mask":
>> +        for service in args.service:
>> +            try:
>> +                SystemdUnit(root, service).mask()
>> +            except SystemdUnitNotFoundError as e:
>> +                sys.exit("Error: Systemctl main mask issue in %s (%s)" =
% (service, e.unit))
>> +    elif command =3D=3D "enable":
>> +        for service in args.service:
>> +            try:
>> +                SystemdUnit(root, service).enable()
>> +            except SystemdUnitNotFoundError as e:
>> +                sys.exit("Error: Systemctl main enable issue in %s (%s)=
" % (service, e.unit))
>> +    elif command =3D=3D "preset-all":
>> +        if len(args.service) !=3D 0:
>> +            sys.exit("Too many arguments.")
>> +        if args.preset_mode !=3D "enable-only":
>> +            sys.exit("Only enable-only is supported as preset-mode.")
>> +        preset_all(root)
>> +    else:
>> +        raise RuntimeError()
>> +
>> +
>> +if __name__ =3D=3D '__main__':
>> +    main()
>> --
>> 2.25.1
>>
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99146): https://lists.openembedded.org/g/openembedded=
-devel/message/99146
> Mute This Topic: https://lists.openembedded.org/mt/94275098/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


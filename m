Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 040FD73243
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 18:20:32 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so67370714wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 11:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=3sjNyuQfZeIHHCfE+04YsmgH6qpHBJdvPtyGj2igP7I=;
	b=BlDg7O6WL/31WQ9ZttFcM7/kxU6hTnQVvUQGXb+KglGTWR4BrMpuo9NsIoJc733db2
	eXU+/gMOdWpFRKYJDfWm//O/DanEG3AJvzX3PYkWHbbTTdnsV98EaazYJFF45kuVa2zj
	DKycmmtgtKjX8Ii8lQmQOgAbjExIyDpdIDg2ImYpT1GcCSdp92SuMVqw/I7Ln+hf9XD5
	KEllEwbWozmRO6nghXAEOJ5w1cCOr/NKmF4dLegcFlpDkK3gBVyKyK3kVjYkfT18NwgK
	+V93XXYADR0NF7cklMCFfii0PEdrGqwtlndLGElvBknAGragweDkZKqdJeCX8Xd9Sayp
	9zvg==
X-Gm-Message-State: ALoCoQmRE9lSCkDLV6OtbvEcoNvVsB9nv6AShn+qK5fpnSRN0fk8lY3+yzgrLkYZjsPHJ1ZNkRrC
X-Received: by 10.180.221.193 with SMTP id qg1mr4846027wic.87.1441995632465;
	Fri, 11 Sep 2015 11:20:32 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id ex8sm342028wib.14.2015.09.11.11.20.30
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Sep 2015 11:20:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20150911174559.GD4184@mentor.com>
Date: Fri, 11 Sep 2015 20:20:30 +0200
Message-Id: <B5525705-0CB7-4007-96F0-10C365483F7B@dominion.thruhere.net>
References: <1441301956-12792-1-git-send-email-koen@dominion.thruhere.net>
	<20150911174559.GD4184@mentor.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
X-Mailer: Apple Mail (2.3094)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] sshguard 1.6.1+git: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Sep 2015 18:20:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 11 sep. 2015, om 19:46 heeft Joe MacDonald =
<Joe_MacDonald@mentor.com> het volgende geschreven:
>=20
> I had the following build failure when I merged this:
>=20
>   sshguard_whitelist.c:350:87: error: dereferencing pointer to =
incomplete type 'struct addrinfo'
>        for (numaddresses =3D 0, addriter =3D hostaddrs; addriter !=3D =
NULL; addriter =3D addriter->ai_next, ++numaddresses) {
>=20
>=20
> I put the contents of the logfile here:
>=20
>   http://pastebin.com/g1dCJcGY
>=20
> Can you take a look at this?

Certainly, thanks for the report! I=E2=80=99ll be away for the next 2 =
weeks, so don=E2=80=99t hold your breath :)

>=20
> Thanks,
> -J.
>=20
> [[oe] [meta-networking][PATCH] sshguard 1.6.1+git: add recipe] On =
15.09.03 (Thu 19:39) Koen Kooi wrote:
>=20
>> SSHguard protects hosts from brute-force attacks against SSH and =
other
>> services.
>>=20
>> This recipe uses iptables as blocker backend and journald as log =
backend.
>>=20
>> When it's working it will look like this in syslog:
>>=20
>> Sep 03 19:35:29 soekris sshguard[27044]: Started with danger =
threshold=3D40 ; minimum block=3D420 seconds
>> Sep 03 19:35:29 soekris sshguard[27044]: Blocking 24.234.171.90:4 for =
>630secs: 40 danger in 4 attacks over 0 seconds (all: 40d in 1 abuses =
over 0s).
>> Sep 03 19:35:29 soekris sshguard[27044]: Blocking 61.182.15.194:4 for =
>630secs: 40 danger in 4 attacks over 0 seconds (all: 40d in 1 abuses =
over 0s).
>> Sep 03 19:35:29 soekris sshguard[27044]: Blocking 115.58.38.53:4 for =
>630secs: 40 danger in 4 attacks over 0 seconds (all: 40d in 1 abuses =
over 0s).
>>=20
>> And the iptable rules:
>>=20
>> root@soekris:~# iptables -L sshguard --line-numbers
>> Chain sshguard (1 references)
>> num  target     prot opt source               destination
>> 1    DROP       all  --  hn.kd.ny.adsl        anywhere
>> 2    DROP       all  --  61.182.15.194        anywhere
>> 3    DROP       all  --  wsip-24-234-171-90.lv.lv.cox.net  anywhere
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> .../recipes-support/sshguard/sshguard/firewall     | 48 =
++++++++++++++++++++++
>> .../sshguard/sshguard/sshguard-journalctl          |  2 +
>> .../sshguard/sshguard/sshguard.service             | 12 ++++++
>> .../recipes-support/sshguard/sshguard_git.bb       | 38 =
+++++++++++++++++
>> 4 files changed, 100 insertions(+)
>> create mode 100644 =
meta-networking/recipes-support/sshguard/sshguard/firewall
>> create mode 100644 =
meta-networking/recipes-support/sshguard/sshguard/sshguard-journalctl
>> create mode 100644 =
meta-networking/recipes-support/sshguard/sshguard/sshguard.service
>> create mode 100644 =
meta-networking/recipes-support/sshguard/sshguard_git.bb
>>=20
>> diff --git =
a/meta-networking/recipes-support/sshguard/sshguard/firewall =
b/meta-networking/recipes-support/sshguard/sshguard/firewall
>> new file mode 100644
>> index 0000000..b683368
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/sshguard/sshguard/firewall
>> @@ -0,0 +1,48 @@
>> +#!/bin/sh
>> +
>> +#
>> +# Function that enables firewall
>> +#
>> +do_enable_firewall()
>> +{
>> +	# creating sshguard chain
>> +	iptables -N sshguard 2> /dev/null
>> +	ip6tables -N sshguard 2> /dev/null
>> +	# block traffic from abusers
>> +	iptables -I INPUT -j sshguard 2> /dev/null
>> +	ip6tables -I INPUT -j sshguard 2> /dev/null
>> +}
>> +#
>> +# Function that disables firewall
>> +#
>> +do_disable_firewall()
>> +{
>> +	# flushes list of abusers
>> +	iptables -F sshguard 2> /dev/null
>> +	ip6tables -F sshguard 2> /dev/null
>> +	# removes sshguard firewall rules
>> +	iptables -D INPUT -j sshguard 2> /dev/null
>> +	ip6tables -D INPUT -j sshguard 2> /dev/null
>> +	# removing sshguard chain
>> +	iptables -X sshguard 2> /dev/null
>> +	ip6tables -X sshguard 2> /dev/null
>> +}
>> +
>> +case "$1" in
>> +    enable)
>> +	do_enable_firewall
>> +	;;
>> +    disable)
>> +	do_disable_firewall
>> +	;;
>> +    restart)
>> +	do_disable_firewall
>> +	do_enable_firewall
>> +	;;
>> +    *)
>> +	exit 1
>> +	;;
>> +esac
>> +=09
>> +exit 0
>> +
>> diff --git =
a/meta-networking/recipes-support/sshguard/sshguard/sshguard-journalctl =
b/meta-networking/recipes-support/sshguard/sshguard/sshguard-journalctl
>> new file mode 100644
>> index 0000000..e7c615b
>> --- /dev/null
>> +++ =
b/meta-networking/recipes-support/sshguard/sshguard/sshguard-journalctl
>> @@ -0,0 +1,2 @@
>> +#!/bin/sh
>> +/bin/journalctl -fb -t sshd -n100 | /usr/sbin/sshguard -l- "$@"
>> diff --git =
a/meta-networking/recipes-support/sshguard/sshguard/sshguard.service =
b/meta-networking/recipes-support/sshguard/sshguard/sshguard.service
>> new file mode 100644
>> index 0000000..e2590fa
>> --- /dev/null
>> +++ =
b/meta-networking/recipes-support/sshguard/sshguard/sshguard.service
>> @@ -0,0 +1,12 @@
>> +[Unit]
>> +Description=3DSSHGuard
>> +After=3Dnetwork.service
>> +
>> +[Service]
>> +PIDFile=3D/run/sshguard.pid
>> +ExecStartPre=3D/usr/lib/sshguard/firewall enable
>> +ExecStopPost=3D/usr/lib/sshguard/firewall disable
>> +ExecStart=3D/usr/lib/sshguard/sshguard-journalctl -i =
/run/sshguard.pid
>> +
>> +[Install]
>> +WantedBy=3Dmulti-user.target
>> diff --git a/meta-networking/recipes-support/sshguard/sshguard_git.bb =
b/meta-networking/recipes-support/sshguard/sshguard_git.bb
>> new file mode 100644
>> index 0000000..04435e8
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/sshguard/sshguard_git.bb
>> @@ -0,0 +1,38 @@
>> +SUMMARY =3D "SSHguard protects hosts from brute-force attacks =
against SSH and other services."
>> +
>> +LICENSE =3D "ISC"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D47a33fc98cd20713882c4d822a57bf4d"
>> +
>> +PV =3D "1.6.1+git${SRCPV}"
>> +
>> +SRCREV =3D "019a0406811a536faf3f90cdd7a0a538ee24d789"
>> +SRC_URI =3D =
"git://bitbucket.org/sshguard/sshguard.git;protocol=3Dhttps;branch=3D1.6 =
\
>> +           file://firewall \
>> +           file://sshguard.service \
>> +           file://sshguard-journalctl \
>> +          "
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +DEPENDS =3D "flex-native"
>> +
>> +inherit autotools-brokensep systemd
>> +
>> +EXTRA_OECONF +=3D " --with-firewall=3Diptables \
>> +                  --with-iptables=3D${sbindir}/iptables \
>> +                "
>> +
>> +do_install_append() {
>> +    install -d ${D}${libdir}/sshguard
>> +    install -m 0755 ${WORKDIR}/firewall ${D}${libdir}/sshguard
>> +    install -m 0755 ${WORKDIR}/sshguard-journalctl =
${D}${libdir}/sshguard
>> +
>> +    sed -i -e s:/bin:${base_bindir}:g -e s:/usr/sbin:${sbindir}:g =
${D}${libdir}/sshguard/sshguard-journalctl
>> +
>> +    install -d ${D}${systemd_unitdir}/system
>> +    install -m 0644 ${WORKDIR}/sshguard.service =
${D}${systemd_unitdir}/system
>> +    sed -i -e s:/usr/lib:${libdir}:g =
${D}${systemd_unitdir}/system/sshguard.service=20
>> +}
>> +
>> +FILES_${PN} +=3D "${systemd_unitdir}"
>> +RDEPENDS_${PN} +=3D "iptables"
>> --=20
>> 2.0.1
>>=20
> --=20
> -Joe MacDonald.
> :wq



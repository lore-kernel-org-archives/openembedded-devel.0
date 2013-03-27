Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UKnoQ-0005Dw-Lx
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Mar 2013 11:42:38 +0100
Received: by mail-ea0-f170.google.com with SMTP id a15so3251258eae.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2013 03:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=jtVlZu1lwhZDqxbQ6+llk/KsnrsQajSIRrIPBwvgRFM=;
	b=a0haRzLx1cQmiVJX+WoPGouowheYUihqwf9BmhBhS9Ryrxcw6rDsTEoagLYujbpwE4
	v2efdqx4f0wqO0trXxg/Skadel/rQJJvoQ0U53PyHL1yCE2oj8Xj7B6DmqlF7O1jro0u
	WOqXUUDJDPa2AlFw81JgIWQtQgQ9ITPF9YypVGlkRF8qAaiL5fjvjwaCErZXKNXz5pXE
	Q5/cRSNfaoN3xysB2TepZUQnEcvV7xiSKqU/3KDMq3uBGN/CJfgFZ3+UPN5KmvVlue4Q
	GLhs0x2/iyyvPFu6K0rAMJSBKUIFrKAuvzoT/tms7T0sAxtrvxcXJPe0Nch1VO50fgSD
	yjpw==
X-Received: by 10.15.36.67 with SMTP id h43mr53991458eev.5.1364379933861;
	Wed, 27 Mar 2013 03:25:33 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id f47sm30286154eep.13.2013.03.27.03.25.30
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 03:25:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALbNGRQ1+_k1rSudZ6fjEB3WjtLiVEpamgy4ARo6pc2Ftu-yZg@mail.gmail.com>
Date: Wed, 27 Mar 2013 11:25:32 +0100
Message-Id: <5F3BAD5D-21D1-450F-858F-C056B603A314@dominion.thruhere.net>
References: <1364378833-16237-1-git-send-email-koen@dominion.thruhere.net>
	<CALbNGRQ1+_k1rSudZ6fjEB3WjtLiVEpamgy4ARo6pc2Ftu-yZg@mail.gmail.com>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlPBv2RMbN9Lh/WH0KxK9p2fQz7JEL89d5wuv1BcGnsAQUlZ0rrR+S5rokTG5nfeTOzwk9g
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] multipath-tools: add recipe for git version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 10:42:59 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 27 mrt. 2013, om 11:20 heeft Andreas M=FCller =
<schnitzeltony@googlemail.com> het volgende geschreven:

> On Wed, Mar 27, 2013 at 11:07 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> Multipath-tools hasn't seen a release in 3 years, so grab latest git.
>>=20
>> 'kpartx' is subpackaged since that's the tool most people want.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> .../multipath-tools/multipath-tools_git.bb         | 34 =
++++++++++++++++++++++
>> 1 file changed, 34 insertions(+)
>> create mode 100644 =
recipes-support/multipath-tools/multipath-tools_git.bb
>>=20
>> diff --git a/recipes-support/multipath-tools/multipath-tools_git.bb =
b/recipes-support/multipath-tools/multipath-tools_git.bb
>> new file mode 100644
>> index 0000000..1b83f49
>> --- /dev/null
>> +++ b/recipes-support/multipath-tools/multipath-tools_git.bb
>> @@ -0,0 +1,34 @@
>> +DESCRIPTION =3D "The upstream project used to drive the Device =
Mapper multipathing driver."
>> +
>> +DEPENDS =3D "lvm2 libaio"
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D7be2873b6270e45abacc503abbe2aa3d"
>> +
>> +
>> +SRC_URI =3D =
"git://git.opensvc.com/multipath-tools/.git;protocol=3Dhttp"
>> +SRCREV =3D "15fc23ffb2bd1bac6990eda3e23c3e8980e6cfa5"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +PV =3D "0.4.9+git"
>> +
>> +EXTRA_OEMAKE =3D "MULTIPATH_VERSION=3D${PV} DESTDIR=3D${D} =
syslibdir=3D${base_libdir} libdir=3D${base_libdir}/multipath"
>> +
>> +do_compile() {
>> +       oe_runmake
>> +}
>> +
>> +do_install() {
>> +       oe_runmake install
>> +}
>> +
> Is overwriting do_compile & do_install required?

do_install, yes, do_compile probably not=



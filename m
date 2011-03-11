Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Py4gF-0000Ms-Hi
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 16:55:07 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(ip-109-40-2-144.web.vodafone.de [109.40.2.144])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p2BFrFO8028278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 11 Mar 2011 16:53:23 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 2638725E7B;
	Fri, 11 Mar 2011 16:53:11 +0100 (CET)
Message-ID: <4D7A4566.6070607@dresearch.de>
Date: Fri, 11 Mar 2011 16:53:10 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<ild6ma$ton$1@dough.gmane.org>
In-Reply-To: <ild6ma$ton$1@dough.gmane.org>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p2BFrFO8028278
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] net-snmp: disable libnl use
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
X-List-Received-Date: Fri, 11 Mar 2011 15:55:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/11/2011 02:05 PM, Koen Kooi wrote:
> On 11-03-11 12:04, Steffen Sledz wrote:
>> Fixes compile error
>=20
>> | ./.libs/libnetsnmpmibs.so: undefined reference to `nl_handle_destroy=
'
>> | ./.libs/libnetsnmpmibs.so: undefined reference to `nl_handle_alloc'
>=20
>> which occurred sometimes depending on build order (not in clean packag=
e
>> only builds).
>=20
> What features do we loose when disabling netlink support? I'd rather ge=
t
> the libnl recipe fixed (e.g. static lib only) instead of hacking the
> dependants.

I'm not sure.

But there is no dependency to libnl. If *libnl was not built before net-s=
nmp* the autotools/configure does not find it. So in that case libnl wasn=
't used anyway.

Just in case *it was built before* net-snmp tries to use it and hits the =
mentioned error.

Regards,
Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



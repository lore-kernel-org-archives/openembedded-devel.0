Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2481E6C782
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2013 06:29:02 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hq15so1685144wib.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2013 23:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=iuRRHi/r7oTmfokGk3SQtin7d5+miNkLBeL5e7kEHhM=;
	b=H1aIBF1VWDGI9uYivayDBp4zKX3/ByFiHCgk8M2kiYuvNdDNOSLkqhwmwH8refO3Vr
	0psl+c8Ebsh5fuTaIgQk9foX3zqBjShEhJ8LOsE8B/cOJ/WLx/BMo74T+tNYRT1PICKY
	cR9j5Zis+E1nG9wgHODozmETA8duhkGhmDi0lEtXqiaPHGUIAshxtqyq04uzlps9zRZi
	HyEUPYYtKTziGqkQCsuaQfXmuQWxrXdHaLMTwhJMu3+/piXJvRZ1YYKy63YnxZPrm/T2
	2cjIuC1IbOAgsHOKgi5tSxvHp5N1sCgAayIt+5zB9JlZJk2L7uy37uaIQtVAcdHRrmt9
	RRAg==
X-Gm-Message-State: ALoCoQm/dSorQjnRt8xArKaW9QfExywlj5W1GpQVTi3gPoeYOWavfb1d16Kh4rGgLa2yCOKGrsrt
X-Received: by 10.180.206.129 with SMTP id lo1mr1115548wic.15.1378535344214;
	Fri, 06 Sep 2013 23:29:04 -0700 (PDT)
Received: from [172.20.0.132] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id b11sm1458490wik.1.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 23:29:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1378504692-3593-1-git-send-email-fathi.boudra@linaro.org>
Date: Sat, 7 Sep 2013 08:29:02 +0200
Message-Id: <15335D9C-70A1-49CD-A96B-4B76B1A36FC3@dominion.thruhere.net>
References: <1378504692-3593-1-git-send-email-fathi.boudra@linaro.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe.macdonald@windriver.com>
Subject: Re: [meta-networking][PATCH V2] fping: add recipe
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
X-List-Received-Date: Sat, 07 Sep 2013 06:29:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 sep. 2013, om 23:58 heeft Fathi Boudra <fathi.boudra@linaro.org> =
het volgende geschreven:

> V1->V2
> drop PR
> use PACKAGECONFIG for ipv6
> drop COMPATIBLE_HOST

Changelogs like this go below the '---' so they don't end up in git log.

> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
> meta-networking/recipes-support/fping/fping_3.5.bb | 24 =
++++++++++++++++++++++
> 1 file changed, 24 insertions(+)
> create mode 100644 meta-networking/recipes-support/fping/fping_3.5.bb
>=20
> diff --git a/meta-networking/recipes-support/fping/fping_3.5.bb =
b/meta-networking/recipes-support/fping/fping_3.5.bb
> new file mode 100644
> index 0000000..064c630
> --- /dev/null
> +++ b/meta-networking/recipes-support/fping/fping_3.5.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "sends ICMP ECHO_REQUEST packets to network hosts"
> +DESCRIPTION =3D "fping is a ping like program which uses the Internet =
Control \
> +Message Protocol (ICMP) echo request to determine if a target host is =
\
> +responding. fping differs from ping in that you can specify any =
number of \
> +targets on the command line, or specify a file containing the lists =
of \
> +targets to ping.  Instead of sending to one target until it times out =
or \
> +replies, fping will send out a ping packet and move on to the next =
target \
> +in a round-robin fashion."
> +HOMEPAGE =3D "http://www.fping.org/"
> +SECTION =3D "console/tools"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D09d77789fe32be35acde9637a5ee39b1"
> +
> +SRC_URI =3D "http://www.fping.org/dist/fping-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "2e17cb655aa4eb59b5a4a38a89e746ed"
> +SRC_URI[sha256sum] =3D =
"09b8960e235341bae6000085d38106357eae656a79e0119bd27e816c9003656a"
> +
> +S =3D "${WORKDIR}/fping-${PV}"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--enable-ipv4"
> +
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"

You'll also need:

PACKAGECONFIG ?=3D "${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6', =
'', d)}"

See meta/recipes-extended/iptables/iptables_1.4.17.bb in OE-core for =
reference on ipv6 PACKAGECONFIG.

regards,

Koen

> --=20
> 1.8.1.2
>=20



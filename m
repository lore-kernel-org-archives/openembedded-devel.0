Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mgl@doredevelopment.dk>) id 1Lzrpl-0008DH-MR
	for openembedded-devel@openembedded.org; Fri, 01 May 2009 14:27:18 +0200
Received: from [192.168.18.34] (07723322604.hef.nianet.dk [77.233.226.4] (may
	be forged)) (authenticated bits=0)
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id n41CLbVX031438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 May 2009 14:21:49 +0200
Message-ID: <49FAE94F.2090101@doredevelopment.dk>
Date: Fri, 01 May 2009 14:21:35 +0200
From: Martin Lund <mgl@doredevelopment.dk>
Organization: =?ISO-8859-1?Q?Dor=E9Development?=
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-MIME-Autoconverted: from 8bit to quoted-printable by bq8.dotserv.com id
	n41CLbVX031438
Subject: =?UTF-8?B?UHVsbCByZXF1ZXN0IGZyb20gRG9yw6lEZXZlbG9wbWVudCAtIE5ldzogTWljcm8gZGlzdHJvL2ltYWdl?=
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
X-List-Received-Date: Fri, 01 May 2009 12:27:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello OE dev,

Please pull the changes from the following repository:

git pull git://dev.doredevelopment.dk/oe-micro.git master

This oe-micro repository adds the following files to current dev:

conf/distro/micro-uclibc.conf |   43 +++++++++++++++++
conf/distro/micro.conf        |  100=20
+++++++++++++++++++++++++++++++++++++++++
recipes/images/micro-image.bb |   34 ++++++++++++++
3 files changed, 177 insertions(+), 0 deletions(-)

There should be no conflicts with the current OE dev branch.

These files constitute a new distribution named "Micro" and a=20
corresponding buildable image target: micro-image



The "Micro" distribution/image is created because we feel that there is=20
a need for a truly tiny and clean distro and image definition in OE for=20
those users out there that needs a _very_ tiny Linux rootfs with=20
virtually nothing installed except busybox, libc, udev, and a few init=20
scripts. On arm the jffs2 image size is only 1 MB (uclibc based). No=20
bloat allowed.

The micro-image is ideal for users who wants this type of tiny Linux=20
rootfs system with only a few custom applications added.

It has been tested to build and run on the following machine types:

    * at91sam9263ek [glibc, uclibc]
    * x86 [glibc]

As everything else OE it should build for most other machine types as=20
well (no guarantee of course).

The micro distribution/image is inspired by the "minimal" distro and=20
image configuration - but it takes that one step further as contents are=20
heavily stripped down and non needed definitions removed. Thanks to=20
those who contributed to minimal distro - good work.

More details on micro can be found in the following wiki:
http://dev.doredevelopment.dk/wiki/OpenEmbeddedMicro

Note: It is still work in progress and there are things to improve on=20
the todo list (see wiki).

We intend to maintain this distro/image in the future - please pull :)

Thanks.

Best regards, Dor=E9Development

--=20
Martin Lund, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 84 24, Email: mgl@doredevelopment.dk
WWW: http://www.doredevelopment.dk




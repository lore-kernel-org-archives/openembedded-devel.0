Received: from smtp.fchosted.com ([205.234.75.10] helo=mail.fchosted.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jfaith@soundmetrics.com>) id 1PQsNk-00008E-4l
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 03:06:49 +0100
Received: from MBXCLUS01.fchosted.com ([10.10.2.22]) by hubex02.fchosted.com
	([10.10.1.52]) with mapi; Thu, 9 Dec 2010 18:08:14 -0800
From: John Faith <jfaith@soundmetrics.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Dec 2010 18:05:10 -0800
Thread-Topic: [oe] i2c-dev.h header file
Thread-Index: AcuYDxnLIy+omczNTVGiFMbUwVLNSQ==
Message-ID: <829C64A6-E3E4-452D-B230-751435760513@soundmetrics.com>
References: <4D016E63.5040301@balister.org>
In-Reply-To: <4D016E63.5040301@balister.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 205.234.75.10
X-SA-Exim-Mail-From: jfaith@soundmetrics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: i2c-dev.h header file
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
X-List-Received-Date: Fri, 10 Dec 2010 02:06:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Dec 9, 2010, at 4:03 PM, Philip Balister wrote:

> It turns out i2c-dev.h is being staged by two bb files. I assume the=20
> correct copy comes from the kernel headers file.
>=20
> The i2c-tools package is also staging a copy that over writes this one.=20
> This causes a problem with the uhd build.
>=20
> I'd like to stop the i2c-tools package from staging that header. I think=
=20
> this is the proper solution. Installing i2c-tools on my desktop did not=20
> install this header anywhere and there was no corresponding dev package.
>=20
> Thoughts? If there are no objections I will implement this in the morning=
.
>=20
> Philip
>=20

Hi Philip,
I ran into this as well, and since I didn't want to mask the kernel header =
(which is a different file), I decided to rename the file from i2c-tools.  =
Don't know if this would work for anyone else, but this is the workaround I=
 added to i2c-tools_3.0.2.bb:

do_stage2() {
    install -d ${STAGING_INCDIR}/linux
    install -m 0644 include/linux/i2c-dev.h ${STAGING_INCDIR}/linux/i2c-dev=
-user.h
}
addtask stage2 after do_package before do_populate_staging

do_install_append() {
    install -d ${D}${includedir}/linux
    install -m 0644 include/linux/i2c-dev.h ${D}${includedir}/linux/i2c-dev=
-user.h
    rm -f ${D}${includedir}/linux/i2c-dev.h
}


,
John






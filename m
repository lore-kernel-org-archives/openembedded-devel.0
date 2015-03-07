Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from f4mail-83-111.rediffmail.com (unknown [203.199.83.114])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE5B60144
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Mar 2015 13:22:16 +0000 (UTC)
Received: from rediffmail.com (unknown [10.50.250.70])
	by f4mail-83-111.rediffmail.com (Postfix) with SMTP id 5E1EF248494E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Mar 2015 18:48:33 +0530 (IST)
Received: (qmail 9303 invoked by uid 510); 7 Mar 2015 13:14:40 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=ApRigvRfLYCK8znYNVzygu8C1Su3q5Iy80hbkzCr68kv4W6UdhTnzhjaK4L7+dNQArhyblATlzKrYAzYgIpptAa1d3NBKfJKrgW9s5D3hGp6tZxMUeKYuWcFAL6oehYW+GpaeeKjcwH0mRoEx+w1DEnoB3KB1xxRAY26vpeCTGA=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160205.54FAF9A7.00A7, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 7 Mar 2015 13:14:35 -0000
Message-ID: <20150307131435.3659.qmail@f4mail-235-141.rediffmail.com>
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Received: from unknown 103.25.205.2 by rediffmail.com via HTTP;
	07 Mar 2015 13:14:34 -0000
X-Senderscore: D=0&S=0
Sender: pandey_himanshu80@rediffmail.com
From: "pandey_himanshu80" <pandey_himanshu80@rediffmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: ERROR: QA Issue: initscripts: Files/directories were installed but not shipped
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
X-List-Received-Date: Sat, 07 Mar 2015 13:22:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Sir,
My recipe contains following lines in do_install() section:
&nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}${base_bindir}&nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}${base_sbindir}&nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}${sbindir}&nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}/${localstatedir}/lib/stateless&nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}/${localstatedir}/log&nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}/${localstatedir}/run
&nbsp; &nbsp; &nbsp; &nbsp; install -m 0755 ${S}/src/netreport &nbsp; &nbsp; &nbsp;${D}/${localstatedir}/run
FILES_${PN} += "${localstatedir}/run"
I am getting the following error:
ERROR: QA Issue: initscripts: Files/directories were installed but not shipped&nbsp; /runERROR: QA run found fatal errors. Please consider fixing them.ERROR: Function failed: do_package_qa
Regards,Himanshu &nbsp;
From raj.khem@gmail.com  Sat Mar  7 17:11:31 2015
Return-Path: <raj.khem@gmail.com>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id C2234738EB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Mar 2015 17:11:30 +0000 (UTC)
Received: by pablj1 with SMTP id lj1so51074815pab.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Mar 2015 09:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=exFD7mrY0HqWYoQgy7Z21onX5Ku2+UdB3GhG8G3LYi8=;
	b=DCcLD1ve+QrdU87pkzYJ6TBs9jaiLPyC/tLG5yf4ovBMmMa5a1VJdeTUeUdfGx3JH9
	crf96C3oePPg7ZVFH+FGM0Iew1pm9IY2hBJnoX3TMK3C37i4pTthOgEPnJMTDosjSCe1
	+r42Q9UA9de/kI6AS3ZSrNuzH7is5XHoC80aGatPX7C6hiJ9jSictrNZspq4uk30UBI7
	qY777J7XQ8mcDH4VDQMoypF8ywnIVN52H3QGxNEIH7aIp7nrQg7EYIboPv7fFOLaT5Lp
	UQi1uFVu3M1um1J7ud+8RgYnBS7nBILotFnb7UmEQPvLOxCEw1nvp3w7noX1CHJnQ+NW
	Y3/w==
X-Received: by 10.68.211.161 with SMTP id nd1mr18010117pbc.6.1425748292263;
	Sat, 07 Mar 2015 09:11:32 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:8cba:4754:67eb:6b50?
	([2601:9:3580:84c:8cba:4754:67eb:6b50])
	by mx.google.com with ESMTPSA id ht2sm7137266pdb.23.2015.03.07.09.11.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 07 Mar 2015 09:11:30 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150307131435.3659.qmail@f4mail-235-141.rediffmail.com>
Date: Sat, 7 Mar 2015 09:11:35 -0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C22E13E-CC9D-43F8-8414-B89163787C43@gmail.com>
References: <20150307131435.3659.qmail@f4mail-235-141.rediffmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2070.6)
Subject: Re: [oe] ERROR: QA Issue: initscripts: Files/directories were
	installed but not shipped
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
X-List-Received-Date: Sat, 07 Mar 2015 17:11:32 -0000


> On Mar 7, 2015, at 5:14 AM, pandey_himanshu80 =
<pandey_himanshu80@rediffmail.com> wrote:
>=20
> Hi Sir,
> My recipe contains following lines in do_install() section:
> &nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}${base_bindir}&nbsp; &nbsp; =
&nbsp; &nbsp; install -d ${D}${base_sbindir}&nbsp; &nbsp; &nbsp; &nbsp; =
install -d ${D}${sbindir}&nbsp; &nbsp; &nbsp; &nbsp; install -d =
${D}/${localstatedir}/lib/stateless&nbsp; &nbsp; &nbsp; &nbsp; install =
-d ${D}/${localstatedir}/log&nbsp; &nbsp; &nbsp; &nbsp; install -d =
${D}/${localstatedir}/run
> &nbsp; &nbsp; &nbsp; &nbsp; install -m 0755 ${S}/src/netreport &nbsp; =
&nbsp; &nbsp;${D}/${localstatedir}/run
> FILES_${PN} +=3D "${localstatedir}/run"
> I am getting the following error:
> ERROR: QA Issue: initscripts: Files/directories were installed but not =
shipped&nbsp; /runERROR: QA run found fatal errors. Please consider =
fixing them.ERROR: Function failed: do_package_qa


Please use sane mail programs, your client seems to be molesting the =
emails.

/run is a runtime directory so you should find a different way to get =
this file into /run folder at runtime
a simple install at build time into /run won=E2=80=99t help.

> Regards,Himanshu &nbsp;
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



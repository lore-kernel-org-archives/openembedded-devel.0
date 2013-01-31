Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1U0xr6-0002zE-K2
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 18:23:21 +0100
Received: by mail-ee0-f42.google.com with SMTP id b47so1587982eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 09:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=M480fAHr6k7zBe1+eKeREy1zPsUZQ9XjmOKATGcnWQI=;
	b=HQ9JKvOuxY+ySsP+BK/cDNoE05uR+DEoIiN01VSrwV7QNu+X+VtCWG/x5o6SsIdMPo
	eV5igCqmBBcRi5CZKOktL14KmIFWxvy5DTZWdkO9bGvCICVL4wpelFVB9159UlBPKlu/
	Vxoqv0FVK+NVLG8vGdah/4Ky0ETSB6d7nwY36TbBrK4MX1n7phRN4wpYbkfVDmMAIitm
	q9uvOmZeGNUky98Er60pTbZug+q7eY2EdgMDVRLbSHP03TpFU0FbjCDKbbhP9voZMPOh
	zHABSJlBNf+OFrGrtcwLTkS/pPhav/aUlk5I7yQdwRpIraZxo5RVktPGUDl/zvIbyGDs
	hokw==
X-Received: by 10.14.223.135 with SMTP id v7mr29168424eep.41.1359652057649;
	Thu, 31 Jan 2013 09:07:37 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 3sm8306154eej.6.2013.01.31.09.07.35
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 09:07:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130131165633.GF2102@jama.dyndns-home.com>
Date: Thu, 31 Jan 2013 18:07:37 +0100
Message-Id: <21F2D8CF-6E10-41F8-9A55-99949E2CEB79@dominion.thruhere.net>
References: <1359532955-16954-1-git-send-email-koen@dominion.thruhere.net>
	<20130131165633.GF2102@jama.dyndns-home.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQl+HmrgaphMDt1SWdgvEhprkAP3pECt3sf+OSu6LNTpJsRKeTfGLyxB385WRFvGnrFxxNiB
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][[RFC][PATCH] nodejs: add 0.8.18
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
X-List-Received-Date: Thu, 31 Jan 2013 17:23:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 jan. 2013, om 17:56 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Wed, Jan 30, 2013 at 09:02:35AM +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> .../nodejs/nodejs/0002-Enable-NEON.patch           | 27 ++++++++++
>> ...0003-Resolve-bad-rpath-issue-when-linking.patch | 29 ++++++++++
>> meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb   | 61 =
++++++++++++++++++++++
>> 3 files changed, 117 insertions(+)
>> create mode 100644 =
meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch
>> create mode 100644 =
meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-l=
inking.patch
>> create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
>=20
> FWIW: 0.6.21 fails exactly the same as 0.6.20 but I've merged it as =
it's
> not worse.
>=20
> I've tried 0.8.18 today and it fails:
> ERROR: Function failed: do_configure (see =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/n=
odejs-native/0.8.18-r0/temp/log.do_configure.30923 for further =
information)
> ERROR: Logfile of failure stored in: =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/n=
odejs-native/0.8.18-r0/temp/log.do_configure.30923
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function do_configure
> | =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/n=
odejs-native/0.8.18-r0/gcc: 2: =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/n=
odejs-native/0.8.18-r0/gcc: Cannot fork
> | =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/n=
odejs-native/0.8.18-r0/gcc: 2: =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/n=
odejs-native/0.8.18-r0/gcc: Cannot fork
> | Traceback (most recent call last):
> |   File "./configure", line 473, in <module>
> |     configure_node(output)
> |   File "./configure", line 371, in configure_node
> |     cc_version, is_clang =3D compiler_version()
> |   File "./configure", line 331, in compiler_version
> |     version =3D tuple(map(int, proc.communicate()[0].split('.')))
> | ValueError: invalid literal for int() with base 10: ''
> | ERROR: Function failed: do_configure (see =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/n=
odejs-native/0.8.18-r0/temp/log.do_configure.30923 for further =
information)
> NOTE: recipe nodejs-native-0.8.18-r0: task do_configure: Failed
> ERROR: Task 22884 =
(virtual:native:/home/jenkins/oe/shr-core-branches/shr-core/meta-openembed=
ded/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb, do_configure) =
failed with exit code '1'
>=20
> Any idea?

That's likely the gcc wrapper script I added maybe it doesn't like your =
native gcc. FWIW I only tested it on fedora 18=



Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 546A360796
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 15:46:15 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id m18so15000856pgd.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 08:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=TA2uUPlJIHKBbrsu6QCvviMfGrYI6oOITIYjCT9Pd0k=;
	b=aiBl+bvdUFVlnKaB8tt2P6aM0xG9o1s8/pLcTEwlFTN5AUB/txf1q3tqfihD+VnkVM
	vF/FY9H/TkiCm/ymxHt/X8h6WrFkr7WfanCx16zXtfwtv6860r200Ouj946K9skvXLfH
	ABUyfxVlpVcVQO9v+1R6/7q9jpIgNqxcdpatUZAzq3S2mX4UAjStt3Fb9fTN8rFzdhQg
	nYBAGHToERe37OJ2bREUHtOp3UN9AvuGR5BuxKwvsfx3iY/Mm2U5qINotln8BgMh58ld
	/01ugOrEMLeXx7AqAqrYfVVypy2JKQeijKEwnjdy9/73lt3qvOilHE/nWook8/gwRlRl
	Gp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=TA2uUPlJIHKBbrsu6QCvviMfGrYI6oOITIYjCT9Pd0k=;
	b=WFTQbPuNueMIfF4oV8USF0jDvGK5QkKJhjH5HKxgg3nTLRlxCcvoSfQufGf9vszuIg
	+VVgQGclYivNwzIjL9xBXlxrzGX1JtG+Z5lSnbnQ/aW5Jl2mhTvGGqe3Eas7OGKd6uxK
	gfaR+eQMDopLu4Y0eJmgNB0TCy3hIm1mI/UKClu2eTrbWZAlprYdOgnqxKcHuXwJyNJ3
	EnEhLeb2BnidLx5mWnZkwbcG+8p3EVtxtwugyQjgMhIUsZOea3fgGMC0vH9yOgwiIQJA
	RH6ZvZlKxCxmlYgKu/Vnu4yq3W7+KPdmuOxSngBtY2+EewrL/hmo8OYL4OFhp0xm5kpK
	QXEA==
X-Gm-Message-State: AMCzsaX3my+zHChzfugmFACzd/FKjJw2MnWNatAvM/YIYVqS6zuB9vdD
	cBTamwCH3NIZAeP5KLxixMJDtw==
X-Google-Smtp-Source: ABhQp+STui/P/yY54oZvrJYvWxr6gdyyIPYbcS1iQigtuvGiVp6q15wmw2SCk0CvEcvOEFhodo4Ldg==
X-Received: by 10.99.132.72 with SMTP id k69mr2250940pgd.141.1509464776723;
	Tue, 31 Oct 2017 08:46:16 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:7d30:7a9e:43a0:435a?
	([2601:202:4001:9ea0:7d30:7a9e:43a0:435a])
	by smtp.gmail.com with ESMTPSA id
	j11sm3320745pfh.18.2017.10.31.08.46.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Oct 2017 08:46:16 -0700 (PDT)
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
	<1509387073-21934-4-git-send-email-joe_macdonald@mentor.com>
	<f585dafe-fe4f-fefb-dd23-c1f99b653754@gmail.com>
	<20171031132125.bjisys7yjaqrc6cp@mentor.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5bf9187e-85a9-a74c-6f96-c6c54259555c@gmail.com>
Date: Tue, 31 Oct 2017 08:46:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171031132125.bjisys7yjaqrc6cp@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 3/6] freediameter: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Oct 2017 15:46:16 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 10/31/2017 06:21 AM, Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH 3/6] freediameter: add new recipe] On=
 17.10.30 (Mon 17:47) akuster808 wrote:
>
>>
>> On 10/30/2017 11:11 AM, Joe MacDonald wrote:
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>
>>> freeDiameter is an open source Diameter protocol
>>> implementation. It provides an extensible platform
>>> for deploying a Diameter network for your Authentication,
>>> Authorization and Accounting needs.
>>>
>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>> If you want this in meta-networking, please send a patch to remove it
>> from meta-security.
> I never even thought of looking for it in meta-security.  Since I've
> always encountered it in the CGL space it just never occurred, and sinc=
e
> the patch was still apparently active in patchwork, I just assumed it'd=

> been lost.
>
> Do you (or anyone else using the layers) have a preference for what we
> do with the recipe?=20
Meta-networking is fine by me.

-Armin
>  Unfortunately at a glance they look at least a bit
> different from each other, so if I'm going to include it in
> meta-networking I'll want to review what's in meta-security first to
> determine what changes are appropriate to the meta-networking version.
>
> -J.
>
>> - armin
>>> ---
>>>  ...murhash-algorithm-with-Robert-Jenkin-s-ha.patch | 223 +++++++++++=
++++++++++
>>>  .../freediameter/files/freediameter.init           |  72 +++++++
>>>  .../freediameter/files/freediameter.service        |  11 +
>>>  .../freediameter/files/install_test.patch          |  22 ++
>>>  .../freediameter/files/pass-ptest-env.patch        |  72 +++++++
>>>  .../recipes-protocols/freediameter/files/run-ptest |  11 +
>>>  .../freediameter/freediameter.inc                  |  98 +++++++++
>>>  .../freediameter/freediameter_1.2.1.bb             |   7 +
>>>  8 files changed, 516 insertions(+)
>>>  create mode 100644 meta-networking/recipes-protocols/freediameter/fi=
les/Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch
>>>  create mode 100755 meta-networking/recipes-protocols/freediameter/fi=
les/freediameter.init
>>>  create mode 100644 meta-networking/recipes-protocols/freediameter/fi=
les/freediameter.service
>>>  create mode 100644 meta-networking/recipes-protocols/freediameter/fi=
les/install_test.patch
>>>  create mode 100644 meta-networking/recipes-protocols/freediameter/fi=
les/pass-ptest-env.patch
>>>  create mode 100644 meta-networking/recipes-protocols/freediameter/fi=
les/run-ptest
>>>  create mode 100644 meta-networking/recipes-protocols/freediameter/fr=
eediameter.inc
>>>  create mode 100644 meta-networking/recipes-protocols/freediameter/fr=
eediameter_1.2.1.bb
>>>
>>> diff --git a/meta-networking/recipes-protocols/freediameter/files/Rep=
lace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch b/meta-networking=
/recipes-protocols/freediameter/files/Replace-murmurhash-algorithm-with-R=
obert-Jenkin-s-ha.patch
>>> new file mode 100644
>>> index 0000000..71a5a1a
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/freediameter/files/Replace-mu=
rmurhash-algorithm-with-Robert-Jenkin-s-ha.patch
>>> @@ -0,0 +1,223 @@
>>> +Replace murmurhash algorithm with Robert Jenkin's hash algorithm
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +From test result, murmurhash algorithm does not work in big endian
>>> +processor, so replace it with Robert Jenkin's hash which has worked
>>> +in linux kernel for many years and has more adaptability.
>>> +
>>> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>>> +---
>>> + libfdproto/ostr.c |  192 +++++++++++++++++++++---------------------=
-----------
>>> + 1 file changed, 74 insertions(+), 118 deletions(-)
>>> +
>>> +diff --git a/libfdproto/ostr.c b/libfdproto/ostr.c
>>> +index 8f29b48..ce1f4dd 100644
>>> +--- a/libfdproto/ostr.c
>>> ++++ b/libfdproto/ostr.c
>>> +@@ -430,128 +430,84 @@ after_proto:
>>> +=20
>>> +=20
>>> + /******************************************************************=
**************************************/
>>> +-/* Hash function -- credits to Austin Appleby, thank you ^^ */
>>> +-/* See http://murmurhash.googlepages.com for more information on th=
is function */
>>> +-
>>> +-/* the strings are NOT always aligned properly (ex: received in RAD=
IUS message), so we use the aligned MurmurHash2 function as needed */
>>> +-#define _HASH_MIX(h,k,m) { k *=3D m; k ^=3D k >> r; k *=3D m; h *=3D=
 m; h ^=3D k; }
>>> +-uint32_t fd_os_hash ( uint8_t * string, size_t len )
>>> ++/*
>>> ++ * Robert Jenkin's hash function.
>>> ++ * http://burtleburtle.net/bob/hash/evahash.html
>>> ++ * This is in the public domain.
>>> ++ */
>>> ++#define mix(a, b, c)						\
>>> ++	do {							\
>>> ++		a =3D a - b;  a =3D a - c;  a =3D a ^ (c >> 13);	\
>>> ++		b =3D b - c;  b =3D b - a;  b =3D b ^ (a << 8);	\
>>> ++		c =3D c - a;  c =3D c - b;  c =3D c ^ (b >> 13);	\
>>> ++		a =3D a - b;  a =3D a - c;  a =3D a ^ (c >> 12);	\
>>> ++		b =3D b - c;  b =3D b - a;  b =3D b ^ (a << 16);	\
>>> ++		c =3D c - a;  c =3D c - b;  c =3D c ^ (b >> 5);	\
>>> ++		a =3D a - b;  a =3D a - c;  a =3D a ^ (c >> 3);	\
>>> ++		b =3D b - c;  b =3D b - a;  b =3D b ^ (a << 10);	\
>>> ++		c =3D c - a;  c =3D c - b;  c =3D c ^ (b >> 15);	\
>>> ++	} while (0)
>>> ++
>>> ++unsigned hash_rjenkins(const char *str, unsigned length)
>>> + {
>>> +-	uint32_t hash =3D len;
>>> +-	uint8_t * data =3D string;
>>> +-=09
>>> +-	const unsigned int m =3D 0x5bd1e995;
>>> +-	const int r =3D 24;
>>> +-	int align =3D (long)string & 3;
>>> +-=09
>>> +-	if (!align || (len < 4)) {
>>> +-		/* In case data is aligned, MurmurHash2 function */
>>> +-		while(len >=3D 4)
>>> +-		{
>>> +-			/* Mix 4 bytes at a time into the hash */
>>> +-			uint32_t k =3D *(uint32_t *)data;	/* We don't care about the byt=
e order */
>>> +-
>>> +-			_HASH_MIX(hash, k, m);
>>> +-
>>> +-			data +=3D 4;
>>> +-			len -=3D 4;
>>> +-		}
>>> +-
>>> +-		/* Handle the last few bytes of the input */
>>> +-		switch(len) {
>>> +-			case 3: hash ^=3D data[2] << 16;
>>> +-			case 2: hash ^=3D data[1] << 8;
>>> +-			case 1: hash ^=3D data[0];
>>> +-	        		hash *=3D m;
>>> +-		}
>>> +-	=09
>>> +-	} else {
>>> +-		/* Unaligned data, use alignment-safe slower version */
>>> +-	=09
>>> +-		/* Pre-load the temp registers */
>>> +-		uint32_t t =3D 0, d =3D 0;
>>> +-		switch(align)
>>> +-		{
>>> +-			case 1: t |=3D data[2] << 16;
>>> +-			case 2: t |=3D data[1] << 8;
>>> +-			case 3: t |=3D data[0];
>>> +-		}
>>> +-		t <<=3D (8 * align);
>>> +-
>>> +-		data +=3D 4-align;
>>> +-		len -=3D 4-align;
>>> +-	=09
>>> +-		/* From this point, "data" can be read by chunks of 4 bytes */
>>> +-	=09
>>> +-		int sl =3D 8 * (4-align);
>>> +-		int sr =3D 8 * align;
>>> +-
>>> +-		/* Mix */
>>> +-		while(len >=3D 4)
>>> +-		{
>>> +-			uint32_t k;
>>> +-		=09
>>> +-			d =3D *(unsigned int *)data;
>>> +-			k =3D (t >> sr) | (d << sl);
>>> +-
>>> +-			_HASH_MIX(hash, k, m);
>>> +-
>>> +-			t =3D d;
>>> +-
>>> +-			data +=3D 4;
>>> +-			len -=3D 4;
>>> +-		}
>>> +-
>>> +-		/* Handle leftover data in temp registers */
>>> +-		d =3D 0;
>>> +-		if(len >=3D align)
>>> +-		{
>>> +-			uint32_t k;
>>> +-		=09
>>> +-			switch(align)
>>> +-			{
>>> +-			case 3: d |=3D data[2] << 16;
>>> +-			case 2: d |=3D data[1] << 8;
>>> +-			case 1: d |=3D data[0];
>>> +-			}
>>> +-
>>> +-			k =3D (t >> sr) | (d << sl);
>>> +-			_HASH_MIX(hash, k, m);
>>> +-
>>> +-			data +=3D align;
>>> +-			len -=3D align;
>>> +-
>>> +-			/* Handle tail bytes */
>>> +-
>>> +-			switch(len)
>>> +-			{
>>> +-			case 3: hash ^=3D data[2] << 16;
>>> +-			case 2: hash ^=3D data[1] << 8;
>>> +-			case 1: hash ^=3D data[0];
>>> +-					hash *=3D m;
>>> +-			};
>>> +-		}
>>> +-		else
>>> +-		{
>>> +-			switch(len)
>>> +-			{
>>> +-			case 3: d |=3D data[2] << 16;
>>> +-			case 2: d |=3D data[1] << 8;
>>> +-			case 1: d |=3D data[0];
>>> +-			case 0: hash ^=3D (t >> sr) | (d << sl);
>>> +-					hash *=3D m;
>>> +-			}
>>> +-		}
>>> +-
>>> ++	const unsigned char *k =3D (const unsigned char *)str;
>>> ++	uint32_t a, b, c;  /* the internal state */
>>> ++	uint32_t len;      /* how many key bytes still need mixing */
>>> ++
>>> ++	/* Set up the internal state */
>>> ++	len =3D length;
>>> ++	a =3D 0x9e3779b9;      /* the golden ratio; an arbitrary value */
>>> ++	b =3D a;
>>> ++	c =3D 0;               /* variable initialization of internal stat=
e */
>>> ++
>>> ++	/* handle most of the key */
>>> ++	while (len >=3D 12) {
>>> ++		a =3D a + (k[0] + ((uint32_t)k[1] << 8) + ((uint32_t)k[2] << 16) =
+
>>> ++			 ((uint32_t)k[3] << 24));
>>> ++		b =3D b + (k[4] + ((uint32_t)k[5] << 8) + ((uint32_t)k[6] << 16) =
+
>>> ++			 ((uint32_t)k[7] << 24));
>>> ++		c =3D c + (k[8] + ((uint32_t)k[9] << 8) + ((uint32_t)k[10] << 16)=
 +
>>> ++			 ((uint32_t)k[11] << 24));
>>> ++		mix(a, b, c);
>>> ++		k =3D k + 12;
>>> ++		len =3D len - 12;
>>> ++	}
>>> +=20
>>> ++	/* handle the last 11 bytes */
>>> ++	c =3D c + length;
>>> ++	switch (len) {            /* all the case statements fall through =
*/
>>> ++	case 11:
>>> ++		c =3D c + ((uint32_t)k[10] << 24);
>>> ++	case 10:
>>> ++		c =3D c + ((uint32_t)k[9] << 16);
>>> ++	case 9:
>>> ++		c =3D c + ((uint32_t)k[8] << 8);
>>> ++		/* the first byte of c is reserved for the length */
>>> ++	case 8:
>>> ++		b =3D b + ((uint32_t)k[7] << 24);
>>> ++	case 7:
>>> ++		b =3D b + ((uint32_t)k[6] << 16);
>>> ++	case 6:
>>> ++		b =3D b + ((uint32_t)k[5] << 8);
>>> ++	case 5:
>>> ++		b =3D b + k[4];
>>> ++	case 4:
>>> ++		a =3D a + ((uint32_t)k[3] << 24);
>>> ++	case 3:
>>> ++		a =3D a + ((uint32_t)k[2] << 16);
>>> ++	case 2:
>>> ++		a =3D a + ((uint32_t)k[1] << 8);
>>> ++	case 1:
>>> ++		a =3D a + k[0];
>>> ++		/* case 0: nothing left to add */
>>> + 	}
>>> ++	mix(a, b, c);
>>> +=20
>>> +-	/* Do a few final mixes of the hash to ensure the last few
>>> +-	   bytes are well-incorporated. */
>>> +-	hash ^=3D hash >> 13;
>>> +-	hash *=3D m;
>>> +-	hash ^=3D hash >> 15;
>>> ++	return c;
>>> ++}
>>> +=20
>>> +-	return hash;
>>> ++uint32_t fd_os_hash ( uint8_t * string, size_t len )
>>> ++{
>>> ++	return hash_rjenkins(string, len);=20
>>> + }=20
>>> +=20
>>> +--=20
>>> +1.7.10.4
>>> +
>>> diff --git a/meta-networking/recipes-protocols/freediameter/files/fre=
ediameter.init b/meta-networking/recipes-protocols/freediameter/files/fre=
ediameter.init
>>> new file mode 100755
>>> index 0000000..e63a42a
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/freediameter/files/freediamet=
er.init
>>> @@ -0,0 +1,72 @@
>>> +#!/bin/sh
>>> +#
>>> +### BEGIN INIT INFO
>>> +# Provides:          freediameter
>>> +# Default-Start:     2 3 4 5
>>> +# Default-Stop:      0 1 6
>>> +# Required-Start:    $remote_fs $syslog
>>> +# Required-Stop:     $remote_fs $syslog
>>> +# Short-Description: Start freeDiameter daemon at boot time
>>> +# Description:       Start the freeDiameter daemon at boot time.
>>> +#       freeDiameter is an extensible implementation of the Diameter=
 protocol,
>>> +#       designed for Authentication, Authorization and Accounting. D=
iameter is
>>> +#       an evolution of the RADIUS protocol.
>>> +### END INIT INFO#
>>> +DAEMON=3D/usr/bin/freeDiameterd
>>> +CONF=3D/etc/freeDiameter/freeDiameter.conf
>>> +NAME=3Dfreediameter
>>> +DESC=3D"freeDiameter daemon"
>>> +
>>> +. /etc/init.d/functions
>>> +start() {
>>> +	[ -x $DAEMON ] || exit 5
>>> +	echo -n $"Starting $DAEMON: "
>>> +	start-stop-daemon -S -b -x ${DAEMON} && success || failure
>>> +	retval=3D$?
>>> +	echo ""
>>> +	return $retval
>>> +}
>>> +
>>> +stop() {
>>> +	echo -n $"Stopping $prog: "
>>> +	start-stop-daemon -K -x $DAEMON
>>> +	retval=3D$?
>>> +	echo ""
>>> +	return $retval
>>> +}
>>> +
>>> +restart() {
>>> +	stop
>>> +	sleep 3
>>> +	start
>>> +}
>>> +
>>> +rh_status() {
>>> +	status $DAEMON
>>> +}
>>> +
>>> +rh_status_q() {
>>> +	rh_status > /dev/null 2>&1
>>> +}
>>> +
>>> +case "$1" in
>>> +  start)
>>> +	rh_status_q && exit 0
>>> +	start
>>> +	;;
>>> +  stop)
>>> +	rh_status_q || exit 0
>>> +	stop
>>> +	;;
>>> +  restart)
>>> +	restart
>>> +	;;
>>> +  status)
>>> +	rh_status
>>> +	;;
>>> +  *)
>>> +	echo $"Usage: $prog {start|stop|status|restart}"
>>> +	exit 2
>>> +esac
>>> +
>>> +exit $?
>>> diff --git a/meta-networking/recipes-protocols/freediameter/files/fre=
ediameter.service b/meta-networking/recipes-protocols/freediameter/files/=
freediameter.service
>>> new file mode 100644
>>> index 0000000..514481b
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/freediameter/files/freediamet=
er.service
>>> @@ -0,0 +1,11 @@
>>> +[Unit]
>>> +Description=3Dfreediameter daemon
>>> +After=3Dnetwork.target
>>> +
>>> +[Service]
>>> +Type=3Dsimple
>>> +PIDFile=3D/var/run/freediameter.pid
>>> +ExecStart=3D@BINDIR@/freeDiameterd
>>> +
>>> +[Install]
>>> +WantedBy=3Dmulti-user.target
>>> diff --git a/meta-networking/recipes-protocols/freediameter/files/ins=
tall_test.patch b/meta-networking/recipes-protocols/freediameter/files/in=
stall_test.patch
>>> new file mode 100644
>>> index 0000000..151037d
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/freediameter/files/install_te=
st.patch
>>> @@ -0,0 +1,22 @@
>>> +CMakeLists: add an option to install tests
>>> +
>>> +Upstream-Status: Inappropriate [OE ptest specific]
>>> +
>>> +Original author: Yao Zhao <yao.zhao@windriver.com>
>>> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>> +
>>> +diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
>>> +index da8da1b..de04059 100644
>>> +--- a/tests/CMakeLists.txt
>>> ++++ b/tests/CMakeLists.txt
>>> +@@ -113,4 +113,9 @@ ENDFOREACH( TEST )
>>> + ####
>>> + ## INSTALL section ##
>>> +=20
>>> +-# we do not install the tests
>>> ++# install the tests
>>> ++SET(INSTALL_TEST_SUFFIX       /opt/${FD_PROJECT_NAME}-tests   CACHE=
 PATH "Directory where the test binary is installed.")
>>> ++
>>> ++INSTALL(TARGETS ${TEST_LIST}
>>> ++        RUNTIME DESTINATION ${INSTALL_TEST_SUFFIX}
>>> ++        COMPONENT freeDiameter-common)
>>> diff --git a/meta-networking/recipes-protocols/freediameter/files/pas=
s-ptest-env.patch b/meta-networking/recipes-protocols/freediameter/files/=
pass-ptest-env.patch
>>> new file mode 100644
>>> index 0000000..ea857af
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/freediameter/files/pass-ptest=
-env.patch
>>> @@ -0,0 +1,72 @@
>>> +freediameter ptest cases testmesg_stress.c and testloadext.c need lo=
ad
>>> +extensions both build time and runtime. Then they search extensions =
with
>>> +build directory that causes runtime failures.
>>> +
>>> +Pass an environment variable to define runtime extension path.
>>> +
>>> +Upstream-Status: Inappropriate [OE ptest specific]
>>> +
>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>> +
>>> +diff -Nur freeDiameter-1.2.0.orig/tests/testloadext.c freeDiameter-1=
=2E2.0/tests/testloadext.c
>>> +--- freeDiameter-1.2.0.orig/tests/testloadext.c	2014-02-19 17:33:24.=
785405032 +0800
>>> ++++ freeDiameter-1.2.0/tests/testloadext.c	2014-02-19 20:08:03.87140=
3924 +0800
>>> +@@ -49,7 +49,7 @@
>>> + {
>>> + 	DIR *dir;
>>> + 	struct dirent *dp;
>>> +-	char fullname[512];
>>> ++	char fullname[1024];
>>> + 	int pathlen;
>>> +=20
>>> + 	/* First, initialize the daemon modules */
>>> +@@ -57,11 +57,16 @@
>>> + 	CHECK( 0, fd_queues_init()  );
>>> + 	CHECK( 0, fd_msg_init()  );
>>> + 	CHECK( 0, fd_rtdisp_init()  );
>>> +-=09
>>> ++
>>> ++	char *ext_dir =3D getenv("EXTENSIONS_DIR");
>>> ++	if (ext_dir)
>>> ++		pathlen =3D snprintf(fullname, sizeof(fullname), "%s", ext_dir);
>>> ++	else
>>> ++		pathlen =3D snprintf(fullname, sizeof(fullname), BUILD_DIR "/exte=
nsions/");
>>> ++
>>> + 	/* Find all extensions which have been compiled along the test */
>>> +-	TRACE_DEBUG(INFO, "Loading from: '%s'", BUILD_DIR "/extensions");
>>> +-	CHECK( 0, (dir =3D opendir (BUILD_DIR "/extensions")) =3D=3D NULL =
? 1 : 0 );
>>> +-	pathlen =3D snprintf(fullname, sizeof(fullname), BUILD_DIR "/exten=
sions/");
>>> ++	TRACE_DEBUG(INFO, "Loading from: '%s'", fullname);
>>> ++	CHECK( 0, (dir =3D opendir (fullname)) =3D=3D NULL ? 1 : 0 );
>>> + =09
>>> + 	while ((dp =3D readdir (dir)) !=3D NULL) {
>>> + 		char * dot =3D strrchr(dp->d_name, '.');
>>> +diff -Nur freeDiameter-1.2.0.orig/tests/testmesg_stress.c freeDiamet=
er-1.2.0/tests/testmesg_stress.c
>>> +--- freeDiameter-1.2.0.orig/tests/testmesg_stress.c	2014-02-19 17:33=
:24.785405032 +0800
>>> ++++ freeDiameter-1.2.0/tests/testmesg_stress.c	2014-02-19 20:08:03.9=
28403924 +0800
>>> +@@ -67,15 +67,20 @@
>>> + {
>>> + 	DIR *dir;
>>> + 	struct dirent *dp;
>>> +-	char fullname[512];
>>> ++	char fullname[1024];
>>> + 	int pathlen;
>>> + 	struct fd_list all_extensions =3D FD_LIST_INITIALIZER(all_extensio=
ns);
>>> + 	struct fd_list ext_with_depends =3D FD_LIST_INITIALIZER(ext_with_d=
epends);
>>> +=20
>>> ++	char *ext_dir =3D getenv("EXTENSIONS_DIR");
>>> ++	if (ext_dir)
>>> ++		pathlen =3D snprintf(fullname, sizeof(fullname), "%s", ext_dir);
>>> ++	else
>>> ++		pathlen =3D snprintf(fullname, sizeof(fullname), BUILD_DIR "/exte=
nsions/");
>>> ++
>>> + 	/* Find all extensions which have been compiled along the test */
>>> +-	LOG_D("Loading %s*.fdx from: '%s'", BUILD_DIR "/extensions", prefi=
x ?: "");
>>> +-	CHECK( 0, (dir =3D opendir (BUILD_DIR "/extensions")) =3D=3D NULL =
? 1 : 0 );
>>> +-	pathlen =3D snprintf(fullname, sizeof(fullname), BUILD_DIR "/exten=
sions/");
>>> ++	TRACE_DEBUG(INFO, "Loading from: '%s'", fullname);
>>> ++	CHECK( 0, (dir =3D opendir (fullname)) =3D=3D NULL ? 1 : 0 );
>>> + =09
>>> + 	while ((dp =3D readdir (dir)) !=3D NULL) {
>>> + 		char * dot =3D strrchr(dp->d_name, '.');
>>> diff --git a/meta-networking/recipes-protocols/freediameter/files/run=
-ptest b/meta-networking/recipes-protocols/freediameter/files/run-ptest
>>> new file mode 100644
>>> index 0000000..d0ca8d9
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/freediameter/files/run-ptest
>>> @@ -0,0 +1,11 @@
>>> +#!/bin/sh
>>> +
>>> +if ! lsmod | grep -q sctp && ! modprobe sctp 2>/dev/null; then
>>> +        echo "Couldn't load kernel module sctp."
>>> +        echo "Test cases testsctp and testcnx will fail."
>>> +        echo
>>> +fi
>>> +
>>> +export EXTENSIONS_DIR=3D$EXTENSIONS_DIR
>>> +cmake  -E cmake_echo_color --cyan "Running tests..."
>>> +ctest --force-new-ctest-process
>>> diff --git a/meta-networking/recipes-protocols/freediameter/freediame=
ter.inc b/meta-networking/recipes-protocols/freediameter/freediameter.inc=

>>> new file mode 100644
>>> index 0000000..6880d26
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/freediameter/freediameter.inc=

>>> @@ -0,0 +1,98 @@
>>> +SUMMARY =3D "An open source implementation of the diameter protocol"=

>>> +DESCRIPTION =3D "\
>>> +freeDiameter is an open source Diameter protocol implementation. It =
\
>>> +provides an extensible platform for deploying a Diameter network for=
 \
>>> +your Authentication, Authorization and Accounting needs."
>>> +
>>> +HOMEPAGE =3D "http://www.freediameter.net"
>>> +
>>> +DEPENDS =3D "flex bison cmake-native libgcrypt gnutls libidn lksctp-=
tools"
>>> +
>>> +pkgname =3D "freeDiameter"
>>> +
>>> +SRC_URI =3D "http://www.freediameter.net/hg/${pkgname}/archive/${PV}=
=2Etar.gz;downloadfilename=3D${pkgname}-${PV}.tar.gz \
>>> +           file://Replace-murmurhash-algorithm-with-Robert-Jenkin-s-=
ha.patch \
>>> +           file://freediameter.service \
>>> +           file://freediameter.init \
>>> +           \
>>> +           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
>>> +           'file://install_test.patch \
>>> +            file://run-ptest \
>>> +            file://pass-ptest-env.patch', '', d)} \
>>> +           "
>>> +
>>> +S =3D "${WORKDIR}/${pkgname}-${PV}"
>>> +
>>> +PTEST_PATH =3D "${libdir}/${pkgname}/ptest"
>>> +
>>> +inherit cmake update-rc.d ptest systemd
>>> +
>>> +EXTRA_OECMAKE =3D " \
>>> +    -DDEFAULT_CONF_PATH:PATH=3D${sysconfdir}/${pkgname} \
>>> +    -DBUILD_DBG_MONITOR:BOOL=3DON  \
>>> +    -DBUILD_TEST_APP:BOOL=3DON \
>>> +    -DBUILD_TESTING:BOOL=3DON \
>>> +    -DBUILD_APP_RADGW:BOOL=3DON \
>>> +    -DBUILD_APP_REDIRECT:BOOL=3DON \
>>> +    -DBUILD_TEST_ACCT:BOOL=3DON \
>>> +    -DBUILD_TEST_NETEMUL:BOOL=3DON \
>>> +    -DBUILD_TEST_RT_ANY:BOOL=3DON \
>>> +    -DINSTALL_LIBRARY_SUFFIX:PATH=3D${baselib} \
>>> +    -DINSTALL_EXTENSIONS_SUFFIX:PATH=3D${baselib}/${pkgname} \
>>> +    -DINSTALL_TEST_SUFFIX:PATH=3D${PTEST_PATH}-tests \
>>> +    -DCMAKE_SKIP_RPATH:BOOL=3DON \
>>> +"
>>> +# INSTALL_LIBRARY_SUFFIX is relative to CMAKE_INSTALL_PREFIX
>>> +# specify it on cmd line will fix the SET bug in CMakeList.txt
>>> +
>>> +# -DBUILD_APP_ACCT:BOOL=3DON This needs POSTGRESQL support
>>> +
>>> +# -DBUILD_APP_DIAMEAP:BOOL=3DON  -DBUILD_APP_SIP:BOOL=3DON -DBUILD_T=
EST_SIP:BOOL=3DON
>>> +# These need MySQL support
>>> +
>>> +# -DBUILD_DBG_INTERACTIVE:BOOL=3DON This needs SWIG support
>>> +
>>> +# -DALL_EXTENSIONS=3DON will enable all
>>> +
>>> +do_install_append() {
>>> +    # install the sample configuration file
>>> +    install -d -m 0755 ${D}${sysconfdir}/${pkgname}
>>> +    for i in ${S}/doc/*.conf.sample; do
>>> +        install -m 0644 $i ${D}${sysconfdir}/${pkgname}/
>>> +    done
>>> +    mv ${D}${sysconfdir}/${pkgname}/freediameter.conf.sample \
>>> +      ${D}${sysconfdir}/${pkgname}/freeDiameter.conf.sample
>>> +
>>> +    # install daemon init related files
>>> +    install -d -m 0755 ${D}${sysconfdir}/default
>>> +    install -d -m 0755 ${D}${sysconfdir}/init.d
>>> +    install -m 0644 ${S}/contrib/debian/freediameter-daemon.default =
\
>>> +      ${D}${sysconfdir}/default/${BPN}
>>> +    install -m 0755 ${WORKDIR}/freediameter.init ${D}${sysconfdir}/i=
nit.d/${BPN}
>>> +
>>> +    # install for systemd
>>> +    install -d ${D}${systemd_system_unitdir}
>>> +    install -m 0644 ${WORKDIR}/freediameter.service ${D}${systemd_sy=
stem_unitdir}
>>> +    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}=
/*.service
>>> +}
>>> +
>>> +do_install_ptest() {
>>> +    sed -i "s#\(EXTENSIONS_DIR=3D\).*\$#\1${libdir}/${pkgname}/#" ${=
D}${PTEST_PATH}/run-ptest
>>> +    mv ${D}${PTEST_PATH}-tests/* ${D}${PTEST_PATH}/
>>> +    rmdir ${D}${PTEST_PATH}-tests
>>> +    install -m 0644 ${B}/tests/CTestTestfile.cmake ${D}${PTEST_PATH}=
/
>>> +}
>>> +
>>> +FILES_${PN}-dbg +=3D "${libdir}/${pkgname}/.debug/*"
>>> +
>>> +# include the extensions in main package
>>> +FILES_${PN} +=3D "${libdir}/${pkgname}/*"
>>> +
>>> +RDEPENDS_${PN} =3D "glib-2.0 gnutls libidn"
>>> +RDEPENDS_${PN}-ptest =3D "cmake"
>>> +
>>> +INITSCRIPT_NAME =3D "${BPN}"
>>> +INITSCRIPT_PARAMS =3D "start 30 . stop 70 0 1 2 3 4 5 6 ."
>>> +
>>> +SYSTEMD_SERVICE_${PN} =3D "freediameter.service"
>>> +SYSTEMD_AUTO_ENABLE =3D "disable"
>>> diff --git a/meta-networking/recipes-protocols/freediameter/freediame=
ter_1.2.1.bb b/meta-networking/recipes-protocols/freediameter/freediamete=
r_1.2.1.bb
>>> new file mode 100644
>>> index 0000000..3fb929a
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.2=
=2E1.bb
>>> @@ -0,0 +1,7 @@
>>> +include freediameter.inc
>>> +
>>> +LICENSE =3D "BSD"
>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D892b2ed6ae815488a08416ff7=
ee74a35"
>>> +
>>> +SRC_URI[md5sum] =3D "61b1062aa144b5f12eed514611e6d697"
>>> +SRC_URI[sha256sum] =3D "bd7f105542e9903e776aa006c6931c1f5d3d477cb59a=
f33a9162422efa477097"




Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id E291C71951
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 11:05:27 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id a140so94632707wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 04:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=X744QEmWSdJSbh3RUIM4c9WHv/vrK/YTg6/REQBl9ao=;
	b=GvBkHzz42FvzTWqV+yIjfV4AVdQaO6fVPifbl3mvSDOv2R5WI4SS9OombmG00P1rQ3
	ntTu/NOaiqwj3QZU8Mu4MEHX1bjRb6XO+n4UQLjdS5amxOYr1Zmp6toy5qgRdZJWAeQS
	fFomhne3BuO6g6SVdHVsglZZTyat+o3HjBtHzbS7dw2EAGjVbkkmoiczNi7sIntQy6BV
	GonmQBA8yPxcKM3N8RJvKrZhMKCAhPA3hP59eqQw0C+Ukhj98wPOJfRBR+Oqje8vOrc2
	9zyNHAnWjytzLBDPMA1t2kMSQwqe4IPYIGTVKxZZHXh+qoFaT6bGS6zeItV78tDHr/0E
	0GxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=X744QEmWSdJSbh3RUIM4c9WHv/vrK/YTg6/REQBl9ao=;
	b=EH+7UYo5KLt7cTrtz/6ZWNjT1FRrxp++QINQLi+TMIO/WnyNldHwCMs30iE+8+7zdT
	flqWK/Jbiu4jFSJi+5UHJen8u4tnrlkxjhbSI0Yus3zLDbysPOOO97tAsfEEMj8q26OC
	KHS8QXok3czrc+YqTg9SPmhgfPxstAzVSZhitsLCabMcJ71SxuPFFWxmuTc135NzH76R
	l015oL4KHyS0MAFMHm84w4sI7AnT86waM8bSnm4nR896Ke7FufLxO6/IQwYPDpwmfge8
	Wyor3yooL1kQENJp5ISRm2q38AhQQfyjXZhFMabVFHOfwu02m0oqmYWl6PqgyrKbf4Is
	8FJg==
X-Gm-Message-State: AOPr4FViwNmU0wX4BKIzAJqHG6RQlr+gbnZPVatDppVfk0UrCfg1RdlK92xxxGaLlPJ0pg==
X-Received: by 10.28.228.68 with SMTP id b65mr9653176wmh.47.1460545528264;
	Wed, 13 Apr 2016 04:05:28 -0700 (PDT)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	b135sm27667340wmb.10.2016.04.13.04.05.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2016 04:05:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAFkk2KTGfZ9RDNTdTQmfAB+G3KnNGBqDivM2NVgrG4idV-KgHA@mail.gmail.com>
Date: Wed, 13 Apr 2016 13:05:25 +0200
Message-Id: <22F07C44-43D4-469A-A201-7596A5F45ABB@gmail.com>
References: <CAFkk2KTGfZ9RDNTdTQmfAB+G3KnNGBqDivM2NVgrG4idV-KgHA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: Build failures due to libtdb racing with libbsd
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
X-List-Received-Date: Wed, 13 Apr 2016 11:05:29 -0000
X-Groupsio-MsgNum: 60981
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7EC6CECE-A7AD-4178-9011-018503B12AB2";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_7EC6CECE-A7AD-4178-9011-018503B12AB2
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> Am 13.04.2016 um 11:41 schrieb Ulf Magnusson <ulfalizer@gmail.com>:
> 
> Hello,
> 
> I get libtdb build failures like the following. The failing file
> varies between runs.
> 
> ERROR: oe_runmake failed
> ERROR: Function failed: do_compile
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 16 -e MAKEFLAGS=
> | WAF_MAKE=1 PATH=buildtools/bin:../../buildtools/bin:$PATH waf build
> | Checking project rules ...
> | Project rules pass
> | [  1/100] Generating tdb.vscript
> | [  2/100] Compiling lib/replace/replace.c
> | [  3/100] Compiling lib/replace/cwrap.c
> | [  4/100] Generating PKGCONFIG_tdb.pc
> | [  5/100] Compiling lib/replace/replace.c
> | [  6/100] Compiling lib/replace/test/testsuite.c
> | [  7/100] Compiling lib/replace/test/strptime.c
> | [  8/100] Compiling lib/replace/test/os2_delete.c
> | [  9/100] Compiling lib/replace/test/getifaddrs.c
> | [ 10/100] Compiling common/check.c
> | [ 11/100] Compiling common/error.c
> | [ 12/100] Compiling common/tdb.c
> | [ 13/100] Compiling common/traverse.c
> | [ 14/100] Compiling common/freelistcheck.c
> | [ 15/100] Compiling common/lock.c
> | [ 16/100] Compiling common/dump.c
> | [ 17/100] Compiling common/freelist.c
> | [ 18/100] Compiling common/io.c
> | [ 19/100] Compiling common/open.c
> | [ 20/100] Compiling common/transaction.c
> | [ 21/100] Compiling common/hash.c
> | [ 22/100] Compiling common/summary.c
> | [ 23/100] Compiling common/rescue.c
> | [ 24/100] Compiling common/mutex.c
> | [ 25/100] Compiling tools/tdbtorture.c
> | In file included from ../tools/tdbtorture.c:5:0:
> | ../lib/replace/replace.h:151:24: fatal error: bsd/string.h: No such
> file or directory
> |  #include <bsd/string.h>
> |                         ^
> | compilation terminated.
> | Build failed:  -> task failed (err #1):
> |     {task: cc tdbtorture.c -> tdbtorture_5.o}
> | make: *** [all] Error 1
> | WARNING: exit code 1 from a shell command.
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile
> NOTE: recipe libtdb-1.3.0-r0: task do_compile: Failed
> 
> The problem seems to be a race with building libbsd (and unlucky
> timing in my build). Adding libbsd to DEPENDS fixes the problem.
> 
> For some added context, libtdb uses a nonstandard ./configure from the
> Samba project based on a configuration utility called Waf that I'm a
> complete noob on. Perhaps there is some way to disable libbsd support
> instead.

It is not reasonable to disable libbsd support. When disabled, samba4 will
statically link own copies of the missing functions - better rely on
maintained stuff ...

I completely lost any track which samba patch has been applied and which
is missing. IIRC, I send some patches after analyzing requirement of
each of those dependencies and kept hard dependency of libbsd.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_7EC6CECE-A7AD-4178-9011-018503B12AB2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJXDif2AAoJEESZlq7c5QqdrIwP/0DbsMlJLtbBRCdSrtjSF3ZN
Gx5c6usrFtPR8gB+XH26iBkZrY3CMr+tRAUGufc//B3ArnwFytSTA8QMSnMWZxda
amTd1w4mTjN4EnrMoDaclYWwY5eZe43yfTtpwmI97qYkQ2mKSlNFCFCGyWpL+r/A
TXugPIDL3nUbNxUqUDEs+Jooao2NqU90aXObkpOI9B9Hew7HBMvkdyCD/I5EXzwW
5dJP0FQTfuDdBVuL2fM8jxwR05jD04d93zlCzNMAMDFPlrSwUTtR32URm36npF7T
tr0d52Bih/TBsXNsfypF0DFegVRoU3MILpHWt+GHwGMnob7Xmk5W9fYMOCXj8ZIE
kM78M+C42lgnxfmf5h+Uxpia9Q+e6MJEpvIuSsuY66dIe05kCxf3zL1WcVhkm4CJ
GJHLIn53jIjbMOsyF+CmDf2CFxlmxD6GgfvGC9SgtmUfXMFrlYIpt7nIksyvjezC
ZK93wXwxUpd1c0LIpU8nV8wLRUAYPTEY4LMvtHdZmNaiUeGmXU9Ks+wmfLiHHoWa
VJz7MEC7+oQBDbRtSqF28Wg1OrE8+2jxeyf4SFpdurl7KdmLYROWzvC2wvoBYLdM
EWVi+cWjFojnxt59BlKOSakaLUtTS1j9dQ5nf4YEL8n2lSttMtzsFleUCvpHyx51
hlnM1LJXDAgrvf3NhLsC
=tyz5
-----END PGP SIGNATURE-----

--Apple-Mail=_7EC6CECE-A7AD-4178-9011-018503B12AB2--

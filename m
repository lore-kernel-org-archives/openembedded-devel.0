Return-Path: <behanw@converseincode.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id C07FB78211
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 16:49:49 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id u5so5241001pgn.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=converseincode.com; s=google;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=17WNxFBM7RMfb9yDuPbQH4OnHNsDUW4nsKfXWnmj3H8=;
	b=BIKvCayKZm0a0yKyCebv1kCxLhQuuaIg5+m7Xjs7xISwjr7x2IYBJOLxy/v+mGe4IG
	GZzJPopH+1AsJgH5j9hc9N2eddO5i4wlSTdadOG31coW1UU7+jELJ3Jm7hVSzr3KJiwX
	QaJuykZ+wthO+lXyvfOvzSyB2PLnNvYZVgCVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=17WNxFBM7RMfb9yDuPbQH4OnHNsDUW4nsKfXWnmj3H8=;
	b=pGqON6PGYfQ2VZ22OaXvTLqE3PJtIi0BjEJynp+Lugb1xR7ztXgsFM6xg9Vvl/4/tF
	FVGQYSfUE0SMU+WTKFOpWBORrKTyQYUNATMtqhIAJUVae6OyCWRr/XJ2jeAqSNZr6Ej1
	gLjQC110UYOMsu7O67lAxosMC2QCCweascikF+EHGSHY6mPrC82e2PJwv/ZojDpI8HZQ
	Kwbm+tGGV/Sa0aQ0lvX1vS5oYUCLSXSnfDD/WUPmyMyDKWNI/RRcIpyUEyDZvSHqMj4h
	SOFIXvRunNIvX9BaYBPZP8X7dpJIzgZLIg8SVNXUY3l3CC5vTS7nS87MsJBFBLml6t+L
	4Myg==
X-Gm-Message-State: AHYfb5h8iMYEvlAkvZDfmbTpnDIc6HJA5jTheb8Jqeqspt1Z9zTcHxcw
	JqaYQdyxouTP5IEf
X-Received: by 10.101.85.1 with SMTP id f1mr12405992pgr.225.1502383789122;
	Thu, 10 Aug 2017 09:49:49 -0700 (PDT)
Received: from [192.168.120.225] (d207-6-122-147.bchsia.telus.net.
	[207.6.122.147]) by smtp.gmail.com with ESMTPSA id
	c19sm13839330pfk.3.2017.08.10.09.49.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 09:49:46 -0700 (PDT)
From: Behan Webster <behanw@converseincode.com>
Message-Id: <B7CAC62B-B2BD-4DB5-BE14-83EB8AA6EEF8@converseincode.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Thu, 10 Aug 2017 09:49:44 -0700
In-Reply-To: <CANx9H-D3NL4ikmCGQ5NS5b+70-3drcYr=5Pp1dhpVOdcm=Sm+g@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
References: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
	<1502288526.1934.39.camel@linux.intel.com>
	<879E7479-CCE4-47D5-BB40-E789BA93185C@converseincode.com>
	<CANx9H-AJpd0OpMG13ps89kQ7bpzH3b3GdN5xzfhVPTW3EcdjmA@mail.gmail.com>
	<CANx9H-D3NL4ikmCGQ5NS5b+70-3drcYr=5Pp1dhpVOdcm=Sm+g@mail.gmail.com>
X-Mailer: Apple Mail (2.3273)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: Alpha release of check-requirement.sh
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
X-List-Received-Date: Thu, 10 Aug 2017 16:49:50 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Aug 10, 2017, at 1:42 AM, Tim Orling <ticotimo@gmail.com> wrote:
>=20
> Also, I recommend a method of linking the checker script with the =
documentation.

That=E2=80=99s actually where this all started. I generate documentation =
from the JSON from my script for he LF training documentation. I=E2=80=99v=
e been reading the documentation to update my package lists, but found a =
lot of errors in the docs (missing packages, typos, duplicate packages, =
inconsistencies) all which I reported.

Since those errors are trivial for me to find because of my test system =
(more below) I=E2=80=99m suggesting the package lists in the =
documentation be generated from my tool (mirroring what I do for =
ready-for.sh)

Not that I=E2=80=99m suggesting the same for YP, but for LF, I maintain =
all requirements (machine and packages) in ready-for.sh, which generates =
JSON which is used by lualatex to generate per class setup documentation =
(55 auto generated PDFs).

I literally update one file, type make and it generates script, website, =
and PDFs.

I=E2=80=99m suggesting something similar can be done for the YP =
documentation, but only for the package lists.

> And run unit tests to prove nothing has changed on distro X, Y or Z.

There is already a test system for packages per distro. It uses a second =
script called pkgsearch which uses meta data from pkgs.org =
<http://pkgs.org/> (pkgsearch is also in my git repo). You can see part =
of the test machinery in the =E2=80=94check-packages option in the =
check-requirements.sh script. (I couldn=E2=80=99t maintain the lists of =
packages for all the LF courses without an automated test system).

This is what a successful test run looks like.

$ ./check-requirements.sh --check-packages --all
YP =
.*************************.****.*********.**...*...........****...........=
.
YPDOC .*******.*.*...........................
YPGUI .**..*.**.*.......**......*............
YPST .*..*..*..*...........*............

dots represent a passed package list for a distro. The star represents a =
download of a cross-bistro package list from pkgs.org <http://pkgs.org/> =
(lists are cached so they=E2=80=99re only downloaded once per day).

Here=E2=80=99s what a failed test looks like when asking for the =
"pony=E2=80=9D package:

behanw@turin-vm:/mnt/src/lf/github/ready-for/check-requirements$ =
./check-requirements.sh --check-packages --all --nocache
YP .*
NOTE: Checking CentOS-6 for YP...
MISSING: pony (CentOS-6)
.
NOTE: Checking CentOS-7 for YP...
MISSING: pony (CentOS-7)
.
NOTE: Checking Debian-7 for YP...
MISSING: pony (Debian-7)
.
NOTE: Checking Debian-8 for YP...
MISSING: pony (Debian-8)
.
<snip>

> And I want a pony, with wings and a single horn.

Tim: Is pink okay?

=
https://thumbs.dreamstime.com/z/pony-unicorn-golden-wings-big-eyes-cloud-r=
ainbow-multicolor-vector-illustration-86109664.jpg =
<https://thumbs.dreamstime.com/z/pony-unicorn-golden-wings-big-eyes-cloud-=
rainbow-multicolor-vector-illustration-86109664.jpg>

Behan ;)=


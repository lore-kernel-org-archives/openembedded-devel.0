Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id D425C6FF84
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Aug 2018 10:41:46 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k15-v6so3011859edr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2018 03:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8RxQTIsH73xFO3g11YNJDsyn5y5ReH/lf4pXnALIvWA=;
	b=SvpcHbjTWSSCjZdmOyMpocF3kzXk9YyhvYUREiwjcWaRCrUliW9HOdHxFJVVb3Eh1b
	EA5xnGSrAk4c96ZtAECSLvkIiWECPfwWseJukR7rHrR0p0RADslxbyz0dYYYecjtDMXi
	8YY7yq/AGlMCDVqDowyOJWExaGUTsSLCEOG4R5VvWnh2nuFfbRSk8oq1Eecc7cBqLZHV
	jW7xvF38dzz0BX4xV/qcJ5zXuFbeBsPjDpQxjvLgQywpj9HyGW5u9AIyk8FCPrGKgShi
	rxnh0PIAZsWh+Wzc6r1WIpiLeZ4kpVjZ7TkLcM+Y02jRfgcmFwgqwMbvlGNS5aww6Kud
	ee5g==
X-Gm-Message-State: AOUpUlEjgrR4QUltFCfqXlqnExWP54wgMan8vJWwG2T+8mQgNT5Mm5oh
	IFb0BDaz1csuR4uY8EXGSYE=
X-Google-Smtp-Source: AAOMgpdoUX5RPiEoReUPmXbV92/Dm5WRdaQlfrlqLYaPFTr93dloWaH8Iqp+QZdkuUd0qY5VQyZA5g==
X-Received: by 2002:a50:865b:: with SMTP id
	27-v6mr10239083edt.42.1533379307444; 
	Sat, 04 Aug 2018 03:41:47 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	v26-v6sm1336790eds.43.2018.08.04.03.41.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 04 Aug 2018 03:41:46 -0700 (PDT)
Message-ID: <e3cd5b4ebde785d03e79564e0243006287f12a47.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Leitner <richard.leitner@skidata.com>, 
	openembedded-devel@lists.openembedded.org
Date: Sat, 04 Aug 2018 11:41:45 +0100
In-Reply-To: <2e3d0628-932b-0466-2832-82741e7cd699@skidata.com>
References: <20180727131616.13881-1-git@andred.net>
	<390065ca-13d0-7dcd-8528-575b25187e2e@skidata.com>
	<872b2392cfb7793f514cf8b806262e8d37bb9fd4.camel@andred.net>
	<2e3d0628-932b-0466-2832-82741e7cd699@skidata.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][master-next][PATCH 1/2] openjdk-8: update to 8u172b11
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
X-List-Received-Date: Sat, 04 Aug 2018 10:41:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-07-31 at 13:33 +0200, Richard Leitner wrote:
> On 07/31/2018 01:19 PM, André Draszik wrote:
> > On Tue, 2018-07-31 at 11:00 +0200, Richard Leitner wrote:
> > > Hi André,
> > > thank you for your patches.
> > > 
> > > Unfortunately I have checksum issues for aarch64's jdk, corba, jaxp,
> > > jaxws, langtools & nashorn:
> > 
> > Hm, is that another instance of
> > http://lists.openembedded.org/pipermail/openembedded-devel/2018-May/1183
> > 58.html
> > ?
> > 
> > I'll check...
> 
> Thanks!

I'll get back to that next week, see below.

[...]

> > > For qemuarm java runs (correctly) in interpreted mode.
> The errors occur only on qemuarm64. 
> I've attached the testimage logs. Hope that helps.
> 
> If you need anything else from me please just drop me a line!

I am generally using real hardware for aarch64, but I've executed the
aarch64 qemu openjdk-8-test-image, and it also works for me (again, with the
versions I had posted originally).

RESULTS:
RESULTS - ping.PingTest.test_ping - Testcase 964: PASSED
RESULTS - ssh.SSHTest.test_ssh - Testcase 224: PASSED
RESULTS - java.JavaTest.test_java_exists - Testcase -1: PASSED
RESULTS - java.JavaTest.test_java_jar_comp_mode - Testcase -1: PASSED
RESULTS - java.JavaTest.test_java_jar_int_mode - Testcase -1: PASSED
RESULTS - java.JavaTest.test_java_jar_works - Testcase -1: PASSED
RESULTS - java.JavaTest.test_java_version - Testcase -1: PASSED
RESULTS - javac.JavacTest.test_javac_exists - Testcase -1: PASSED
RESULTS - javac.JavacTest.test_javac_works - Testcase -1: PASSED
SUMMARY:
openjdk-8-test-image () - Ran 9 tests in 56.859s
openjdk-8-test-image - OK - All required tests passed


And:

root@qemuarm64:~# java -version
openjdk version "1.8.0_172-internal"
OpenJDK Runtime Environment (build 1.8.0_172-internal-b11)
OpenJDK 64-Bit Server VM (build 25.172-b11, mixed mode)


That said, I also notice your -version output has 'linux-aarch64 compressed
oops' here:
| # Java VM: OpenJDK 64-Bit Server VM (25.172-b11 mixed mode linux-aarch64 compressed oops)

I wonder why I don't have 'linux-aarch64', and what is 'compressed oops'?
Thumb?



I'll try a few things:
* my poky is not current master, but maybe two months old
* re-download and compare the openjdk archives.



Cheers,
Andre'



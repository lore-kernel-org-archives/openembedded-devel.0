Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9D87CDC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 12:38:01 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id cy15so25168086edb.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 04:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gkC3DDycBt/VoLqOVLSSEJwkY98+oY2NMeV1C4Pf1NY=;
	b=l6A0OtNC+R086CQVDTCnGyMsUsaks6T2jp89x1aOkfQ+1jxY/yhtp9N6hi12I5qrY3
	5ERjTrntCkmqNQtGLsMW+4obbvuTyH3ijx1oAKWNpHjlTJfsq1zZsGL1pyXO5zARY108
	QlPJZN+cNMSCPMfGuM1nqQ/s25qlttVNlAg7YZoUYeKCIlWrunJbCp4OS5uoDk2W0P87
	8/jTAYw66D+z9ZCbT3PjZcd6rnJgvAROThIfQqf4W09ySkCTMy/2XawfCFh8eD87XJCA
	NbX0lW5kPUiGlLAgOkkC9/TTTrAAEJr65AFyv3s8Eb6XZ3PJF5KpOR5neSW+E/oNfIN+
	bQCw==
X-Gm-Message-State: APjAAAXNMQGpeyKCx2pxH7eoscIjhiN23N5dI+m+GyVqXf/d3N37h+f1
	tRI+6X4UbYN91/EEquPEFP19/s1P
X-Google-Smtp-Source: APXvYqwdLNkkQW2fmTHyAa7MD6AVX+Aghs+jF6afCcemxGc5ZVizcpvDHFKLBwA/8r/Ube4xTTb/TA==
X-Received: by 2002:a17:906:4d10:: with SMTP id
	r16mr52779671eju.142.1577450281613; 
	Fri, 27 Dec 2019 04:38:01 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id d8sm3962420edn.52.2019.12.27.04.38.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 04:38:00 -0800 (PST)
Message-ID: <bacc68f921bb700832b0f0537d6ff546beabe89b.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 12:38:00 +0000
In-Reply-To: <20191227082053.26882-1-mohamad.noor.alim.hussin@intel.com>
References: <20191227082053.26882-1-mohamad.noor.alim.hussin@intel.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH v2] openjdk-12: Add new recipe
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
X-List-Received-Date: Fri, 27 Dec 2019 12:38:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2019-12-27 at 16:20 +0800, mohamad.noor.alim.hussin@intel.com wrote:
> From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> 
> Openjdk-12 is implementation of Java SE 12.
> This recipe taken from branch jdk12u on release 12.0.2+10 [1].
> Openjdk-12 can compile with glibc on x86_64, x86 and aarch64. Compiling
> against musl is not working.
> 
> Some highlight features for openjdk-12 taken from [2-9]
>     189: 	Shenandoah: A Low-Pause-Time Garbage Collector (Experimental)
>     230: 	Microbenchmark Suite
>     325: 	Switch Expressions (Preview)
>     334: 	JVM Constants API
>     340: 	One AArch64 Port, Not Two
>     341: 	Default CDS Archives
>     344: 	Abortable Mixed Collections for G1
>     346: 	Promptly Return Unused Committed Memory from G1
> 
> For more information see source code at [10].
> 
> References
> [1] https://openjdk.java.net/projects/jdk/12/
> [2] https://openjdk.java.net/jeps/189
> [3] https://openjdk.java.net/jeps/230
> [4] https://openjdk.java.net/jeps/325
> [5] https://openjdk.java.net/jeps/334
> [6] https://openjdk.java.net/jeps/340
> [7] https://openjdk.java.net/jeps/341
> [8] https://openjdk.java.net/jeps/344
> [9] https://openjdk.java.net/jeps/346
> [10] https://hg.openjdk.java.net/jdk-updates/jdk12u/rev/7b6accc7c009
> 
> Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> ---
>  lib/oeqa/files/hello.java                     |   5 +
>  lib/oeqa/runtime/cases/java.py                |  16 ++
>  lib/oeqa/runtime/cases/javac.py               |  27 ++-
>  recipes-core/openjdk/openjdk-12-common.inc    | 158 ++++++++++++++++++
>  recipes-core/openjdk/openjdk-12-cross.inc     | 145 ++++++++++++++++
>  recipes-core/openjdk/openjdk-12-native.inc    |  86 ++++++++++
>  .../openjdk/openjdk-12-native_2+10.bb         |   2 +
>  .../openjdk-12-release-2+10-aarch32.inc       |  15 ++
>  .../openjdk-12-release-2+10-aarch64.inc       |  12 ++
>  .../openjdk-12-release-2+10-common.inc        |  35 ++++
>  .../openjdk/openjdk-12-release-2+10.inc       |  11 ++
>  recipes-core/openjdk/openjdk-12_2+10.bb       |  57 +++++++
>  recipes-core/openjdk/openjre-12_2+10.bb       |  54 ++++++
>  .../0001-fix-stringop-truncate-gcc8.patch     |  11 ++
>  .../0002-fix-stringop-truncate-gcc8.patch     |  38 +++++
>  .../filter-aclocal-copy-too.patch             |  10 ++
>  .../openjdk/patches-openjdk-12/jvm.cfg        |  41 +++++
>  ...njdk12-find-compiler-fix-env-respect.patch |  11 ++
>  ...move-shell-variables-from-autoheader.patch |  28 ++++
>  .../images/openjdk-12-test-image.bb           |   3 +
>  .../images/openjre-12-test-image.bb           |   3 +
>  21 files changed, 764 insertions(+), 4 deletions(-)
>  create mode 100644 lib/oeqa/files/hello.java
>  create mode 100644 recipes-core/openjdk/openjdk-12-common.inc
>  create mode 100644 recipes-core/openjdk/openjdk-12-cross.inc
>  create mode 100644 recipes-core/openjdk/openjdk-12-native.inc
>  create mode 100644 recipes-core/openjdk/openjdk-12-native_2+10.bb
>  create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10-aarch32.inc
>  create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10-aarch64.inc
>  create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10-common.inc
>  create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10.inc
>  create mode 100644 recipes-core/openjdk/openjdk-12_2+10.bb
>  create mode 100644 recipes-core/openjdk/openjre-12_2+10.bb
>  create mode 100644 recipes-core/openjdk/patches-openjdk-12/0001-fix-stringop-truncate-gcc8.patch
>  create mode 100644 recipes-core/openjdk/patches-openjdk-12/0002-fix-stringop-truncate-gcc8.patch
>  create mode 100644 recipes-core/openjdk/patches-openjdk-12/filter-aclocal-copy-too.patch
>  create mode 100644 recipes-core/openjdk/patches-openjdk-12/jvm.cfg
>  create mode 100644 recipes-core/openjdk/patches-openjdk-12/openjdk12-find-compiler-fix-env-respect.patch
>  create mode 100644 recipes-core/openjdk/patches-openjdk-12/remove-shell-variables-from-autoheader.patch
>  create mode 100644 recipes-images/images/openjdk-12-test-image.bb
>  create mode 100644 recipes-images/images/openjre-12-test-image.bb

This patch still uses 'True' options in the d.getVar() calls. This
has been deprecated in 2016. Please remove them.

Cheers,
Andre'




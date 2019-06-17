Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 204797E84F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 19:01:37 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id z25so17651783edq.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 12:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=abChJ69m5JnNypO2OfKKuc0kKM7U1HYPMng7uQT4y50=;
	b=HQB3FVsLhJKRBgg4xu/8vdrahhqvmx0pHtTneFD7oAkjmGE5goHhqy+palUtXL4OhT
	0oGZ3pv5JDFt9PPHpjQhgm1dQvEwqM3Ns+k8pts98GRzETNQLekJYAGNjdDik7sACFV6
	nBuLEVXhU9rAPQlw8SYdPungwwJ7m0AL/TSEOpKDAvP3VjdCw1yMhWENOFH6LceRLqtG
	HqjzDaIpIed+5sdZ8MPaK2n3GL64j3QOGKxdNtQSGChwDmybeqsSNA3mur1mVfTCibAS
	IuqkcKKMFeOa35htKem4LTrmtgVdax4VZ9xvXtG3wXiINvZMTpM1hz8SuDGfa5WyiGgo
	9CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=abChJ69m5JnNypO2OfKKuc0kKM7U1HYPMng7uQT4y50=;
	b=nzGJkdwDYzUeyyKYMAZLF0EdxSrAYqDtykjI04w9UrHqwE5vTPmAEwDI/dKj+cYavo
	L2aqLVWmWRcciZF9yB2NOQwHGscgwRckKFJpxJFITjCJDTFE450VquKVETakwmjqiBzG
	QBAh9XoUB1Ars2jUS89Pkwv0qQpJqH2zmCfajfFNo0XvmzllU4DjwVfH64TKff9IeLOB
	a/ogFgYylhkHC6fZSvHOQ7gPK2QpBbqrv7LSNwTPc4mdYWEc5tLEYjtMC6+mqOgyLPmD
	9c+G9SNopzTVMQ9SvBxKX5mie86qGo5W4hoPy9J5V5EYo+B0Z7pLLa5uf//zkC209K+y
	La3g==
X-Gm-Message-State: APjAAAVTTY1Zsrj0ZVBOChC6qiu0DIz4L/HQkf3LoC7KIYN51opYjFsq
	MUCKl6CwQoFCHJGzgVPhmI6G4aPlDuTwuzGyWXeVLVQx
X-Google-Smtp-Source: APXvYqza8xDWMgZVZHrWeSVJZgS7FXrkt4UZ9cAQPF4dVd9CqekN7WVIf7tBKJoMgUCAEmq9HgH7plQ0hJrQANFT8Ps=
X-Received: by 2002:a50:95d3:: with SMTP id x19mr75726961eda.98.1560798097830; 
	Mon, 17 Jun 2019 12:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190522065246.14793-1-naveen.kumar.saini@intel.com>
In-Reply-To: <20190522065246.14793-1-naveen.kumar.saini@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Jun 2019 21:01:33 +0200
Message-ID: <CA+chaQcyOZCUZCd-RjG8eYoo0_RpcpPnSgJS_jLb7Spb54cqAA@mail.gmail.com>
To: Naveen Saini <naveen.kumar.saini@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] pm-graph: add recipe
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
X-List-Received-Date: Mon, 17 Jun 2019 19:01:37 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

it doesn't respect libdir variable and fails when multilib is enabled
(because files are installed in /usr/lib while FILES_${PN} expects
/usr/lib64):

ERROR: QA Issue: pm-graph: Files/directories were installed but not shipped
in any package:
  /usr/lib
  /usr/lib/pm-graph
  /usr/lib/pm-graph/sleepgraph.py
  /usr/lib/pm-graph/bootgraph.py
  /usr/lib/pm-graph/config
  /usr/lib/pm-graph/config/freeze.cfg
  /usr/lib/pm-graph/config/suspend.cfg
  /usr/lib/pm-graph/config/cgskip.txt
  /usr/lib/pm-graph/config/standby-callgraph.cfg
  /usr/lib/pm-graph/config/suspend-callgraph.cfg
  /usr/lib/pm-graph/config/freeze-dev.cfg
  /usr/lib/pm-graph/config/standby.cfg
  /usr/lib/pm-graph/config/freeze-callgraph.cfg
  /usr/lib/pm-graph/config/suspend-dev.cfg
  /usr/lib/pm-graph/config/standby-dev.cfg
  /usr/lib/pm-graph/config/suspend-x2-proc.cfg
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
pm-graph: 16 installed and not shipped files. [installed-vs-shipped]

On Wed, May 22, 2019 at 8:59 AM Naveen Saini <naveen.kumar.saini@intel.com>
wrote:

> This tool suite is designed to assist kernel and OS developers
> in optimizing their linux stack's suspend/resume & boot time.
>
> For more details and usage, please check:
> https://01.org/pm-graph
>
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
>  .../recipes-kernel/pm-graph/pm-graph_5.3.bb   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
>
> diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> new file mode 100644
> index 000000000..de2d46dca
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
> @@ -0,0 +1,19 @@
> +SUMMARY  = "Timing analysis tools for suspend/resume/boot"
> +DESCRIPTION = "This tool suite is designed to assist kernel and OS
> developers \
> +in optimizing their linux stack's suspend/resume & boot time."
> +HOMEPAGE = "https://01.org/pm-graph"
> +LICENSE  = "GPL-2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
> +
> +SRCREV = "5be9a16547234cef5aca8bfaccd920490ea1cfa7"
> +SRC_URI = "git://github.com/intel/pm-graph.git"
> +S = "${WORKDIR}/git"
> +
> +COMPATIBLE_HOST='(i.86|x86_64).*'
> +EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D}"
> +
> +do_install() {
> +        oe_runmake install
> +}
> +
> +RDEPENDS_${PN} += "python-core python-threading python-datetime
> python-subprocess python-compression"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


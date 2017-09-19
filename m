Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3606E77DB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 08:10:14 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id d16so8060731ioj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 01:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=gKOgf4f+dVaGfkwQXFkhcZkbTrlFb2P2lWpXr+7r2lM=;
	b=sTtT1wrr7CSoc23sC9Nz22ZsS+pvskB6uj6V4ES7XYEgNIlawbQMzYkZeqgqq0050C
	/8lKH7OSHjTw7ufpq8W+kRntvUaw+wvVxNxw/DdGrsY++qEU68RVA1idMVZiBVMTcYJQ
	Ud5a4YXMPX6UDQf9KQpZD57mukVk61gG/1jJzj1K76YQTNksuVs+LYrl5sbK94yyKEcl
	NsHX5z5iulWKFM7uL0UCAPLxWnpd44bFpBiskEX3r7OQEJjYadMCIhUcXFAFcKXqVQoR
	0IrIm+DH+mMIyla8W2rC86RB4lsJ7HNXFw+/wEt7A1BIRLd4VSJD7gabZaWCdYit9O27
	L9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=gKOgf4f+dVaGfkwQXFkhcZkbTrlFb2P2lWpXr+7r2lM=;
	b=Dqr60OmYQnnGfXh3Ukxu35E6Q1GRYG6iLQG92sRi3QKX8Pp2+pGV41O2YCPw+8dp8o
	bEUc1/m0uCcb+zuCtRmXbhW5EUcUf87klg93BbIaiBwNBN/9feeNWLuXOwadwI8JZuvu
	yoy7P5vlQ+h3hCjvU/3vrTULly/2DW+Z7/vdEjr9YmVDf+e44dGRdXNW7V7siTOEX87m
	JuHCwj3Jtc22C11+Rq6HmFqVaA8Lk9xsbZmk6IyeOr0Z68qgbyfZFSvitaOm95glvtdS
	63krSv6lSb+9y/f4d+ZiiDo75c9jmVytr0wRjVbPQZbKwgac/0Sx9emSn17gl0YXxlr2
	BhDg==
X-Gm-Message-State: AHPjjUjrq7I+9THQAwxgttyB9TtYwuBYZ7NTKPQFxfak1BMIZEgBC1Wf
	TAZOljoP29CFyWrve4NTZmytc1wB+AR1waVE56i2zORm
X-Google-Smtp-Source: AOwi7QBjHoQ6pzqwY4Iwuwn7fC8Z/Xw3OCw1//o7TV3rs9RWc+FNj9JRzL07xW8CTFr3Ag4i9Dr/g+/0ijqHxdKamw0=
X-Received: by 10.107.32.70 with SMTP id g67mr807474iog.77.1505808615296; Tue,
	19 Sep 2017 01:10:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 01:09:54 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 09:09:54 +0100
Message-ID: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Use of github /archive/ tarballs in SRC_URI
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
X-List-Received-Date: Tue, 19 Sep 2017 08:10:15 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Some people have insisted for a long time that the dynamically generated
/archive/ tarballs at github cannot be trusted for long-term stability, as
they are generated using git-archive.  Others said that git-archive takes
measures to ensure the files are identical, and basic testing does indeed
show that.  Personally I was on the fence: a dynamically generated tarball
that is cached *could* change, but the git-archive generates the same file
list and the tools are stable.

Then the tarball for one of Erlang's repositories changed, and was noticed
by the checksum in the recipe (thanks Gunnar Andersson for reporting
this).  The extracted contents are identical, but the tarball itself has
changed.  I'm presuming this is due to the old tarball expiring in their
cache, and a newly generated tarball using a later version of tar.

So we now have documented evidence that this can and does happen, and it's
quite frustrating when this happens.  So, I suggest that use of github.com
/archive/ URLs be considered a bad practise for the primary SRC_URI tarball.

I'm working my way through the recipes in oe-core that use /archive/ and
replacing them with either maintainer-generated tarballs or git clones, but
there are a number of recipes in meta-oe which could do with fixing:

$ git grep -l -E github\\.com/.*/archive/
meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb
meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb
meta-oe/recipes-kernel/crash/crash_7.1.9.bb
meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
meta-oe/recipes-support/hunspell/hunspell_1.6.1.bb
meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
meta-oe/recipes-test/gtest/gtest_1.8.0.bb
meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.015.bb

Ross


Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0BDA2745E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 15:48:29 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id x144-v6so522361itc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BOJuPfLKbTu0yRL5a+m148WvaYVILO7ekFdSC5Nobjo=;
	b=k/1ypWXVUneQVhLoPCvGcuN54jPyZ6YL7Uawivx/olTgVhzdKFrQBdTTJIXYvJ5mqu
	uNndajwEhrdXy7vSFGQNDotHj2IYnArShU6ncpSYUAHJMWBsw6A72I9rERzshOTmAy3u
	Ltfh7MqPtTPKmdRelQpMVXYJQNDBv8h6+ukxduA59quCqT9kV/hWJt2/otbdBVJ2qPhf
	Q5tJRtpFoaXfYzjTSGnFMRAyngoJmscgFzEpAbyhw/dKw9zVurqB7LmWZaZOkhLm9wcR
	JpdHXHii/A4fM2csk5XqHYRIXYVDeTfRXyzFi+6wy+/kKfPP0USrAU6lktGiFnb31YQj
	TTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BOJuPfLKbTu0yRL5a+m148WvaYVILO7ekFdSC5Nobjo=;
	b=nvBMRIneqfZAPLETRCStowAvfKl68nZWB/kO/rM7dg9slbX9/qA7l7U3Sb9pyjRtUU
	z0KtJ9+iea68ncR/mD+c2EunOWvLVO+yVa6zc1Jte/X7mF2Qvce6ASvEsfegAm9qGNG4
	TCjH0g7yNjEv78SbWYtZ0vVpilfUaMaTlpXmRDl89OqKLniU1SI1y6TOC443dBXoI0KO
	vZ+Xl6T6K/tx8aNonUQjsJiSsiZUYdjcm6OCYmRYaewWvT7eokbu82VYUShsizL3FN0B
	BMyWG3SRm1S+i/zeHUBU9qRGA5FovE+mjXX4Iguq5lCIbRJfgsU7NCnAxypWY7IiZ5L5
	hOXQ==
X-Gm-Message-State: ALQs6tAAiyBsiXeqLYYbqAC8aFuCF/sV87z1ehvi0gX+jruDwtmowQGz
	pFtSq1JFeP6nK1HUM+4VsnJZv5+7kvJ3LRD8ESY=
X-Google-Smtp-Source: AB8JxZoDi5EgfxdlaYmN0A0ZMRCIomCUwkeG98KpQjMuobQhsgkQTcMPKvBZMr2PunoTv0UWGYBfOj5YBma0h9PEOfo=
X-Received: by 2002:a24:3284:: with SMTP id
	j126-v6mr7658519ita.117.1524152910694; 
	Thu, 19 Apr 2018 08:48:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:894:0:0:0:0:0 with HTTP;
	Thu, 19 Apr 2018 08:48:10 -0700 (PDT)
In-Reply-To: <CAJTo0LbNGfDv5cNtMWFRrnfF37mtj6oPDcE2n443SiPfkLGDQA@mail.gmail.com>
References: <20180419141737.21053-1-costamagnagianfranco@yahoo.it>
	<CAJTo0LbNGfDv5cNtMWFRrnfF37mtj6oPDcE2n443SiPfkLGDQA@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Thu, 19 Apr 2018 17:48:10 +0200
Message-ID: <CAATN8PUv83PA3nQQfsFKPSrp+R4Q=ansTsUWd3foD6c6WSu-1Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] websocketpp: add new recipe based on Debian packaging
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
X-List-Received-Date: Thu, 19 Apr 2018 15:48:30 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,
you are right, after upstream commit
7389cb451caf74485aee89dc0a6174c68af0de74

this is not required anymore.
Since this patch is going into master, I can drop this, and I'll leave this
comment in case somebody tries this to rocko or older.

In case of this error:
ERROR: websocketpp-0.7.0-r0 do_package: QA Issue: websocketpp:
Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/cmake
  /usr/lib/cmake/websocketpp
  /usr/lib/cmake/websocketpp/websocketpp-configVersion.cmake
  /usr/lib/cmake/websocketpp/websocketpp-config.cmake
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
websocketpp: 5 installed and not shipped files. [installed-vs-shipped]


just add this line on the bb file
FILES_${PN}-dev += "${libdir}/cmake ${datadir}/cmake"

G.

2018-04-19 16:42 GMT+02:00 Burton, Ross <ross.burton@intel.com>:

> On 19 April 2018 at 15:17, Gianfranco Costamagna
> <costamagna.gianfranco@gmail.com> wrote:
> > +FILES_${PN}-dev += "${libdir}/cmake"
>
> cmake.bbclass does this:
>
> FILES_${PN}-dev += "${libdir}/cmake ${datadir}/cmake"
>
> So this is not required.
>
> Ross
>


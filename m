Return-Path: <behanw@converseincode.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id C087877BE4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 04:40:30 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id l64so36491531pge.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 21:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=converseincode.com; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=9f3aW7aVT3sBx0i+v8L/gwu+at4zhJ73ZJwI0rXJMCY=;
	b=CDt3G6LmdalvIDpaNIXOBVf5SogRmUs6JwsjOtCAthqThjwWBDfua3H3ewjoBJbuXW
	6EgxXxLbjHq54lOjZEM8TWy/4lQVfwPFT+4lGimzFhpCiVC0PUq9fh+IZ+6Ej3lA2Ala
	4SsQFTTE8ZuuVCXqCkbyrzSlNhPL6X4E4A2AY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=9f3aW7aVT3sBx0i+v8L/gwu+at4zhJ73ZJwI0rXJMCY=;
	b=NZ3mc4BwckVqoaSOZZg/Ua/1EzzuGWJNl9pb8EF7L/uaw9E/Ao6QUTGXQR4k3CrWK8
	88LjN7K+/aDjzWMfkcXMthL+1jBTMUwYf+nUpPYf7iMLtziOpHkK7QfK05CG/qtvQlQW
	XI430mmiy6t/7aFlkrq3RFDmI8Jq+2U+ejk1K/MbJA47+H9FMVeOVYGzSC2OrMVfIM28
	Ppa2hSIwRHjjZRM0DSVGC5Ta10qshtZRd+UBqkXYAESZdlZxbp4STntd7APvt5s3XeWv
	ffziRdyYjII52Q5IJS1g0tFJ+AiK5mkvlXRAIRLqOoauvKstL4U81WSCAxEUJnd0UO3C
	IYEg==
X-Gm-Message-State: AHYfb5ilO8MwyVJAe4S+95A20lJ3FJlr5vEE5T2ume3TlJXCcHDaEbzs
	lzsj/XudQGycOuF2M+ZQ9Q==
X-Received: by 10.99.51.142 with SMTP id z136mr10025686pgz.275.1502340031871; 
	Wed, 09 Aug 2017 21:40:31 -0700 (PDT)
Received: from [192.168.120.225] (d207-6-122-147.bchsia.telus.net.
	[207.6.122.147]) by smtp.gmail.com with ESMTPSA id
	y70sm9659597pfg.93.2017.08.09.21.40.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 21:40:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Behan Webster <behanw@converseincode.com>
In-Reply-To: <1502288526.1934.39.camel@linux.intel.com>
Date: Wed, 9 Aug 2017 21:40:29 -0700
Message-Id: <879E7479-CCE4-47D5-BB40-E789BA93185C@converseincode.com>
References: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
	<1502288526.1934.39.camel@linux.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 10 Aug 2017 04:40:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Aug 9, 2017, at 7:22 AM, Leonardo Sandoval =
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>=20
> in my opinion, this fits nicely into the oe-core, into the
> scripts/contrib folder.

Keeping it in script/contrib seems odd to me (horse before the cart). =
One of the requirements for OE is git (or tar) to actually get OE in the =
first place.

I see this as more something some one would run before cloning OE or =
Poky. It=E2=80=99s a replacement for needing to read a long HOWTO on a =
webpage to get started with OE or YP.

Behan=


Return-Path: <max@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 2DC087987E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 12:54:22 +0000 (UTC)
Received: by swift.blarg.de (Postfix, from userid 500)
	id 8077D22004B; Thu, 27 Sep 2018 14:54:22 +0200 (CEST)
Date: Thu, 27 Sep 2018 14:54:22 +0200
From: Max Kellermann <max+openembedded@blarg.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180927125422.6pt6cpm2hsp35nbj@swift.blarg.de>
Mail-Followup-To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20180918082608.1088-1-max+openembedded@blarg.de>
	<CAMKF1spwKoe9+NqUsU6DZ0PvSWtT9N3-uPEUS8Y7n3heCHeM8A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spwKoe9+NqUsU6DZ0PvSWtT9N3-uPEUS8Y7n3heCHeM8A@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/8] [meta-oe] devtools/php: remove the failing ${D}/${TMPDIR} code
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
X-List-Received-Date: Thu, 27 Sep 2018 12:54:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2018/09/24 20:48, Khem Raj <raj.khem@gmail.com> wrote:
> http://errors.yoctoproject.org/Errors/Details/193970/

Hm, I tried to go back and forth to find what is causing this
nonsensical path.  There must be be something which concatenates two
absolute paths, but I can't reproduce it.

In any case, the code which my patch removed makes the problem only
worse.  My build directory happens to be inside /usr/src/, and so the
shell script finally attempts to remove /usr/ which is non-empty,
which crashes the build.

Do you have an idea how to reproduce these strange paths?

Max


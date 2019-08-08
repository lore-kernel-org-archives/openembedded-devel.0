Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD947F37C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 13:26:22 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id z51so3283267edz.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2019 06:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KUsraDfCSm7T5TWa8QkbLxn5vqoqbDOzxXNNc2ViYsM=;
	b=rxFqMNJhzBYOLW8gCNLtriJjzaE/ZGiev/vmcCYYIr42J6ooVIv85FFL6aPW4NzfIa
	/txkUm+hBYt01U0T+kR8DtulaCDqmfhWK3ZxjXGGl0qMi6Sl6bT5uFcjeyPiSJbFhLo5
	gchMJAPQnFM2jWvIa+sT6ZNeoWj2VZT8NmMRNCQMnIwEYC4SCxkxvHHyqoiPRNlcJota
	xPMyXBZBhOyjYK7u4BNTYmEuyirNoTzlk5OcVGkNy4+6IpE1vnZLaU161XyfEfXVV36M
	MukxAFkrvGIZs6aHBOvoaRmpGdU8a5E7Ydd+HeGnPutGExA5rdmannvkBCOdYvja1WrZ
	+HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KUsraDfCSm7T5TWa8QkbLxn5vqoqbDOzxXNNc2ViYsM=;
	b=oze8YRClz34/OB6HHGvzndISwNggwZUMddPajCI8c83Qf+s2kvNy+mZsIrwQ8trLbk
	2AmC/bIiswEFMunZ3FrZRF4kLXT+tVITyqsRy6GkUph/iTUcIeNlAWEQA6+kz/RYx4Rj
	8kHZXb57XaN2Jy41ZnSrT6oILi9ehrYMZG/GP0eL0KONXFKXU/Lf1yj3oLouzx1VmqZU
	j4e3w+jmW55itXrazrp6v7lzJcnPSj47qaoUXmj2mkffDkFDIlc2Gv2Uwgt85IYQ8Kif
	nGSeX3zR6SZh/ME2bi/MqCSdMM8MqBcIkn5ZI6tRl2q545whESQsPC8aXGrbePFBiHqb
	VGmQ==
X-Gm-Message-State: APjAAAU9bEFe6fneBdNg4uHh0ZY+HOPa5g0huQ/56gi0g68elcdP2nag
	/cTYXuscAonKroJqO/ZO+v7IYBc7cLe8DbiNk/8=
X-Google-Smtp-Source: APXvYqzvM5MWK1vfdtF46yIamWqtM1ID6FClC42WVE/fVsRGW75rSQA6IYLQRvEwSeKXe0w8XGXVV6uHd19Mapcw8Dw=
X-Received: by 2002:a17:906:e95:: with SMTP id
	p21mr13051130ejf.205.1565270783121; 
	Thu, 08 Aug 2019 06:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190806064731.17490-1-andrej.valek@siemens.com>
	<76644068-fffd-3398-0898-e00db5a9f026@gmail.com>
	<233c3c9c-9cd6-aead-3ddf-3adfb6d7d554@siemens.com>
In-Reply-To: <233c3c9c-9cd6-aead-3ddf-3adfb6d7d554@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 8 Aug 2019 15:26:11 +0200
Message-ID: <CA+chaQe1_bMvan17fjGrgXUf-ArJ43bu4iqC9PKq9BU6oRe_1g@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nodejs: 10.16.0 -> 10.16.1
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
X-List-Received-Date: Thu, 08 Aug 2019 13:26:22 -0000
Content-Type: text/plain; charset="UTF-8"

My guess: it's the recent insane.bbclass change in oe-core/master-next

On Thu, Aug 8, 2019 at 8:31 AM Andrej Valek <andrej.valek@siemens.com>
wrote:

> Hi Khem!
>
> I have checked the task, what you mentioned, but there is no errors on
> my side.
>
> DEBUG: Executing python function do_package_qa
> NOTE: DO PACKAGE QA
> DEBUG: Executing python function read_subpackage_metadata
> DEBUG: Python function read_subpackage_metadata finished
> NOTE: Checking Package: nodejs-doc
> NOTE: Checking Package: nodejs
> NOTE: mips-poky-linux-objdump -p .../packages-split/nodejs/usr/bin/node
> NOTE: Checking Package: nodejs-locale
> NOTE: Checking Package: nodejs-staticdev
> NOTE: Checking Package: nodejs-src
> NOTE: Checking Package: nodejs-systemtap
> NOTE: Checking Package: nodejs-dev
> NOTE: Checking Package: nodejs-dbg
> NOTE: mips-poky-linux-objdump -p
> .../packages-split/nodejs-dbg/usr/bin/.debug/node
> NOTE: Checking Package: nodejs-npm
> NOTE: DONE with PACKAGE QA
> DEBUG: Python function do_package_qa finished
> DEBUG: Executing python function sstate_task_postfunc
> NOTE: Using umask 0o002 (not 22) for sstate packaging
> DEBUG: Executing python function sstate_hardcode_path
> NOTE: Removing hardcoded paths from sstate package: ...
> DEBUG: Python function sstate_hardcode_path finished
> DEBUG: Executing python function sstate_report_unihash
> DEBUG: Python function sstate_report_unihash finished
> DEBUG: Executing shell function sstate_create_package
> DEBUG: Shell function sstate_create_package finished
> DEBUG: Executing python function sstate_sign_package
> DEBUG: Python function sstate_sign_package finished
> DEBUG: Executing python function sstate_hardcode_path_unpack
> DEBUG: Python function sstate_hardcode_path_unpack finished
> DEBUG: Executing python function uninative_changeinterp
> DEBUG: Python function uninative_changeinterp finished
> DEBUG: Python function sstate_task_postfunc finished
>
>
> What is your testing setup?
> Is it fully reproducible? Could you please run only package_qa task?
>
> Regards,
> Andrej
>
> On 8/8/19 6:32 AM, Khem Raj wrote:
> > Hi Andrej
> >
> > I am seeing
> >
> > ERROR: nodejs-10.16.1-r0 do_package_qa: QA Issue:
> > /usr/lib/node_modules/npm/node_modules/node-gyp/gyp/samples/samples
> > contained in package nodejs-npm requires /usr/bin/python, but no
> > providers found in RDEPENDS_nodejs-npm? [file-rdeps]
> >
> > Can you see whats going on ?
> >
> > On 8/5/19 11:47 PM, Andrej Valek wrote:
> >> Update nodejs to active 10.x LTS release 10.16.1.
> >>
> >> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> >> ---
> >>  .../recipes-devtools/nodejs/{nodejs_10.16.0.bb => nodejs_10.16.1.bb}
> | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>  rename meta-oe/recipes-devtools/nodejs/{nodejs_10.16.0.bb =>
> nodejs_10.16.1.bb} (97%)
> >>
> >> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.1.bb
> >> similarity index 97%
> >> rename from meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
> >> rename to meta-oe/recipes-devtools/nodejs/nodejs_10.16.1.bb
> >> index aaa1da0aa..8c7795c76 100644
> >> --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
> >> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.1.bb
> >> @@ -23,8 +23,8 @@ SRC_URI_append_class-target = " \
> >>             file://0002-Using-native-torque.patch \
> >>             "
> >>
> >> -SRC_URI[md5sum] = "c9a7ab43f8b50c8a4d5545de307b7540"
> >> -SRC_URI[sha256sum] =
> "18e37f891d10ea7fbc8f6410c444c2b1d9cc3cbbb1d35aa9c41f761816956608"
> >> +SRC_URI[md5sum] = "009e079ce7e2d695642fb61372459a77"
> >> +SRC_URI[sha256sum] =
> "6268319c8dddfdaa7886ea3f253ac5c2d133a6c682c00786296227e03f322009"
> >>
> >>  S = "${WORKDIR}/node-v${PV}"
> >>
> >>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


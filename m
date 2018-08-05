Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id A15CA78A8B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Aug 2018 15:17:02 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id e19-v6so3868666edq.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Aug 2018 08:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/tbY8uxBdXRujhXqO0/2EvEjSCkS8VUgYQTXDOjuW38=;
	b=EOfE6f1+KgRa1RpmOWGvtKRTKuCgovTYAf4L2wOtB+RMxSIM6qIo8RI2XgWmgHl4iR
	b2tq2+/mWOzJP1RNtXs87RRzN8C0seB2BAEFb9AefK29cJ+ZgitBgwlTcn84citVL6se
	MpC2rOLLTFUwPBBmsKAMAIbaKPYDcRhJH8myJEGXJe1osqFgBwnXcbjFoDw/oVjD4rf0
	SUZih+lIfB7pI777G4Ad0J1xJX2WOdBjPcJdQp7vQenZSOCLp6ft61tWsJsuOLpFhHyY
	qPr6xvc0eSVjxKIEGXLYxYsWFLb89oZrG8b7oLhR+3O+SQf03LHtQQER/QplIiQB+jMq
	xGJA==
X-Gm-Message-State: AOUpUlHXhTUQlj06PWuMouIWIXPqNK9Gaqa5oITKVr4yZkCUjHZM2p7m
	ysOQsYz5kjJYyZ1sAvkJ/sOQRysO
X-Google-Smtp-Source: AAOMgpfLU9DJIpbx3M+GsKjKOql5x8q82uaMJrIohpdH4dpcGyYCGmUj/CXWVRgqprU6cFP7IA9lWA==
X-Received: by 2002:a50:b684:: with SMTP id
	d4-v6mr14654083ede.250.1533482223384; 
	Sun, 05 Aug 2018 08:17:03 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	x13-v6sm11375658edx.17.2018.08.05.08.17.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 05 Aug 2018 08:17:02 -0700 (PDT)
Message-ID: <2331871aa2d04d81366a40787db418acf7dc00b8.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Leitner <richard.leitner@skidata.com>, 
	openembedded-devel@lists.openembedded.org
Date: Sun, 05 Aug 2018 16:17:01 +0100
In-Reply-To: <e3cd5b4ebde785d03e79564e0243006287f12a47.camel@andred.net>
References: <20180727131616.13881-1-git@andred.net>
	<390065ca-13d0-7dcd-8528-575b25187e2e@skidata.com>
	<872b2392cfb7793f514cf8b806262e8d37bb9fd4.camel@andred.net>
	<2e3d0628-932b-0466-2832-82741e7cd699@skidata.com>
	<e3cd5b4ebde785d03e79564e0243006287f12a47.camel@andred.net>
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
X-List-Received-Date: Sun, 05 Aug 2018 15:17:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2018-08-04 at 11:41 +0100, André Draszik wrote:
> On Tue, 2018-07-31 at 13:33 +0200, Richard Leitner wrote:
> > On 07/31/2018 01:19 PM, André Draszik wrote:
> > > On Tue, 2018-07-31 at 11:00 +0200, Richard Leitner wrote:
> > > > Hi André,
> > > > thank you for your patches.
> > > > 
> > > > Unfortunately I have checksum issues for aarch64's jdk, corba, jaxp,
> > > > jaxws, langtools & nashorn:
> > > 
> > > Hm, is that another instance of
> > > http://lists.openembedded.org/pipermail/openembedded-devel/2018-May/11
> > > 83
> > > 58.html
> > > ?
> > > 
> > > I'll check...
> > 
> > Thanks!
> 
> I'll get back to that next week, see below.

Indeed, it's another case like previously. At least now the checksums will
be stable, though. See diff (similar for all 6 archives):

diff -urN new/corba-3a04a7c080af/.hg_archival.txt orig/corba-3a04a7c080af/.hg_archival.txt
--- new/corba-3a04a7c080af/.hg_archival.txt 2018-05-09 04:52:12.000000000 +0100
+++ orig/corba-3a04a7c080af/.hg_archival.txt     2018-05-09 04:52:12.000000000 +0100
@@ -1,4 +1,5 @@
 repo: 55540e827aef970ecc010b7e06b912d991c8e3ce
 node: 3a04a7c080af040b0075b2079cc1fa91c8197b8b
 branch: default
-tag: aarch64-jdk8u181-b03
+latesttag: aarch64-jdk8u172-b11
+latesttagdistance: 1

etc.

I'll post updated patches hopefully this week, after I've trackced down
what's missing to be able to use this against latest poky master and/or
glibc on aarch64.


Nevertheless, I'll probably also switch to direct mercurial clones, rather
than mercurial archives to avoid these mismatches in the future. Unless
there is a strong reason not to.


A.



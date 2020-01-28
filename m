Return-Path: <richard.leitner@skidata.com>
Received: from mail.bubus.at (bubus.at [81.19.156.191])
	by mail.openembedded.org (Postfix) with ESMTP id ADEB47F7CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 08:34:22 +0000 (UTC)
Received: from pcleri (unknown [91.230.2.244])
	by mail.bubus.at (Postfix) with ESMTPSA id 5289D6C20001;
	Tue, 28 Jan 2020 09:34:22 +0100 (CET)
Date: Tue, 28 Jan 2020 09:34:21 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20200128083421.GH2982185@pcleri>
References: <20200128052225.2455848-1-richard.leitner@skidata.com>
	<e4120acd-f334-c9fb-5503-526a81786ba0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e4120acd-f334-c9fb-5503-526a81786ba0@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH v2 0/4] openjdk-8: update to jdk8u242ga
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
X-List-Received-Date: Tue, 28 Jan 2020 08:34:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 28, 2020 at 08:24:09AM +0100, Jacob Kroon wrote:
> Hi Richard,
> 
> On 1/28/20 6:22 AM, Richard Leitner wrote:
> > This series updates Openjdk 8 to the latest "ga" release 242.
> > 
> > Successful testing has been done on a fedora-31 build host for
> > qemuarm64, qemux86-64, qemuarm32 and armv7a.
> > 
> > CHANGES v2:
> >   - remove openjre debuginfo fixup completely as it targeted JDK_HOME
> >     instead of JRE_HOME and jre doen't create debuginfo files.
> > 
> > Richard Leitner (4):
> >    openjdk-8: update to latest ga version 242
> >    docs: add update8checksums.sh and mention it in UPDATING.md
> >    openjre-8: remove debuginfo fixup from do_install
> >    openjdk-8: fix jdk linking for non aarch architectures

...

> Thanks for doing this work. How about just squashing all the commits into a
> single one ? Should also make it easier to backport the update to zeus etc.

Yes, I guess that makes sense. I just wanted to repost the series for
"easier" review.
When commiting it to master-next I will squash them ;-)

regards;rl

> 
> Thanks,
> Jacob


Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id AE7F171B2E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 18:42:42 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 3A1592803AD; Tue, 31 Jul 2018 11:46:37 -0700 (PDT)
Date: Tue, 31 Jul 2018 11:46:37 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: William Delacre <williamdelacre@gmail.com>,
	Mark Asselstine <mark.asselstine@windriver.com>
Message-ID: <20180731184637.GJ20696@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	William Delacre <williamdelacre@gmail.com>,
	Mark Asselstine <mark.asselstine@windriver.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
	<20180727164420.GM20696@vctlabs.com>
	<CAOnRZEK6f6dJtHcxrOTZN1CE_w=4=VHRKkArM76=KtJY69EK0w@mail.gmail.com>
	<2158826.FCmzKMqH1E@yow-masselst-lx1>
MIME-Version: 1.0
In-Reply-To: <2158826.FCmzKMqH1E@yow-masselst-lx1>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: (No subject)
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
X-List-Received-Date: Tue, 31 Jul 2018 18:42:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jul 31, 2018 at 10:30:02AM -0400, Mark Asselstine wrote:
> On Tuesday, July 31, 2018 7:54:22 AM EDT William Delacre wrote:
> > Le ven. 27 juil. 2018 à 18:40, S. Lockwood-Childs <sjl@vctlabs.com> a
> > 
> > écrit :
> > > It depends on the role of the particular dependency:
> > > 
> > > * tool you need to run during build             <-- native dependency
> > > * library you need to link against during build <-- target dependency
> > 
> > Thanks for the precision :-)
> > 
> > My question may seem a bit stupid but how do you know which is which ?
> > Let’s say I want to write a recipe to install any specific software on my
> > target, how do I choose the dependencies ?
> > I have to refer to the software Makefile/CMakeList ?
> 
> It is not always easy to see via code inspection. I would suggest keep a 
> second build for a different arch than your build host, possibly ARM. Start by 
> using the non-native DEPENDS and only if there is an issue with the ARM build 
> look at using -native for a DEPENDS.
> 
> To be honest I haven't had to worry about this too much as it is rare to run 
> into issues.

Yes target build dependencies are more common, so this approach of defaulting
to target rather than native does make sense.

My other advice is to start out by reviewing the build instructions in the
README / INSTALL docs for the software package; if that package requires some
non-standard external build tool ("non-standard" meaning other than 
autotools / make etc) that would need to be listed as native dependency, 
that tool really should be mentioned in the build instructions.

--SJLC


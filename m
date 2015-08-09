Return-Path: <sjl@dent.vctlabs.com>
Received: from dent.vctlabs.com (dent.vctlabs.com [68.183.110.161])
	by mail.openembedded.org (Postfix) with ESMTP id 40CEF76781
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2015 00:12:08 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 6214DC05F4; Sat,  8 Aug 2015 17:30:37 -0700 (PDT)
Date: Sat, 8 Aug 2015 17:30:37 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150809003037.GW8667@dent.vctlabs.com>
References: <20150718003812.GA18468@dent.vctlabs.com>
	<60400991-1BCD-4AED-93C2-3C5DA77CE88A@gmail.com>
MIME-Version: 1.0
In-Reply-To: <60400991-1BCD-4AED-93C2-3C5DA77CE88A@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-filesystems][PATCH 1/2] libimobiledevice: remove runtime configure check
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Aug 2015 00:12:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Apologies for managing to reply to the wrong thread the first time...

On Sat, Aug 08, 2015 at 04:01:38PM -0700, Khem Raj wrote:
> 
> > On Jul 17, 2015, at 5:38 PM, S. Lockwood-Childs <sjl@vctlabs.com> wrote:
> > 
> > configure.ac had a runtime check for large file support that got run
> > on 64-bit architectures, and all runtime checks must go away to be
> > cross-compile safe.
> > 
> > Luckily that runtime check was extraneous, so just remove it;
> > standard AC_SYS_LARGEFILE macro should be sufficient for figuring out
> > proper settings to get large file support.
> > 
> > Also un-blacklist libimobiledevice, since this problem was the
> > reason for the blacklist.
> > 
> 
> one difference is that now it will depend on --enable-largefile secondly, what does AC_SYS_LARGEFILE
> check do in the end ? is it a link time check ?

Not sure what you mean by 'now it will depend on --enable-largefile' since 
the handling of that flag isn't being changed. I didn't add AC_SYS_LARGEFILE
macro; it was already there. The recipe still doesn't need to set that flag...
large file support should get enabled if the platform supports it.

AC_SYS_LARGEFILE does a compile-time check that off_t is large as expected,
and if not it tries some defines (such as _FILE_OFFSET_BITS) to see if they
can make off_t check pass. In the 64-bit Linux case, the first check passes,
since no tinkering with extra defines is needed, but for 32-bit case 
_FILE_OFFSET_BITS will get defined.



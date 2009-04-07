Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LrIzI-0006Tj-0b
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 23:38:41 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHR002NP2L1C3JW@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Apr 2009 16:34:19 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CA4516B83A8; Tue,
	07 Apr 2009 17:34:12 -0400 (EDT)
Date: Tue, 07 Apr 2009 17:34:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090407213412.GF11203@denix.org>
References: <20090402185006.GA12552@denix.org>
	<20090402191118.GC30840@smtp.west.cox.net>
	<20090402203832.GC12552@denix.org>
	<20090407162432.GA11203@denix.org>
MIME-version: 1.0
In-reply-to: <20090407162432.GA11203@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: package_ipk.bbclass fails due to a wrong version of a	package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Apr 2009 21:39:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 07, 2009 at 12:24:32PM -0400, Denys Dmytriyenko wrote:
> On Thu, Apr 02, 2009 at 04:38:32PM -0400, Denys Dmytriyenko wrote:
> > On Thu, Apr 02, 2009 at 12:11:18PM -0700, Tom Rini wrote:
> > > On Thu, Apr 02, 2009 at 02:50:06PM -0400, Denys Dmytriyenko wrote:
> > > 
> > > > I've been debugging this issue for a while now w/o much success.
> > > > 
> > > > We have following recipes in play:
> > > > curl_7.19.0.bb
> > > > curl-native_7.18.2.bb
> > > > curl-sdk_7.18.2.bb
> > > > 
> > > > None of those set PV explicitly, so they are picked up from the filename.
> > > 
> > > Hmm, if you throw in a -v -DDD and log all the output, do you see both
> > > curl_7.18.2.bb being loaded (for -sdk) and curl_7.19.0.bb (for target)
> > > being loaded up?
> > 
> > Nope. While trying to build curl-sdk_7.18.2.bb there is no mentioning of 
> > 7.19.0 (grepped the output) until the do_package_write_ipk, where it tried to 
> > create a lock file, as I mentioned above:
> > 
> > NOTE: package curl-sdk-7.18.2-r0: task do_package_write_ipk: started
> > DEBUG: mkdirhier(/oe/tmp/work/i686-i686-sdk-angstrom-linux/curl-sdk-7.18.2-r0/image)
> > DEBUG: mkdirhier(/oe/tmp/work/i686-i686-sdk-angstrom-linux/curl-7.19.0-r1/image)
> > ERROR: Error, lockfile path does not exist!: /oe/tmp/work/i686-i686-sdk-angstrom-linux/curl-7.19.0-r1/install
> > 
> > The second mkdirhier() is where it fails and it is called from lockfile(), 
> > which gets called from do_package_ipk()...
> > 
> > BTW, this was a i686-generic build, thus i686-i686-sdk path...
> 
> FYI, I figured it out few days ago, but had some personal matters to resolve 
> first. I'll be sending a detailed explanation and a patch soon.

Ok, the problem comes from the 1af5030de05a1e65d1de734f7675ffc22c8318fc 
commit taken from Poky, which seems legitimate, as it "fixes" the generation 
of pkgdata/runtime files by adding extra fields, such as PN, PV and PR. It was 
commited as part of RPM packaging.

Unfortunately, that unmasks some issues, namely the one with curl/curl-sdk...

All curl recipes use a single .inc file, which expands the PACKAGES variable 
with libcurl name (i.e. "curl curl-dev curl-dbg libcurl libcurl-dev...").

Now when curl target is packaged, it generates a pkgdata file with version 
7.19.0-r1 in it under arch dir. Next, when curl-sdk is being packaged its 
PACKAGES variable is "curl-sdk curl-sdk-dev curl-sdk-dbg libcurl 
libcurl-dev...". So when do_package_write_ipk() calls 
read_subpackage_metadata(), it looks for pkgdata of libcurl and finds it in 
arch dir first, extracting the wrong version numbers, hence lockfile() trying 
to access the wrong directory. Here is the code:

def get_subpkgedata_fn(pkg, d):
    import bb, os
    archs = bb.data.expand("${PACKAGE_ARCHS}", d).split(" ")
    archs.reverse()
    pkgdata = bb.data.expand('${TMPDIR}/pkgdata/', d)
    targetdir = bb.data.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/', d)
    for arch in archs:
        fn = pkgdata + arch + targetdir + pkg
        if os.path.exists(fn):
            return fn
    return bb.data.expand('${PKGDATA_DIR}/runtime/%s' % pkg, d)

Now, the above code works in Poky, because Poky has the same version numbers 
for curl, curl-native and curl-sdk.

Maybe there is way to fix this issue in the core classes, but I don't believe 
libcurl should be in curl-sdk PACKAGES anyway. I have it fixed this way and 
I'll be sending the patch to the list shortly. Plus, curl-sdk is only needed 
for do_stage() and has empty do_install() anyway.

The above commit from Poky may unmask some other similar issues, not related 
to curl - for example the one Otavio reported recently. It can be easily 
verified if it is the rootcause:

$ git revert -n 1af5030de05a1e65d1de734f7675ffc22c8318fc

If there are multiple pkgdata files with the same name, but different 
contents, the above quoted get_subpkgedata_fn() function may pick the wrong 
one. The question is - is it even valid to have something like this:

${TMPDIR}/pkgdata/armv5te-none-linux-gnueabi/runtime/foo
${TMPDIR}/pkgdata/i686-armv5te-sdk-none-linux-gnueabi/runtime/foo

-- 
Denys



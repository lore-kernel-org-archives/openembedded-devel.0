Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LpS35-0001sK-Sb
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 20:54:06 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHH00BK9LNJHWWU@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	02 Apr 2009 13:50:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0D7216B83B5; Thu,
	02 Apr 2009 14:50:07 -0400 (EDT)
Date: Thu, 02 Apr 2009 14:50:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090402185006.GA12552@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: package_ipk.bbclass fails due to a wrong version of a package
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
X-List-Received-Date: Thu, 02 Apr 2009 18:54:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

I've been debugging this issue for a while now w/o much success.

We have following recipes in play:
curl_7.19.0.bb
curl-native_7.18.2.bb
curl-sdk_7.18.2.bb

None of those set PV explicitly, so they are picked up from the filename.

Now, let's run this:
$ bitbake curl curl-sdk

And here is the error message:
NOTE: package curl-sdk-7.18.2-r0: task do_package_write_ipk: started
ERROR: Error, lockfile path does not exist!: /oe/tmp/work/i686-armv5te-sdk-none-linux-gnueabi/curl-7.19.0-r1/install
ERROR: Error in executing: /oe/openembedded/recipes/curl/curl-sdk_7.18.2.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing: /oe/openembedded/recipes/curl/curl-sdk_7.18.2.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of /oe/openembedded/recipes/curl/curl-sdk_7.18.2.bb do_package_write_ipk failed
ERROR: Task 867 (/oe/openembedded/recipes/curl/curl-sdk_7.18.2.bb, do_package_write_ipk) failed

The message comes from package_ipk.bbclass, line 161, bb.utils.lockfile():

        packages = bb.data.getVar('PACKAGES', d, True)
        for pkg in packages.split():
                localdata = bb.data.createCopy(d)
                pkgdest = bb.data.getVar('PKGDEST', d, 1)
                root = "%s/%s" % (pkgdest, pkg)

                lf = bb.utils.lockfile(root + ".lock")

For some reason it evaluates curl-sdk PV as 7.19.0 in there.

curl-sdk builds fine on its own, it only fails when it's built after the 
target one. I guess workaround would be to match the version numbers of 
target, native and sdk recipes...

Any ideas? Thanks in advance.

-- 
Denys



Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OpYJI-0002YE-0c
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 05:11:57 +0200
Received: by wyg36 with SMTP id 36so4868202wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 20:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=7kAtdppZJaCy+uqhMJUbkyfXqmFGMNi/C40IC6Q+uy4=;
	b=P+ZWYeETEncrwl8i0B9m0XY0GSUIT3agdRvpd8eAL5Plg6O6mzaTBHOZ7AIvfKcJF7
	fawtBdkt3nt9s2U1tomh4p7l3GNvHlX37cqVbmEgkd1VMlLOgeJBajbTv4U8W2tznVU1
	ZVGRX7l13ecunxH7pYUvBLwaNLt8v8eLMH4Yk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=HWIV99dUSLuoddX3BdpwuF7GpFjZprwXTVGekGbmVqb4K6fap8gg4afuR0Ks2Cqj60
	FGiEeKMlut+zMfTDlVsgCAkdbvt/9fCJUWSM4oQ81RXen82NUlr2NOKAjPa4CJ0KeNmr
	G6oknCoiTXjirx8DvpPViPYi3OW/sop4mT4Os=
MIME-Version: 1.0
Received: by 10.216.154.206 with SMTP id h56mr2857144wek.111.1283051485491;
	Sat, 28 Aug 2010 20:11:25 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Sat, 28 Aug 2010 20:11:25 -0700 (PDT)
Date: Sat, 28 Aug 2010 20:11:25 -0700
Message-ID: <AANLkTi=7Ys9reqVWjN5Byrpt+kagk6EBO-9xLr9ptPFa@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: apr-util_1.3.4 does not build
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
X-List-Received-Date: Sun, 29 Aug 2010 03:11:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am running ubuntu 9.10 with and up to date overo branch of OE and
apr- util will not build gives the following error:

NOTE: Running task 819 of 832 (ID: 9,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
do_qa_configure)
ERROR: This autoconf log indicates errors, it looked at host includes.
Rerun configure task after fixing this. The path was
'/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4'
ERROR: Error in executing:
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb
do_qa_configure failed
ERROR: Task 9 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
do_qa_configure) failed
NOTE: Tasks Summary: Attempted 818 tasks of which 818 didn't need to
be rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb'
failed


I have tried cleaning the recipe and rebuilding with no luck as well
as trying to build from a fresh tmp directory. Though I think I
understand the error I do not know how to go about fixing it with a
proper patch. I would appreciate any help with this.



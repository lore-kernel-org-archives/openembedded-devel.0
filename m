Received: from [64.233.178.245] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JgS2r-0008Qo-5U
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 00:00:01 +0200
Received: by hs-out-0708.google.com with SMTP id 23so2087267hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 15:00:00 -0700 (PDT)
Received: by 10.100.140.15 with SMTP id n15mr17120070and.87.1207000800055;
	Mon, 31 Mar 2008 15:00:00 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 31 Mar 2008 15:00:00 -0700 (PDT)
Message-ID: <c384c5ea0803311500r15a7b84fp2515f3b54ad747a4@mail.gmail.com>
Date: Tue, 1 Apr 2008 00:00:00 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: [Review] Remove /xorg-lib/pixman_* in favor of /libpixman/libpixman_*
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Mar 2008 22:00:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

(lib)pixman is present at two locations:

/libpixman/libpixman_*
/xorg-lib/pixman_*

The latter has a false/redundant DEPENDS = "util-macros
xorg-headers-native" as it includes xorg-lib/xorg-lib-common.inc.

That these are redundant can be tested with the latest 0.9.6 recipes,
present in both directories, which have been *identical* and present
since 2007-11-10.

* I propose to remove the xorg-lib/ ones, as pixman is independent of
X. That's also the way I use it.

* I would like to hear if anyone using X and /libpixman/libpixman
0.9.6 found any problems so far, as I don't use X on my targets (yet).


Regards,
-- 
Leon



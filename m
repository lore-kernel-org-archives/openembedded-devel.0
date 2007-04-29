Received: from [66.249.82.230] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HiD7Y-0007cE-Sg
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2007 19:23:37 +0200
Received: by wx-out-0506.google.com with SMTP id t14so1312394wxc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2007 10:14:28 -0700 (PDT)
Received: by 10.90.89.5 with SMTP id m5mr4741920agb.1177866868818;
	Sun, 29 Apr 2007 10:14:28 -0700 (PDT)
Received: by 10.90.50.5 with HTTP; Sun, 29 Apr 2007 10:14:28 -0700 (PDT)
Message-ID: <c384c5ea0704291014x569592bbhdde78ef780de98d1@mail.gmail.com>
Date: Sun, 29 Apr 2007 19:14:28 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: bb.parse.SkipPackage() messages only shown on -b builds?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Apr 2007 17:23:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

In the past I have been bitten by messages similar to those, and where
I am uncertain how to proceed:

bitbake -vvv -D angstrom-console-image
[...]
DEBUG: No providers of build target glib-2.0 (for
['/home/leon/sandbox/openembedded/org.openembedded.dev/packages/avahi/avahi_0.6.18.bb'])
DEBUG: Removing failed build target glib-2.0
[...]

Obviously something failed, but no further information about why it does.

Running bitbake with -b on the target .bb:

bb.parse.SkipPackage: ${PN} requires native language support.

Why are the SkipPackage messages not shown in the first build?

Regards
-- 
Leon



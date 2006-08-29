Received: from [64.233.162.197] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GI8Bc-0000OE-2u
	for openembedded-devel@openembedded.org; Tue, 29 Aug 2006 20:19:44 +0200
Received: by nz-out-0102.google.com with SMTP id v1so1414150nzb
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 11:17:38 -0700 (PDT)
Received: by 10.65.112.5 with SMTP id p5mr8882112qbm;
	Tue, 29 Aug 2006 11:17:37 -0700 (PDT)
Received: from CUBE ( [82.193.96.237])
	by mx.gmail.com with ESMTP id m1sm6828008nzf.2006.08.29.11.17.36;
	Tue, 29 Aug 2006 11:17:37 -0700 (PDT)
Date: Tue, 29 Aug 2006 21:17:54 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <10110188445.20060829211754@gmail.com>
To: Keith Packard <keithp@keithp.com>, Phil Blundell <pb@handhelds.org>, 
	Matthew Allum <mallum@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Xserver source tree ghosting issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Aug 2006 18:19:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Greetings,

  It appears that freedesktop.org used to host two Xserver CVS trees:
http://webcvs.freedesktop.org/xorg/xserver/xorg
http://webcvs.freedesktop.org/xserver/xserver/

  They apparently were used for different purposes, were not synced
(much) and were used by different projects. Now, "xorg/xserver" was
migrated to GIT, and serves as the base for the releases. The projects
which previously used "xserver" tree switched to these releases and
the GIT tree, just to find out that they lost some code.

  This is in particular the case for Familiar/OpenEmbedded projects,
and an example of the feature which was in "xserver" bit not in
"xorg/xserver", is xcalibrate kdrive server extension by Phil
Blundell,
http://webcvs.freedesktop.org/xserver/xserver/Xext/xcalibrate.c?hideattic=0&view=log .


  Please consider the issue of xcalibrate in particular (there's a
patch against GIT in openebedded repo, xcalibrate.patch), and in
general, the issue of the two trees, one of which appears to be
forsaken, while contains/may contain important changes.


Thank you,

-- 
 Paul                          mailto:pmiscml@gmail.com




Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1IGYoT-0005my-EE
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 13:25:53 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 712866284BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2007 13:23:52 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46B1B6DB.6020603@klever.net>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>
Date: Thu, 02 Aug 2007 13:23:51 +0200
Message-Id: <1186053831.5972.222.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
Subject: Re: Gstreamer and rpath
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
X-List-Received-Date: Thu, 02 Aug 2007 11:25:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Michael Krelin wrote:
> I don't know much about gstreamer, but being inventor of
> OE_LT_RPATH_ALLOW I felt obliged to look into gst-plugins.inc and I'm
> guessing it should be:

Maybe it would be better to not break build environment and then work
around consequent errors by hacks like OE_LT_RPATH_ALLOW,
never-ever-do-rpath.patch etc.

gcc has --sysroot which can do required linking without any hacks.

To fix this overall see:

http://bugs.openembedded.org/show_bug.cgi?id=2713
get rid references to temporary directories on installed system

I failed to find proper place to change OE-wide values for cross- CC,
CC, CPP, CXX, LD,... Can anybody tell me, where they are defined?

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus




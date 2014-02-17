Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id BA9F16E71A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 21:46:22 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1500LCBTTBRO20@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	17 Feb 2014 15:46:23 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 66D2420173; Mon,
	17 Feb 2014 16:46:23 -0500 (EST)
Date: Mon, 17 Feb 2014 16:46:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140217214623.GU22890@denix.org>
References: <CAP71Wjy4dxnDZFb3x_5zPg5HV-VOakeYtFz+8o0h2xk08R1=zQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP71Wjy4dxnDZFb3x_5zPg5HV-VOakeYtFz+8o0h2xk08R1=zQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Andre McCurdy <andre.mccurdy@entropic.com>
Subject: Re: [meta-qt5] why does Qt5 build with ARM_INSTRUCTION_SET = "arm"
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
X-List-Received-Date: Mon, 17 Feb 2014 21:46:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 17, 2014 at 02:27:51PM -0700, Nicolas Dechesne wrote:
> hi,
> 
> does anybody know why in Qt5/qtbase.inc, we have:
> 
> ARM_INSTRUCTION_SET = "arm"
> 
> Could it be an a low hanging fruit from the past? e.g. before
> https://bugreports.qt-project.org/browse/QTBUG-16402 or
> https://qt.gitorious.org/qt/qtbase/commit/a3bd9d4c0f3d9e80dbe35bd88649b245dca5f410?

Hmm, I would assume that's here from 4.8 days, although I haven't tried 
dropping that line for latest Qt5... Would make sense to do some more testing.


> as a matter of fact, for our project Qt5 (and QtWebkit) are building
> (and working fine) when built with Thumb2, outside of OE. Also using
> ARM instruction set instead of Thumb2 enforces Webkit to use the ARM
> version of the javascript JIT, while the Thumb2 JIT engine seems to
> work a lot better in our testing...

Seems like worth the effort to re-test the need for that setting. Unless 
someone else has tried it already and found out the issue is still there

-- 
Denys


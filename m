Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id D4F3B6E7BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 19:13:33 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N150013HMQMSL60@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	17 Feb 2014 13:13:35 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 83131200BE; Mon,
	17 Feb 2014 14:13:34 -0500 (EST)
Date: Mon, 17 Feb 2014 14:13:34 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140217191334.GR22890@denix.org>
References: <CAMCfZKG5Pk5W4nuDQvTrJb1CHdrTmKNBdN2_nkOmr9PfX_0b=w@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMCfZKG5Pk5W4nuDQvTrJb1CHdrTmKNBdN2_nkOmr9PfX_0b=w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: mpeg2dec license
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
X-List-Received-Date: Mon, 17 Feb 2014 19:13:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 17, 2014 at 03:50:59PM -0300, Diego Sueiro wrote:
> Folks,
> 
> Why mpeg2dec is pointing to a "commercial" license type since it's COPYING
> file and project website mentions GPLv2?
> Is there something I'm missing?

LICENSE = "GPLv2+"
LICENSE_FLAGS = "commercial"
LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
file://include/mpeg2.h;beginline=1;endline=22;md5=ead62602d4638329d3b5b86a55803154"

http://cgit.openembedded.org/openembedded-core/commit/?id=43410523a07d9eb52a7d57ae3dc1cc320cbbc6f9

The code is still marked as GPLv2+, but the flag is set as commercial due to 
MPEG2 licensing agreement - basically, you are required to pay licensing fees 
to MPEG LA in order to use MPEG2 codec:

http://www.mpegla.com/main/programs/M2/Pages/Agreement.aspx
http://en.wikipedia.org/wiki/MPEG-2#Patent_pool

-- 
Denys


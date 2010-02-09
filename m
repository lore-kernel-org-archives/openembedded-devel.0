Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Nexy4-0006pA-Ln
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 22:50:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id CA8014BCA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2010 16:47:28 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24087-09 for <openembedded-devel@lists.openembedded.org>; 
	Tue,  9 Feb 2010 16:47:28 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 9FA0D4BC8D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2010 16:47:28 -0500 (EST)
Message-ID: <4B71D7F0.6070706@cbnco.com>
Date: Tue, 09 Feb 2010 16:47:28 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <C791CD9B.22735%jgrant@vml.com>
	<18e217241002080848t193add2drd5603d0c252ee509@mail.gmail.com>
In-Reply-To: <18e217241002080848t193add2drd5603d0c252ee509@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Working with OEMs
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
X-List-Received-Date: Tue, 09 Feb 2010 21:50:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

C Michael Sundius wrote:
> Further, I wonder if there are others out there who also feel
> this way? My understanding is that Monta Vista is using OE; are there voices
> on this list from MV or others that use OE for creating a consistent means
> of building for developers and Config/Release Managers? If so, what are your
> tricks and complaints with respect to this issue.

Hi Mike,

I'm using COLLECTIONS, the srctree and gitver classes, plus amend.inc. I 
think all of the above come from Chris at MV. It's about three billion 
times better than the custom build system we had before.

We have four trees:

- public: playground for new recipes before submitting to OE; also, 
amend.inc's to tweak packaging behaviour or configure flags.
- private: recipes to build closed-source drivers from our suppliers;
- oe: full org.openembedded.dev;
- proj: git repos for internal projects get cloned here, and added to 
COLLECTIONS with wildcards

Building the internal projects with OE means they barely even need to be 
cross-compile aware. All they need is a simple Makefile, and a git tag 
to set the package version. It's way easier than writing a one-off build 
system for each project.

The only problem is that bitbake takes forever to start up: COLLECTIONS 
causes a re-exec of Python, I think, and there are about 8,000 recipes 
in the tree. But we get around it by passing in a specific recipe file 
with -b.

For release management, I have a class that creates a list of the .deb 
packages that would have gone into an image, and a script that checks 
them into the right place in CVS. If you use Angstrom I think you get 
the same list for free every time you build an image. The class just 
saves me from waiting for rootfs to run.

Mike



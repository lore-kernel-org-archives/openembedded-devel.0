Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LwNj6-0005SX-Vu
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 23:42:01 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090421213732.LSX6112.fed1rmmtao102.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 17:37:32 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id iMdX1b0074dMFYL03MdXU6; Tue, 21 Apr 2009 17:37:31 -0400
X-Authority-Analysis: v=1.0 c=1 a=cjLNA8OfJ9QA:10 a=ZxtmPpjDU2cA:10
	a=VW0r-LrmZRzN9_kUWHQA:9 a=lxceld_hI-AiWDxNMg4A:7
	a=ZphHOA3C8W7_dvOCTls5PNUDj58A:4
X-CM-Score: 0.00
Date: Tue, 21 Apr 2009 14:37:31 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090421213731.GN17629@smtp.west.cox.net>
References: <1238399997-6016-1-git-send-email-khimov@altell.ru>
	<20090421204132.GL17629@smtp.west.cox.net>
	<gslcfj$t2k$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gslcfj$t2k$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] image.bbclass: reorder do_rootfs
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
X-List-Received-Date: Tue, 21 Apr 2009 21:42:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2009 at 11:05:55PM +0200, Koen Kooi wrote:
> On 21-04-09 22:41, Tom Rini wrote:
>> On Mon, Mar 30, 2009 at 11:59:57AM +0400, Roman I Khimov wrote:
>>
>>> Places do_rootfs function before do_install in image creation process.
>>>
>>> This change allows multiimage builds, when one image depends on another (before
>>> that second image creation raced with do_rootfs for the first one) and uses
>>> it for some purpose.
>>>
>>> Multiimage builds are useful in situations like creating an installer image
>>> with initramfs (built in OE) and an image of the target FS (also built in OE)
>>> or for building virtualized system images to be placed on target FS.
>>
>> So, the problem we have happen is that opkg (or dpkg or ...) gets into a
>> race because>1 image are trying to muck around in ${TMPDIR}/rootfs,
>
> No, there's a lockfile for that, otherwise 'bitbake foo-image bar-image'  
> wouldn't work (it didn't for a long time).

My snapshot is slighlty stale, but with BB_NUMBER_THREADS >1 it doesn't.
Lemme go fire up a build real quick in my current checkout tho..

-- 
Tom Rini



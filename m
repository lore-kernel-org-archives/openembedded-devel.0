Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lc9VS-0002WK-NW
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 03:28:19 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090225022510.HTTT16134.fed1rmmtao104.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 21:25:10 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id L2R71b00E4dMFYL042R7Sx; Tue, 24 Feb 2009 21:25:10 -0500
X-Authority-Analysis: v=1.0 c=1 a=WjrIhNZC0vwndm_NoNMA:9
	a=DVu7JhKTQqq7A5KhhOgA:7 a=pcDzRrTJ4QQEVXulo4-ZL-fmvf0A:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 24 Feb 2009 19:25:07 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090225022507.GP2172@smtp.west.cox.net>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda>
	<8763izyarp.fsf@neumann.lab.ossystems.com.br>
	<fce2a370902241036y359e2c7cv1126a62c8627d2bb@mail.gmail.com>
	<20090224185059.GL2172@smtp.west.cox.net>
	<87wsbfw9zy.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <87wsbfw9zy.fsf@neumann.lab.ossystems.com.br>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: checksums situation
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
X-List-Received-Date: Wed, 25 Feb 2009 02:28:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 24, 2009 at 11:01:05PM -0300, Otavio Salvador wrote:
[snip]
> I do belive that the best way to solve it is to have a md5 file together
> with the .bb recipe. This solves the problems for forks, derivatives and
> also makes harder to just use "cat tmp/checksums.ini >> conf/checksums.ini".

Running a script that will make the .sum file isn't any harder really.
And it's still a "this is the checksum we downloaded" not "this is the
checksum upstream says is correct".

> Doing that we'll have a clear way to add the required content, avoid the
> mirror and URL issues and also make simple to forget about useless
> entries in the metadata repository.
> 
> Obviously, it is a little more difficult to add the contents but I
> believe that it will enforce more checking by our side before changing a
> hash.

I think there's enough eyes on things now such that people don't just
change checksums.ini and not get called out on it.  But that's still an
aside.

-- 
Tom Rini



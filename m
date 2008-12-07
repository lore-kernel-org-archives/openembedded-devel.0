Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L9Q1r-0004CT-0E
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 21:14:59 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081207201108.JOGP8485.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sun, 7 Dec 2008 15:11:08 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id oLB71a00C1E665w04LB7ne; Sun, 07 Dec 2008 15:11:07 -0500
X-Authority-Analysis: v=1.0 c=1 a=ZsG32m1HjQCr_ES-F8YA:9
	a=Bi-fvjrfDcDTBb0qjCDtAeIwi_UA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 7 Dec 2008 13:11:18 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081207201118.GD15204@smtp.west.cox.net>
References: <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<d2b9ea600810211323y1dd1fc11i585f26f044696de9@mail.gmail.com>
	<20081202174141.GB16628@smtp.west.cox.net>
	<1228250322.5456.70.camel@dax.rpnet.com>
	<20081202212155.GG16628@smtp.west.cox.net>
	<20081206214525.GJ16628@smtp.west.cox.net>
	<20081207193340.GC15204@smtp.west.cox.net>
	<ghha1f$ugd$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ghha1f$ugd$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Canadian SDK support
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
X-List-Received-Date: Sun, 07 Dec 2008 20:14:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 07, 2008 at 09:00:47PM +0100, Koen Kooi wrote:
> On 07-12-08 20:33, Tom Rini wrote:
>
>> As an aside, gcc-cross-sdk on arm(v6 only?) is blowing up in fortran,
>> but I've got a git bisect narrowing that down now (30 revs left).
>
> gcc-cross-sdk picks the wrong patch (from files/gfortran.patch) instead  
> of the correct one from gcc-4.2.4/gfortran.patch. gcc-cross *does* pick  
> the right patch.

For gcc-4.2.4.inc would it be OK to rename gfortran.patch to
gfortran-4.2.4.patch and fix this problem?

-- 
Tom Rini



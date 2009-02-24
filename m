Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lc0JS-0000vy-OO
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 17:39:19 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090224163609.UABZ2948.fed1rmmtao101.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 11:36:09 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id Ksc81b00F4dMFYL03sc8J2; Tue, 24 Feb 2009 11:36:08 -0500
X-Authority-Analysis: v=1.0 c=1 a=xT2cSXgipxKjdyq02GgA:9
	a=1ZUHTDXQChDSdHQpETkA:7 a=CT7tZsWKkALcVqlUndhlx0oNEjwA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 24 Feb 2009 09:36:08 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090224163608.GI2172@smtp.west.cox.net>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda>
	<49A4203E.3060202@balister.org>
MIME-Version: 1.0
In-Reply-To: <49A4203E.3060202@balister.org>
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
X-List-Received-Date: Tue, 24 Feb 2009 16:39:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 24, 2009 at 11:28:46AM -0500, Philip Balister wrote:
> Michael 'Mickey' Lauer wrote:
>> Am Montag, den 23.02.2009, 23:46 -0700 schrieb Tom Rini:
>>> I'm going to make a different suggestion.  Lets just drop it. 
>>
>> I'm in favour of this. I don't think they give us the safety we want and
>> they introduce more inconvenience.
>
> Drop checksum checking? I am not in favour of this. The check does  
> provide valuable reassurance that the source's are not changing in  
> "funny" ways. This is valuable data for many people.
>
> We have ways of disabling the checks for people who are less concerned  
> with image integrity.
>
> I agree the current implementation is not perfect, but it is a good  
> compromise.
>
> The only thing I would like to see is a way to keep a local checksums  
> file for people using overlays and other out of tree sw.

So in the case of "I care if the file changed under me" what we have now
is OK.  But it's worthless in the case of "I care that the file is what
upstream says it should be".

-- 
Tom Rini



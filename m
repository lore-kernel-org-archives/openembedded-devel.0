Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LPlsS-00087Y-Ar
	for openembedded-devel@openembedded.org; Wed, 21 Jan 2009 23:48:52 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090121224136.FQYT12540.fed1rmmtao106.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 21 Jan 2009 17:41:36 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id 6Nhd1b0031E665w04NhdZc; Wed, 21 Jan 2009 17:41:37 -0500
X-Authority-Analysis: v=1.0 c=1 a=3Ti2wQrTUiQA:10 a=H0KbiYiYTioA:10
	a=JEgeQjq9DPK14JHP4ZYA:9 a=2F2I-gMtGAStq7VephgA:7
	a=qG9ks5E-sQxwBAgI8b-gAkO1gQYA:4 a=UcWZWmDdwLsA:10 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 21 Jan 2009 15:41:36 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090121224136.GG5233@smtp.west.cox.net>
References: <gl7r2t$sge$1@ger.gmane.org> <49777438.8070108@balister.org>
	<gl7tcr$55v$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gl7tcr$55v$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Add option for strict checksumming, was: Re:	checksums...
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
X-List-Received-Date: Wed, 21 Jan 2009 22:48:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 21, 2009 at 08:34:51PM +0100, Koen Kooi wrote:
> On 21-01-09 20:15, Philip Balister wrote:
>> Koen Kooi wrote:
>>> Hi,
>>>
>>> Could people adding new recipe and people git-am'ing patches adding
>>> new recipes please add the corresponding checksums to checksums.ini?
>>>
>>> It's not hard:
>>>
>>> 1) bitbake <recipe>
>>> 2) watch it fail
>>> 3) cd $TMPDIR ; cat /OE/org.openembedded.dev/conf/checksums.ini >>
>>> checksums.ini ; python
>>> /OE/org.openembedded.dev/contrib/source-checker/oe-checksums-sorter.py
>>> checksums.ini > /OE/org.openembedded.dev/conf/checksums.ini
>>> 4) git commit --amend /OE/org.openembedded.dev/conf/checksums.ini
>>
>> I screwed this up once (and committed a recipe without the checksum)
>> when I left ALLOW_INSECURE_DOWNLOADS set in my local.conf. Now I have it
>> commented out and am really careful only to use it only when hacking.
>
> What about this:
>
> From a48ee59ac6ea569a5f88066d86de4b66d8f606c3 Mon Sep 17 00:00:00 2001
> From: Koen Kooi <koen@openembedded.org>
> Date: Wed, 21 Jan 2009 20:29:53 +0100
> Subject: [PATCH] base.bbclass: only error out on missing checksums when  
> OE_STRICT_CHECKSUMS is set
>  * we want to error out on non-matching sums, missing ones are less bad

This will bring us back to where we started.  I think we just need to
live with the pain a bit more and get people used to "Oops, no checksum
in your patch" ...

And btw, git commit --amend will let you change things in the last
commit you made.  ONLY do this if you haven't also done a push.

-- 
Tom Rini



Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Nl8at-0000rU-DQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 23:23:35 +0100
Received: by bwz5 with SMTP id 5so456285bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 14:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=izSUQBEPIRtwfR1G8KUVwGXgZDeLF8NAXLtvsODoVMg=;
	b=sk8CRbdK1lLoJ47kiIUcs4HZ5uJ281Au+v/oeqqblOmYeLFthFGOXJREIxJfNLgUDH
	khGOx1Hf62NL1lHQG3MmsgewxqmZoDQSUYK/yn4Xr9PD5r3l6bITW6xFxl1Y7RbA7g8W
	YbcJ4KdBg4bMvemBoDwb/5wyXQbIrantcMbXw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=n/N3cIog/w28I9wAfhHZBPLkKT1fUd3yTfSlAKvqG5U5qTBvZ5ltgM/w5vU5/E6Hm0
	quHRFquZ+OEX3jS/9I5ZVGwFwVuSAU545cXQUQY//MFa7K3BVo7ONVKrNMh7L/aQFADN
	OMetbEfhU44I8k/nJNTosY5HI5d7/Owowub4E=
Received: by 10.204.8.73 with SMTP id g9mr719791bkg.146.1267222847774;
	Fri, 26 Feb 2010 14:20:47 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 16sm380686bwz.13.2010.02.26.14.20.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 14:20:47 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Nl8e2-0008Ty-Te; Fri, 26 Feb 2010 23:26:50 +0100
Date: Fri, 26 Feb 2010 23:26:50 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100226222650.GG30265@mx.loc>
References: <1266951776.18176.47.camel@trini-m4400>
	<4B87EC32.6030807@mwester.net> <hm93de$tnt$1@dough.gmane.org>
	<18e217241002261221u5f43eaebn19a52e6b86a22c00@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <18e217241002261221u5f43eaebn19a52e6b86a22c00@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Fri, 26 Feb 2010 22:23:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 26, 2010 at 12:21:56PM -0800, C Michael Sundius wrote:
>On Fri, Feb 26, 2010 at 10:20 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 26-02-10 16:43, Mike Westerhof wrote:
>> > Tom Rini wrote:
>> >> I was about to just push this and I noticed that a number of
>> >> distributions (SlugOS, Angstrom, Kaelios, micro) currently set
>> >> FEATURE_SUID=y, but it's not actually install SUID.  And since I recall
>> >> some way-back-when's of "busybox SUID is dangerous / crap!", I thought
>> >> it best to post the patch first and let folks speak up / ask me to drop
>> >> FEATURE_SUID=y when I do this.  So, here's the patch:
>> >
>> > In the case of SlugOS, this was deliberate -- the thinking was that we
>> > would let the user decide if they wanted to run busybox SUID after
>> > installation.  In retrospect, that actually led to more problems than
>> > good, so this change gets an ACK from me (albeit late - sorry for the
>> > delay!)
>>
>> The same logic was applied to angstrom "let users sort it out", but I
>> think this patch is a better way to go.
>>
>>
>just to give you a heads up, we're currently working on a patch to busybox
>(and well have an OE recipe for it too) which will allow us to currently
>create two busybox executables: busybox-suid and busybox-nsuid. this way we
>can have the best of both worlds. maintain suid for programs that really
>require it while keeping the likes of ls and cat safe for the masses...

SUID_DROP applets do just that before the individual applet_main is called,
i.e. drops privs. But whatever..
If you really think you want to build the thing twice then i'd try
FEATURE_SHARED_BUSYBOX, fyi.
$ size 0_lib/{busybox,libbusybox.so.1.17.0.git}
   text	   data	    bss	    dec	    hex	filename
   1379	    520	     16	   1915	    77b	0_lib/busybox
 339569	   6705	   8552	 354826	  56a0a	0_lib/libbusybox.so.1.17.0.git

duplicating 2k is better than duplicating all the innocent rest, but maybe
that's just me..

cheers,

>once its through our internal review, we'll send it out.



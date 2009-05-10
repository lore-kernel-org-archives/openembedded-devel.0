Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M3H2M-0001iE-SM
	for openembedded-devel@openembedded.org; Sun, 10 May 2009 23:58:24 +0200
Received: (qmail 14134 invoked from network); 10 May 2009 21:51:54 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 10 May 2009 14:51:54 -0700
Date: Sun, 10 May 2009 14:51:54 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090510215154.GA7973@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<20090429161224.GB18788@smtp.west.cox.net> <49FCA524.10102@dls.net>
	<c384c5ea0905030529n585de20awfcc6bb835a282483@mail.gmail.com>
	<20090503165318.GA7973@smtp.west.cox.net>
	<20090510194704.GZ7973@smtp.west.cox.net>
	<gu7ff8$cmr$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gu7ff8$cmr$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Sun, 10 May 2009 21:58:26 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, May 10, 2009 at 11:03:36PM +0200, Koen Kooi wrote:
> On 10-05-09 21:47, Tom Rini wrote:
>> On Sun, May 03, 2009 at 09:53:18AM -0700, Tom Rini wrote:
>>> On Sun, May 03, 2009 at 02:29:53PM +0200, Leon Woestenberg wrote:
>>>> Hello,
>>>>
>>>> On Sat, May 2, 2009 at 9:55 PM, Mike (mwester)<mwester@dls.net>  wrote:
>>>>> Acked-by: Mike Westerhof<mwester@dls.net>
>>>>>
>>>> I think we can add this functionality now.
>>>>
>>>> By the recent merge of "micro.conf" and "micro-uclibc.conf", a new
>>>> TODO is to merge the LIBC feature into micro distro as well.
>>>> See "[oe] Pull request from DoréDevelopment - New: Micro distro/image"
>>>
>>> I'll push this out Monday AM us.  IMHO, for micro and micro-uclibc (and
>>> similar for minimal/minimal-uclibc) is to merge them back into one and
>>> make LIBC an easy override.
>>
>> So, here's a problem we've run into now.  With distros that use
>> debian.bbclass, having an OVERRIDE of 'glibc' added causes the glibc
>> recipe to not create a 'glibc' package, nor a 'libc6' package.  The
>> libc6-dev package is created.
>
> I suspect that's because ${PN} ('glibc') is now in overrides twice, try  
> changing the override to libc-glibc or something similar.

Testing now.  But that means we'll be doing overrides like:
SRC_URI_libc-uclibc += "file://fixes-for-uclibc.patch;patch=1"
Not too wierd looking?  Otherwise, is there somewhere we can do,
roughly, sort -u, on ${OVERRIDES} ?  And not require a new bitbake for
everyone?

-- 
Tom Rini



Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LyU8Z-0001O8-J9
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 18:56:59 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090427165153.HCNZ16134.fed1rmmtao104.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 12:51:53 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id kgrs1b00P4dMFYL04grt5P; Mon, 27 Apr 2009 12:51:53 -0400
X-Authority-Analysis: v=1.0 c=1 a=FWpWOkutOBYA:10 a=GclPNJOSj40A:10
	a=22pK5S-mAAAA:8 a=Q7rD2lDuXG_I_rOiZLYA:9
	a=ZiT5myD65W6oWNcsvdWy5sK2qwAA:4
X-CM-Score: 0.00
Date: Mon, 27 Apr 2009 09:51:52 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090427165152.GN18788@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<gt4j8d$u5m$1@ger.gmane.org>
	<20090427154342.GM18788@smtp.west.cox.net>
	<gt4nef$e8l$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gt4nef$e8l$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
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
X-List-Received-Date: Mon, 27 Apr 2009 16:57:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2009 at 06:45:02PM +0200, Koen Kooi wrote:
> On 27-04-09 17:43, Tom Rini wrote:
>> On Mon, Apr 27, 2009 at 05:33:31PM +0200, Koen Kooi wrote:
>>> On 27-04-09 16:19, Tom Rini wrote:
>>>> Hey all.  I've created a new branch, trini/add-libc-overrides which does
>>>> the following:
>>>> - Make every distro declare PREFERRED_LIBC, either outright or
>>>>     overridable.
>>>
>>> ACK on the idea, NACK on the implementation.
>>>
>>> ANGSTROMLIBC is called ANGSTROMLIBC and not ANGSTROM_LIBC for a reason,
>>> since you can't pass env vars with underscores throught bitbake:
>>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2008-December/007258.html
>>
>> OK.  But what about ANGSTROM_GCC_VERSION ?  I've been passing that in
>> via BB_ENV_EXTRAWHITE for a while and it's working, as far as I can
>> tell.
>
> With bitbake 1.8.12? If it's fixed in bitbake svn, great!

Yeap.  Even double-checked my build-dirs to be sure,
tmp.4.1.2/work/armv6... has gcc-4.1.2 stuff in it.

-- 
Tom Rini



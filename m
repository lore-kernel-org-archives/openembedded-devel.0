Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LyUpe-0008EM-7z
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 19:41:30 +0200
Received: (qmail 7615 invoked from network); 27 Apr 2009 17:36:25 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 27 Apr 2009 10:36:25 -0700
Date: Mon, 27 Apr 2009 10:36:25 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090427173625.GP18788@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<gt4j8d$u5m$1@ger.gmane.org>
	<20090427154342.GM18788@smtp.west.cox.net>
	<gt4nef$e8l$1@ger.gmane.org>
	<20090427165152.GN18788@smtp.west.cox.net>
	<49F5EC3B.1020505@balister.org>
MIME-Version: 1.0
In-Reply-To: <49F5EC3B.1020505@balister.org>
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
X-List-Received-Date: Mon, 27 Apr 2009 17:41:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2009 at 01:32:43PM -0400, Philip Balister wrote:
> Tom Rini wrote:
>> On Mon, Apr 27, 2009 at 06:45:02PM +0200, Koen Kooi wrote:
>>> On 27-04-09 17:43, Tom Rini wrote:
>>>> On Mon, Apr 27, 2009 at 05:33:31PM +0200, Koen Kooi wrote:
>>>>> On 27-04-09 16:19, Tom Rini wrote:
>>>>>> Hey all.  I've created a new branch, trini/add-libc-overrides which does
>>>>>> the following:
>>>>>> - Make every distro declare PREFERRED_LIBC, either outright or
>>>>>>     overridable.
>>>>> ACK on the idea, NACK on the implementation.
>>>>>
>>>>> ANGSTROMLIBC is called ANGSTROMLIBC and not ANGSTROM_LIBC for a reason,
>>>>> since you can't pass env vars with underscores throught bitbake:
>>>>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2008-December/007258.html
>>>> OK.  But what about ANGSTROM_GCC_VERSION ?  I've been passing that in
>>>> via BB_ENV_EXTRAWHITE for a while and it's working, as far as I can
>>>> tell.
>>> With bitbake 1.8.12? If it's fixed in bitbake svn, great!
>>
>> Yeap.  Even double-checked my build-dirs to be sure,
>> tmp.4.1.2/work/armv6... has gcc-4.1.2 stuff in it.
>
> What bitbake is in the stable branch? We should be careful forcing dev  
> to diverge stable for at least a few months ....
>
> Of course, we can update .stables bitbake also.

Stable is .12 as well.  There's a few nice cleanups that Chris has done
that don't quite work with .12, but do with what's in development
(COLLECTIONS for example) so we need to think about this problem for
other reasons :)

-- 
Tom Rini



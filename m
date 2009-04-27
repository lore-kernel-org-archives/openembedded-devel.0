Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LyT4Z-0002IX-CV
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 17:48:47 +0200
Received: (qmail 7137 invoked from network); 27 Apr 2009 15:43:42 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 27 Apr 2009 08:43:42 -0700
Date: Mon, 27 Apr 2009 08:43:42 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090427154342.GM18788@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<gt4j8d$u5m$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gt4j8d$u5m$1@ger.gmane.org>
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
X-List-Received-Date: Mon, 27 Apr 2009 15:48:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2009 at 05:33:31PM +0200, Koen Kooi wrote:
> On 27-04-09 16:19, Tom Rini wrote:
>> Hey all.  I've created a new branch, trini/add-libc-overrides which does
>> the following:
>> - Make every distro declare PREFERRED_LIBC, either outright or
>>    overridable.
>
> ACK on the idea, NACK on the implementation.
>
> ANGSTROMLIBC is called ANGSTROMLIBC and not ANGSTROM_LIBC for a reason,  
> since you can't pass env vars with underscores throught bitbake:  
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2008-December/007258.html

OK.  But what about ANGSTROM_GCC_VERSION ?  I've been passing that in
via BB_ENV_EXTRAWHITE for a while and it's working, as far as I can
tell.

But, OK, I'll redo it as PREFERREDLIBC and get a new branch up soon.

-- 
Tom Rini



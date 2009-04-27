Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LyU2D-0001Gs-Ik
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 18:50:25 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LyTxJ-0002Fo-Sc
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 16:45:22 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 16:45:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 16:45:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 27 Apr 2009 18:45:02 +0200
Message-ID: <gt4nef$e8l$1@ger.gmane.org>
References: <20090427141943.GG18788@smtp.west.cox.net>	<gt4j8d$u5m$1@ger.gmane.org>
	<20090427154342.GM18788@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090421 Shredder/3.0b3pre
In-Reply-To: <20090427154342.GM18788@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Mon, 27 Apr 2009 16:50:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-04-09 17:43, Tom Rini wrote:
> On Mon, Apr 27, 2009 at 05:33:31PM +0200, Koen Kooi wrote:
>> On 27-04-09 16:19, Tom Rini wrote:
>>> Hey all.  I've created a new branch, trini/add-libc-overrides which does
>>> the following:
>>> - Make every distro declare PREFERRED_LIBC, either outright or
>>>     overridable.
>>
>> ACK on the idea, NACK on the implementation.
>>
>> ANGSTROMLIBC is called ANGSTROMLIBC and not ANGSTROM_LIBC for a reason,
>> since you can't pass env vars with underscores throught bitbake:
>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2008-December/007258.html
>
> OK.  But what about ANGSTROM_GCC_VERSION ?  I've been passing that in
> via BB_ENV_EXTRAWHITE for a while and it's working, as far as I can
> tell.

With bitbake 1.8.12? If it's fixed in bitbake svn, great!

regards,

Koen




Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lr5M5-0006RK-MN
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 09:08:23 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lr5JH-00082T-DC
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 07:01:27 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 07 Apr 2009 07:01:27 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 07 Apr 2009 07:01:27 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 07 Apr 2009 09:01:16 +0200
Message-ID: <gretns$4ts$1@ger.gmane.org>
References: <49DA2F2C.60008@bolloretelecom.eu>
	<19c1b8a90904061449s1cc1c4e6pb1c04f2c71cc6beb@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <19c1b8a90904061449s1cc1c4e6pb1c04f2c71cc6beb@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Scanned: No (on linuxtogo.org); SA Timed out after 240 secs
Subject: Re: [RFC] make "LDFLAGS ignored" QA errors fatal
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
X-List-Received-Date: Tue, 07 Apr 2009 07:08:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06-04-09 23:49, Khem Raj wrote:
> On 4/6/09, Jeremy Lainé<jeremy.laine@bolloretelecom.eu>  wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> I have spent quite some time cleaning up a bunch of recipes which were
>> triggering "LDFLAGS ignored" QA errors, and I don't really want to
>> have to do this again in the future. I suggest we stop whitelisting
>> this kind of QA error, using the attached patch.
>>
>> To track down the faulty packages I have made use of oestats output
>> (note that not all QA errors are "LDFLAGS ignored"):
>>
>> http://tinderbox.openembedded.net/packages/?qalog=1
>>
>> In most cases, the problem is that recipes simply pass
>> - -L${STAGING_LIBDIR} as LDFLAGS instead of using the full ${LDFLAGS}
>> variable. The result is that flags such as --hash-style=gnu are
>> getting ignored.
>
> I think we should configure toolchain to pass this flags by gcc driver
> while linking instead of making it a part of LDFLAGS it should help in
> recipes which use gcc to link.

While that would improve the situation a bit, it would also mean that 
we'll have a harder time detecting which recipes ignore LDFLAGS.

regards,

Koen




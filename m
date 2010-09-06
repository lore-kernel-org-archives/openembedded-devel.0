Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <captain.deadly@gmail.com>) id 1OsiPu-0003Tf-Ob
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 22:35:57 +0200
Received: by wye20 with SMTP id 20so5105041wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 13:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:x-enigmail-version:content-type:content-transfer-encoding;
	bh=M0QX+de4b4aBIv1JIHGpOjU8mAkQoYdDjeoAuuXi3oU=;
	b=cJ7Sfb4MdjG1+AgACF5edtM6Iv/NuhUS/JChajvOZhwMaG0YOM9xeYdrdhp0OAsKPj
	IdJcLv9DzxZYZ4uK3aZ0R5U7YxAIdugJpJO1V81Ey49asmEl03V6glPqrc9BbyLkn9qW
	OT1Ut0qmJFmxndu3kmgByi3KOkxy2xapeW9bU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=KUzQqFe9jiqDvqYkF1oLxfvSKTyu3AFvXFmKe0JOM+a1fBTk8miAH5DHZhnzolb2cY
	zpX0nIV2/ggWdv0q7gT3ApJVVBV2vvdJSCxllVTb9Q0iandNqAn+stgzUNk3CM1I6uq0
	lZiP4NoRLq8yynYCGVS1fHZzNrtJkCc+HKW7M=
Received: by 10.216.185.211 with SMTP id u61mr684236wem.12.1283805301562;
	Mon, 06 Sep 2010 13:35:01 -0700 (PDT)
Received: from [192.168.100.100] (mobileinternet4.o2.ie [62.40.32.14])
	by mx.google.com with ESMTPS id o49sm3623126wej.43.2010.09.06.13.34.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 06 Sep 2010 13:35:00 -0700 (PDT)
Message-ID: <4C85506E.5020708@gmail.com>
Date: Mon, 06 Sep 2010 21:34:54 +0100
From: Arigead <captain.deadly@gmail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTineLTCDtymfwbaAJXcrz0vB=V4++=HOwEA7wQHU@mail.gmail.com>
In-Reply-To: <AANLkTineLTCDtymfwbaAJXcrz0vB=V4++=HOwEA7wQHU@mail.gmail.com>
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: captain.deadly@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libtermcap (was: Re: Asterisk and termcap)
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
X-List-Received-Date: Mon, 06 Sep 2010 20:35:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/9/6 Arigead <captain.deadly@gmail.com>:
>> was trying to build Asterisk for the OpenMoko Free runner and it failed
>> on a dependency on termcap so I tried to bitbake termcap first and that
>> failed. The termcap compile stage is working but it's when it tries to
>> install that the recipe seems to fail but I'm new to this.
>>
>> I'm off to read the openembedded documentation again but in the mean
>> time if anybody can give me a hit that would be great.
> 
> Eric peeked into the termcap problem. I've tested his patch and it
> works. He will probably push a patch later today.
> 
> The termcap problem from asterisk is not related. It cannot find
> libtermcap. This one does not exist any more with ncurses 5.7.
> 
> People how should we fix this? I know it has been discussed before,
> but I don't recall a solution.
> I bumped into this for a different package too. There I fixed things
> by adding a patch, but I am not sure if that is really the desired
> solution.
> 
> Best regards, Frans
> 

thanks a million for that Frans. I'll keep my ears on here and see if an
answer to this comes up.



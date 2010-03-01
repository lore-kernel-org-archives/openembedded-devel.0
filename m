Received: from mail-yw0-f171.google.com ([209.85.211.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nm7SO-0003J9-OD
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 16:22:57 +0100
Received: by ywh1 with SMTP id 1so1129500ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 07:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=oA4Es4AcXONwL2mxdrbgwMVm77gmzrfsqmbFDm7b/9c=;
	b=XdHcPsct56NZCfpiIDD4wtyelyqfiQKSiGbOtZcS0pU0I9MXUBkFNS3EMYXrEO1uDC
	o3QNtd4+l+1b44PhejwCm3s1FoQeOyyZdGjS31/ZjdQTAfjKBrJYirNWzNgun8dloZcM
	LBhpqrJ3OKLdLh9t5hV2FEcVED2ZNGJJJ8XJQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XlLQ4KFzcAsBSn7s8JR2tReV1AGzOcASc7XJ9NqweKYKKG2lpAn4zV7czd+iZ4b1IO
	QDVEJoprN5ayMxUumQ5te50SsLPwbKeYDALTKqyvx6XEF2GLjv834XEMwU6uPNYbyudG
	ECeOXyO9vpYzDxFca92s5LcBqzzOKL42VhOOM=
MIME-Version: 1.0
Received: by 10.101.195.29 with SMTP id x29mr6322987anp.93.1267456802548; Mon, 
	01 Mar 2010 07:20:02 -0800 (PST)
In-Reply-To: <20100301151557.GD15391@denix.org>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<hmeia3$p6c$1@dough.gmane.org>
	<ac9c93b11002281226w3b73d9ebo6c3169dedd1b74c5@mail.gmail.com>
	<6ec4247d1002281340t76447b67hc0457bbf702d38b9@mail.gmail.com>
	<20100301151557.GD15391@denix.org>
Date: Mon, 1 Mar 2010 16:20:02 +0100
Message-ID: <ac9c93b11003010720k5b16ee6ey32abea5202c58f23@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Mon, 01 Mar 2010 15:22:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/1 Denys Dmytriyenko <denis@denix.org>:
> On Mon, Mar 01, 2010 at 08:10:31AM +1030, Graham Gower wrote:
>> On 1 March 2010 06:56, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>> > 2010/2/28 Koen Kooi <k.kooi@student.utwente.nl>:
>> >>
>> >> But more importantly, what harm do the recipes do to you? Does it offend
>> >> you that there are 26 recipes?
>> >
>> > Somewhat yes. Frankly I don't see a use for 26 recipes for all kind of
>> > different versions, some of which are very outdated.
>>
>> What should offend you more is stuff like this:
>>
>> [grg@rak gcc]$ pwd
>> /home/grg/oe/openembedded/recipes/gcc
>> [grg@rak gcc]$ find . -name svn-updates.dpatch -exec ls -l {} \;
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-4.4.2/debian/svn-updates.dpatch
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-4.4.1/debian/svn-updates.dpatch
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-4.3.1/debian/svn-updates.dpatch
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-4.3.3/debian/svn-updates.dpatch
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-4.3.4/debian/svn-updates.dpatch
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-svn/debian/svn-updates.dpatch
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-4.3.2/debian/svn-updates.dpatch
>> [grg@rak gcc]$ grep svn-updates *
>> [grg@rak gcc]$
>
> So, there is 125 MB wasted right there... Thanks for the heads up! :)

Actually probably just 105 MB, guess we need one copy of it :-)

FM
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



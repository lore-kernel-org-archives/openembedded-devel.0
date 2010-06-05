Received: from fg-out-1718.google.com ([72.14.220.158])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1OKu0C-0005C9-QD
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 16:05:33 +0200
Received: by fg-out-1718.google.com with SMTP id 16so298048fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jun 2010 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=PhClIkBXdbbqM31FdJoQkCO9qVBcyLtdi/PBROXKK24=;
	b=deyPN7XDVr1r+xDrbLnSVtE7WqprQgdj7BInK+dMjh5FOm59ZA8D0w1/nRg7S11k5j
	DU7GV3ZQQMkcN7aQ3C51HIRJZ2HuNMt0FZEvji2BdefhX7B3ndlLqNrUhBBZuflObper
	bNAm3NpRyA4K5xTiwUv0Ai/22JsKrVtSDB3/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=w/kyOc2dFyXNWHe00UmgugAlyTkI9nP8z6sm4Jx6FVDzrN6Y0J3N3CCmXNUphBTMnN
	Cq/5F4xBPHwe1Q1XHfnDsK2HH/+faN43lmuEomdKuAcHMR0acUAalM0NADTwhpJHSzTB
	zcV4JMjXWl/A7cG7wOd5JlLrL/m1l/zuZi2jw=
Received: by 10.87.42.2 with SMTP id u2mr19442987fgj.79.1275746477072;
	Sat, 05 Jun 2010 07:01:17 -0700 (PDT)
Received: from [192.168.5.27] (z0701.wist.uni-linz.ac.at [193.171.42.194])
	by mx.google.com with ESMTPS id 1sm3292025fkt.11.2010.06.05.07.01.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Jun 2010 07:01:16 -0700 (PDT)
Message-ID: <4C0A58AA.9050508@gmail.com>
Date: Sat, 05 Jun 2010 16:01:14 +0200
From: =?ISO-8859-1?Q?Matthias_G=FCnther?= <matgnt@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C0992ED.6000102@gmail.com> <hucovl$sbi$1@dough.gmane.org>
	<20100605060300.GS16035@jama>
In-Reply-To: <20100605060300.GS16035@jama>
X-SA-Exim-Connect-IP: 72.14.220.158
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4 upgrade to 4.7.0-beta1
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
X-List-Received-Date: Sat, 05 Jun 2010 14:05:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit


On 05.06.2010 08:03, Martin Jansa wrote:
> On Sat, Jun 05, 2010 at 07:57:09AM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 05-06-10 01:57, Matthias Günther wrote:
>>> Hello.
>>>
>>> I've been working with QML (Qt Quick) for some time now and therefore
>>> I've created recipes for Qt 4.7.0-tp and beta1 versions. The patches
>>> just disable the not cross compiling parts (e.g. some demos/examples).
>>>
>>> Should I send the beta1-patch to the ML or is it better to wait for the
>>> final release?
>>
>> Please send them to the list so we can work out issues before the
>> release happens.
> 
> Matthias: please confirm if they will be the same as you have in 
> http://gitorious.org/~matgnt/angstrom/matgnts-openembedded/commits/qt-4.7
> or create reabased branch there, it will be easier for some testers to
> try your changes :).

I removed the outdated technical preview version, cleaned it up a bit
and rebased onto the latest OE. You can find the temporary branch at:

>http://gitorious.org/~matgnt/angstrom/matgnts-openembedded/commits/tmp-qt-4.7.0-beta1-oe-rebased

Since there have been a lot of changes to OE during the last weeks I'm
currently rebulding from scratch and if everything works fine I will
send the patches to the ML afterwards.

Regards,
Matthias



Return-Path: <marcin@juszkiewicz.com.pl>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 3516A6A9D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:54:39 +0000 (UTC)
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 2E34DD231C; Tue, 11 Jun 2013 10:54:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 3796AD22F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 10:54:12 +0200 (CEST)
Message-ID: <51B6E5AF.4080808@juszkiewicz.com.pl>
Date: Tue, 11 Jun 2013 10:54:07 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130529 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1370165592-15697-1-git-send-email-net147@gmail.com>
	<51AB1684.1080500@juszkiewicz.com.pl>
	<CAMKF1soSa-S9kUC1PH9pJYbnJsvRiubNxbgNvYEx8zs4XiwmLw@mail.gmail.com>
	<51B6D7DA.1060609@juszkiewicz.com.pl>
	<CAMKF1sokFKxLAWEmSOMN15UODnWswpKRZbs79X=ggWvUW2Yepg@mail.gmail.com>
In-Reply-To: <CAMKF1sokFKxLAWEmSOMN15UODnWswpKRZbs79X=ggWvUW2Yepg@mail.gmail.com>
X-Enigmail-Version: 1.4.6
OpenPGP: id=117A251E
Subject: Re: [meta-oe][PATCH] llvm3.2: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 08:54:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 11.06.2013 10:03, Khem Raj pisze:
> On Tue, Jun 11, 2013 at 12:55 AM, Marcin Juszkiewicz
>> W dniu 11.06.2013 09:48, Khem Raj pisze:

>>> why do you think they are worthless ? when they give good information
>>> instead of failing to build and then generating support question
>>> which need more work to come to same conclusion
>>
>> $ MACHINE=genericarmv8 bitbake nano
>> "llvm is not supported"
>> "openjdk is not supported"
>> "another-thing-you-do-not-care-for-this-build is not supported"
> 
> it could be said if you do not care for such recipes then BBMASK them
> and message
> well may be it could be make bb.note instead of bb.warn to make it
> more of FYI kind of thing

"NOTE: llvm does not support aarch64 yet" looks better. But still is
worthless.

>> This is how your builds look for not supported architectures.
>>
>> OE has COMPATIBLE_HOST variable which can be used by recipe maintainers
>> to mark which architectures are supported.

> in this case arch does not map to what OE's target arch is so you have
> to do it twice if you want to use COMPATIBLE_HOST

It has 7 OE architectures: i.86, x86_64, arm, mips(el), powerpc(64)
which are then mapped into 5 llvm ones. Can be gathered into one
COMPATIBLE_HOST (copied from kexec-tools):

COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*|mips.*)-(linux)'

"mips.*" probably needs to be changed to "mips(el)?" to not cover mips64.

> and suppose a non supported arch becomes supported you have to change
> both places.

Once it gets supported you will need to add/edit recipe anyway.


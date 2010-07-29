Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eblima@gmail.com>) id 1OeX3s-0004p9-0Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 19:39:17 +0200
Received: by iwn34 with SMTP id 34so490669iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 10:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=tEZMTZAERKbVORvS/qn+rjBjMKVan2cHZYqfdDVKo9w=;
	b=bcDwVgEK8adzJskwIZ5A0xSVYzIo4S712dOAF33cuILtAJf4ydXg9DJi3Ay/y2iLaz
	1CmBB0AI/VNA/b6DNsUC7RfRp2PnK05iQxiHEaF1aQQnwTLlFHI5zZdHfGLE5xqjai3x
	wvtlw5JgwWd0x9OvVJJECeijldfIAojaS8Adw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=dC7aXL5OF4H2MIf2lPcmc2zgKipgYsiWLkjr8YJlc42+ZmaIWstM0eWqBY2Ujpjbjl
	lN4nBHxKuz7JRNAf2UR7YY+FlvmWcvGt/KYRs4mR1SGNBq0vT2kbg1N97E6Y45rNC/QW
	BWThBy4I337OR9M0Dsd8yltAeb0h7E2GMKvgc=
Received: by 10.231.33.205 with SMTP id i13mr248880ibd.179.1280425082649; Thu, 
	29 Jul 2010 10:38:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.176.77 with HTTP; Thu, 29 Jul 2010 10:37:42 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.00.1007270937190.16525@linux.fjfi.cvut.cz>
References: <20100727010733.1B6BB46773@linux.fjfi.cvut.cz> 
	<20100727071827.GA3397@rhein.zuhause.netz>
	<alpine.LRH.2.00.1007270937190.16525@linux.fjfi.cvut.cz>
From: "Eduardo Lima (Etrunko)" <eblima@gmail.com>
Date: Thu, 29 Jul 2010 14:37:42 -0300
Message-ID: <AANLkTimgJJsUZWSgW42aZH77fX2oboM=ahhCt_H0Z4y6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: eblima@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] cmake-native: add recipe for cmake 2.8.2.
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
X-List-Received-Date: Thu, 29 Jul 2010 17:39:39 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 27, 2010 at 4:43 AM, David Kozub <zub@linux.fjfi.cvut.cz> wrote:
> On Tue, 27 Jul 2010, Henning Heinold wrote:
>
>> Eduardo Lima sends in patches for cmake 2.8 too. So please coordinate with
>> him.
>> I would like to see a fine recipe with which uses the latest features
>> available in OE like BBCLASSEXTENDED and so on.
>
> I missed it. It even seems he's been working on webkit-efl too. I'll try to
> contact him.

Yeah, I was indeed working on webkit-efl. :)

We have discussed a lot in the past days and I guess we've achieved
the point where we have both CMake native and non-native building. As
we already agreed on IRC the other day, it's not possible to have a
unique recipe for building both. In fact, non-native is much more
complicated than it seems at first. I couldn't even make the actual
2.6.4 recipe (already in the repository) work.

David, could you please send your CMake updated patches to the list?

Best Regards, Etrunko.

>
> As for the cmake - I tried and failed. My problem is:
>
> * cmake is built using cmake-native, and it uses inherit cmake
>
> * I can't have inherit cmake in the native recipe, as it would be a circular
> dependency
>
> * I got stuck on: can I somehow "inherit cmake" only for the non-native
> case?
>
> I think that's not possible and so I see only two options:
>
> * hack the non-native recipe to not inherit cmake, yet still use the native
> cmake (this would probably mean some ugly copypasting - so that doesn't
> sound good)
>
> * build cmake non-native the same way cmake-native is built: bootstrap it,
> don't use native to build non-native (and thus no "inherit cmake")
>
> The second option looks more reasonable to me, but I didn't want to break
> what was working and building non-native with native seemed nice.
>
> Any thoughts on how to solve this?
>
> Regards,
>
> David
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Eduardo de Barros Lima
eblima@gmail.com



Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P35sS-0001hj-6f
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 13:40:13 +0200
Received: by iwn2 with SMTP id 2so8170447iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=oE9WOM1Y5SfZXppRZS8deDh9UuJzmDqk/79stDm+Gs8=;
	b=cwSf5wkvk2uyjX/Er54m4rrAxr9fuv1aRKf18KMNsVsrVdrvysI9d4flmyZ/3aOX9l
	Vi+kjgOD9tcTnXw0hDnV63ldWTnL14iZhYho5FXuUhRV664Avk3w5AHChDmVroldHW7T
	za9fxYHHxLFJBirpxX8jMR5s2y8HyNBIyNNCQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=nz526+mEmS5RwSN7QT+YG85nyvAYNCDXPS+So1uilF8D8hCQTFNIoPwgikiUo8Dds8
	tWK2tBjzLxX9KtyvLjaSEd99Hu0m8z6bn+jhzprOaCySVCW5Vat9ITIrulrymwxlOwhb
	9TfuXET+YkeeexJdiWXFPDC0WayyPvsdA25ow=
MIME-Version: 1.0
Received: by 10.231.173.144 with SMTP id p16mr11961402ibz.108.1286278791104;
	Tue, 05 Oct 2010 04:39:51 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 5 Oct 2010 04:39:51 -0700 (PDT)
In-Reply-To: <AANLkTinpEEdA7k87fa2nPXGtav6URN+R6itO6UE4gtGk@mail.gmail.com>
References: <AANLkTikzKs+3U0JfEbQxg5dLVuMF51To2qTn55YLOmjg@mail.gmail.com>
	<AANLkTinpEEdA7k87fa2nPXGtav6URN+R6itO6UE4gtGk@mail.gmail.com>
Date: Tue, 5 Oct 2010 13:39:51 +0200
Message-ID: <AANLkTikGBtkXxirSKm=arDwFeTh1-fTXc6iLLEuAaCUy@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing 2010-10-04
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
X-List-Received-Date: Tue, 05 Oct 2010 11:40:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/5 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/10/4 Cliff Brake <cliff.brake@gmail.com>:
>> Testing run from last week:
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=testing_2010-09-27
>>
>> testing-next is updated and ready for clean builds:
>> http://wiki.openembedded.net/index.php/Testing
>>
>> Thanks,
>> Cliff
>>
>> --
>
> For me this version fails on native sqlite3_3.6.23.1.bb, do_compile
> see e.g. testing_2010-1004: fails on native sqlite3_3.6.23.1.bb, do_compile
> See also http://tinderbox.openembedded.net/public/logs/task/8402014.txt
>
> this fails both minimal/console-image as well as slugos/slugos-image
>
> Frans
>
Actually this is already fixed here:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=9f503dbde0f2f6e9d4a94f6ab4be1b04dfc99950

suggest to make a new testing-next label and restart this weeks' test.

Frans



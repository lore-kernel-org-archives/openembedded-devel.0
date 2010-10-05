Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P38PE-00080t-2m
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 16:22:14 +0200
Received: by wyb35 with SMTP id 35so6210583wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=704tSxQkX7aiVr+DVbgef+ppih6yxe7OMI3UFzhWH34=;
	b=QPHTUl7bG7eJZLYWzyl6VrYQUOHJh9pzZnQ69QfhRB8HF+qobqvgmQY7TIfKor3gBb
	JvEDbckN//zNtjhH7TS5I4VEDGOwYh2DMq6Nm33DFkIxxHW4d/ufJbi8G2/kaAyogPQ9
	shpEy0nWYkQz/xSfYIIBLOeUo79pUVvVzAqHg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DzA7e7I3SAaPC2XMdw+0yu/r6KIVBeuiebxY29qrXmCnsJ7hcBCx9J96EuwL6Qii2t
	WpRLqOjV9y0Cobh5SoU0Ja94ZpVPMv1kvPDyvNOz6b1wfGA0+v6LoKcYmbJ2EMc2/1sH
	mJiHgS0SJQE1RQYE9vAiSvEdiIrBJQSGFnlbA=
MIME-Version: 1.0
Received: by 10.227.127.84 with SMTP id f20mr9999247wbs.3.1286288510944; Tue,
	05 Oct 2010 07:21:50 -0700 (PDT)
Received: by 10.216.45.149 with HTTP; Tue, 5 Oct 2010 07:21:50 -0700 (PDT)
In-Reply-To: <AANLkTikGBtkXxirSKm=arDwFeTh1-fTXc6iLLEuAaCUy@mail.gmail.com>
References: <AANLkTikzKs+3U0JfEbQxg5dLVuMF51To2qTn55YLOmjg@mail.gmail.com>
	<AANLkTinpEEdA7k87fa2nPXGtav6URN+R6itO6UE4gtGk@mail.gmail.com>
	<AANLkTikGBtkXxirSKm=arDwFeTh1-fTXc6iLLEuAaCUy@mail.gmail.com>
Date: Tue, 5 Oct 2010 10:21:50 -0400
Message-ID: <AANLkTikx3QRQVWJMEfLrv1bsEuvgK-xCC0mB4ZCOyxXC@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
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
X-List-Received-Date: Tue, 05 Oct 2010 14:22:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 5, 2010 at 7:39 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/10/5 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> 2010/10/4 Cliff Brake <cliff.brake@gmail.com>:
>>> Testing run from last week:
>>> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=testing_2010-09-27
>>>
>>> testing-next is updated and ready for clean builds:
>>> http://wiki.openembedded.net/index.php/Testing
>>>
>>> Thanks,
>>> Cliff
>>>
>>> --
>>
>> For me this version fails on native sqlite3_3.6.23.1.bb, do_compile
>> see e.g. testing_2010-1004: fails on native sqlite3_3.6.23.1.bb, do_compile
>> See also http://tinderbox.openembedded.net/public/logs/task/8402014.txt
>>
>> this fails both minimal/console-image as well as slugos/slugos-image
>>
>> Frans
>>
> Actually this is already fixed here:
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=9f503dbde0f2f6e9d4a94f6ab4be1b04dfc99950
>
> suggest to make a new testing-next label and restart this weeks' test.

Hi Frans,

I would prefer to simply wait till next week.  The reason is some
people may have already done builds, and I don't want to burden them
with rebuilding, and sorting out the confusion who built on what
version of testing-next.  I don't think its a big deal if we miss a
weak as long as we identify the issues and fix them for next week.
But, I'm open to other thoughts on this.

Thanks,
Cliff

-- 
=================
http://bec-systems.com



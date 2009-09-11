Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MmCbn-0004n7-7B
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Sep 2009 22:20:42 +0200
Received: by qw-out-1920.google.com with SMTP id 4so476431qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2009 13:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=qzWEOPjrsmBoL8ItBEKlKqoGuqqsHOWqVk07LDh6TXI=;
	b=oimppZ+LEIaz6wjEXhSn+L8DBWOUcVf/Pkkr/BM+Gx3WctagufR99QSWQJ1l/hzDSz
	5xq+6y/6cI3ami5qlSjIRnZVDFsvRJyi75ElalFR3SPh7jPl3X8DAJM2fdYssf43Dzqe
	NmSftw5uhfFO1XtBOeJqg1emUhmElb60TqHWk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=iR6oY2xqX4l2OuUoR5msFx5m9A1MFml29gDhP1Sq6HQzmnwswGNlWzYq/FvRHPcn3c
	CySPYjOzypxXiNMH6+w98EF4na/O3jwumJPtVR0alkHdxap0PpipZMn52Uk2xNsp8QSB
	+T2mIBaJAfPShrNedZLPsqJBLnrJbi33E1+Bg=
MIME-Version: 1.0
Received: by 10.229.92.199 with SMTP id s7mr1418962qcm.23.1252700411615; Fri, 
	11 Sep 2009 13:20:11 -0700 (PDT)
In-Reply-To: <20090911083758.GA6676@rhein.zuhause.netz>
References: <E1Mlvq3-0005kd-19@melo.openembedded.org>
	<20090911083758.GA6676@rhein.zuhause.netz>
Date: Fri, 11 Sep 2009 13:20:11 -0700
Message-ID: <19c1b8a90909111320x5fc77de2jf51945afa3e53437@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.148
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Khem Raj : console-image.bb: Require console-base-image
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
X-List-Received-Date: Fri, 11 Sep 2009 20:20:42 -0000
Content-Type: text/plain; charset=UTF-8

yes probably

On 9/11/09, Henning Heinold <heinold@inf.fu-berlin.de> wrote:
> On Fri, Sep 11, 2009 at 02:26:15AM +0000, git version control wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: d3fc551eb32ff334fcea7cfe20a6f76b20c65c21
>> URL:
>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=d3fc551eb32ff334fcea7cfe20a6f76b20c65c21
>>
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date:   Tue Sep  8 20:43:46 2009 -0700
>>
>> console-image.bb: Require console-base-image
>>
>> * Get rid of code duplication.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> ---
>>
>>  recipes/images/console-image.bb |   20 +++-----------------
>>  1 files changed, 3 insertions(+), 17 deletions(-)
>>
>> diff --git a/recipes/images/console-image.bb
>> b/recipes/images/console-image.bb
>> index 9707881..c3d3f17 100644
>> --- a/recipes/images/console-image.bb
>> +++ b/recipes/images/console-image.bb
>> @@ -1,24 +1,10 @@
>>  #Angstrom bootstrap image
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> shouldnt we fix the comment as it has nothing to do with distribution?
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



Received: from [66.249.82.225] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HR6eH-0000GS-S9
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Mar 2007 14:02:42 +0100
Received: by wx-out-0506.google.com with SMTP id t14so2094764wxc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2007 06:02:40 -0700 (PDT)
Received: by 10.70.28.7 with SMTP id b7mr1430975wxb.1173790960727;
	Tue, 13 Mar 2007 06:02:40 -0700 (PDT)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id r1sm10072244nzd.2007.03.13.06.02.37;
	Tue, 13 Mar 2007 06:02:40 -0700 (PDT)
Date: Tue, 13 Mar 2007 15:02:37 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1153707250.20070313150237@gmail.com>
To: "Jan Janssens" <janjans321@gmail.com>
In-Reply-To: <7c8eac300703130353t4982c66bua4f24205e4e651d6@mail.gmail.com>
References: <274295013.20070311040657@gmail.com>
	<7c8eac300703110856v1e825559x8f89abd79d17fed8@mail.gmail.com>
	<665468377.20070311213332@gmail.com>
	<7c8eac300703130353t4982c66bua4f24205e4e651d6@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Allow to limit generated binary locales to predefined list
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2007 13:02:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Jan,

Tuesday, March 13, 2007, 12:53:36 PM, you wrote:

>>   My intention was to do as little (pre/post)processing/interpretation
>> for GLIBC's SUPPORTED file as possible. Looking at what it has:
>>
>> aa_DJ.UTF-8 UTF-8
>> aa_DJ ISO-8859-1
>>
>>   It's clear why dot couldn't be used - it already appears in
>> SUPPORT's syntax. So, again, I don't try to interpret it in any way,
>> just provide means to specify expressions of that syntax using OE variable,
>> using simple substitution of newlines with spaces, and spaces with
>> commas.
> Ok, that makes sense.

> I don't really get why the SUPPORTED file postfixes all UTF-8 locales
> with ".UTF-8" as well as adds " UTF-8". That seems redundant
> information; it seems all UTF-8 locales are in the form of
> <locale>.UTF-8 UTF-8, while all other encodings simply use <locale>
> <encoding>... Anyway, since we don't control that syntax, let's indeed
> keep it simple and compatible.

  And I, after more consideration, that you of course was right, and
we should provide user-visible settings in well-known format, not
something internal. So, I (once again) checked that
glibc-package.bbclass of SUPPORTED's "a[.b] c" syntax just throws away
b, and uses a.c as designator. So, patch is updated:
http://bugs.openembedded.org/show_bug.cgi?id=1966

  Thanks for suggestion!

> I would like usage of the colon better than the comma though...

> Jan.


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com




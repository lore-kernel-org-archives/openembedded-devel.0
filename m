Received: from [64.233.162.235] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HO0Da-0008NJ-NT
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2007 00:34:18 +0100
Received: by nz-out-0506.google.com with SMTP id m22so1256636nzf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2007 15:34:17 -0800 (PST)
Received: by 10.64.199.2 with SMTP id w2mr8850076qbf.1173051257761;
	Sun, 04 Mar 2007 15:34:17 -0800 (PST)
Received: from cube ( [82.193.98.2])
	by mx.google.com with ESMTP id 36sm7817847nza.2007.03.04.15.34.16;
	Sun, 04 Mar 2007 15:34:16 -0800 (PST)
Date: Mon, 5 Mar 2007 01:34:15 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1784291541.20070305013415@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <45E57EF4.9050706@dominion.kabel.utwente.nl>
References: <407130732.20070227223500@gmail.com>
	<1172609341.28406.169.camel@localhost.localdomain>
	<1828813817.20070227233137@gmail.com>
	<45E57EF4.9050706@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] base_less_or_equal() for numerical value testing in OE
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
X-List-Received-Date: Sun, 04 Mar 2007 23:34:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Wednesday, February 28, 2007, 3:09:08 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Paul Sokolovsky schreef:
>> Hello Richard,
>> 
>> Tuesday, February 27, 2007, 10:49:01 PM, you wrote:
>> 
>>> On Tue, 2007-02-27 at 22:35 +0200, Paul Sokolovsky wrote:
>>>> This code was committed, as it doesn't affect any existing aspect of
>>>> OE. Please feel free to tweak it, and of course use!
>> 
>>> So its not really a RFC, is it? ;-)
>> 
>>   Disapprove is easy if it's wrong.

> To illustrate the point: your commit broke building for machines that don't set root flash
> size (e.g. machines that don't have flash).

  Oops, sorry, I actually had a patch to set the default value in
bitbake.conf, missed to commit. Thanks for adding it. Except that
common usecase would be to check if that value is less than a
threshold, and don't include some package then. So, default value
should be some reasonably big, not 0. I'll commit such change.

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com




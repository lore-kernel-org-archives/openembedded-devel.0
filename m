Received: from [64.233.162.229] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HXD9h-0000aT-Rr
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Mar 2007 11:12:22 +0200
Received: by nz-out-0506.google.com with SMTP id m22so330226nzf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2007 02:12:20 -0700 (PDT)
Received: by 10.64.156.3 with SMTP id d3mr3496744qbe.1175245939937;
	Fri, 30 Mar 2007 02:12:19 -0700 (PDT)
Received: from cube ( [77.123.185.1])
	by mx.google.com with ESMTP id 36sm2590214nzk.2007.03.30.02.12.19;
	Fri, 30 Mar 2007 02:12:19 -0700 (PDT)
Date: Fri, 30 Mar 2007 12:12:21 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <7207965.20070330121221@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <460CD224.7050005@dominion.kabel.utwente.nl>
References: <18310385162.20070330115222@gmail.com>
	<460CD224.7050005@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] Solving ipkg-utils issues
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
X-List-Received-Date: Fri, 30 Mar 2007 09:12:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Friday, March 30, 2007, 12:02:28 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Paul Sokolovsky schreef:
>> Hello openembedded-devel,
>> 
>>   For quite some time bugs in ipkg-utils package (mostly in
>> ipkg-make-index tool) plagued image creation process in OE. Many of
>> them are known to old-time developers, and being (manually) worked
>> around. I was working on resolving them for some time, and guess now
>> finally have both clear picture of the issues and their interaction
>> with each other, and fixes for them. So, I would like to push these
>> fixes to mainline, and am opening this thread for review of
>> them, as well as to collect any other concerns about ipkg-utils.
>> 
>>   In my list, there're 3 major issues:
>> 
>> 1. Broken version comparison logic in ipkg-utils (note that this is
>> exactly ipkg-utils issues, nether bitbake nor ipkg is affected).
>> 
>> 2. Inability of ipkg-make-index to detect packages which were updated,
>> while version stays the same.

> It's hard to distinguish between 'update' and 'data corruption' without knowing if someone
> rebuilt the package.

  Yeah, so I followed suggestion to track ipk timestamps. But we
indeed have overloaded Packages files, and this timestamp is clearly
ipkg-make-index internal thing, so I did it a-la Packages.files,
introduced Packages.timestamps for that.

  But this will be second patch, and I'd like to have it step by step,
with interim testing, because interaction of issues can be indeed pretty bad.

> regards,

> Koen

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com




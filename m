Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SUc8P-0000LG-BM
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 13:11:13 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 26E67F8123B; Wed, 16 May 2012 05:01:13 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2631FF8123A;
	Wed, 16 May 2012 05:01:12 -0600 (MDT)
Message-ID: <4FB388F8.2000802@mlbassoc.com>
Date: Wed, 16 May 2012 05:01:12 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
In-Reply-To: <CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
Subject: Re: [toolchain-layer][pull-request] Remove old toolchain recipes
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
X-List-Received-Date: Wed, 16 May 2012 11:11:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-16 04:50, Thilo Fromm wrote:
> Hello *.*,
>
>> Khem Raj (3):
>>       eglibc-2.12: Remove
>>       binutils-2.20: Remove
>>       gcc-4.5: Remove
>
> Removing gcc-4.5 would kill Texas Instruments DaVinci (dm814x, dm816x)
> support. You only get a heavily patched 2.6.37 kernel from TI for
> these (linux-ti81xx-psp_2.6.37). Unfortunately gcc>= 4.6 is unable to
> build a kernel which boots for these platforms. After
>
> Uncompressing linux ... booting the kernel
>
> there is silence. We can reproduce this reliably on a ti8148-evm
> development board. My best guess is it's because of an ancient kernel
> being compiled with a very recent GCC.

I build with GCC 4.6.3 from that tree for the DM8148 all the time and
it works fine.  Maybe there is some option/selection in your configuration
that's not in mine?  Can you send it & I'll give it a compare?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------



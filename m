Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SV284-00055n-It
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 16:56:36 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 9E61BF81246; Thu, 17 May 2012 08:46:34 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 7DDFDF81240;
	Thu, 17 May 2012 08:46:08 -0600 (MDT)
Message-ID: <4FB50F30.7000906@mlbassoc.com>
Date: Thu, 17 May 2012 08:46:08 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4FB508C7.4070808@mlbassoc.com> <3003401.DA8hFehsbE@helios>
In-Reply-To: <3003401.DA8hFehsbE@helios>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-browser
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
X-List-Received-Date: Thu, 17 May 2012 14:56:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-17 08:37, Paul Eggleton wrote:
> On Thursday 17 May 2012 08:18:47 Gary Thomas wrote:
>> Trying the new layer, when I ran 'bitbake chromium -c fetch', I got this
>> error: Fetcher failure for URL:
>> 'http://commondatastorage.googleapis.com/chromium-browser-official/chromium
>> -19.0.1049.3.tar.bz2'. The fetch command returned success for url
>> http://commondatastorage.googleapis.com/chromium-browser-official/chromium-
>> 19.0.1049.3.tar.bz2 but
>> /local/p60_poky/downloads/chromium-19.0.1049.3.tar.bz2 doesn't exist?!
>>
>> Looking at my tree, I found this:
>>
>> downloads/chromium-19.0.1049.3.tar.bz2?cms_redirect=yes&redirect_counter=1
>> which has MD5SUM that matches the recipe.
>>
>> Any ideas what might have gone wrong?
>
> If it really has "?cms_redirect=yes&redirect_counter=1" at the end of the
> filename that might have something to do with it...

Of course, but that's a result of the fetcher code - the recipe does not
have such:
   SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P}.tar.bz2"

The fetch log is at http://www.mlbassoc.com/misc/chromium_fetch.log
My build host is Fedora 16 (i686)
My oe-core (poky/master) is rev 38da655788

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------



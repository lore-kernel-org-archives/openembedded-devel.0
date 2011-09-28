Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1R8vpj-00087D-Jz
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Sep 2011 17:14:03 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id CD9E71660844; Wed, 28 Sep 2011 09:08:37 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 217031660332;
	Wed, 28 Sep 2011 09:08:36 -0600 (MDT)
Message-ID: <4E833873.9090805@mlbassoc.com>
Date: Wed, 28 Sep 2011 09:08:35 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Michael Poole <mdpoole@troilus.org>
References: <1316770597.99899.YahooMailNeo@web121512.mail.ne1.yahoo.com>
	<4E7C63C8.3050900@mlbassoc.com>
	<CAOU-OA+uKFYL4nJutdTHsUCYnGy9=NiYW65jGbRk76+GL6iocg@mail.gmail.com>
	<4E7DB4E4.5090202@mlbassoc.com>
	<CAOU-OA+9_Y4_3W9wy=YMNsW--wc49+i1xqsvxRuLc7jpRQ+efA@mail.gmail.com>
In-Reply-To: <CAOU-OA+9_Y4_3W9wy=YMNsW--wc49+i1xqsvxRuLc7jpRQ+efA@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: ti_cgt_c6000_6.1.17_setup_linux_x86.bin error while installing ti-codec-engine
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
X-List-Received-Date: Wed, 28 Sep 2011 15:14:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-09-28 08:58, Michael Poole wrote:
> On Sat, Sep 24, 2011 at 6:45 AM, Gary Thomas wrote:
>> On 2011-09-23 14:46, Michael Poole wrote:
>>>
>>> On Fri, Sep 23, 2011 at 6:47 AM, Gary Thomas wrote:
>>>>
>>>> Check to make sure that you don't have write permission to /opt
>>>> If you have write permission in the directory /opt, the installer
>>>> fails to put the tools where they belong in your OE build.
>>>
>>> Is it generally known that this limitation is due to a bug in
>>> ti-eula-unpack.inc?  (Python's print automatically adds a newline,
>>> which the code's author apparently did not expect.)  My local repo has
>>> these changes to allow in-tree installs by users with write access to
>>> /opt; please pardon Gmail's mangling of leading whitespace:
>>
>> I don't know if this is a generally known fact; it should be, I reported it
>> to
>> this list more than a year ago and was basically ignored [actually told I
>> just
>> shouldn't have write access to /opt so the issue was my own fault...]
>>
>> Does the unpack work with your patches if /opt is not writeable?
>
> Yes, it does.  (It took a few days for me to find time to do a clean
> rebuild on a system where I didn't need write access to /opt.)

Thanks for checking.

Will you push these changes into meta-texasinstruments (please)?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------



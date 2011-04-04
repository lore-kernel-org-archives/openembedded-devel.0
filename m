Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Q6l2k-0001bX-OV
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 16:46:14 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id CB2B116605BE; Mon,  4 Apr 2011 08:44:11 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id C81111660599;
	Mon,  4 Apr 2011 08:43:59 -0600 (MDT)
Message-ID: <4D99D92F.6080609@mlbassoc.com>
Date: Mon, 04 Apr 2011 08:43:59 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D99D609.8020800@mlbassoc.com> <4D99D689.9050705@mlbassoc.com>
	<79CF2877-D36A-412A-AF90-6FF538AACF9C@gmail.com>
In-Reply-To: <79CF2877-D36A-412A-AF90-6FF538AACF9C@gmail.com>
Subject: Re: Master broken?
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
X-List-Received-Date: Mon, 04 Apr 2011 14:46:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2011 08:37 AM, Sachin Kamboj wrote:
> The problem is "angstrom-2008.1" has been retired and is no longer available in the master branch. Use "angstrom-2010.x" instead as your distro. Alternatively, use the maintenance branch:
>
> http://www.angstrom-distribution.org/angstrom-20081-moves-maintenance-branch

Thanks, that got me going.

Why didn't I get an error when I selected DISTRO="angstrom-2008.1"?  There is no
longer a .../conf/distro/angstrom-2008.1.conf file on the master branch.

> On Apr 4, 2011, at 10:32 AM, Gary Thomas wrote:
>
>> On 04/04/2011 08:30 AM, Gary Thomas wrote:
>>> I just updated to org.openembedded.dev 556819235f501bf762c8d8cc9f41a1a8244b106f
>>
>> To be clear, local.conf includes these settings:
>>   DISTRO = "angstrom-2008.1"
>>   MACHINE = "beagleboard"
>>   IMAGE_PKGTYPE ?= "ipk"
>>
>>> Now I get these errors during the initial parse:
>>> $ bitbake xfce-image
>>> NOTE: Handling BitBake files: | (0046/7335) [ 0 %]ERROR: global name 'runtime_mapping_rename' is not defined while parsing /local/Angstrom_BeagleBoard/openembedded
>>> /recipes/images/x11-gpe-image.bb
>>> NOTE: Handling BitBake files: \ (0053/7335) [ 0 %]ERROR: global name 'runtime_mapping_rename' is not defined while parsing
>>> /local/Angstrom_BeagleBoard/openembedded/recipes/images/angstrom-gnome-image.bb
>>> NOTE: Handling BitBake files: \ (0113/7335) [ 1 %]ERROR: global name 'runtime_mapping_rename' is not defined while parsing
>>> /local/Angstrom_BeagleBoard/openembedded/recipes/images/helloworld-image.bb
>>> ... etc
>>>
>>> What am I missing?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------



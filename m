Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SLEm0-0007wb-R4
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 16:25:21 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 3D446F81249; Fri, 20 Apr 2012 08:15:52 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 51A84F811F4;
	Fri, 20 Apr 2012 08:15:50 -0600 (MDT)
Message-ID: <4F916F96.8050901@mlbassoc.com>
Date: Fri, 20 Apr 2012 08:15:50 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F916294.6090706@mlbassoc.com>
	<CABcZAN=ATv+2NUzf1nNq6w1O4Kg+trD1S3kuKM0Eq4=yq4PL2Q@mail.gmail.com>
In-Reply-To: <CABcZAN=ATv+2NUzf1nNq6w1O4Kg+trD1S3kuKM0Eq4=yq4PL2Q@mail.gmail.com>
Subject: Re: COMPATIBLE_MACHINE
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
X-List-Received-Date: Fri, 20 Apr 2012 14:25:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-04-20 08:04, Chris Larson wrote:
> On Fri, Apr 20, 2012 at 6:20 AM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> I'm writing a .bbappend for a recipe which contains a COMPATIBLE_MACHINE
>> pattern like this:
>>   COMPATIBLE_MACHINE = "(machine1|machine2|machine3)"
>>
>> Is there a way my .bbappend file can add to this pattern?  I don't want
>> to disturb what's there, just add my machine as well.
>
> It's just a standard regular expression.
>
> COMPATIBLE_MACHINE = "(machine1|machine2|machine3)"
> COMPATIBLE_MACHINE .= "|machine4"
>
> Will result in a value of "(machine1|machine2|machine3)|machine4",
> which is still a perfectly valid pattern, as far as I can tell.

Yes, this does seem to work.  Any clues why most uses of COMPATIBLE_MACHINE
use the regex "(x|y|z)" instead of just "x|y|z"?  Aren't they the same?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------



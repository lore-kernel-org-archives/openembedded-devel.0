Received: from ausc60pc101.us.dell.com ([143.166.85.206])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ryan_d_phillips@dell.com>) id 1PSXmy-0003Do-DC
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 17:31:45 +0100
X-Loopcount0: from 10.210.138.66
Message-ID: <4D079B88.9010503@dell.com>
Date: Tue, 14 Dec 2010 10:30:00 -0600
From: Ryan D Phillips <ryan_d_phillips@dell.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4D065431.6080304@dell.com>
	<AANLkTin2DnrgjhA4Qt63+pyfhPP=rLcs94CL_gbOeBGC@mail.gmail.com>
In-Reply-To: <AANLkTin2DnrgjhA4Qt63+pyfhPP=rLcs94CL_gbOeBGC@mail.gmail.com>
X-SA-Exim-Connect-IP: 143.166.85.206
X-SA-Exim-Mail-From: ryan_d_phillips@dell.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: use HTTP for svn checkout
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
X-List-Received-Date: Tue, 14 Dec 2010 16:31:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2010 2:00 PM, Khem Raj wrote:
> On Mon, Dec 13, 2010 at 9:13 AM, Ryan D Phillips
> <ryan_d_phillips@dell.com>  wrote:
>>   SVN over HTTP is a more reliable transport for developers behind
>> restrictive
>> proxies.
>>
>
> and how much slower/faster is it when compared to svn protocol ?
>

The speed depends on which subversion client backend someone is using. 
HTTP will be slower than using the svn native protocol, but the serf 
subversion backend will perform parallel fetches.

I would like to see this patch get into the OE tree to make the tree 
more robust to proxies. Currently, this is the only customization I need 
for the projects I work on.

Regards,
Ryan Phillips



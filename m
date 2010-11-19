Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1PJTrW-0006gz-AV
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 17:30:59 +0100
Received: from meyreuil.atmel.fr (meyreuil [10.159.254.132])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id oAJGRLhu014269;
	Fri, 19 Nov 2010 08:27:22 -0800 (PST)
Received: from [127.0.0.1] ([10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id oAJGTkh26443; 
	Fri, 19 Nov 2010 17:29:46 +0100 (MET)
Message-ID: <4CE6A5F8.4090301@atmel.com>
Date: Fri, 19 Nov 2010 17:29:44 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
References: <4CE69DDB.9030500@atmel.com> <20101119160716.GD3411@jama>
In-Reply-To: <20101119160716.GD3411@jama>
X-SA-Exim-Connect-IP: 204.2.163.5
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: parsing error while building from scratch: literki_git.bb
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
X-List-Received-Date: Fri, 19 Nov 2010 16:30:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Le 19/11/2010 17:07, Martin Jansa :
> On Fri, Nov 19, 2010 at 04:55:07PM +0100, Nicolas Ferre wrote:
>> Hi,
>>
>> While trying to build from scratch the latest .dev branch with:
>> - at91sam9m10g45ek machine
>> - angstrom-2010.x distribution
>> - bitbake 1.10.1
>>
>> I have the following error just after bitbake parsing .bb files:
> 
> what does it show if you do
> git ls-remote http://git.senfdax.de/git/literki master
> in terminal?

It seems to work:
$ git ls-remote http://git.senfdax.de/git/literki master
1da40724369c8adc069288f1bfc6b2e167bbb87b        refs/heads/master

> are you using BB_LOCALCOUNT_OVERRIDE and/or BB_GIT_CLONE_FOR_SRCREV (ie
> in your local.conf?

No, neither the one nor the other.

Bye,
-- 
Nicolas Ferre




Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1PNMyO-00006U-LT
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 10:58:09 +0100
Received: from meyreuil.atmel.fr (meyreuil [10.159.254.132])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id oAU9rvHI000916;
	Tue, 30 Nov 2010 01:53:58 -0800 (PST)
Received: from [127.0.0.1] ([10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id oAU9uNh12815; 
	Tue, 30 Nov 2010 10:56:23 +0100 (MET)
Message-ID: <4CF4CA46.8000302@atmel.com>
Date: Tue, 30 Nov 2010 10:56:22 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE69DDB.9030500@atmel.com> <20101119160716.GD3411@jama>
	<4CE6A5F8.4090301@atmel.com>
In-Reply-To: <4CE6A5F8.4090301@atmel.com>
X-SA-Exim-Connect-IP: 204.2.163.5
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: release-2010.12 (was: parsing error while building from scratch: literki_git.bb)
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
X-List-Received-Date: Tue, 30 Nov 2010 09:58:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Le 19/11/2010 17:29, Nicolas Ferre :
> Le 19/11/2010 17:07, Martin Jansa :
>> On Fri, Nov 19, 2010 at 04:55:07PM +0100, Nicolas Ferre wrote:
>>> Hi,
>>>
>>> While trying to build from scratch the latest .dev branch with:
>>> - at91sam9m10g45ek machine
>>> - angstrom-2010.x distribution
>>> - bitbake 1.10.1
>>>
>>> I have the following error just after bitbake parsing .bb files:
>>
>> what does it show if you do
>> git ls-remote http://git.senfdax.de/git/literki master
>> in terminal?
> 
> It seems to work:
> $ git ls-remote http://git.senfdax.de/git/literki master
> 1da40724369c8adc069288f1bfc6b2e167bbb87b        refs/heads/master
> 
>> are you using BB_LOCALCOUNT_OVERRIDE and/or BB_GIT_CLONE_FOR_SRCREV (ie
>> in your local.conf?
> 
> No, neither the one nor the other.

My build on top of release-2010.12 is only working with the following
commit form org.openembedded.dev:
dc07958c6fad86917bd7d1b65614b14a1eec8c11

Please include in release...

Bye,
-- 
Nicolas Ferre




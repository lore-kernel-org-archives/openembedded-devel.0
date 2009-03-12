Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1Lhfru-0007EA-3R
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 09:02:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id BA7C02C81D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 08:01:24 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4MQ72PPa4sGb
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 08:01:20 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 888042C7FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 08:01:19 +0000 (UTC)
Message-ID: <49B8C180.3010607@gmail.com>
Date: Thu, 12 Mar 2009 09:02:08 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49bdfd00903100733s3af6dc2o48f09b48593fe51f@mail.gmail.com>	<19c1b8a90903101122r59d22d0fia19158c42583e784@mail.gmail.com>
	<49bdfd00903110149y39fb7aa4we99d373a4ff1790f@mail.gmail.com>
In-Reply-To: <49bdfd00903110149y39fb7aa4we99d373a4ff1790f@mail.gmail.com>
Subject: Re: Problem building kernel - too many files open
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
X-List-Received-Date: Thu, 12 Mar 2009 08:02:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Piero Pezzin ha scritto:
> Hi,
> 
> I searched without success. I agree with you, there is a problem on my host,
> but I'd like to know why it pops out during the do_package task.
> 
> Any help will be appreciated.
> 
> Regards,
> 
> Piero
> 
> On Tue, Mar 10, 2009 at 7:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
> 
>> On Tue, Mar 10, 2009 at 7:33 AM, Piero Pezzin <piero.pezzin@gmail.com>
>> wrote:
>>> Hello everyone,
>>>
>>> I'm building a minimal distribution for a x86 machine (my host is a
>> x86-64
>>> with CentOS 4.4):
>>>
>>> OE Build Configuration:
>>> BB_VERSION        = "1.8.12"
>>> METADATA_BRANCH   = "org.openembedded.dev"
>>> METADATA_REVISION = "a8a23e995d108ecdfc31129941671551c591bc6e"
>>> TARGET_ARCH       = "i486"
>>> TARGET_OS         = "linux"
>>> MACHINE           = "x86"
>>> DISTRO            = "minimal"
>>> DISTRO_VERSION    = ".dev-snapshot-20090310"
>>> TARGET_FPU        = ""
>>>
>>>
>>> During kernel building, I got the following error:
>>>
>>> OTE: package linux-2.6.28: started
>>> NOTE: package linux-2.6.28-r6: task do_package: started
>>> ERROR: Error in executing:
>>> /home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
>>> linux_2.6.28.bb
>>> ERROR: Exception:exceptions.IOError Message:[Errno 24] Too many open
>> files:

this is a known error.
Nobody solved it yet.

/marco



Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1PpOfY-0003tE-VP
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 18:26:33 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id AA9261660252; Tue, 15 Feb 2011 10:25:22 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.1
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8753F16601BB;
	Tue, 15 Feb 2011 10:25:17 -0700 (MST)
Message-ID: <4D5AB6FD.2030104@mlbassoc.com>
Date: Tue, 15 Feb 2011 10:25:17 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D59BBC3.3080806@mlbassoc.com> <4D5AAF85.3000409@mentor.com>
In-Reply-To: <4D5AAF85.3000409@mentor.com>
Subject: Re: testing release-2011.03 failure
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
X-List-Received-Date: Tue, 15 Feb 2011 17:26:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2011 09:53 AM, Tom Rini wrote:
> On 02/14/2011 04:33 PM, Gary Thomas wrote:
>> MACHINE = beagleboard
>> DISTRO = angstrom-2010.x
>> PARALLEL_MAKE ?= "-j4"
>> BB_NUMBER_THREADS ?= "4"
>> target = angstrom-gnome-image
>> bitbake = 1.11.0
>> host = Fedora 13/x86
>>
>> openembedded/recipes/gnome/system-tools-backends_2.10.1.bb failed
>>
>> Log at http://pastebin.com/rL0BnD8w
>
> Can you try adding PARALLEL_MAKE = "" to the offending recipe?

Still errors, but maybe more readable:

| Making all in services
| make[2]: Entering directory `/work/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1/services'
| cd .. && \
|         /bin/sh /work/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1/missing --run automake-1.7 
--gnu  services/Makefile
| configure.in:8: version mismatch.  This is Automake 1.7.9,
| configure.in:8: but the definition used by this AM_INIT_AUTOMAKE
| configure.in:8: comes from Automake 1.11.1.  You should recreate
| configure.in:8: aclocal.m4 with aclocal and run automake again.
| make[2]: *** [Makefile.in] Error 1
| make[2]: Leaving directory `/work/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1/services'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/work/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1'
| make: *** [all] Error 2


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------



Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Oyt8j-0007Ds-TJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 23:15:42 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id C27EC5AE506; Thu, 23 Sep 2010 15:00:48 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4C5E31660134;
	Thu, 23 Sep 2010 15:00:47 -0600 (MDT)
Message-ID: <4C9BBFFE.9040605@mlbassoc.com>
Date: Thu, 23 Sep 2010 15:00:46 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C9BB058.4050407@cbnco.com> <4C9BB632.4050107@cbnco.com>
In-Reply-To: <4C9BB632.4050107@cbnco.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gst-plugins-base tries to use host orcc
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
X-List-Received-Date: Thu, 23 Sep 2010 21:15:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2010 02:18 PM, Michael Smith wrote:
> nm, I see the problem now.
>
> Michael Smith wrote:
>> Hi,
>>
>> gst-plugins-base-0.10.30 fails to build because common/m4/orc.m4 uses
>> "pkg-config --variable=orcc orc-0.4" to get the path to orcc, instead
>> of just using "orcc" in the path.
>>
>> tmp/sysroots/i486-oe-linux/lib/pkgconfig/orc-0.4.pc has:
>>
>> exec_prefix=
>> toolsdir=${exec_prefix}/bin
>> orcc=${toolsdir}/orcc
>>
>> so Make ends up calling /bin/orcc, which doesn't exist.
>>
>> For orc-native, tmp/sysroots/x86_64-linux/lib/pkgconfig/orc-0.4.pc has:
>>
>> exec_prefix=/..../tmp/sysroots/x86_64-linux
>>
>> but I don't know how to make pkg-config use this pc file when looking
>> for orcc, or if it even should. Has anybody else run into this?

So what's the fix?  I'm seeing this trying to build gst-plugins-bad 0.10.20
(I'm working on the recipe locally)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------



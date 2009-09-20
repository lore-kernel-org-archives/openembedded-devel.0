Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MpLYq-0008Hb-CO for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 14:30:39 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MpLYI-0005VB-Tp
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 14:30:02 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2009 14:30:02 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2009 14:30:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 20 Sep 2009 14:29:28 +0200
Message-ID: <h95778$187$1@ger.gmane.org>
References: <1253428380-27587-1-git-send-email-denis@denix.org>
	<1253436022.4490.1517.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1253436022.4490.1517.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] package.bbclass: export subpackage individual version, if different from main
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
X-List-Received-Date: Sun, 20 Sep 2009 12:30:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-09-09 10:40, Phil Blundell wrote:
> On Sun, 2009-09-20 at 02:33 -0400, Denys Dmytriyenko wrote:
>> Fixes the wrong versioned runtime dependency for shlib subpackages with
>> own versions. Consider this:
>>
>> PACKAGES = "libfoo libbar"
>> PV_libfoo = "1"
>> PV_libbar = "2"
>> PV = "3"
>
> Is this even legitimate usage?  I had always thought that PV applied to
> the recipe, not to the output subpackages.
>
> What's the typical use-case for this kind of thing?

It's usefull for the case where you have a meta-release (e.g. 
codec-engine 2.24.01) containing itself (e.g. codec-engine), but also 
matching parts like dsplink 1.63, lpm 1.14, etc. When building the 
meta-release you'll get all the parts you need with matching versions, 
but ideally you want the subpackages to keep their PV.

Another usecase would be a big external-toolchain tarball where you want 
to keep libgcc and libc versions when importing it into OE.

regards,

Koen




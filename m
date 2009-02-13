Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXu09-0000wD-3E
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 10:06:25 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LXtyo-0004rG-Vm
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 09:05:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 09:05:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 09:05:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 13 Feb 2009 10:03:49 +0100
Message-ID: <gn3d1m$um5$1@ger.gmane.org>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>	<1234460865.3592.2.camel@mill.internal.reciva.com>	<49946CA4.6060303@dls.net>
	<gn28a2$8if$1@ger.gmane.org>
	<20090213032918.GS11815@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <20090213032918.GS11815@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 3/6] package.bbclass, package_ipk.bbclass: add dynamic depends on locale packages (ipk specific)
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
X-List-Received-Date: Fri, 13 Feb 2009 09:06:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-02-09 04:29, Tom Rini wrote:
> On Thu, Feb 12, 2009 at 11:36:50PM +0100, Koen Kooi wrote:
>> On 12-02-09 19:38, Mike (mwester) wrote:

>>> I have grave concerns over anything that adds unnecessary entries that
>>> cannot be turned off.
>> You can make them approx 50% smaller by doing:
>>
>> echo -n "Stripping source lines from Package files"
>> for i in `find .. -name Packages` ; do grep -v ^Source: $i|gzip
>> -c9>$i.gz ;gunzip -c $i.gz>$i ; touch $i.sig ; done
>
> How hard would it be to make that happen more easily, with the normal
> tools?  Perhaps some flag to generate just the minimum information?

The problem, for me, is that I want a packages file will all the 
information, put that in an sqlite DB for the feedbrowser and strips 
things out. The feedbrowser only knows about http urls, so access to the 
ipk files itself isn't possible.
I suspect there's an easy solution for that, but I haven't given it a 
lot of thought :)

regards,

Koen





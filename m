Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Nr7Sw-00023y-0J
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 11:24:10 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 8F55D491264
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 11:21:06 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 15 Mar 2010 11:21:27 +0100
Message-ID: <4B9E0A1B.3070606@dresearch.de>
Date: Mon, 15 Mar 2010 11:21:15 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B9E0843.30005@dresearch.de> <4B9E09C8.2060903@ge.com>
In-Reply-To: <4B9E09C8.2060903@ge.com>
X-OriginalArrivalTime: 15 Mar 2010 10:21:27.0730 (UTC)
	FILETIME=[45CDD120:01CAC429]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SRC_URI fetching problem
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
X-List-Received-Date: Mon, 15 Mar 2010 10:24:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Martyn Welch wrote:
> Steffen Sledz wrote:
>> I work at a recipe for rsyslog (http://www.rsyslog.com) and hit a
>> problem with the wget fetcher.
>>
>> The download uri for rsyslog-5.4.0.tar.gz does not contain the archive
>> name itself but is http://www.rsyslog.com/Downloads-req-getit-lid-197.phtml.
>>
>> If i set
>>
>> SRC_URI = "http://www.rsyslog.com/Downloads-req-getit-lid-197.phtml"
>> SRC_URI[archive.md5sum] = "291882229d50496f42bd63174076dd37"
>> SRC_URI[archive.sha256sum] = "d9cd21d2fcd45fcae65eb0a51927c40315cca02afdc62478abd950febfcf7228"
> 
> At a guess you need to add ";name=archive" to the end of your SRC_URI.

Nope, same behaviour. :(

BTW: The ";name=" option is not documented in the user manual at
<http://docs.openembedded.org/usermanual/usermanual.html>.

Steffen





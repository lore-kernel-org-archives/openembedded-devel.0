Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PHUEo-0003h6-O3
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Nov 2010 05:30:52 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PHUDn-00072P-41 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 20:29:43 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 13 Nov 2010 20:29:42 -0800
Received: from [172.30.80.225] ([172.30.80.225]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 13 Nov 2010 21:29:41 -0700
Message-ID: <4CDF65B3.7040408@mentor.com>
Date: Sat, 13 Nov 2010 21:29:39 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1PHKJt-0002MF-FQ@melo.openembedded.org>
	<20101113175148.GN3843@jama>
In-Reply-To: <20101113175148.GN3843@jama>
X-OriginalArrivalTime: 14 Nov 2010 04:29:42.0010 (UTC)
	FILETIME=[8E9B85A0:01CB83B4]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Tom Rini : unzip-native: Fix name
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
X-List-Received-Date: Sun, 14 Nov 2010 04:30:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2010 10:51 AM, Martin Jansa wrote:
> On Sat, Nov 13, 2010 at 05:55:21PM +0000, git version control wrote:
>>   	install -d ${D}${mandir}
>>   	mv ${D}${prefix}/man/* ${D}${mandir}
>> +
>> +do_install_append_pn-unzip() {
>>   	mv ${D}${bindir}/unzip ${D}${bindir}/unzip.${PN}
>>   }
>
> Looks like missing }

Blaaaarg.  Sorry all.

-- 
Tom Rini
Mentor Graphics Corporation



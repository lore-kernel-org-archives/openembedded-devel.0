Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1Qnpew-0003TI-Hd
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 12:23:43 +0200
Received: from nvs0066 ([10.91.8.1]) by smtp.nedap.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Aug 2011 12:19:19 +0200
X-TM-IMSS-Message-ID: <61c93538000291f8@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 61c93538000291f8 ;
	Mon, 1 Aug 2011 12:18:20 +0200
Message-ID: <4E367DA8.3030307@nedap.com>
Date: Mon, 01 Aug 2011 12:19:20 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4E36790A.4020406@nedap.com> <j15tjm$3pe$1@dough.gmane.org>
In-Reply-To: <j15tjm$3pe$1@dough.gmane.org>
X-OriginalArrivalTime: 01 Aug 2011 10:19:19.0449 (UTC)
	FILETIME=[7989B090:01CC5034]
Subject: Re: bblayers and PRINC
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
X-List-Received-Date: Mon, 01 Aug 2011 10:23:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2011 12:02 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 01-08-11 11:59, Jaap de Jong schreef:
>> Hi All,
>>
>> if created my own udev_151.bbappend to change some of the files in the original package:
>>
>> THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}" FILESPATHBASE_prepend := "${THISDIR}/${PN}-${PV}:"
>>
>> #PRINC = 1 PR .= ".1"
>>
>> PRINC doesn't seem to work.
> PRINC only works with an OE-core setup similar like this one: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/tree/README
>

I know PRINC only works with oe-core, that's why I'm using `PR .= ".1"`
That works with all my other *.bbappend recipes but not for udev; if you 
look at the bitbake log at the end you can see that it does some strange 
things...
At this moment I must stay with release-2010.12.

Jaap



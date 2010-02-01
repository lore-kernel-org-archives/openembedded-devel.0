Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Nc2Of-0007GI-15
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 20:57:24 +0100
Received: (qmail 32066 invoked by uid 1003); 1 Feb 2010 19:54:52 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 1 Feb 2010 19:54:52 -0000
Message-ID: <4B67318A.4050005@balister.org>
Date: Mon, 01 Feb 2010 14:54:50 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1Nat3b-0004cf-RY@melo.openembedded.org>
	<1264885694.4951.9.camel@trini-m4400>
In-Reply-To: <1264885694.4951.9.camel@trini-m4400>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Philip Balister : task-sdk-native: Convert to use an inc file for the basic native sdk.
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
X-List-Received-Date: Mon, 01 Feb 2010 19:57:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2010 04:08 PM, Tom Rini wrote:
> On Fri, 2010-01-29 at 15:46 +0000, git version control wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: cd149ebbd44ee4cc91f1c44d39a4105bc95f2cdc
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=cd149ebbd44ee4cc91f1c44d39a4105bc95f2cdc
>>
>> Author: Philip Balister<philip@balister.org>
>> Date:   Fri Jan 29 10:45:22 2010 -0500
>>
>> task-sdk-native: Convert to use an inc file for the basic native sdk.
>
> Curious, why?  The first thing that came to mind would be
> task-native-sdk-qte or something, but that would be handled by RDEP on
> task-sdk-native.
>

Both approaches work. Since the end result is an empty ipk with only a 
control file to suck in the needed packages, the end result is the same.

Basically, I came up with the inc approach before I figured out what you 
suggest :)

Philip



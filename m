Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QLFwE-0004Ug-Vz
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 16:35:27 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QLFtV-0002Lz-An from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 07:32:37 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sat, 14 May 2011 07:32:37 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sat, 14 May 2011 07:32:36 -0700
Message-ID: <4DCE9282.5080603@mentor.com>
Date: Sat, 14 May 2011 07:32:34 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <201105051150.06842.sgh@sgh.dk> <4DC2827E.9020801@mlbassoc.com>
	<4DCE3FCF.4050706@atmel.com>
In-Reply-To: <4DCE3FCF.4050706@atmel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 14 May 2011 14:32:37.0162 (UTC)
	FILETIME=[C57268A0:01CC1243]
Subject: Re: perl-native fails on Ubuntu 11.04
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
X-List-Received-Date: Sat, 14 May 2011 14:35:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

On 05/14/2011 01:39 AM, Ulf Samuelsson wrote:
> 2011-05-05 12:57, Gary Thomas skrev:
>> On 05/05/2011 03:50 AM, Søren Holm wrote:
>>> Please apply this patch to make perl-native build on Ubuntu 11.04
>>>
>>> https://gist.github.com/raw/925006/4217f358fb00b5b7f1dfbd1ce5f4afa4f64b0bb0/0001-perl-native-multilib-patch-for-ubuntu-11.04.patch
>>>
>>
>> This patch only works for x86_64 systems.  A corrected version
>> replaces `uname -m` with * in
>>   ++test -f /usr/lib/*-linux-gnu/libc.so &&
>> glibpth="/usr/lib/*-linux-gnu $glibpth"
>>
> 
> 
> Yes ,  Just installed Ubuntu 11.04 on a machine and I tried that patch
> and failed.
> 'uname -m`  returns i686  but the library is in i386-linux-gnu
> I symlinked i686-linux-gnu to i386-linux-gnu, and then the build completes.
> 
> `uname -i`  will return i386 so that is an alternative as well.

On my x86_64 ubuntu 10.04 box it returns unknown, so I think we'll have
to use the glob.

-- 
Tom Rini
Mentor Graphics Corporation



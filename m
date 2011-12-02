Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RWULB-0000yD-FL
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 15:43:54 +0100
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 28D034B02DD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2011 15:37:08 +0100 (CET)
Message-ID: <4ED8E293.1060107@eukrea.com>
Date: Fri, 02 Dec 2011 15:37:07 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1322824856-15965-1-git-send-email-eric@eukrea.com>
	<1322824856-15965-2-git-send-email-eric@eukrea.com>
	<jbadu4$u4u$1@dough.gmane.org>
In-Reply-To: <jbadu4$u4u$1@dough.gmane.org>
Subject: Re: [meta-oe 2/3] atftp: correctly handle init script
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
X-List-Received-Date: Fri, 02 Dec 2011 14:43:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

>> -INITSCRIPT_NAME = "atftpd" -INITSCRIPT_PARAMS = "defaults 80"
>> +INITSCRIPT_PACKAGES = "${PN}d" +INITSCRIPT_NAME_${PN}d = "atftpd"
>> +INITSCRIPT_PARAMS_${PN}d = "defaults 80"
>>
>> -USERADD_PACKAGES = "atftpd" -USERADD_PARAM_atftpd = "--system
>> --no-create-home --shell /bin/false \ +USERADD_PACKAGES = "${PN}d"
>> +USERADD_PARAM_${PN}d = "--system --no-create-home --shell /bin/false \
>> --user-group nobody"
>
> Was the USERADD change intentional?
>
yes, in fact there is no functional change, only a cosmetic one,
the only goal is to have the atftpd parchaque consistent (${PN}d instead of 
atftpd)

Eric



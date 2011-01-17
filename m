Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1Peldh-0008VD-Lq
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 10:44:41 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Mon, 17 Jan 2011 10:44:04 +0100
X-TM-IMSS-Message-ID: <0643d1a30000121a@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 0643d1a30000121a ;
	Mon, 17 Jan 2011 10:44:09 +0100
Message-ID: <4D340F63.60505@nedap.com>
Date: Mon, 17 Jan 2011 10:44:03 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4D301DFC.4090900@nedap.com> <4D305F0D.4000107@mentor.com>
In-Reply-To: <4D305F0D.4000107@mentor.com>
X-OriginalArrivalTime: 17 Jan 2011 09:44:04.0624 (UTC)
	FILETIME=[140A0100:01CBB62B]
Subject: Re: chattr not found?
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
X-List-Received-Date: Mon, 17 Jan 2011 09:44:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tim,

Thanks!
But...
at boot I get:

     update-alternatives: Error: cannot register alternative chattr to 
/usr/bin/chattr since it is already registered to /bin/chattr

Not a big deal, I guess...

Jaap


On 01/14/2011 03:34 PM, Tom Rini wrote:
> On 01/14/2011 02:57 AM, Jaap de Jong wrote:
>> Hi All!
>>
>> for some reason chattr is linked to chattr.e2fsprogs instead of
>> ../usr/bin/chattr.e2fsprogs
>>
>> # ls -l /bin/chattr*
>> lrwxrwxrwx 1 root root 16 2011-01-14 10:37 /bin/chattr ->  chattr.e2fsprogs
>>
>> # ls -l /usr/bin/chattr*
>> -rwxr-xr-x 1 root root 7304 2010-12-10 01:12 /usr/bin/chattr.e2fsprogs
>>
>> I have no time to investigate this.
>> Look simple...
> I'm pushing a fix for this now, thanks for the report.
>



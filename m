Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx18-13.smtp.antispamcloud.com (mx18-13.smtp.antispamcloud.com
	[207.244.64.182])
	by mail.openembedded.org (Postfix) with ESMTP id 06686607F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 06:06:17 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1bBFaA-0004YM-Fq; Fri, 10 Jun 2016 08:06:16 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jun 2016 08:06:09 +0200
To: <openembedded-devel@lists.openembedded.org>
References: <1464860046-15121-1-git-send-email-richard.purdie@linuxfoundation.org>
	<57568DB8.6010209@topic.nl>
	<1465307382.13979.78.camel@linuxfoundation.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <575A58D1.3070606@topic.nl>
Date: Fri, 10 Jun 2016 08:06:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465307382.13979.78.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw3m8KyO/e3OFX2RUwx7xEEvBqm3RvM5N1UuDkdL5rJuDWYSHbx/2iEXlZ3vyVN/fF+Iu
	NqWVQJTrKtJ9y7p4b9mIqVXVcArPTKJ173BjamDICPT5v9s5yYGFyGM7BAaP3Xg9i+nEmou2UMHg
	mE6z+uPpnAH3Z/yWJ/1UVv3cE79AS8/p6qm/+Srh1DpyyOtNC8srclQ9E0taDpYFK2PbcOzXYu/I
	cQJuWHlbnMOsg605uIsVkmFiKN4g6sbzZ/DG2bYbk+PuJAkSa01TMfeJ1noZd57uU+vYl1kpKtSO
	Wrva29UU3frYgZ0TR7bi/ToFn8OpyKA69LF1Ge2GaGfxmfqxg/+p2ZjpNnFVhpbuUAsdZ/RlU1v5
	1vXjaHvNDaZvYntRBOMqkNRCP7fVbbh/uqGqlWnJ+tQkP1HvU99403+oc/e1rVLsLRRzePcb6lVD
	iRz9D+/9oSt5jUrIaWXjdPQICGSqDH5ZxqCCXyEbbNwy6cMiiH3izwFu+xwdVhZyX5L5g2m8DCGg
	UHHxn6e6gArzX5NI37q4AO7kJrqw2Qae7o6cW64wNyLmPPFRGqR1pJnckpWaLvahyBjmQxBKOzsM
	ppduCVf+i9mk5WykwrtPRhC1JeifEZi+kYyqZHU3A+NiHxNXMYbXox8YlpbR9REN2vxcDlHOkrTL
	QldwJ2dGzJxsPdynu43xqHKIl4dwQzEvuGslKTrRIXcXpFg5ivY=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Originating-IP: 88.159.208.100
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/3] gitkpkgv: Ensure files are closed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 06:06:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 07-06-16 15:49, Richard Purdie wrote:
> On Tue, 2016-06-07 at 11:02 +0200, Mike Looijmans wrote:
>> =EF=BB=BFLooks like regression in Python itself?
>>
>> In both Python 2 and 3, the file is closed properly if the file
>> object is not
>> being stored:
>>
>>   >>> import os
>>   >>> os.listdir('/proc/self/fd')
>> ['0', '1', '2', '3']
>>   >>> l=3Dopen('/proc/self/stat').readline()
>>   >>> os.listdir('/proc/self/fd')
>> ['0', '1', '2', '3']
>>   >>> f=3Dopen('/proc/self/stat')
>>   >>> os.listdir('/proc/self/fd')
>> ['0', '1', '2', '3', '4']
>>   >>>
>>
>>
>> (file descriptor "3" is the one being used to read the /proc/self/fd
>> directory, "4" is the one used for reading the stat file)
>>
>> The "with" construction should not be needed here. Something else is
>> causing
>> this (e.g. nested function definition or exception handler?).
>
> $ python2 -Wdefault -c "open('/bin/bash')"
> $ python3 -Wdefault -c "open('/bin/bash')"
> -c:1: ResourceWarning: unclosed file <_io.TextIOWrapper name=3D'/bin/bash=
' mode=3D'r' encoding=3D'UTF-8'>
>
> Admittedly its not an out the box warning but it is one that seems to
> be enabled under bitbake. Details in:
>
> https://bugs.python.org/issue10093
>
> but the gist of the issue is that relying on the garbage collector to
> close files is a cpython'ism and other implementations of python may
> not do this.
>
> So whilst "with" might not be strictly required, it is recommended.

Oh dear, looks like's there's been a change of sorts in the Python communit=
y=20
and they're now adopting the Java stupidity of "the garbage collector doesn=
't=20
actually work so you'll have to do all your own resource management".

These are reasons why projects are so reluctant to move from Python 2 to 3.=
=20
Python 3 is just a different language.

Ah well, guess we'll have to live with that. I'm already getting used to=20
embedded devices running 30MB of software to enable the flashlight...


Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail







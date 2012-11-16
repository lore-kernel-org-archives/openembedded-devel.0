Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1TZHRi-0006D1-Ri
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2012 09:38:43 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Fri, 16 Nov 2012
	09:24:44 +0100
X-TM-IMSS-Message-ID: <f14eb7e300206efb@nedap.com>
Received: from [10.17.24.8] ([10.17.24.8]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id f14eb7e300206efb ;
	Fri, 16 Nov 2012 09:24:35 +0100
Message-ID: <50A5F84B.6080501@nedap.com>
Date: Fri, 16 Nov 2012 09:24:43 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50A4F6E6.9040507@nedap.com> <1413640.UNPzzlppx2@helios>
	<50A5F00A.9050703@nedap.com>
In-Reply-To: <50A5F00A.9050703@nedap.com>
Subject: Re: llvm issue
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
X-List-Received-Date: Fri, 16 Nov 2012 08:38:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/16/2012 08:49 AM, Jaap de Jong wrote:
> On 11/15/2012 04:25 PM, Paul Eggleton wrote:
>> On Thursday 15 November 2012 15:06:30 Jaap de Jong wrote:
>>> when I checkout openjdk-7 on meta-java and bitbake <anything> I get
>>> these errors:
>>>
>>> ERROR: Unable to parse
>>> /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm
>>> 2.9_2.9.bb
>>> | ETA:  00:00:15
>>>
>>> ERROR: Command execution failed: Exited with 1
>>> NOTE: Error expanding variable populate_packages
>>> NOTE: Error during finalise of
>>> /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm
>>> 2.8_2.8.bb NOTE: Error expanding variable populate_packages
>>> NOTE: Error during finalise of
>>> /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm
>>> 2.9_2.9.bb
>> Are you using the denzil branch of OE-Core perhaps? I suspect meta-java has
>> been updated to use spaces for python function indentation which only works
>> with danny/master. I don't see a denzil branch in meta-java, perhaps it would
>> be worth adding one...?
> Yes, I'm using denzil.
> And for you second question: I'm probably not the one who should answer
> this, but: yes, that would help!
> What would be the way to use the 'danny' branch? I don't see any branch
> of that name under sources/*/
about danny:
cd sources/openembedded-core
git checkout danny

Unfortunately: same problem...



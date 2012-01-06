Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RjHDj-0004tN-5w
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jan 2012 22:21:03 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q06LDYui025373
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Jan 2012 13:13:34 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 6 Jan 2012 13:13:33 -0800
Message-ID: <4F0763FD.9000801@windriver.com>
Date: Fri, 6 Jan 2012 15:13:33 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1325876341.git.otavio@ossystems.com.br>
	<b61f46cb503582b669cbc56b0ea04d7fdaafd256.1325876341.git.otavio@ossystems.com.br>
	<1325879877.3234.2.camel@lenovo.internal.reciva.com>
	<CAP9ODKqpDS=sJQ-uuP5+E6QOMU7eQheWXqk+TSA4fkpwha6LVw@mail.gmail.com>
In-Reply-To: <CAP9ODKqpDS=sJQ-uuP5+E6QOMU7eQheWXqk+TSA4fkpwha6LVw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 5/5] udisks: disable manpage building
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
X-List-Received-Date: Fri, 06 Jan 2012 21:21:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/12 2:10 PM, Otavio Salvador wrote:
> On Fri, Jan 6, 2012 at 17:57, Phil Blundell<philb@gnu.org>  wrote:
>
>> On Fri, 2012-01-06 at 18:59 +0000, Otavio Salvador wrote:
>>> +EXTRA_OECONF = "--disable-man-pages"
>>
>> why is this desirable?
>>
>
> Because it was breaking builds for me.
>

In what way?  Most of the problems I've observed in the past have been docbook 
related, but I think those have been resolved within OE-Core.

Man pages are very desirable for a class of systems, so I'm hesitant to simply 
remove them w/o a reason or replacement (i.e. a static page)

--Mark



Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1S9wrQ-0004kq-MP
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 12:04:16 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Tue, 20 Mar 2012
	11:55:23 +0100
X-TM-IMSS-Message-ID: <32b1850f001458e9@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 32b1850f001458e9 ;
	Tue, 20 Mar 2012 11:55:27 +0100
Message-ID: <4F68621B.4000909@nedap.com>
Date: Tue, 20 Mar 2012 11:55:23 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Lightning/1.0b2 Thunderbird/3.1.19
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4F62FFB7.5070401@nedap.com> <4F6756A9.7020106@windriver.com>
In-Reply-To: <4F6756A9.7020106@windriver.com>
Subject: Re: remove dbg and dev packages
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
X-List-Received-Date: Tue, 20 Mar 2012 11:04:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/19/2012 04:54 PM, Mark Hatle wrote:
> On 3/16/12 3:54 AM, Jaap de Jong wrote:
>> Hi!
>>
>> is there an option (in local.conf?) to not build (or not add to the
>> repository of) the dbg and dev packages?
> You have to build the dev packages, otherwise you can't (cross) compile the
> software in the development environment.
Clear!

> The dbg packages are optional, but if you disable them then things may or may
> not be stripped and the filesizes on the target may increase.  (It's been a
> while since I tried it w/o dbg packages...)
Don't want that.

> Is there a reason why you don't want the dev and dbg packages to be generated?
> They should only be installed onto a target filesystem if you've requested them
> (or a package has a dependency on them).  Normal, non-dev, filesystems shouldn't
> be installed any of those components... if they are, there is a packaging bug in
> something.
The only simple reason is to keep the repository's and the Packages* 
files smaller.

Thanks for your comments!



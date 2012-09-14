Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TCbJe-0002Si-Mg
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 21:12:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8EG3riW025140
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 09:03:53 -0700 (PDT)
Received: from msp-dhcp28.wrs.com (172.25.34.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 14 Sep 2012 09:03:53 -0700
Message-ID: <50535568.2060407@windriver.com>
Date: Fri, 14 Sep 2012 11:03:52 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20120914081644.GC22757@localhost>
	<20120914114711.GF22757@localhost>
In-Reply-To: <20120914114711.GF22757@localhost>
Subject: Re: [meta-systemd] base-files and systemd services
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
X-List-Received-Date: Fri, 14 Sep 2012 19:12:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/12 6:47 AM, Holger Hans Peter Freyther wrote:
> On Fri, Sep 14, 2012 at 10:16:44AM +0200, Holger Hans Peter Freyther wrote:
>> Good Morning,
>>
>>
>> a.) Use a tempfiles.d/volatile.conf to create these directories?
>
> this does not work due the implementation of systemd-tmpfiles. It might
> or might not (depending on the hash of the dir to be created) create the
> /var/volatile/tmp dir before it creates /var/log/tmp/wtmp. I will have
> to patch the tmp.conf.
>
>> b.) Install initscripts in my systemd image?
>> c.) ???

I'd suggest two possible fixes, the first is somewhat "obvious" to me.  Fix the 
setup/initialization scripts to make sure /var/volatile is setup/mounted before 
systemd starts doing it's stuff....

But the alternative (if that is not reasonable or possible), create a custom 
"fs-perms.txt" to describe a functional filesystem layout for a systemd based 
configuration.  (This can be carried in the systemd layer.)

--Mark

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>




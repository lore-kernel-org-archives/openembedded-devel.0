Received: from carmex.station51.net ([109.74.206.142] helo=station51.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <butters@station51.net>) id 1OW4tO-000723-E8
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 11:56:44 +0200
Received: from [87.241.99.70] (account butters HELO [192.168.1.201])
	by station51.net (CommuniGate Pro SMTP 5.3.4)
	with ESMTPSA id 1571757 for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 11:51:39 +0200
Message-ID: <4C32FCA9.2050508@station51.net>
Date: Tue, 06 Jul 2010 11:51:37 +0200
From: Bill Sargent <butters@station51.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.4) Gecko/20100608 Thunderbird/3.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C2CE2E6.3050708@station51.net> <4C3092C5.5060606@station51.net>
	<AANLkTil9SMIAhB8Z7wEJ8uzgIT0aVpbK8R6CNgKzc6mu@mail.gmail.com>
	<4C30FDBB.2090900@station51.net>
	<AANLkTimAw443ZvzI1_ukdZIPq1zz0zSDFI4y2zO_O4gf@mail.gmail.com>
In-Reply-To: <AANLkTimAw443ZvzI1_ukdZIPq1zz0zSDFI4y2zO_O4gf@mail.gmail.com>
X-SA-Exim-Connect-IP: 109.74.206.142
X-SA-Exim-Mail-From: butters@station51.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenLDAP 2.4.21. doesn't create packages
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
X-List-Received-Date: Tue, 06 Jul 2010 09:56:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

  On 7/5/2010 2:33 AM, Khem Raj wrote:
>
> well I guess you need openldap-slapd instead of libldap-2.4-slapd and
> same for other packages
>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

No that doesn't work either.

I did however kind of get them installed by using PACKAGE_INSTALL in my 
custom recipe. I specified libldap-2.4-slapd and -bin as well as all the 
other libldap 2.4 backends. I don't know what the difference is in 
INSTALL_IMAGE and PACKAGE_INSTALL ... I had started out by just 
modifying console-image and then I used
http://docs.openembedded.org/usermanual/usermanual.html#commonuse_new_image

to create my own. What I need is an image with PHP, Apache2, LDAP and 
MySQL installed. And I had everything going except LDAP. And now even 
though I have the packages installed, there are no init scripts for it, 
and there are no configs for any of this stuff. I just don't get it.

Bill



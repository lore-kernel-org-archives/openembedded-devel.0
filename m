Received: from carmex.station51.net ([109.74.206.142] helo=station51.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <butters@station51.net>) id 1OVPk5-0000gu-81
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 16:00:28 +0200
Received: from [87.241.99.70] (account butters HELO [192.168.1.201])
	by station51.net (CommuniGate Pro SMTP 5.3.4)
	with ESMTPSA id 1566348 for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 15:55:21 +0200
Message-ID: <4C3092C5.5060606@station51.net>
Date: Sun, 04 Jul 2010 15:55:17 +0200
From: Bill Sargent <butters@station51.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.4) Gecko/20100608 Thunderbird/3.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C2CE2E6.3050708@station51.net>
In-Reply-To: <4C2CE2E6.3050708@station51.net>
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
X-List-Received-Date: Sun, 04 Jul 2010 14:00:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 7/1/2010 8:48 PM, Bill Sargent wrote:
>  Hello,
>
> I'm trying to add the openldap 2.4.21 recipe to my bootable image, and 
> it doesn't seem to be creating the packages. It installs only the libs 
> and no binaries (slapd etc..) ... I looked at the recipe and it seems 
> it should be creating some bin package as well as base etc... but I 
> haven't seen any in my packages directories.
>
> Can someone explain to me what is wrong? Is there a problem with the 
> openldap recipe?
>
> Thanks
> Bill

Well I wrote this the other day and as usual, nobody responded. I 
finally got it to spit out libldap-2.40*.ipk with the slapd etc... 
however, adding

libldap-2.4-slapd
and
libldap-2.4-bin

to my IMAGE_INSTALL variable doesn't seem to work. Can someone explain 
to me, the correct way to install a full working openldap server and 
utilities into an image?

As much documentation as there is for this, apparently we need a list of 
installable packages as well since the filenames don't exactly always 
mean that it's a package name thats installable.  If there is one, I've 
missed it I think :)

Thanks,
Bill





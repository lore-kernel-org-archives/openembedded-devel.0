Received: from carmex.station51.net ([109.74.206.142] helo=station51.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <butters@station51.net>) id 1OVWrc-00057N-AT
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 23:36:44 +0200
Received: from [87.241.99.70] (account butters HELO [192.168.1.201])
	by station51.net (CommuniGate Pro SMTP 5.3.4)
	with ESMTPSA id 1567114 for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 23:31:43 +0200
Message-ID: <4C30FDBB.2090900@station51.net>
Date: Sun, 04 Jul 2010 23:31:39 +0200
From: Bill Sargent <butters@station51.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.4) Gecko/20100608 Thunderbird/3.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C2CE2E6.3050708@station51.net> <4C3092C5.5060606@station51.net>
	<AANLkTil9SMIAhB8Z7wEJ8uzgIT0aVpbK8R6CNgKzc6mu@mail.gmail.com>
In-Reply-To: <AANLkTil9SMIAhB8Z7wEJ8uzgIT0aVpbK8R6CNgKzc6mu@mail.gmail.com>
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
X-List-Received-Date: Sun, 04 Jul 2010 21:36:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

  On 7/4/2010 7:58 PM, Khem Raj wrote:
>
> suppose your image is console-image then you can add something like
> below to your local.conf
>
> IMAGE_INSTALL_append_pn-console-image = " libldap-2.4-slapd libldap-2.4-bin"
>
>
>

I get this:

ERROR: [/home/bill/oe/openembedded/recipes/images/console-image.bb] 
RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 
'libldap-2.4-slapd' but it wasn't found in any PACKAGE or RPROVIDES 
variables.
NOTE: Runtime target libldap-2.4-slapd  is unbuildable, removing ...
Missing or unbuildable dependency chain was: [libldap-2.4-slapd]
ERROR: Required build target 'console-imageä has no buildable providers.
Missing or unbuilding depenency chain was: [console-image, 
libldap-2.4-slapd]

I see the packages. I see this specific package. I even erased the 
packages, cleared the staging, and rebuilt them and they're back again, 
but it still will not incorporate them in to my image.

Is the recipe correct? SHouldnt the  Openldap recipe have a PROVIDES 
variable in it saying that it provides these packages?


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




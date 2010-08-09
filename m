Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henri.bragge@dcombus.com>) id 1OiQlU-00017K-N9
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 13:43:38 +0200
Received: from [100.100.100.68] (unknown [83.150.95.26])
	by smtp-68.nebula.fi (Postfix) with ESMTP id 5E16D43F06A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Aug 2010 14:43:24 +0300 (EEST)
Message-ID: <4C5FE9F0.20501@dcombus.com>
Date: Mon, 09 Aug 2010 14:43:44 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>	<1280926084-7605-1-git-send-email-henri.bragge@dcombus.com>	<AANLkTinnz+cB5Au1hMsniwFbCSjo-EaNWoR=9Xae4krA@mail.gmail.com>	<loom.20100805T104704-558@post.gmane.org>	<AANLkTik=13a7k7D1n=VfJnqO5DdPy5PUVdLdnDHtZh1d@mail.gmail.com>	<AANLkTim41rfG5eqwrEu5goiqFZqhZK3XY2Pq=shdANTU@mail.gmail.com>	<AANLkTincP+hP1RSsA+u5+HQ3xKLFgDkt7x4R-hN3kOsP@mail.gmail.com>	<4C5BDE5B.3050008@dcombus.com>
	<AANLkTikjR5wxTzno2fJwtnDwVzDrQaMTVU=SiEbxHbCp@mail.gmail.com>
In-Reply-To: <AANLkTikjR5wxTzno2fJwtnDwVzDrQaMTVU=SiEbxHbCp@mail.gmail.com>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: henri.bragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 1/2] recipe for gsnmp-0.3.0
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
X-List-Received-Date: Mon, 09 Aug 2010 11:43:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> Still one issue left:
>
> I saw this warning when building another package:
>
> /home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal/gsnmp.m4:4:
> warning: underquoted definition of AM_PATH_GSNMP
> /home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal/gsnmp.m4:4:
>   run info '(automake)Extending aclocal'
> /home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal/gsnmp.m4:4:
>   or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
>
> I suggest a patch to resolve this.
>   

Posted a patch that should fix this. Couldn't really reproduce the 
problem but I hope it helps..

- Henri



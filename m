Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PqNKC-0004dP-8N
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 11:12:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 30B423148B51
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 11:11:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ohTUsZIPuKN2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 11:11:14 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 32BE5314DD01
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 11:11:14 +0100 (CET)
Message-ID: <4D5E45C1.7010504@opendreambox.org>
Date: Fri, 18 Feb 2011 11:11:13 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110208 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinr=zf_zn16kQrx4h=ZTVnJnZyQVE46oLjN+v-Q@mail.gmail.com>
In-Reply-To: <AANLkTinr=zf_zn16kQrx4h=ZTVnJnZyQVE46oLjN+v-Q@mail.gmail.com>
Subject: Re: deb packages architecture problem.
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
X-List-Received-Date: Fri, 18 Feb 2011 10:12:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/17/2011 10:40 PM, Filip Zyzniewski wrote:
> there is a problem with deb packages.
> 
> When installing packages on the target system dpkg complains:
> "package architecture (arm) does not match system (armel)"
> 
> The question is - should we convince dpkg that the architecture is
> arm, or build the packages so that their architecture is armel?
> 
> First solution may cause some problems with dpkg not expecting this
> value on a particular system, the second means potential bugs
> resulting from a deeper change in OpenEmbedded.

Looking at package_deb.bbclass, the solution seems to be setting
DPKG_ARCH_arm ?= "armel" in there.

Regards,
Andreas



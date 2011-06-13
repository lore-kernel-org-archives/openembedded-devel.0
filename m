Received: from ns1.gatteins.it ([193.58.239.94])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <matteo.facchinetti@sirius-es.it>) id 1QW20K-0003v6-CC
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 09:56:12 +0200
X-Virus-Scanned: amavisd-new at gattei.com
Received: from [10.16.100.107] (78-134-76-42.dynamic.eolo.it [78.134.76.42])
	by ns1.gatteins.it (Postfix) with ESMTPA id 40970DEF22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 09:52:55 +0200 (MEST)
Message-ID: <4DF5C1D1.9000201@sirius-es.it>
Date: Mon, 13 Jun 2011 09:52:49 +0200
From: Matteo Facchinetti <matteo.facchinetti@sirius-es.it>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1307541389-2401-1-git-send-email-matteo.facchinetti@sirius-es.it>	<1307551786.4193.25.camel@mattotaupa>
	<4DF0A343.6040608@sirius-es.it>
	<1307696674.4148.7.camel@mattotaupa>
In-Reply-To: <1307696674.4148.7.camel@mattotaupa>
Subject: Re: [PATCH v2] wxbase_2.8.9: fix includepath for SDL dependency
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
X-List-Received-Date: Mon, 13 Jun 2011 07:56:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2011 11:04 AM, Paul Menzel wrote:
> Thank you for the explanation. I think it is generally discourage to
> have arbitrary build behavior in OE recipes.
>
> Do you need to use SDL?
No, for my project I don't use it.
>   Is it generally needed when using wxbase? If yes
> the dependency to sdl should be added and `--with-sdl` passed to
> configure.
>
Generally, could be need use this feat when board have ALSA support but 
in other case best way is to disable it.

In according with the project, I think could be a good choice to make a 
new recipes with wxbase-nosoud_2.8.9.bb,
and for wxbase_2.8.9.bb we force to compile with sound support, correct 
sdl path and right dependency.

What do you think about this?

Matteo



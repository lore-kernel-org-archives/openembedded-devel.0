Received: from [200.234.205.219] (helo=hm633.locaweb.com.br)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <alainm@pobox.com>) id 1K91fV-0006NM-P9
	for openembedded-devel@openembedded.org; Wed, 18 Jun 2008 19:42:02 +0200
Received: (qmail 7211 invoked from network); 18 Jun 2008 17:40:57 -0000
Received: from unknown (10.1.10.145)
	by hm633.locaweb.com.br with QMQP; 18 Jun 2008 17:40:57 -0000
Received: from unknown (HELO alain.cosmodata.inet)
	(am@cosmodata.com.br@201.20.205.130)
	by hm145.locaweb.com.br with SMTP; 18 Jun 2008 17:41:10 -0000
Message-ID: <48594898.5080507@pobox.com>
Date: Wed, 18 Jun 2008 14:40:40 -0300
From: "Alain M." <alainm@pobox.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20070728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ae36f8040806180812j37bca53lf1e06722a8246a55@mail.gmail.com>
	<200806181725.49146.mickey@vanille-media.de>
	<ae36f8040806180956r7143e0eelc1adbf65112d9a3c@mail.gmail.com>
In-Reply-To: <ae36f8040806180956r7143e0eelc1adbf65112d9a3c@mail.gmail.com>
Subject: Re: [Angstrom-devel] problems with bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 18 Jun 2008 17:42:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I would like to ask you to kindly send the fix here on the list, I will 
do the same on ubuntu 8.04 in a few weeks and it will be of great value 
to me :)

Thanks,
Alain

Luís Vitório Cargnini escreveu:
> I did as you said, I finded the error in expression regular, the error
> was in BBFILES I fixed it
> but the error now is:
> 
> 
> lvcargnini@protheus:~/instramed/openembedded$ bitbake nano
> ERROR:  Openembedded's config sanity checker detected a potential
> misconfiguration.
> 	Either fix the cause of this error or at your own risk disable the
> checker (see sanity.conf).
> 	Following is the list of potential problems / advisories:
> 
> 	Please set TARGET_ARCH directly, or choose a MACHINE or DISTRO that does so.
> Please set TARGET_OS directly, or choose a MACHINE or DISTRO that does so.
> DISTRO 'None' not found. Please set a valid DISTRO in your local.conf
> 
> 
> On Wed, Jun 18, 2008 at 12:25 PM, Michael 'Mickey' Lauer
> <mickey@vanille-media.de> wrote:
>> Am Mittwoch 18 Juni 2008 17:12:53 schrieb Luís Vitório Cargnini:
>>> Dear fellows:
>>>
>>> I'm restarting the development process based on openembedded with
>>> angstrom distro, after reconfiguring a new machine (ubuntu 8.04) to
>>> work properly I did the following:
>>> bitbake base-image ; bitbake console-image ; bitbake x11-image
>>>
>>> and get the following errors:
>>>
>>> ERROR: no files to build.
>> This almost always is a problem of BBFILES or BBPATH settings. Since your
>> BBFILES seems to be set (double check whether the regex is valid), double
>> check whether BBPATH points to the proper directories, so that Bitbake
>> actually has a chance to find your local.conf and its bitbake.conf.
>>
>> --
>> :M:
>>
>> _______________________________________________
>> Angstrom-distro-devel mailing list
>> Angstrom-distro-devel@linuxtogo.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/angstrom-distro-devel
>>
> 
> 
> 



Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Sggp3-0002QB-4T
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jun 2012 20:37:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5IIQPuk017170
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2012 11:26:25 -0700 (PDT)
Received: from msp-dhcp56.wrs.com (172.25.34.56) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 18 Jun 2012 11:26:25 -0700
Message-ID: <4FDF72D0.2000008@windriver.com>
Date: Mon, 18 Jun 2012 13:26:24 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <CAE9DZUTckmmxoW_kdKksyT7tq86zV-AacJGwrEqpCFh+vBZYFw@mail.gmail.com>
In-Reply-To: <CAE9DZUTckmmxoW_kdKksyT7tq86zV-AacJGwrEqpCFh+vBZYFw@mail.gmail.com>
Subject: Re: Package selection
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
X-List-Received-Date: Mon, 18 Jun 2012 18:37:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/12 11:57 AM, Dallas Clement wrote:
> Pardon my ignorance, I am a newb to OE / BitBake.  I've been building
> custom embedded rootfs images the old fashioned way by hand for a long
> time.
>
> Recently I've been experimenting with OE / BitBake to determine if it
> is suitable for my needs.  I want to be able to select exactly which
> packages are included in my custom distro.  I tried to build the
> "helloworld" example, and it seemed to download and build gobs of
> packages, when all I wanted was the most rudimentary rootfs.  In fact,
> for starters I'd like to build a rootfs that simply consists of a
> statically built busybox and have the init process point to the ash
> shell.  Is this even possible with OE?  Once I gain confidence with
> something simple like this, I'd like to continue refining things by
> adding packages that I select.
>
> Lastly, it is possible to avoid the repeated fetching of source
> packages?  In other words, can the source URI's point to packages in a
> local file system repository?

if you use 'hob' you can get a graphical environment and an easy way to select 
exactly what you want on the target rootfs.  Don't be surprised though if it 
builds more then you think it should, as dependency resolution is complete 
during the build process.. the image generation uses a package specific 
resolution to get the smallest set for your image based on your requirements.

--Mark

> Thanks much,
>
> Dallas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




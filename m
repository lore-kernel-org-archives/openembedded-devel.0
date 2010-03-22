Received: from exprod5og114.obsmtp.com ([64.18.0.28])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Ntd4a-0005xG-AZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 09:33:28 +0100
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob114.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6cqlcKlLv+kVJPohicVLYX+4Ssdyt1b@postini.com;
	Mon, 22 Mar 2010 01:30:14 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip06.e2k.ad.ge.com with ESMTP; 22 Mar 2010 04:30:12 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 04:30:12 -0400
Message-ID: <4BA72B57.9050807@ge.com>
Date: Mon, 22 Mar 2010 08:33:27 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201003191752.13129.marcin@juszkiewicz.com.pl>
In-Reply-To: <201003191752.13129.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 64.18.0.28
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Rootfs without busybox in it
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
X-List-Received-Date: Mon, 22 Mar 2010 08:33:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> Hi
>
> As part of my work for BugLabs company I am working on creating root 
> filesystem which does not rely on BusyBox for 90% of commands but rather use 
> normal versions of them.
>   

I have a patch series that completely removes the need for busybox we
have been working on that I have been trying to get in shape to post on
this list . It's definitely not quite right yet, however it works. I'll
post it to the mailing list.

Martyn

> I have something what boots and more or less works but found few issues for 
> which I want to get some discussion.
>
> 1. 'ifupdown' package needed changes:
>
> - removal of 'networking' initscript
> - removal of 'interfaces' definition
> - shipping /etc/network/run/ directory
>
> first two are present in 'netbase' and are usually more optimised for OE 
> targets, last one is required for keeping information about state of 
> interfaces
>
> 2. lack of '/bin/sh' makes device not bootable
>
> One solution is to use 'update-alternatives' script for handling that. But 
> this is 'egg & chicken' problem because 'u-a' is shell script. So far my 
> temporary solution is creation of 'bash-sh' package which symlinks '/bin/bash' 
> in post install script and in pre remove symlinks it to busybox. It is not 
> ideal but I needed something to get it working.
>
> 3. lack of '/etc/init.d/hwclock.sh'
>
> We provide it with BusyBox package, Debian has own one in util-linux(-ng) 
> package. I am planning to strip Debian one from log functions and test it.
>
> 4. lack of 'start-stop-daemon'
>
> So far I am using one from 'dpkg' but not extracted it to separate package.
>
> 5. 'adduser' is from 'tinylogin'
>
> We can not use Debian one because it is written in Perl. 'useradd' comes from 
> 'shadow' package. There are few versions of 'adduser' command in contrib/ 
> directory of shadow sources - 'adduser.sh' one looks simplest.
>
> Tinylogin should be dropped in OE anyway in favour of BusyBox (but that's 
> other story).
>
> Will write more when will remind them.
>
> Regards, 
>   
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189




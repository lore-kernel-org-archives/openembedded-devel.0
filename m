Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dfoley@techsol.ca>) id 1NY6ah-0006Wn-R4
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 00:37:35 +0100
Received: by pwi4 with SMTP id 4so347969pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 15:35:13 -0800 (PST)
Received: by 10.142.118.20 with SMTP id q20mr1459148wfc.135.1264116913766;
	Thu, 21 Jan 2010 15:35:13 -0800 (PST)
Received: from ?192.168.0.42? (s207-6-220-230.bc.hsia.telus.net
	[207.6.220.230])
	by mx.google.com with ESMTPS id 22sm1467365pzk.10.2010.01.21.15.35.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Jan 2010 15:35:11 -0800 (PST)
Message-ID: <4B58E4AD.8010406@techsol.ca>
Date: Thu, 21 Jan 2010 15:35:09 -0800
From: Dallas Foley <dfoley@techsol.ca>
Organization: Techsol
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <op.u6vw72i1mn1qzu@guohr-laptop-ubuntu>	<19c1b8a91001211410y19908564h7fe9aca3f81317ab@mail.gmail.com>	<4B58D410.2020100@techsol.ca>
	<20100121232210.GB11015@gmail.com>
In-Reply-To: <20100121232210.GB11015@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: dfoley@techsol.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: I realy think we should upgrade PREFERRED_VERSION_glibc to 2.9 in conf/distro/include/sane-toolchain.inc
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
X-List-Received-Date: Thu, 21 Jan 2010 23:37:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On (21/01/10 14:24), Dallas Foley wrote:
>> Khem Raj wrote:
>>> On Thu, Jan 21, 2010 at 5:32 AM, Guo Hongruan <camelguo@gmail.com> wrote:
>>>> Hi guys,
>>>> I think we should upgrade PREFERRED_VERSION_glibc from 2.6 to 2.9 in
>>>> conf/distro/include/sane-toolchain.inc. The reasons are:
>> Although I haven't tried a build from scratch in a few weeks or so,
>> I have one known problem with glibc 2.9. I wonder if it's just me or
>> not. glibc 2.6.1 always works. On my armv4t board gpe-mini-browser2
>> always seg faults. I've tried different gcc and binutils
>> combinations. However, glibc 2.9 on armv5te (imx) or armv7a (omap)
>> work fine for me.
> 
> You could try to backport armv4t-interworking.patch from eglibc/files
> that should help you will getting 2.9 up on armv4t. This patch is
> applied to 2.10.1 may be moving to 2.10.1 would be better than 2.9
> IMO

Ok thanks.
If my line wrapping was wrong in the previous post, then sorry about that.

> 
> -Khem
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





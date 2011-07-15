Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QhogS-0003tT-HM
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 22:08:24 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qhoca-0007E2-5y from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 13:04:24 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 15 Jul 2011 13:04:24 -0700
Received: from [172.30.80.62] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 15 Jul 2011 13:04:23 -0700
Message-ID: <4E209D45.9000802@mentor.com>
Date: Fri, 15 Jul 2011 13:04:21 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <09D9BE2AC4AA764DABAA8C91E48D819E0157569474@DEMCHP99E35MSX.ww902.siemens.net>
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819E0157569474@DEMCHP99E35MSX.ww902.siemens.net>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 15 Jul 2011 20:04:24.0021 (UTC)
	FILETIME=[64788850:01CC432A]
Subject: Re: PSTAGE_MIRROR not working with file:// uri
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
X-List-Received-Date: Fri, 15 Jul 2011 20:08:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/15/2011 01:48 AM, Aeschbacher, Fabrice wrote:
> Hi,
> 
> [bitbake 1.12 / OE 2010.12]
> 
> I am facing a quite strange issue with packaged-staging (INHERIT += "packaged-staging" in local.conf) when trying to use a pre-built toolchain.
[snip]
> I guess this must already have worked, mainly because of this comment in the .bbclass:
> 
>   # To use the prebuilt pstage packages, save them away..
>   # $ rsync --delete -a tmp/pstage/ /there/oe/build/pstage_mirror
>   # .. and use it as mirror in your conf/local.conf:
>   # PSTAGE_MIRROR = "file:///there/oe/build/pstage_mirror"
> 
> So I wondered if someone can confirm that PSTAGE_MIRROR has already worked with a file:/// uri,
> and could see what I am missing here.

Internally we have code like http://pastebin.com/cb1Nen97 and file URIs
work.  Try merging the two and see if that fixes things?

-- 
Tom Rini
Mentor Graphics Corporation



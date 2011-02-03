Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@vdm-design.de>) id 1Pkvu4-0001tN-Av
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 10:55:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 1F425309C003
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Feb 2011 10:54:10 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 7mkP7FJKxjHX
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Feb 2011 10:54:09 +0100 (CET)
Received: from rikrok.localnet (rikrok.physik.uni-bonn.de [131.220.167.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTPSA id BAC40309C002
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Feb 2011 10:54:09 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 3 Feb 2011 10:54:08 +0100
User-Agent: KMail/1.10.3 (Linux/2.6.27.45-0.1-default; KDE/4.1.3; i686; ; )
References: <20110203093253.GG4580@excalibur.local>
In-Reply-To: <20110203093253.GG4580@excalibur.local>
MIME-Version: 1.0
Message-Id: <201102031054.08764.ml@vdm-design.de>
Subject: Re: libnl vs. libnl2 madness
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
X-List-Received-Date: Thu, 03 Feb 2011 09:55:05 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 03 February 2011 10:32:53 Stefan Schmidt wrote:
> Hello.
>
> The last hours I was trying to compile wpa_supplicant with nl80211 support.
> That needs netlink support through libnl or libnl2.
>
> Enabling the option to use libnl2, not that easy to find, still breaks with
> missing header files. Checking the libnl2 source shows that they are
> provided. After some head on the table banging I found:
>
> commit 880e00d3b7ccf66d9421a06bc28e553e07842b59
> Author: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> Date:   Tue Nov 24 16:33:06 2009 +0000
>
>     libnl2: change includedir to not step over libnl1; also convert to new
> staging

At that time there was just one recipe depending on libnl2 and that was FSO2.
I think one month ago JaMa has build the first SHR image without libnl(1), 
until then it was impossible because of some important parts. I'm not sure but 
i think the main blocker was bluez4 (Can't check now).

But i think there are a lot minor packages that still require libnl and don't 
support libnl2.

Regards
Thomas



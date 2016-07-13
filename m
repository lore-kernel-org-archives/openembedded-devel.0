Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 06AC96E667
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 07:03:36 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1bNECg-0004AU-72 for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jul 2016 09:03:30 +0200
Received: from ip4da29576.direct-adsl.nl ([77.162.149.118])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 09:03:30 +0200
Received: from koen by ip4da29576.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 09:03:30 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 13 Jul 2016 09:03:21 +0200
Message-ID: <nm4p3p$a9f$1@ger.gmane.org>
References: <1468317923-18042-1-git-send-email-koen.kooi@linaro.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da29576.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
In-Reply-To: <1468317923-18042-1-git-send-email-koen.kooi@linaro.org>
Subject: Re: [RFC][PATCH] mozjs: add 45.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2016 07:03:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Op 12-07-16 om 12:05 schreef Koen Kooi:
> Mozjs 17 has serious issues on non-x86 64 bit hardware and worse, on 48/51 bit VA architectures. The systemd -> polkit -> mozjs chain renders various armv8 systems unbootable due to that. There are no fixes for mozjs17, only more recent versions.
> 
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
> 
> This is an RFC since there are a number of things needing to get sorted out, like the usage for host python instead of the sysroot one and the fact that configure runs 'pip install', which needs networking. But it's mozilla software, so we have to accept that it's ugly and a maintenance nightmare. 

And of course polkit can only work with mozjs17. Great, a 'security' helper
than depends on a library that doesn't get any security updates and doesn't
work properly on !x86...

I'll see if I can fix polkit in a different way, there's a patch to move it to
the duktape js library, maybe that will improve things.

regards,

Koen






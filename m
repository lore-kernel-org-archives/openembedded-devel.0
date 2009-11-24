Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NCsWu-0003r3-Rd
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 11:21:55 +0100
Received: by bwz19 with SMTP id 19so5890001bwz.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 02:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=v8uqpxEitpPTWkD4q3/en3O7H5m+YLat4IYGmvVMm1M=;
	b=ZlKLxw9MSOFiv8yYSGInfTiNswMrQsgbW08de5l4IUxLy6qbRn/jqgRNKOYFUUo4A1
	QDmlBvfWMlCGFOsQa5NKkltnX9g6kmFf734kTyjbzcZvNkFtjnbuzu9NbHXwThljvOxO
	9VUfkDP91rVUJfEO+yL3ZY7TPk0KmqyTH0mOM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ErmfO82uxTCZybTcdWfxOy47ofE0/fCkSLElJmpkCPLWS2uF2DR0KpsxSuvOZN6nmR
	vLmKoKgsTrf75Wctxiu7PsJZp5HVZq0Q8dQ3hFzw6vNimqWvanSyteqdKKRnTZeQncaB
	e8rtvD8Y/lYmm9jAatHQHn3kOt7uPWmhRN310=
Received: by 10.204.49.68 with SMTP id u4mr5990991bkf.42.1259058024231;
	Tue, 24 Nov 2009 02:20:24 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm1721847fxm.6.2009.11.24.02.20.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Nov 2009 02:20:23 -0800 (PST)
Date: Tue, 24 Nov 2009 11:20:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091124102028.GG28485@jama>
References: <E1NCsJm-0008Ly-9m@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1NCsJm-0008Ly-9m@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [oe-commits] Koen Kooi : opkg-target,sdk: bump SRCREV
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
X-List-Received-Date: Tue, 24 Nov 2009 10:21:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 24, 2009 at 10:08:18AM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 2fdf1aa1c869ea9deecee86206f49a2eca9d7c00
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=2fdf1aa1c869ea9deecee86206f49a2eca9d7c00
> 
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Tue Nov 24 10:22:43 2009 +0100
> 
> opkg-target,sdk: bump SRCREV

Hi,

just out of curiosity, does your opkg also ship with update-alternatives
script included in package?

Haven't you problem with it, ie not respecting
virtual/update-alternatives set for distribution in OE?

We're using slightly modified cworth's update-alternatives script
http://patchwork.openembedded.org/patch/1291/
so we need to remove it from opkg, because otherwise version from opkg
is higher in PATH :/
http://patchwork.openembedded.org/patch/1290/

Could other distributions also use this?

Cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         



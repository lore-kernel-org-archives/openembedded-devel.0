Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SCW0U-0006Jg-3W
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 15:00:14 +0200
Received: by bkcjg15 with SMTP id jg15so5328748bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 05:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=AVsHz3sKr23sY8eOUjumaJVNo4bN78lddg9geu9cjT0=;
	b=jIJ5Db/6tDFBTJnZJk3dqssqyvr6u0bQIqI5MR121E1Hm/sQ+JeZ14CRwqyJxRrxag
	7cZR4HcCESDeb/zu1L818FjREbc0NaLHbJeb1wCGg0exmOWqUD+DzPLtC/Z/LGImxzzk
	OMO+bj8uPaJv08u5CGQ57yW4WC9r/TYHtg7PMQmKAqb7oH39ZcLgrMIU0GU8R6t5f0ir
	PkIp/0j5oaePqLAn+gYyb4AiCzIdspbHa7yLg+vQWxhaSQ2cdoNR1WNcZnBdFC/rkuLp
	1r42M03S2Y9v+yt5ffpb/aAziG5vdyNfmxZrBChf6i1svhpyxqn4/JeJ3r36Ph8XvQJO
	96bg==
Received: by 10.204.155.83 with SMTP id r19mr10192263bkw.123.1332852673124;
	Tue, 27 Mar 2012 05:51:13 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id p19sm26102291bka.1.2012.03.27.05.51.11
	(version=SSLv3 cipher=OTHER); Tue, 27 Mar 2012 05:51:12 -0700 (PDT)
Message-ID: <4F71B7BF.6010707@dresearch-fe.de>
Date: Tue, 27 Mar 2012 14:51:11 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <8c581985c4eb9edd0843595fb0b735f70a899c48.1332849864.git.sledz@dresearch-fe.de>
	<71df8a759f91e821a2daee22f34eaa3a31708775.1332849864.git.sledz@dresearch-fe.de>
	<4F71B620.7020304@opendreambox.org>
In-Reply-To: <4F71B620.7020304@opendreambox.org>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQkyw+y4OGnhki2bdMr0A/8htc2Y+2uuHW+GULGbMiA2tfHjuQ+wE+lMSpPKCqChoDVhYS4Z
Subject: Re: [2011.03-maintenance 3/3] python-2.6.6: Fix python-2.6.6 build failure on linux-3.x
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
X-List-Received-Date: Tue, 27 Mar 2012 13:00:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2012 14:44, Andreas Oberritter wrote:
> On 27.03.2012 14:07, Steffen Sledz wrote:
>> From: Ulf Samuelsson <ulf_samuelsson@telia.com>
>>
>> python-2.6.6 build will crash when host is running linux kernel 3.x.
>>
>> Fix backported from openembedded-core.
>> meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
> 
> This patch has been superseded by a backport from upstream python,
> causing linux2 to be used for all kernel versions. See commit
> accb2b728ab10cae20be59253a56ac6410b8de10 in oe-core.

Is this patch available in oe-classic master?

I'm just trying to keep the 2011.03-maintenance branch usable with a minimum of work. And the one from the pull request is good enough for me at the moment.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



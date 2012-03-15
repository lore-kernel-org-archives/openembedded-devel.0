Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1S8Avy-0004H4-Rm
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 14:41:38 +0100
Received: by bkcjg15 with SMTP id jg15so2295448bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 06:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=1RNcd2d5BFwapH8hMFXKvRBchnYAuXwei+9X/A2t5Ac=;
	b=f7WL9JE1SK6vyrNCIs4q6LuE6nWOJx5xsABR+JPHoPRQBsFhDq08NeSGKdhCJztZh3
	KFBDhIbsMi8sKT1OqDCN1iR/oAAmJ6obFMPPUxHE+gCQNPCAYLii5dk8bxKlPZci96om
	/dfJj5IHccz1Pb4rWt2uQDOfrYKyqx2cUWSuxfaa0K+X0grn1jdFiRdCF1zHJHxdakjb
	B2KemVZcov810INwexCq2cLoqdOhm46KqFWf/0Rfb2MOKNtLSmHBlz0zosNV+oE+3hWJ
	UD8cUZy1Z6zDFLsT4+NOBfYRxUFVe+6Hi3VADqjxsXQcJ4UMGOx8EhtCN4AqgE8SGBrt
	7R6A==
Received: by 10.204.157.134 with SMTP id b6mr2580994bkx.88.1331818371856;
	Thu, 15 Mar 2012 06:32:51 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(pd95cbf07.dip0.t-ipconnect.de. [217.92.191.7])
	by mx.google.com with ESMTPS id je3sm3755907bkb.15.2012.03.15.06.32.50
	(version=SSLv3 cipher=OTHER); Thu, 15 Mar 2012 06:32:51 -0700 (PDT)
Message-ID: <4F61EF82.6060609@dresearch-fe.de>
Date: Thu, 15 Mar 2012 14:32:50 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAAwVp3u7i6ptQ=dvCV_RGwctHqDWKLXXPXKjGwZJ_okhDx8gwg@mail.gmail.com>
In-Reply-To: <CAAwVp3u7i6ptQ=dvCV_RGwctHqDWKLXXPXKjGwZJ_okhDx8gwg@mail.gmail.com>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQmU8CIwYNopWxC6Vs1G1x49j/BfgWSmF5VNlae8hTeLEHPavlvhqYUPYfEQKBibozlIBkur
Subject: Re: udev_141 vs. udev_network_queue.sh
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
X-List-Received-Date: Thu, 15 Mar 2012 13:41:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2012 16:06, Mario Schuknecht wrote:
> The udev script /etc/udev/scripts/network.sh writes all not configured
> interfaces into the file /dev/udev_network_queue
> root@3065-4-00001:~# cat /dev/udev_network_queue
> eth0
> lo
> ra0
> But no script or program check this file.
> I googled  udev_network_queue and found an old bitbake recipe
> http://svn.nslu2-linux.org/svnroot/slugos/releases/slugos-3.10-beta/openembedded/packages/udev/udev_084.bb
> that
> installs  udev_network_queue.sh.
> That script checks this files and starts the interfaces.
> 
> Why is this file not installed any longer? Is there any other way or
> concept to handle this situation?

It seems that the installation of this script was lost in between udev_084 and udev_089. The latter was introduced by Philipp Zabel (commit 83e3ce3dbc5f49a7c8ee4b535ed14d8938c252aa).

Can someone remember if this script wasn't installed any longer by intention or by mistake?

Should it be installed in later udev versions again?

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



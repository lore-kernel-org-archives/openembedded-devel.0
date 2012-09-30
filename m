Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1TIRFh-000170-Ti
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Sep 2012 23:40:41 +0200
Received: by weyt44 with SMTP id t44so2540561wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Sep 2012 14:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=Qn2wT3nO8L1qMHKqmlegomcu1RnZyGpPiBzeteinFyI=;
	b=lxDxqT+a5yaUVa+VnElojxYmVmkzY1latJ3dGzKMT1KeWxHc5KR3Sim/+URB0rzXwF
	92RK0oVjFTsPrSpLGKsrhbs7KK6YdZWcBRnjfMuxpsBD/TWHB/1JSY2Ta6B+7tMNZY8s
	eBXVrfWuvHvMTJSIWeM7sivzK08E+fmIISfjS/kGaCOClUKR9SlGdQfJ/c/t+Aid3/Bg
	xkx1S3ElpZUBs4sRmpjKC1LanjNF/8IjVnbGucxVB+a4+GEi4Q7tzYamqyN8D+TrDHze
	WDQ+l4qhNFucJaS9Yf1Qas/7lxI7SMFRcrRQET5YyZYqW/h8/z+QtYKSv+UY/KnxBpY+
	rOrA==
Received: by 10.216.145.80 with SMTP id o58mr5720439wej.84.1349040465683;
	Sun, 30 Sep 2012 14:27:45 -0700 (PDT)
Received: from localhost.localdomain ([46.53.195.142])
	by mx.google.com with ESMTPS id dt9sm10653653wib.1.2012.09.30.14.27.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 30 Sep 2012 14:27:45 -0700 (PDT)
Received: from jek by localhost.localdomain with local (Exim 4.80)
	(envelope-from <jekhor@gmail.com>)
	id 1TIR38-0006Ne-Ng; Mon, 01 Oct 2012 00:27:42 +0300
Date: Mon, 1 Oct 2012 00:27:42 +0300
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120930212742.GA24230@jeknote.loshitsa1.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Invalid build host architecture detection on multiarch systems
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
X-List-Received-Date: Sun, 30 Sep 2012 21:40:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

The current OE-Core build system detects a build host arch based on 'uname'
output. This works good in case of a single-architecture system. But if we
have, for example, amd64 kernel + i386 userspace, detection fails.
It can be invalid if we have multiarch-enabled userspace also.

Openssl-native is not compiled in such cases due architecture-specific
assembler sources.

My assumption that an build host arch can be defined as a default
architecture of the main C compiler ('gcc -dumpmachine' or by similar way).

-- 
Yauhen Kharuzhy		JID: jek@jabber.ru
			skype: jekhor
 
A: No
Q: Should I quote below my post?



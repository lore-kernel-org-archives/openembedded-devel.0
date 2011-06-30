Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QcEHl-0002WG-2G
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 12:15:49 +0200
Received: by bwf20 with SMTP id 20so1982154bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 03:12:05 -0700 (PDT)
Received: by 10.204.169.130 with SMTP id z2mr1677867bky.137.1309428725354;
	Thu, 30 Jun 2011 03:12:05 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id k5sm1944839bka.17.2011.06.30.03.12.04
	(version=SSLv3 cipher=OTHER); Thu, 30 Jun 2011 03:12:04 -0700 (PDT)
Message-ID: <4E0C4BF3.2050701@dresearch-fe.de>
Date: Thu, 30 Jun 2011 12:12:03 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Any reasons not to use "newer" ppp?
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
X-List-Received-Date: Thu, 30 Jun 2011 10:15:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The current oe-dev master contains recipes for 2.4.4 and 2.4.5, but both are DEFAULT_PREFERENCE = "-1", so 2.4.3 is used by default.

We hit a problem in LCP open/close handling which is fixed in the newer versions.

Is there any reason *not* to go to 2.4.5?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1RNKQf-0004zl-39
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 09:19:41 +0100
Received: by wyh5 with SMTP id 5so4390551wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 00:13:26 -0800 (PST)
Received: by 10.227.198.85 with SMTP id en21mr27580678wbb.11.1320653606615;
	Mon, 07 Nov 2011 00:13:26 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id
	fy13sm26825648wbb.18.2011.11.07.00.13.25
	(version=SSLv3 cipher=OTHER); Mon, 07 Nov 2011 00:13:26 -0800 (PST)
Message-ID: <4EB79325.80107@dresearch-fe.de>
Date: Mon, 07 Nov 2011 09:13:25 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.3.2
Cc: Tim Riker <Tim@Rikers.org>
Subject: default route handling of udhcpc
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
X-List-Received-Date: Mon, 07 Nov 2011 08:19:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recently we hit a problem with the default route handling of udhcpc.

The provided script busybox/files/simple.script (aka /etc/udhcpc.d/50default) removes all existing default routes before setting new routes. I think that's wrong.

If multiple interfaces offer default routes (via DHCP, static config, or any other way) there is no reason to prefer one over another (without having any additional information). So the script should only add the new default route. A short search in the internet brings up a lot of useful scenarios for multiple default routes.

So i tried to remove the part from the script which removes the existing routes. This led to a confusing situation.

If the script uses "route add default gw ..." (which is the case if /sbin/ip is not installed) everything seems to work fine.

But if /sbin/ip (from the busybox package) is installed the "ip route add default via ..." results in an "ip: RTNETLINK answers: File exists" error. In my opinion this is an error in the busybox ip implementation.

Opinions?

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



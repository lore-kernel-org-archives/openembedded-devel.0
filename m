Received: from [77.233.226.4] (helo=public.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@dev.doredevelopment.dk>) id 1PzQOm-0003N7-1m
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 10:18:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by public.doredevelopment.dk (Postfix) with ESMTP id 970BFE3D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 10:08:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from public.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 9mK0M9qGqG3R
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 10:08:37 +0100 (CET)
Received: from [192.168.18.101] (unknown [192.168.18.101])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by public.doredevelopment.dk (Postfix) with ESMTPS id 3215BADD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 10:08:37 +0100 (CET)
From: Esben Haabendal <eha@dev.doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
Organization: DoreDevelopment ApS
Date: Tue, 15 Mar 2011 10:08:37 +0100
Message-ID: <1300180117.2522.14.camel@eha>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Eliminating dependency race-conditions (was Re: [PATCH] net-snmp: disable libnl use)
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
X-List-Received-Date: Tue, 15 Mar 2011 09:18:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-11 at 12:04 +0100, Steffen Sledz wrote:
> which occurred sometimes depending on build order (not in clean
> package only builds).

I would like to raise awareness of the underlying problem here.

The current dependency/staging model of OE basically has this feature
that a build can be influenced not only by it's own dependencies, but
also what has been build before it (or not).

I strongly believe that this has to be fixed on the architectural level,
and not just on a case-by-case level as is currently needed.

I haven't received much feedback on the preivous posting about the
per-recipe staging principle implemented in OE-lite, but I decided to
take this opportunity to re-iterate the fact that the OE-lite
implementation of staging and build dependencies eliminates this
problem.

I am still very much interested in discussing how to move this
technology from OE-lite to OE, but as it impacts all recipe metadata
(build dependencies has to be redefined), OE community at a large really
needs to value the benefits of solving this problem.

Best regards,
Esben




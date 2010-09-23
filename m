Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Oyrrp-0002hh-Mg
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 21:54:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C61B78AB558
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 15:54:00 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13154-10 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 23 Sep 2010 15:54:00 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 90E398AB519
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 15:54:00 -0400 (EDT)
Message-ID: <4C9BB058.4050407@cbnco.com>
Date: Thu, 23 Sep 2010 15:54:00 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gst-plugins-base tries to use host orcc
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
X-List-Received-Date: Thu, 23 Sep 2010 19:54:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

gst-plugins-base-0.10.30 fails to build because common/m4/orc.m4 uses 
"pkg-config --variable=orcc orc-0.4" to get the path to orcc, instead of 
just using "orcc" in the path.

tmp/sysroots/i486-oe-linux/lib/pkgconfig/orc-0.4.pc has:

exec_prefix=
toolsdir=${exec_prefix}/bin
orcc=${toolsdir}/orcc

so Make ends up calling /bin/orcc, which doesn't exist.

For orc-native, tmp/sysroots/x86_64-linux/lib/pkgconfig/orc-0.4.pc has:

exec_prefix=/..../tmp/sysroots/x86_64-linux

but I don't know how to make pkg-config use this pc file when looking 
for orcc, or if it even should. Has anybody else run into this?

Mike



Received: from [85.115.52.190] (helo=cluster-a.mailcontrol.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Matteo.Fortini@mta.it>) id 1MGDQt-00069M-UH
	for openembedded-devel@openembedded.org; Mon, 15 Jun 2009 16:45:11 +0200
Received: from mailserver.mta.int (mail.mta.it [89.96.171.250])
	by rly12a.srv.mailcontrol.com (MailControl) with ESMTP id
	n5FEYwlk026375 for <openembedded-devel@openembedded.org>;
	Mon, 15 Jun 2009 15:34:58 +0100
Received: from mta-digicas.MTA.INT ([172.26.10.13]) by mailserver.mta.int with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 15 Jun 2009 16:34:57 +0200
Received: from [172.26.6.74] (172.26.6.74) by mta-digicas.mta.int
	(172.26.10.8) with Microsoft SMTP Server (TLS) id 8.1.336.0;
	Mon, 15 Jun 2009 16:34:57 +0200
Message-ID: <4A365C10.8020307@mta.it>
Date: Mon, 15 Jun 2009 16:34:56 +0200
From: Matteo Fortini <matteo.fortini@mta.it>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 15 Jun 2009 14:34:58.0082 (UTC)
	FILETIME=[751B9820:01C9EDC6]
X-Scanned-By: MailControl A-09-00-10 (www.mailcontrol.com) on 10.65.0.122
Subject: nof/libgcc_s.so installed instead of libgcc_s.so on powerpc
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
X-List-Received-Date: Mon, 15 Jun 2009 14:45:12 -0000
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit

I'm building the Angstrom console-image on a powerpc (mpc5121) with 
stable/2009.

the gcc version which is built by default is 4.2.4R5

I specified TARGET_FPU="hard" in the machine description recipe.

However, the libgcc_s.so version which is packaged is from the nof/ dir, 
so that I get funny errors runtime for functions which were referenced 
in the code and were linked ok as external at compile time, but can't be 
found in the nof version of the lib.

Why is it behaving like this?




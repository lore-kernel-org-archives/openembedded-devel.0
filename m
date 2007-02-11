Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <slapinid@gmail.com>) id 1HGM4p-0007aw-VP
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Feb 2007 22:17:40 +0100
Received: by nf-out-0910.google.com with SMTP id l24so1739283nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2007 13:17:39 -0800 (PST)
Received: by 10.82.155.10 with SMTP id c10mr8267350bue.1171228658801;
	Sun, 11 Feb 2007 13:17:38 -0800 (PST)
Received: from ?172.21.138.241? ( [217.66.145.217])
	by mx.google.com with ESMTP id x24sm26675722nfb.2007.02.11.13.17.36;
	Sun, 11 Feb 2007 13:17:38 -0800 (PST)
Message-ID: <45CF87EA.1020309@gmail.com>
Date: Mon, 12 Feb 2007 00:17:30 +0300
From: Sergey Lapin <slapinid@gmail.com>
User-Agent: Icedove 1.5.0.9 (X11/20061220)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: getting core files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Feb 2007 21:17:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi!
What should be done in image to make core dumps work?

I set
  sysctl -w kernel.core_uses_pid=1 kernel.core_pattern=/oldroot/%e.%p.core

do kill -11 <somepid> and see no cores in /tmp.
Any ideas? (ulimit -c is unlimited in startup scripts)




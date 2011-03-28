Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Q4DY5-0007dT-B5
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 16:36:08 +0200
Received: (qmail 31275 invoked by uid 1003); 28 Mar 2011 14:34:07 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.183.40)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	28 Mar 2011 14:34:07 -0000
Message-ID: <4D909C5E.9090203@balister.org>
Date: Mon, 28 Mar 2011 10:34:06 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: autotools problem with native-sdk (again)
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
X-List-Received-Date: Mon, 28 Mar 2011 14:36:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This is familiar:

root@usrp-e1xx:~/gnuradio# ./bootstrap
autom4te: need GNU m4 1.4 or later: 
/home/balister/oe/tmp/sysroot/x86_64-linux/usr/bin/m4
aclocal: autom4te failed with exit status: 1

This is trying to build an autotools based program (gnuradio) on an 
omap3 with the native-sdk. I've seen this before and thought we reverted 
the problem commit pending a proper fix. Looks like hte problem has 
cropped up again.

Philip



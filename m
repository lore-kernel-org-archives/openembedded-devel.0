Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RZ7z1-0002lG-7P
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 22:27:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 3CB783156C23;
	Fri,  9 Dec 2011 22:21:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id xJvOsEK28cWd; Fri,  9 Dec 2011 22:20:58 +0100 (CET)
Received: from [172.22.22.61] (drms-590ceabd.pool.mediaWays.net
	[89.12.234.189])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 3210D3156C22;
	Fri,  9 Dec 2011 22:20:58 +0100 (CET)
Message-ID: <4EE27BB8.3020903@opendreambox.org>
Date: Fri, 09 Dec 2011 22:20:56 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Tom Rini <tom.rini@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: fakeroot 1.15.1 in 2011.03-maintenance
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
X-List-Received-Date: Fri, 09 Dec 2011 21:27:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Tom, all,

one week ago, the fakeroot recipe was moved to 1.15.1 [1] in order to fix
a download problem, even though previous attempts were rejected [2,3].
Well, now I get the following error:


ERROR: The checksums for "[...]/fakeroot_1.15.1.orig.tar.bz2" did not match.
  MD5: expected "248c408b1e06e776c5739871b49bd968", got "0f6101a5c35693fa9ec7f7949156c2ad"
  SHA256: expected "45fbb9ad611f33224cc09954963dde563cc80fe58c76feb25b6e98550b81729a", got "24eda7c94fa8cf1f924cedf26deabcb8de5c0bdc01f1ac075f03dc12898d6923"


 --2011-12-09 22:00:36--  http://snapshot.debian.net/archive/pool/f/fakeroot/fakeroot_1.15.1.orig.tar.bz2
 Resolving snapshot.debian.net... 193.62.202.30, 2001:630:206:4000:1a1a:0:c13e:ca1e
 Connecting to snapshot.debian.net|193.62.202.30|:80... connected.
 HTTP request sent, awaiting response... 302 Found
 Location: http://snapshot.debian.org/ [following]
 --2011-12-09 22:00:36--  http://snapshot.debian.org/
 Resolving snapshot.debian.org... 193.62.202.30, 2001:630:206:4000:1a1a:0:c13e:ca1e
 Reusing existing connection to snapshot.debian.net:80.
 HTTP request sent, awaiting response... 200 OK
 Length: 14143 (14K) [text/html]
 Saving to: `[...]/fakeroot_1.15.1.orig.tar.bz2'
 
      0K .......... ...                                        100%  119K=0.1s
 
 2011-12-09 22:00:36 (119 KB/s) - `[...]/fakeroot_1.15.1.orig.tar.bz2' saved [14143/14143]
 
ERROR: The checksums for "[...]/fakeroot_1.15.1.orig.tar.bz2" did not match.
  MD5: expected "248c408b1e06e776c5739871b49bd968", got "0f6101a5c35693fa9ec7f7949156c2ad"
  SHA256: expected "45fbb9ad611f33224cc09954963dde563cc80fe58c76feb25b6e98550b81729a", got "24eda7c94fa8cf1f924cedf26deabcb8de5c0bdc01f1ac075f03dc12898d6923"


That's because Debian redirects to a HTML page instead of returning an
error, which makes it impossible to use a mirror. I'd submit a patch,
but I'd like to ask first, what's the preferred solution (e.g. go back
to previous version, update to new version, fix SRC_URI). The SRC_URI
could have been fixed for 1.14.5, too. I wonder why this didn't happen
instead.

Regards,
Andreas


[1] http://cgit.openembedded.org/openembedded/commit/?h=2011.03-maintenance&id=672af8093cf33d8b90e9186986ba5c95fc7a0a0a
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-June/033373.html
[3] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/034188.html



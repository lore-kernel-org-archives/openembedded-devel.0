Received: from [17.148.16.94] (helo=asmtpout019.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MY0nj-0001yH-2o
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Aug 2009 18:54:19 +0200
MIME-version: 1.0
Received: from [87.201.169.28] by asmtp019.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KNT003RF7KBHB00@asmtp019.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	03 Aug 2009 09:38:49 -0700 (PDT)
Message-id: <B7AB64EE-A236-4ABD-A033-A737F5663F09@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Mon, 03 Aug 2009 20:37:55 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: Deleting target specific folders from tmp directory
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
X-List-Received-Date: Mon, 03 Aug 2009 16:54:19 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I just noticed that if I have built a v2.6.31 kernel, then cleaned  
it, and then built a v2.6.29 kernel, and then do a console image, some  
artifacts from the previous 2.6.31 console image remains.

When I look at the rootfs installed on my mmc card, in the lib/ 
modules/ folder I can see 2.6.29-omap1 and 2.6.31-rc1-omap1 folders.  
That should not be there when I am building a linux-2.6.29 based  
console image recipe.

Now, I don't want to spend another 10 hours rebuilding my overo-oe  
environment from scratch, so which of the folder in the tmp directory  
can I safely delete?

cache
cross
deploy
pkgdata
rootfs
staging
stamps
usr
work

Best regards,

Elvis




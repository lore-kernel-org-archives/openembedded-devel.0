Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KqYOK-00086W-Jb
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 21:20:13 +0200
Received: from 88-111-190-175.dynamic.dsl.as9105.com ([88.111.190.175]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KqYOB-0003Lv-HU
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 20:20:04 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@openembedded.org
Date: Thu, 16 Oct 2008 20:19:55 +0100
Message-Id: <1224184795.4235.133.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: xserver-xorg rdepends
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
X-List-Received-Date: Thu, 16 Oct 2008 19:20:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I discovered today that xorg-xserver-common.inc has:

RDEPENDS_${PN} = "hal"

which seems a bit undesirable.  I propose to remove this hard-wired
dependency; any DISTRO who wants to keep it can specify that in their
own config file.

Any objections?

p.





Received: from [64.233.182.188] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H4cyU-0008Us-UZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jan 2007 13:54:38 +0100
Received: by nf-out-0910.google.com with SMTP id l24so468864nfc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2007 04:52:48 -0800 (PST)
Received: by 10.49.65.19 with SMTP id s19mr1144692nfk.1168433568789;
	Wed, 10 Jan 2007 04:52:48 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id a23sm3814218nfc.2007.01.10.04.52.48;
	Wed, 10 Jan 2007 04:52:48 -0800 (PST)
Date: Wed, 10 Jan 2007 14:53:03 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <9510564690.20070110145303@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1727737376.20070110090801@vanille-media.de>
References: <E1H4Y6N-0007ih-CH@linuxtogo.org>
	<1727737376.20070110090801@vanille-media.de>
MIME-Version: 1.0
Subject: Few spurious commits lately, was org.oe.dev linux-handhelds-2.6: magician defconfig: I2C_PXA=y
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
X-List-Received-Date: Wed, 10 Jan 2007 12:54:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Michael,

Wednesday, January 10, 2007, 10:08:01 AM, you wrote:

>> packages/base-files/base-files/magician
>> packages/multimachine
>> packages/netbase/netbase/hx4700
>> packages/netbase/netbase/magician
>> packages/openswan/openswan-2.4.4
>> packages/poweroffkey

[]

  Well, it seems there was few such commits lately, worth a note that
mtn doesn't work like CVS/SVN, where omitting a path for commit means
"this directory and subdirectory". Instead, mtn/git treat this as
"commit the whole tree". To get familiar behavior, please use "." for
commit:

       mtn commit .

  And besides, mtn shows list of files it will commit when editing
commit message, so *not* using "-m" makes sense ;-).



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com




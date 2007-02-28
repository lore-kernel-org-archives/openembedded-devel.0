Received: from [192.132.34.13] (helo=amail.unina.it)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <ranaldo@unina.it>) id 1HMLmC-00024C-3i
	for openembedded-devel@openembedded.org; Wed, 28 Feb 2007 11:11:12 +0100
Received: from blaster.unina.it ([192.132.34.15]) (authenticated bits=0)
	by amail.unina.it (8.13.4/8.13.4) with ESMTP id l1SABARp013380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2007 11:11:11 +0100
From: Nicola Ranaldo <ranaldo@unina.it>
To: openembedded-devel@openembedded.org
Date: Wed, 28 Feb 2007 11:09:25 +0100
User-Agent: KMail/1.9.6
MIME-Version: 1.0
Message-Id: <200702281109.25161.ranaldo@unina.it>
Subject: OE and the developing host
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
X-List-Received-Date: Wed, 28 Feb 2007 10:11:12 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I use OE on a gentoo box. This morning i updated the system, and the new 
linux-headers package removed /usr/include/asm/page.h. So when building my 
angstrom image it failed with perl asking to include that file. This problem 
was discussed on the gentoo bug and after applying a simple workaround i was 
able to emerge perl on the gentoo box and perl native on OE.
After a while the oe build stopped on esound, this was caused by a malfunction 
of /usr/lib/libosp.so.5 on gentoo, i reemerged it and solved the problem. Now 
the armstrong-gpe-image is complete. But this introduced a doubt. OE build 
some tools directly, and use other directly from the build host, so it could 
be teoretically possible to produce different images on different host. Is 
there a way or a plan to avoid it and make OE build host independant 
(supposing i was correct)? If not, what's the most used/supported distro by 
OE developers?

Regards

	Niko



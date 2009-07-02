Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MMNDu-00020h-Pe
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jul 2009 16:25:20 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>)
	id 1MMN2C-000296-G1; Thu, 02 Jul 2009 15:13:08 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>)
	id 1MMN2B-0008MC-QB; Thu, 02 Jul 2009 15:13:07 +0100
From: Phil Blundell <philb@gnu.org>
To: Brian Bloniarz <phunge0@hotmail.com>
In-Reply-To: <BLU0-SMTP60F861D06CC0BF029AFA6DFE2F0@phx.gbl>
References: <BLU0-SMTP60F861D06CC0BF029AFA6DFE2F0@phx.gbl>
Date: Thu, 02 Jul 2009 15:13:07 +0100
Message-Id: <1246543987.26610.6.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC Patch] initscripts-1.0 checkroot: fix rootfs identification
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
X-List-Received-Date: Thu, 02 Jul 2009 14:25:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-07-02 at 09:59 -0400, Brian Bloniarz wrote:
> Hi Phil, I had a question about the checkroot script from initscripts-1.0.
> 
> >ROOTFSDEV="/dev/root"
> >if ! grep -q "^$ROOTFSDEV\w" /proc/mounts; then
> >  ROOTFSDEV="rootfs"
> >fi
> >if [ x$(grep "^$ROOTFSDEV\w" /proc/mounts | awk '{print $4}') = "xrw" ]; then
> >	echo "Root filesystem already read-write, not remounting"
> >	exit 0
> >fi
> 
> If this code is intended to look for the rootfs dev, I don't think \w (word
> character) is right. grep "^/dev/root\w" doesn't match "/dev/root", it matches
> stuff like "/dev/rootf". Was this intended?  It looks like this change was from
> 8f5f3f87a526b585717f3064a8db5a2e6ae849ec: "initscripts: tweak mtab reading in
> checkroot.sh so that r/w ramdisk works on epia"

You're right, that "\w" expression does look wrong.  I guess I probably
intended to write "\W" and just missed the shift key, but I don't really
remember for sure.  But yes, your suggestion to use \> sounds like a
fine one.  Please go ahead and make that change.

p.




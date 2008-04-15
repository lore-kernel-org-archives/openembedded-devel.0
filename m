Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jlt1Q-0006iy-Qe
	for openembedded-devel@openembedded.org; Tue, 15 Apr 2008 23:49:00 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jlt1P-0007AH-Ef
	for openembedded-devel@openembedded.org; Tue, 15 Apr 2008 21:48:59 +0000
Received: from 62-237-10-71.dial.tdcsong.fi ([62.237.10.71])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 15 Apr 2008 21:48:59 +0000
Received: from szaka by 62-237-10-71.dial.tdcsong.fi with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 15 Apr 2008 21:48:59 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Szabolcs Szakacsits <szaka@ntfs-3g.org>
Date: Tue, 15 Apr 2008 21:48:52 +0000 (UTC)
Message-ID: <loom.20080415T212907-239@post.gmane.org>
References: <E1JlNXj-0008DF-Mt@daffy.sipo.nl> <48038AFE.2030904@dls.net>
	<loom.20080415T082706-746@post.gmane.org>
	<4804CA41.7050800@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 62.237.10.71 (Mozilla/4.0 (compatible; MSIE 5.5; Windows 98;
	YComp 5.0.2.6))
Sender: news <news@ger.gmane.org>
Subject: Re: union fs
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
X-List-Received-Date: Tue, 15 Apr 2008 21:49:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Mike (mwester <mwester <at> dls.net> writes:
> 
> According to the official docs, due to limitations of the fuse driver 
> for 2.4 kernels, ntfs-3g on such old kernels is prone to data loss. 
> This is a fuse problem, but effectively if you value your NTFS 
> partition's consistency, it means that ntfs-3g on such old kernels 
> should be read-only.
> 
> On 2.6, ntfs-3g works wonderfully on all the devices in read and write 
> modes, and is the driver I recommend for NTFS support on the SlugOS 
> (ARM) distro.
> 
> Sorry for not being more clear.

I see, thank you for the explanation. I think we should have better documented 
this ntfs-3g issue, sorry about it.

Everything is as safe with the 2.4 kernels as with the 2.6 ones if after umount 
one makes sure that the ntfs-3g process is terminated before a device is 
detached or the box is powered down. This can be ensured automatic e.g. by a 
few shell commands. 

Regards,  Szaka

--
NTFS-3G: http://ntfs-3g.org




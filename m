Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Jln9x-0003y1-7e
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Apr 2008 17:33:25 +0200
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx01.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1Jln9s-0002Hp-9W
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Apr 2008 10:33:20 -0500
Message-ID: <4804CA41.7050800@dls.net>
Date: Tue, 15 Apr 2008 10:31:13 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1JlNXj-0008DF-Mt@daffy.sipo.nl> <48038AFE.2030904@dls.net>
	<loom.20080415T082706-746@post.gmane.org>
In-Reply-To: <loom.20080415T082706-746@post.gmane.org>
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
X-List-Received-Date: Tue, 15 Apr 2008 15:33:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Szabolcs Szakacsits wrote:

> What do you mean ntfs-3g is not write safe? Nobody ever told us.
> 
> It's certainly used and certified on several ARM and MIPS embedded devices 
> regularly.
> 
> Regards,  Szaka

According to the official docs, due to limitations of the fuse driver 
for 2.4 kernels, ntfs-3g on such old kernels is prone to data loss. 
This is a fuse problem, but effectively if you value your NTFS 
partition's consistency, it means that ntfs-3g on such old kernels 
should be read-only.

On 2.6, ntfs-3g works wonderfully on all the devices in read and write 
modes, and is the driver I recommend for NTFS support on the SlugOS 
(ARM) distro.

Sorry for not being more clear.

Mike (mwester)



Received: from p3plsmtpa11-08.prod.phx3.secureserver.net ([68.178.252.109])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pab@pabigot.com>) id 1Ty7Ss-0004Rx-Ns
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jan 2013 22:02:36 +0100
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa11-08.prod.phx3.secureserver.net with 
	id rYkU1k00F1mTNtu01YkUfX; Wed, 23 Jan 2013 13:44:29 -0700
Message-ID: <51004BAC.6080909@pabigot.com>
Date: Wed, 23 Jan 2013 14:44:28 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Holger Hans Peter Freyther <holger@freyther.de>
References: <1347641974-4993-1-git-send-email-holger+oe@freyther.de>
	<50FEA9F4.4080508@pabigot.com> <20130123195059.GG2634@xiaoyu.lan>
In-Reply-To: <20130123195059.GG2634@xiaoyu.lan>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-systemd: Introduce a create-volatile to create tmp directories
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
X-List-Received-Date: Wed, 23 Jan 2013 21:02:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2013 01:50 PM, Holger Hans Peter Freyther wrote:
> On Tue, Jan 22, 2013 at 09:02:12AM -0600, Peter A. Bigot wrote:
>
>> meta-gumstix has this patch and it caused problems with attempts to
>> use systemd_v189 in denzil since it's hidden inside a bbappend to
>> systemd_git.  So I'm hoping to identify a more forward-looking
>> solution.  Is there a plan to fix this issue globally?  Koen
>> preferred using base_files+fs_perms as in Angstrom, but Holger was
>> concerned this would prevent sharing base_files between sysvinit and
>> systemd builds.
> My concern is still there but my approach has some downsides as well. The
> presence of /var/log on tmpfs is fooling the journald to use more memory
> than is healthy. I solved this by disabling the auto-detect in the journald
> configuration.
>
> What is the issue you have with meta-gumstix?

Mostly that I wasn't aware of the patch it added to systemd_git that was 
responsible for creating such a critical part of a functioning Poky 
installation.  I'd had things working with systemd_git in the denzil 
branch as of 21Dec, but when that recipe got reverted around 24Dec I 
switched to systemd_v189 assuming it was compatible.  But things broke 
in a very unexpected way because I lost the meta-gumstix systemd_git 
bbappend that created the volatile hierarchy.

I now understand that it was natural to copy it into systemd because 
sysvinit is responsible for this functionality when it's the init 
manager.  Having to put a bbappend in every variant systemd recipe in 
every distro/BSP/vendor image layer seems cumbersome.  Since my email 
I'm seeing discussion on oe-core on how to integrate systemd in 
Yocto/Poky that touches on managing volatiles, so I'll wait, or 
follow-up there if necessary.

Peter



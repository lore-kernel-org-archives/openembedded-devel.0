Received: from [213.230.128.226] (helo=fep01-svc.tim.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gremlin@gremlin.it>) id 1LiRSt-0006rs-Ed
	for openembedded-devel@openembedded.org; Sat, 14 Mar 2009 11:51:39 +0100
Received: from sesha.loc ([217.203.150.58]) by fep01-svc.tim.it
	(InterMail vM.6.01.06.03 201-2131-130-104-20060516) with ESMTP
	id <20090314105114.MLET28515.fep01-svc.tim.it@sesha.loc>
	for <openembedded-devel@openembedded.org>;
	Sat, 14 Mar 2009 11:51:14 +0100
Message-ID: <49BB8B88.30100@gremlin.it>
Date: Sat, 14 Mar 2009 11:48:40 +0100
From: Alessandro GARDICH <gremlin@gremlin.it>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1236958547.8913.5.camel@northpole>
	<20090313162634.GB26615@denix.org>
In-Reply-To: <20090313162634.GB26615@denix.org>
Subject: Re: Can't build an ext2 minimal image
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
X-List-Received-Date: Sat, 14 Mar 2009 10:51:39 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> On Fri, Mar 13, 2009 at 12:35:47PM -0300, Jader H. Silva wrote:
>> I'm trying to build a minimal-image with an ext2 filesystem image, so I
>> set inside my local.conf:
>>
>> IMAGE_FSTYPES = "ext2"
>>
>> But OE insists on building an jffs2 image. I found, inside
>> conf/distro/minimal.conf:
>>
>> IMAGE_FSTYPES = "tar.gz jffs2"
>>
>> Does it means local.conf's IMAGE_FSTYPES get overwritten? If so, can
>> anybody fix it?
> 
> Thanks for reporting - it should be fixed now.
> 

I reported too this "bug"

the trivial patch is already present on mickey branch

-- 
  /------------------------------------------------\
|     Alessandro Gardich : gremlin#gremlin!it      |
  >------------------------------------------------<
|  I never saw a wild thing sorry for itself.      |
|  A small bird will drop frozen dead from a bough |
|  without ever having felt sorry for itself.      |
  \------------------------------------------------/




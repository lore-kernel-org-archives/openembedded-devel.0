Received: from p3plsmtpa08-06.prod.phx3.secureserver.net ([173.201.193.107])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pab@pabigot.com>) id 1TvrEi-0001gs-L5
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 16:18:38 +0100
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa08-06.prod.phx3.secureserver.net with 
	id p30g1k0011mTNtu0130gjn; Thu, 17 Jan 2013 08:00:40 -0700
Message-ID: <50F81217.3040600@pabigot.com>
Date: Thu, 17 Jan 2013 09:00:39 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <004501cdf45e$f5c87270$e1595750$@slingshot.co.nz>
	<CAPESJy6EW3NyWBba=hn7ino2jhnVcA7B-6rLT3NFTGjt3pvekA@mail.gmail.com>
In-Reply-To: <CAPESJy6EW3NyWBba=hn7ino2jhnVcA7B-6rLT3NFTGjt3pvekA@mail.gmail.com>
Subject: Re: Angstrom build failure
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
X-List-Received-Date: Thu, 17 Jan 2013 15:18:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

I resolved this for gumstix/denzil (not Angstrom) with the following, 
made necessary by the commit below. Note that the instructions in the 
commit mis-spell the variable name.

     PREFERRED_VERSION_systemd = "v189"

Peter

commit c17d774553b8e95f142bf6388aa70f48ce8cf1ce
Author: Eric Bénard <eric@eukrea.com>
Date:   Mon Dec 24 13:21:43 2012 +0100

     systemd_v189: add D_P=-1

     now users have the choice :
     * keep the old behaviour when not using systemd :
     PREFERRED_PROVIDER_udev = "udev"
     * switch to systemd (while keeping upgrade path) :
     PREFERRED_PROVIDER_udev = "systemd"
     PREFFERED_VERSION_systemd = "v189"

     Signed-off-by: Eric Bénard <eric@eukrea.com>
     Acked-by: Koen Kooi <koen@dominion.thruhere.net>


On 01/17/2013 03:51 AM, Takeshi Hamasaki wrote:
> Hi,
>
> Do you want systemd and udev to be build same time?
> I'm not sure it is same problem or not,
> I've read some thread about confliction between systemd and udev.
> http://comments.gmane.org/gmane.comp.handhelds.openembedded/55775
>
> adding a line
> PREFERRED_PROVIDER_udev = "systemd"
> in conf/local.conf helped me to go to next step.
>
> Regards,



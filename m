Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1HvqFj-00026K-OK
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2007 09:48:23 +0200
Received: by ug-out-1314.google.com with SMTP id t39so386624ugd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2007 00:46:03 -0700 (PDT)
Received: by 10.82.100.1 with SMTP id x1mr382946bub.1181115962511;
	Wed, 06 Jun 2007 00:46:02 -0700 (PDT)
Received: by 10.82.117.9 with HTTP; Wed, 6 Jun 2007 00:46:02 -0700 (PDT)
Message-ID: <74d0deb30706060046q7a91542bl6591542175161eb5@mail.gmail.com>
Date: Wed, 6 Jun 2007 09:46:02 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46665B15.8090401@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <46665B15.8090401@dominion.kabel.utwente.nl>
Subject: Re: RFC: splitting task-boot out of task-base
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
X-List-Received-Date: Wed, 06 Jun 2007 07:48:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 6/6/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> Building something task-boot based will make OE build everything in task-base, which is a
> bit wastefull, so put task-boot in its own recipe to prevent that.
>
> Comments?

Good idea ...

>  # task-base contain stuff needed for base system (machine related)
>  #
>  RDEPENDS_task-base = "\
> -    task-boot \
>      task-distro-base \
>      task-machine-base \
>      ${DISTRO_SSH_DAEMON} \

... but task-base should still RDEPEND on task-boot, shouldn't it?

regards
Philipp



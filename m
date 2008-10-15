Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KpwEY-0005rx-0e
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Oct 2008 04:35:34 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 812D717CFE2;
	Tue, 14 Oct 2008 22:30:27 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Tue, 14 Oct 2008 22:30:27 -0400
X-Sasl-enc: w23Sy+vhQYppjzZzkqXV1rkNXdoKpmjf11KGXkbIOjt6 1224037826
Received: from [172.18.93.11] (au2.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 169CF1F58D;
	Tue, 14 Oct 2008 22:30:25 -0400 (EDT)
Message-ID: <48F555BC.1010400@whitby.id.au>
Date: Wed, 15 Oct 2008 13:00:20 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Holger Freyther <zecke@openmoko.org>
References: <200810080751.15817.zecke@selfish.org>
	<200810142341.06945.zecke@selfish.org>
	<48F552C9.5090604@whitby.id.au>
In-Reply-To: <48F552C9.5090604@whitby.id.au>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Wed, 15 Oct 2008 02:35:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> Please remove all org.nslu2-linux branches from the git.openembedded.net
> server immediately.  They were never meant to end up on an OE server
> anyway (and the Makefiles specifically prevented this, so someone must
> have done it manually by accident).

I tried to do it myself, but (correctly) got rejected:

> rwhitby@take:/home/slug/openembedded$ git push git@git.openembedded.net:openembedded :heads/org.nslu2-linux.bitbake
> *** Deleting a branch is not allowed in this repository
> To git@git.openembedded.net:openembedded
>  ! [remote rejected] org.nslu2-linux.bitbake (hook declined)
> error: hooks/update exited with error code 1
> error: hook declined to update refs/heads/org.nslu2-linux.bitbake
> error: failed to push some refs to 'git@git.openembedded.net:openembedded'
> rwhitby@take:/home/slug/openembedded$ git push git@git.openembedded.net:openembedded :heads/org.nslu2-linux.dev
> *** Deleting a branch is not allowed in this repository
> To git@git.openembedded.net:openembedded
>  ! [remote rejected] org.nslu2-linux.dev (hook declined)
> error: hooks/update exited with error code 1
> error: hook declined to update refs/heads/org.nslu2-linux.dev
> error: failed to push some refs to 'git@git.openembedded.net:openembedded'
> rwhitby@take:/home/slug/openembedded$

A good hook to have!  Nicely done.

-- Rod



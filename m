Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q740E-0006eq-Qy
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 13:00:54 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q73yF-0007Wv-Ek
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 12:58:51 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <inerh7$g3o$1@dough.gmane.org>
References: <1300981024-9111-2-git-send-email-obi@opendreambox.org>
	<1300983264-16652-1-git-send-email-obi@opendreambox.org>
	<4D99C0EA.5070902@opendreambox.org>	<inciqg$3vi$2@dough.gmane.org>
	<4D99E05E.9020100@opendreambox.org>	<ind0l0$io$1@dough.gmane.org>
	<4D9A0A1D.3020209@opendreambox.org>	<inecec$sae$2@dough.gmane.org>
	<4D9ADC0D.6060603@opendreambox.org> <inen1t$mgv$1@dough.gmane.org>
	<1301995968.14449.293.camel@phil-desktop>
	<inerh7$g3o$1@dough.gmane.org>
Date: Tue, 05 Apr 2011 11:58:49 +0100
Message-ID: <1302001129.14449.319.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCHv2] kernel/module-base: Append PR to MACHINE_KERNEL_PR
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
X-List-Received-Date: Tue, 05 Apr 2011 11:00:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-04-05 at 12:39 +0200, Koen Kooi wrote:
> So apart from handwaving ("presumably unwelcome") do you have any actual
> arguments against moving all machines to MACHINE_KERNEL_PR?

Well, I can't obviously speak for all the machine config maintainers.
It does seem a bit odd to me that you assume they would wish to use
MACHINE_KERNEL_PR when, despite having had it at their disposal for some
time, they have not availed themselves of that opportunity.

As we've discovered in the past when M_K_PR was originally landed in the
tree (and then again in the contemporary stable branch), having it
suddenly switched on tends to cause PRs to go backwards unless it is
done very carefully.  I would certainly consider that to be "unwelcome"
though perhaps you don't share this viewpoint.

Also, as we have previously discussed, the design of M_K_PR does have
some shortcomings, particularly if you have a MACHINE with multiple
kernel packages.  I personally consider it to be a poorly engineered
solution and, although I have no problem with other people and/or
DISTROs using it if it solves their particular problems, I have no
desire to do so myself and I would be opposed to anything which obliges
me to do so.

p.





Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QWVtB-0004lR-PD for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 17:50:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QWVpq-0006Ex-Tk for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 17:47:22 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2011 17:47:22 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2011 17:47:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 14 Jun 2011 17:47:07 +0200
Message-ID: <it7vpr$n45$1@dough.gmane.org>
References: <4DF6DBCE.7010404@gmail.com> <it731q$utn$1@dough.gmane.org>
	<20110614153843.GB1324@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110614153843.GB1324@denix.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] ti-dsplink: Fixed location of toolchain
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
X-List-Received-Date: Tue, 14 Jun 2011 15:50:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-06-11 17:38, Denys Dmytriyenko wrote:
> On Tue, Jun 14, 2011 at 09:36:26AM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 14-06-11 05:55, Joel A Fernandes wrote:
>>> ti-dsplink: Fixed location of toolchain to build ti-dsplink.
>>
>> It sadly really needs an absolute path to the tools :(
> 
> So, what was this patch trying to fix anyway? Is there something broken?

Using an external toolchain without your import magic and then
overriding TOOLCHAINPATH in local.conf is broken. You might call it
broken by design :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN94J7MkyGM64RGpERAufjAJ0byRdnVm9SmVJ0Hlqsyv+BJv75uwCggF42
qeHxFXcjNMNr11nIr+Knmio=
=mZHT
-----END PGP SIGNATURE-----




Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TEbuR-0004FW-KW for openembedded-devel@lists.openembedded.org;
	Thu, 20 Sep 2012 10:14:55 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TEbiD-0006W8-L1 for openembedded-devel@lists.openembedded.org;
	Thu, 20 Sep 2012 10:02:17 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2012 10:02:17 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2012 10:02:17 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 20 Sep 2012 10:02:08 +0200
Message-ID: <k3eihr$mre$1@ger.gmane.org>
References: <1348124504-4764-1-git-send-email-mertsas@cisco.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1348124504-4764-1-git-send-email-mertsas@cisco.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH] zsh: Change from 4.3.17 to 5.0.0, which is the latest stable release. Also change the mirror from the zsh ftp server, which is really slow and unstable, to a sourceforce mirror.
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
X-List-Received-Date: Thu, 20 Sep 2012 08:14:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-09-12 09:01, Martin Ertsaas schreef:
> The reason for removing the 4.3.17 recipe is that it used the ftp
> mirror, which has removed the 4.3.17 tarbal used.
> 
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com> --- 
> meta-oe/recipes-extended/zsh/zsh.inc       |   55 
> ++++++++++++++++++++++++++++ meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
> | 51 --------------------------
> meta-oe/recipes-extended/zsh/zsh_5.0.0.bb |    5 +++ 3 files changed, 60
> insertions(+), 51 deletions(-) create mode 100644
> meta-oe/recipes-extended/zsh/zsh.inc delete mode 100644 
> meta-oe/recipes-extended/zsh/zsh_4.3.17.bb create mode 100644 
> meta-oe/recipes-extended/zsh/zsh_5.0.0.bb
> 
> diff --git a/meta-oe/recipes-extended/zsh/zsh.inc 
> b/meta-oe/recipes-extended/zsh/zsh.inc new file mode 100644 index 
> 0000000..cacce91 --- /dev/null +++ b/meta-oe/recipes-extended/zsh/zsh.inc
> @@ -0,0 +1,55 @@

> +PR = "r0"

remove that
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQWs2AMkyGM64RGpERArFPAJ0biDw7Kxf7+0i9a74s+Hnig3BodACfdoJx
LwMFvzB+RmMZ3JoIpuKhoxw=
=r2qF
-----END PGP SIGNATURE-----




Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id E5D7A6AC01
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 11:25:22 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Xj4t4-00007N-8e for openembedded-devel@lists.openembedded.org;
	Tue, 28 Oct 2014 12:24:30 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 12:24:30 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 12:24:30 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Oct 2014 12:23:34 +0100
Message-ID: <m2nubm$sph$1@ger.gmane.org>
References: <1414466854-22119-1-git-send-email-Qi.Chen@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1414466854-22119-1-git-send-email-Qi.Chen@windriver.com>
Subject: Re: [meta-networking][PATCH] ntp: make daemon run under ntp:ntp
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Oct 2014 11:25:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Qi.Chen@windriver.com schreef op 28-10-14 04:27:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Fix the service so that the ntpd daemon is run under ntp:ntp.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com> --- 
> meta-networking/recipes-support/ntp/ntp/ntpd.service | 2 +- 1 file
> changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-support/ntp/ntp/ntpd.service
> b/meta-networking/recipes-support/ntp/ntp/ntpd.service index
> b7c4268..0e3d7cd 100644 ---
> a/meta-networking/recipes-support/ntp/ntp/ntpd.service +++
> b/meta-networking/recipes-support/ntp/ntp/ntpd.service @@ -5,7 +5,7 @@
> After=network.target [Service] Type=forking PIDFile=/run/ntpd.pid 
> -ExecStart=/usr/sbin/ntpd -p /run/ntpd.pid -g +ExecStart=/usr/sbin/ntpd
> -u ntp:ntp -p /run/ntpd.pid -g

Wouldn't User=ntp be a better approach, or does ntp need more priviliges
during startup before dropping then and su'ing?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUT3y2MkyGM64RGpERAtEyAKC8qvQHY46gq2orocsyv1XW2pfedgCeJ1zt
B/CVWPNqMCM4wBVm5oTviog=
=3fjp
-----END PGP SIGNATURE-----



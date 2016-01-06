Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 6210F731E8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 12:07:45 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1aGmsS-0001YF-Ht for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2016 13:07:44 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2016 13:07:44 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2016 13:07:44 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 6 Jan 2016 13:07:35 +0100
Message-ID: <n6j027$8ma$1@ger.gmane.org>
References: <1452028543-30812-1-git-send-email-twoerner@gmail.com>
	<1452028543-30812-2-git-send-email-twoerner@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
In-Reply-To: <1452028543-30812-2-git-send-email-twoerner@gmail.com>
Subject: Re: [meta-browser][PATCH 2/3] chromium: update run script for early run
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jan 2016 12:07:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-01-16 om 22:15 schreef Trevor Woerner:
> If the chromium run-helper script (google-chrome) is run as part of a 
> (sysvinit) init script, shell variables $USER and $HOME will not be set 
> (leading to unwanted behaviour).
> 
> Replace the use of $USER with `whoami` and replace the use of $HOME with
> the OE bitbake variable ROOT_HOME.
> 
> In this way the chromium run-helper script will work as expected in both 
> instances (as part of an init script and from the cmdline).

Doesn't this break running chrome as a regular non-root user?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFWjQOHMkyGM64RGpERAoGFAJ9QCcfdD8qzAo/Orq/cWJFrBBLfrwCggkqR
PUswbLTWhJPanSY8u/1kfGM=
=4mmY
-----END PGP SIGNATURE-----



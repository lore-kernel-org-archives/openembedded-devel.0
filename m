Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QvmVt-0003S1-NH for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 10:39:13 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QvmRK-00087m-Bf for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 10:34:30 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2011 10:34:30 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2011 10:34:30 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 23 Aug 2011 10:34:18 +0200
Message-ID: <j2voma$si5$1@dough.gmane.org>
References: <1314045908-21970-1-git-send-email-pespin.shar@gmail.com>
	<1314045908-21970-3-git-send-email-pespin.shar@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <1314045908-21970-3-git-send-email-pespin.shar@gmail.com>
X-Enigmail-Version: 1.3
Subject: Re: [meta-efl][PATCH 3/4] enjoy: Update gstreamer package names in RDEPENDS
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
X-List-Received-Date: Tue, 23 Aug 2011 08:39:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-08-11 22:45, Pau Espin Pedrol schreef:
> Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com> --- meta-efl/recipes-efl/e17/enjoy_svn.bb |   12 ++++++------ 1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb index 90eb318..d2f6b03 100644 --- a/meta-efl/recipes-efl/e17/enjoy_svn.bb +++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb @@ -14,12 +14,12 @@ DEPENDS += "gst-plugins-good 
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '', ' #4th needed for flac playback #5th needed binary to create db RDEPENDS += "\ -	gst-plugin-typefindfunctions gst-plugin-playbin gst-plugin-volume gst-plugin-decodebin2  \ -	${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugin-mad 
> gst-plugin-id3demux', d)} \ -	gst-plugin-ogg gst-plugin-ivorbisdec \ -	gst-plugin-flac \ -	lightmediascanner-test \ -	" +       gst-plugins-base-typefindfunctions gst-plugins-base-playbin gst-plugins-base-volume gst-plugins-base-decodebin2 \ +       ${@base_conditional('ENTERPRISE_DISTRO',
> '1', '', 'gst-plugins-ugly-mad gst-plugins-good-id3demux', d)} \ +       gst-plugins-base-ogg gst-plugins-base-ivorbisdec \ +       gst-plugins-good-flac \ +       lightmediascanner-test \ +       "

I'm going to hold of on these gst changes since these will get renamed soon in OE-core.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOU2YKMkyGM64RGpERAjkaAJ91Fg00brQ//+8UaHrIZV4C9k/xmwCfeU1B
T88FXaO8B/GVxKzuxqLZI5U=
=lSCL
-----END PGP SIGNATURE-----




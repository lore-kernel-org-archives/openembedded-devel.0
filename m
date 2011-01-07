Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PbB2U-0007c3-I2 for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 13:03:26 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PbB23-0005LF-BG for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 13:02:59 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 13:02:59 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 13:02:59 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 07 Jan 2011 13:02:44 +0100
Message-ID: <ig6vd4$vme$1@dough.gmane.org>
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>	<1294318110-23521-4-git-send-email-obi@opendreambox.org>
	<1294393961.3699.5.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1294393961.3699.5.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 4/4] gcc: replace unconditional SRC_URI_append with SRC_URI +=
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
X-List-Received-Date: Fri, 07 Jan 2011 12:03:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-01-11 10:52, Paul Menzel wrote:
> Am Donnerstag, den 06.01.2011, 12:48 +0000 schrieb Andreas Oberritter:
> 
> What do you mean by »unconditional SRC_URI_append«? I searched through
> the documentation and could not find the word. I always thought
> `SRC_URI_append =` and `SRC_URI +=` is the same and if I am not mistaken
> the manual says the same [1].

SRC_URI_append = " foo" and SRC_URI += "foo" are the same, but
SRC_URI_append = "foo" and SRC_URI += "foo" are not the same. += (and
=+) add a space, append and prepend don't.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNJwDkMkyGM64RGpERAoTVAJ9zBNMKA8T/IkGZ6hjKh6ZkdqdeKQCglerY
o4hwnqyAwDWlTkekiNmagM4=
=PtUI
-----END PGP SIGNATURE-----




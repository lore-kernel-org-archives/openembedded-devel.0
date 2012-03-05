Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S4efG-0003YV-Tl for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 21:37:51 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S4eWx-00063g-Nz for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 21:29:15 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 21:29:15 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 21:29:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 05 Mar 2012 21:29:03 +0100
Message-ID: <jj37mf$dsm$1@dough.gmane.org>
References: <1330969051-9867-1-git-send-email-koen@dominion.thruhere.net>
	<1330969051-9867-3-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKoGobJnLbOHjWWRupWNDJAUNJ8o4ROBm6EDKN4uiWu=rQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <CAP9ODKoGobJnLbOHjWWRupWNDJAUNJ8o4ROBm6EDKN4uiWu=rQ@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe 3/3] systemd: enable logging to disk instead of tmpfs
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
X-List-Received-Date: Mon, 05 Mar 2012 20:37:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-03-12 19:12, Otavio Salvador schreef:
> On Mon, Mar 5, 2012 at 14:37, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> +       # create dir for journal +       install -d
>> ${D}${localstatedir}/log/journal
> 
> I'd prefer if journal could default to use a buffer or something similar
> instead of writting to disk as we ought to be careful about space in
> embedded devices, in general.

And that's why patch 1/3 enables xz compression :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9VIg0ACgkQMkyGM64RGpH14QCbBuH7m537WtbnT6RdxR1O15CF
FTMAmQHZzg42rc/O0OLPmllHAYeDAe5y
=3Zig
-----END PGP SIGNATURE-----




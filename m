Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NQzNf-0002M6-PD for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 09:30:42 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NQzLj-0004nJ-Rc
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 09:28:39 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jan 2010 09:28:39 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jan 2010 09:28:39 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 02 Jan 2010 09:28:18 +0100
Message-ID: <hhn031$6hg$1@ger.gmane.org>
References: <200912190854.11510.holger+oe@freyther.de>	<hglsin$2vi$2@ger.gmane.org>
	<hgt9h8$25m$1@ger.gmane.org>
	<201001011348.44168.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091220 Shredder/3.0.1pre
In-Reply-To: <201001011348.44168.holger+oe@freyther.de>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Qt4 GLES (once again)
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
X-List-Received-Date: Sat, 02 Jan 2010 08:30:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-01-10 13:48, Holger Hans Peter Freyther wrote:
> On Wednesday 23 December 2009 15:30:00 Koen Kooi wrote:
>> On 20-12-09 20:05, Koen Kooi wrote:
> 
>> It looks like it also changes stuff in libQtGui(E) :(
> 
> it does, it is compiling the egl and OpenVG part into libQtGui... 
> 
> 
> what about something like this? This way one can select qt4-embedded as 
> default and switch to the gles variant when ones needs it?

If that works, I can live with that.

regards,

Koen

> 
> 
> 
> diff --git a/recipes/qt4/qt4-embedded-gles_4.6.0.bb b/recipes/qt4/qt4-embedded-
> gles_4.6.0.bb
> index f819c66..06cdcc5 100644
> --- a/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> +++ b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> @@ -1,6 +1,7 @@
>  require qt4-embedded.inc
>  PR = "${INC_PR}.0"
>  
> +PROVIDES += "qt4-embedded"
>  QT_GLFLAGS = "-opengl es2 -openvg"
>  
>  require qt-4.6.0.inc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLPwOiMkyGM64RGpERAmelAJwJd3cqDmXGpbvEidLqG5CW/bhOPgCeOjzV
uXKmwv73mpZgYn2LWi9kXCA=
=2TBV
-----END PGP SIGNATURE-----




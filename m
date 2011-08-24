Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QwIHv-0004pT-QH for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 20:34:55 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QwIDG-0006sh-Jd for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 20:30:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 20:30:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 20:30:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 24 Aug 2011 20:25:45 +0200
Message-ID: <j33fn9$b50$2@dough.gmane.org>
References: <4E4E536D.7010103@dresearch-fe.de> <4E4E738C.70109@dresearch-fe.de>
	<4E5356B2.3060908@dresearch-fe.de> <4E53583A.3030405@gmx.net>
	<4E535B83.9080508@dresearch-fe.de>
	<CAFu+nvEh9tUGzQM1PFo1ErtOq+a+0yg94pZBO6Ohr92GNZoKBg@mail.gmail.com>
	<1314199372.21496.12.camel@jjg-linux>
	<CA+M6bXnG5iaUuv=60=cXGqACXzmnFL0PpGMkhUcbMNzsy+TnmQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <CA+M6bXnG5iaUuv=60=cXGqACXzmnFL0PpGMkhUcbMNzsy+TnmQ@mail.gmail.com>
X-Enigmail-Version: 1.3
Subject: Re: [2011.03-maintenance] do_compile failed for cacao_0.99.3.bb
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
X-List-Received-Date: Wed, 24 Aug 2011 18:34:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 24-08-11 19:40, Tom Rini schreef:
> On Wed, Aug 24, 2011 at 8:22 AM, Jesse Gilles <jgilles@multitech.com> wrote:
>> On Tue, 2011-08-23 at 13:16 -0400, George C. Huntington, III wrote:
>>> I suspect that the problem is happening earlier, classpath isn't building. the javac wrapper eats the return code from a java compile.
>> 
>> If George is right, then the following patch to the javac wrapper script may fix the issue.  It fixes building classpath as well as returns the error code if all javac attempts fail.
>> 
>> http://patches.openembedded.org/patch/9521/
> 
> So... someone needs to get that into either oe.dev master or better yet update the java bits for meta-oe.

I've been thinking about a meta-java but haven't had the time to look into that.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOVUIpMkyGM64RGpERAmLMAKCEA6PF88wNabEaccDjVXgAsIwzZwCfXi8g
KgAQpseUwf5yuMmx4aAF/Fw=
=R2Wu
-----END PGP SIGNATURE-----




Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RHEUP-0003Ha-K6 for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 14:46:21 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RHEOd-0007E9-NG for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 14:40:23 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 14:40:23 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 14:40:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 21 Oct 2011 14:40:11 +0200
Message-ID: <j7rp7b$3nl$1@dough.gmane.org>
References: <cover.1319168013.git.otavio@ossystems.com.br>
	<1d63385213ee2d6741906cf2e61ccfb6fee58270.1319168013.git.otavio@ossystems.com.br>
	<j7r1gt$3jk$1@dough.gmane.org>
	<CAP9ODKryW=T3KVjGu1F1sWovbpZYE5eJSRTe+f+WxbAnQEJ0Xw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <CAP9ODKryW=T3KVjGu1F1sWovbpZYE5eJSRTe+f+WxbAnQEJ0Xw@mail.gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe][PATCH 3/4] systemd: do not recommend systemd-serialgetty
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
X-List-Received-Date: Fri, 21 Oct 2011 12:46:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-10-11 14:36, Otavio Salvador schreef:
> On Fri, Oct 21, 2011 at 03:55, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 21-10-11 05:34, Otavio Salvador schreef:
>>> The service ought to be add if need. Not by default on all images.
>> 
>> Hmmm, I disagree. If you're using sysvinit OE will add the getty to
>> inittab already, I see no need to make systemd behave differently.
> 
> We we don't move it to suggests?

Opkg doesn't really support that, so no.

> Personally I think it is different and forcing everyone that doesn't want
> it to have bad recommendations is wrong.
> 
> Someone moving to systemd will need to review everything once again and
> it won't hurt to add one package if he really wants to have getty on
> serial. Many won't want or use it.

They are getting it right now with sysvinit already. What about a 'serial'
MACHINE_FEATURE and move it into task-basic?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOoWgrMkyGM64RGpERAu+KAJ9UVC0HoV7IGa8RhhsFwOmOtTVEawCeMI6K
JYepFem+P/wrZpO4NDJneIM=
=VtFO
-----END PGP SIGNATURE-----




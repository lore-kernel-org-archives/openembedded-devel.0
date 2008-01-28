Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1JJQNU-0001AC-VJ
	for openembedded-devel@openembedded.org; Mon, 28 Jan 2008 10:34:10 +0100
Received: (qmail 8832 invoked by uid 813007); 28 Jan 2008 09:34:13 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 28 Jan 2008 09:34:13 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2008 10:33:58 +0100
User-Agent: KMail/1.9.7
References: <200801280845.40636.openembedded@haerwu.biz>
	<479D98E1.2030608@student.utwente.nl>
In-Reply-To: <479D98E1.2030608@student.utwente.nl>
MIME-Version: 1.0
Message-Id: <200801281033.58910.openembedded@haerwu.biz>
Subject: Re: Official list of OE monotone servers?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2008 09:34:12 -0000
X-List-Received-Date: Mon, 28 Jan 2008 09:34:12 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Monday, 28 of January 2008, Koen Kooi napisa=B3:
> Marcin Juszkiewicz schreef:
> | During problems with DNS (which I really hope were last time)
> | Mickeyl(?) made use of openembedded.net domain. This gave nasty
> | problem for me.
> |
> | I was pulling from monotone.openembedded.net and pushing to it. The
> | problem is that this machine was *not* synchronizing changes back to
> | other servers.
> |
> | We need a list of *OFFICIAL* monotone servers which synchronize each
> | other. And as a list I think of:
> |
> | 4. Server fingerprint (used by monotone)
>
> That's the fingerprint of the private key you are running it with.
> Official OE servers all have the same fingerprint (oe@ key).

10:26 hrw@home:org.openembedded$ mtn ls vars|grep known-servers
known-servers: ewi546.ewi.utwente.nl 172f4e97f70e08af3bea06d5ea36a1dfb6724f=
dd
known-servers: monotone.linuxtogo.org ee73b1732eb17743bca1fb95bfb9788b6ac3c=
11d
known-servers: monotone.nslu2-linux.org 0d63ffa0fad7729bafd3428d29b28da7b61=
fac4d
known-servers: monotone.openembedded.net 264e76b669c886cec760875ee884d01b24=
24acab
known-servers: monotone.openembedded.org ee73b1732eb17743bca1fb95bfb9788b6a=
c3c11d

As you see it is/was not always oe@openembedded.org key. I dropped all of t=
hem now.

> | If someone know how to force monotone to not allow to pull/push
> | against not listed servers please share that knowledge too.
>
> Don't allow pushed to untrusted servers? Monotone give a warning about
> that

Too bad that this warning is all we get ;(

10:27 hrw@home:org.openembedded$ mtn pull --set-default monotone.openembedd=
ed.org
mtn: setting default server to monotone.openembedded.org
mtn: doing anonymous pull; use -kKEYNAME if you need authentication
mtn: connecting to monotone.openembedded.org
mtn: first time connecting to server monotone.openembedded.org
mtn: I'll assume it's really them, but you might want to double-check
mtn: their key's fingerprint: ee73b1732eb17743bca1fb95bfb9788b6ac3c11d
mtn: finding items to synchronize:
mtn: certificates | keys | revisions
mtn:        70678 |   67 |     23304
mtn: bytes in | bytes out | certs in | revs in

> and you can make a lua hook for that.=20

Will have to look at it.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                Great response time! Was that 5 baud or 10?





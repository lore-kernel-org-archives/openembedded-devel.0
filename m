Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M1Sav-0005TU-Uj
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 May 2009 23:54:35 +0200
Received: from 79-79-173-112.dynamic.dsl.as9105.com ([79.79.173.112]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M1SUu-0002zl-4T
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 May 2009 22:48:22 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <49FDCB08.4010803@opensimpad.org>
References: <c384c5ea0905030555t48379d37o700254a1c49a4600@mail.gmail.com>
	<49FD9A75.3000609@balister.org> <49FD9EEA.4030608@dls.net>
	<ac9c93b10905030918t25211118yc27bb1177f1e65cb@mail.gmail.com>
	<49FDCB08.4010803@opensimpad.org>
Date: Tue, 05 May 2009 21:47:57 +0100
Message-Id: <1241556477.23982.41.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [RFC]: Remove #####...##### lines
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
X-List-Received-Date: Tue, 05 May 2009 21:54:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-05-03 at 18:49 +0200, Bernhard Guillon wrote:
> Frans Meulenbroeks wrote:
> > I do agree that PR = "r0" in a recipe should be ok. (actually I think
> > that unaware of this I violated that rule a number of times :-) )
> >
> >   
> I like PR = "r0"
> Else it is easy to forget to bump it on updates. The manual also mention 
> it [1].

Yes, agreed.  I don't know where this idea came from that it's somehow a
bad thing to set PR = "r0" explicitly, but whatever its source I think
it is a mistaken belief.  It seems obviously silly to delete the PR
definition whenever a package is upgraded to a new upstream version, and
then re-insert it again on the next packaging change; aside from
anything else, it's just more typing than keeping the line intact and
just changing the value.

p.





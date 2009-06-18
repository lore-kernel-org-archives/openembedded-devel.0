Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MHMaG-000453-JM
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 20:43:37 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MHMQ2-0000ct-2a
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 19:33:02 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f96d234e0906181109y4ee832bcu7b53037c917709be@mail.gmail.com>
References: <1244836535.4151.140.camel@lenovo.internal.reciva.com>
	<1244838263.5958.34.camel@dax.rpnet.com>
	<f96d234e0906181109y4ee832bcu7b53037c917709be@mail.gmail.com>
Date: Thu, 18 Jun 2009 19:33:01 +0100
Message-Id: <1245349981.29153.162.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [rfc] change default for BUILD_OPTIMIZATION, remove	spurious 	assignments
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
X-List-Received-Date: Thu, 18 Jun 2009 18:43:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-06-18 at 14:09 -0400, Cliff Brake wrote:
> I agree, debug symbols are nice in *dbg packages.  Are there any other
> thoughts pro/con for changing OE to match Poky FULL_OPTIMIZATION
> settings?

The Poky setting does look better.  I can't see any harm in changing OE
to match that.

> Any thoughts on -g vs -ggdb for BUILD_OPTIMIZATION?

Looking at what gcc actually does with those options, it doesn't seem
like there's much difference for the common targets that we support.  So
I don't really have a view on it either way.

p.





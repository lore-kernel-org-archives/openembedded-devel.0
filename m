Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NRXk1-0006Ru-1D
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jan 2010 22:12:04 +0100
Received: from [85.210.22.104] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NRXi1-0001WK-7y
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jan 2010 21:09:57 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11001030833v6236cb2ew11627fb47a6d7fa8@mail.gmail.com>
References: <ac9c93b11001030833v6236cb2ew11627fb47a6d7fa8@mail.gmail.com>
Date: Sun, 03 Jan 2010 21:09:40 +0000
Message-ID: <1262552980.2553.104.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.22.104
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qmake issue
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
X-List-Received-Date: Sun, 03 Jan 2010 21:12:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-01-03 at 17:33 +0100, Frans Meulenbroeks wrote:
> I can imagine a few solutions, but no idea which one is the best and
> how to implement them.
> First option is to hack the generated makefile in a configure_append
> step. While this would solve the issue for me it is not really a
> generic solution.
> Second option is to force removing a package from staging when a new
> version is build
> Third option is to change the class which generates the above command
> to put the -L near the end (after any -L's from the makefile itself.

In the particular case of the myth* libraries, I think they should not
be getting staged in the first place.  As far as I know, no other
package uses them for anything.

However, that obviously doesn't solve your qmake problem in the general
case.  With a bit of luck some Qt hacker will be able to shed light on
what is really going on there.

p.





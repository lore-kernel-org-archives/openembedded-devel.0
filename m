Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KDP3B-0003U4-Bw
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 21:28:33 +0200
Received: from 79-71-180-119.dynamic.dsl.as9105.com ([79.71.180.119]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KDP0J-0001hC-NC
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 20:25:35 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <877ic6srbf.fsf@neumann.lab.ossystems.com.br>
References: <877ic6srbf.fsf@neumann.lab.ossystems.com.br>
Date: Mon, 30 Jun 2008 20:25:46 +0100
Message-Id: <1214853946.21138.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: Re: Problem with i18n (input)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 30 Jun 2008 19:28:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2008-06-30 at 15:36 -0300, Otavio Salvador wrote:
> I've been in trouble to get proper support for input in OE. We're
> having problem to support input of international charsets on X. We've
> include locale packages and we have the system properly translated,
> however the input of latin1 chars (e.g. =C3=A9=C3=A7=C3=B3=C3=A3...) does=
n't work.

Can you be any more specific about what exactly goes wrong?  Are you
basically saying that the compose key doesn't work, or are you talking
about something different?  If compose, does it not work at all (i.e.
just enters "e'" as separate keystrokes, as if you hadn't pressed
compose in the first place) or does it swallow the two keystrokes and
then give you nothing, or garbage, out?  If the former, have you
verified (e.g. with xev) that the compose key itself is correctly mapped
and generating events with the right keysym?

Also, what applications are you trying to input these characters into?
This is an area that is not terribly well standardised in X and
different toolkits have different behaviour.

Also also, what build of libx11 do you have?  Is it a "diet" version or
the full thing?

p.





Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KDQJx-00028Y-Sn
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 22:50:00 +0200
Received: from 88-110-220-53.dynamic.dsl.as9105.com ([88.110.220.53]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KDQGv-0004BN-MM
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 21:46:52 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <87zlp2elny.fsf@neumann.lab.ossystems.com.br>
References: <877ic6srbf.fsf@neumann.lab.ossystems.com.br>
	<1214853946.21138.8.camel@lenovo.internal.reciva.com>
	<87zlp2elny.fsf@neumann.lab.ossystems.com.br>
Date: Mon, 30 Jun 2008 21:46:48 +0100
Message-Id: <1214858808.21138.20.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Mon, 30 Jun 2008 20:50:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2008-06-30 at 17:02 -0300, Otavio Salvador wrote:
> When I press "'e" it gives me nothing. When I run it inside xev it
> gives me:
>=20
> KeyPress event, serial 30, synthetic NO, window 0x1400001,
>     root 0x3a, subw 0x0, time 3675299458, (149,171), root:(572,473),
>     state 0x0, keycode 34 (keysym 0xfe51, dead_acute), same_screen YES,
>     XLookupString gives 1 bytes: (b4) "=EF=BF=BD"
>     XFilterEvent returns: False
>=20
> KeyRelease event, serial 30, synthetic NO, window 0x1400001,
>     root 0x3a, subw 0x0, time 3675299519, (149,171), root:(572,473),
>     state 0x0, keycode 34 (keysym 0xfe51, dead_acute), same_screen YES,
>     XLookupString gives 1 bytes: (b4) "=EF=BF=BD"
>     XFilterEvent returns: False
>=20
> KeyPress event, serial 30, synthetic NO, window 0x1400001,
>     root 0x3a, subw 0x0, time 3675302404, (149,171), root:(572,473),
>     state 0x0, keycode 26 (keysym 0x65, e), same_screen YES,
>     XLookupString gives 1 bytes: (65) "e"
>     XFilterEvent returns: False
>=20
> KeyRelease event, serial 30, synthetic NO, window 0x1400001,
>     root 0x3a, subw 0x0, time 3675302404, (149,171), root:(572,473),
>     state 0x0, keycode 26 (keysym 0x65, e), same_screen YES,
>     XLookupString gives 1 bytes: (65) "e"
>     XFilterEvent returns: False

This output means that XIM isn't enabled and hence you aren't getting
any compose handling at the Xlib level.  That shouldn't matter in your
case, though, because GTK does its own compose handling and XIM is
basically just dead weight.

If you see nothing at all when you type "'e" then that would suggest
that GTK is correctly interpreting the dead key and generating the right
keycode internally, but that something is then going wrong after that.
(If it didn't understand the dead acute at all then you would see a
plain unadorned "e".)

Unfortunately I don't think there is any convenient xev equivalent that
will show you gtk's inner workings, so you might have to resort to the
debugger to figure out what's going on here.  I do have a vague
recollection from when I last worked on this stuff that gtk was quite
sensitive to locale settings.  Presumably locale-base-pt-br is a UTF8
locale, right?  Do you have "LANG=3Dpt_BR" set in your environment?

p.





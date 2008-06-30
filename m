Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KDPbI-0004Fl-6P
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 22:03:49 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 6E59517F84F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 17:00:51 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 31A06159315
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 17:00:51 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 30 Jun 2008 17:00:50 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 80D91C1F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 14:00:53 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 2BAF961001E; Mon, 30 Jun 2008 17:02:25 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <877ic6srbf.fsf@neumann.lab.ossystems.com.br>
	<1214853946.21138.8.camel@lenovo.internal.reciva.com>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 30 Jun 2008 17:02:25 -0300
In-Reply-To: <1214853946.21138.8.camel@lenovo.internal.reciva.com> (Phil
	Blundell's message of "Mon\, 30 Jun 2008 20\:25\:46 +0100")
Message-ID: <87zlp2elny.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 30 Jun 2008 20:03:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Phil Blundell <pb@reciva.com> writes:

> On Mon, 2008-06-30 at 15:36 -0300, Otavio Salvador wrote:
>> I've been in trouble to get proper support for input in OE. We're
>> having problem to support input of international charsets on X. We've
>> include locale packages and we have the system properly translated,
>> however the input of latin1 chars (e.g. =C3=A9=C3=A7=C3=B3=C3=A3...) doe=
sn't work.
>
> Can you be any more specific about what exactly goes wrong?  Are you
> basically saying that the compose key doesn't work, or are you talking
> about something different?  If compose, does it not work at all (i.e.
> just enters "e'" as separate keystrokes, as if you hadn't pressed
> compose in the first place) or does it swallow the two keystrokes and
> then give you nothing, or garbage, out?  If the former, have you
> verified (e.g. with xev) that the compose key itself is correctly mapped
> and generating events with the right keysym?

When I press "'e" it gives me nothing. When I run it inside xev it
gives me:

KeyPress event, serial 30, synthetic NO, window 0x1400001,
    root 0x3a, subw 0x0, time 3675299458, (149,171), root:(572,473),
    state 0x0, keycode 34 (keysym 0xfe51, dead_acute), same_screen YES,
    XLookupString gives 1 bytes: (b4) "=EF=BF=BD"
    XFilterEvent returns: False

KeyRelease event, serial 30, synthetic NO, window 0x1400001,
    root 0x3a, subw 0x0, time 3675299519, (149,171), root:(572,473),
    state 0x0, keycode 34 (keysym 0xfe51, dead_acute), same_screen YES,
    XLookupString gives 1 bytes: (b4) "=EF=BF=BD"
    XFilterEvent returns: False

KeyPress event, serial 30, synthetic NO, window 0x1400001,
    root 0x3a, subw 0x0, time 3675302404, (149,171), root:(572,473),
    state 0x0, keycode 26 (keysym 0x65, e), same_screen YES,
    XLookupString gives 1 bytes: (65) "e"
    XFilterEvent returns: False

KeyRelease event, serial 30, synthetic NO, window 0x1400001,
    root 0x3a, subw 0x0, time 3675302404, (149,171), root:(572,473),
    state 0x0, keycode 26 (keysym 0x65, e), same_screen YES,
    XLookupString gives 1 bytes: (65) "e"
    XFilterEvent returns: False

> Also, what applications are you trying to input these characters into?
> This is an area that is not terribly well standardised in X and
> different toolkits have different behaviour.

We used xfce4-terminal for testing. It uses GTK and works fine in my
Debian system but fails in OE.

> Also also, what build of libx11 do you have?  Is it a "diet" version or
> the full thing?

I'm using the full thing:

libx11-6_1:1.1.3-r3_i586.ipk
libx11-locale_1:1.1.3-r3_i586.ipk

--=20
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."



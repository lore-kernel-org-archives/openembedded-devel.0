Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KDQRZ-0002O5-IV
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 22:57:50 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 805EF8ACBC6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 17:54:52 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 475C71CD84F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 17:54:52 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 30 Jun 2008 17:54:52 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 60F72C1F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 14:54:54 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id C38FB61001E; Mon, 30 Jun 2008 17:54:48 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <877ic6srbf.fsf@neumann.lab.ossystems.com.br>
	<1214853946.21138.8.camel@lenovo.internal.reciva.com>
	<87zlp2elny.fsf@neumann.lab.ossystems.com.br>
	<1214858808.21138.20.camel@lenovo.internal.reciva.com>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 30 Jun 2008 17:54:48 -0300
In-Reply-To: <1214858808.21138.20.camel@lenovo.internal.reciva.com> (Phil
	Blundell's message of "Mon\, 30 Jun 2008 21\:46\:48 +0100")
Message-ID: <87r6aeabjb.fsf@neumann.lab.ossystems.com.br>
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
X-List-Received-Date: Mon, 30 Jun 2008 20:57:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Phil Blundell <pb@reciva.com> writes:

> On Mon, 2008-06-30 at 17:02 -0300, Otavio Salvador wrote:
>> When I press "'e" it gives me nothing. When I run it inside xev it
>> gives me:
>>=20
>> KeyPress event, serial 30, synthetic NO, window 0x1400001,
>>     root 0x3a, subw 0x0, time 3675299458, (149,171), root:(572,473),
>>     state 0x0, keycode 34 (keysym 0xfe51, dead_acute), same_screen YES,
>>     XLookupString gives 1 bytes: (b4) "=EF=BF=BD"
>>     XFilterEvent returns: False
>>=20
>> KeyRelease event, serial 30, synthetic NO, window 0x1400001,
>>     root 0x3a, subw 0x0, time 3675299519, (149,171), root:(572,473),
>>     state 0x0, keycode 34 (keysym 0xfe51, dead_acute), same_screen YES,
>>     XLookupString gives 1 bytes: (b4) "=EF=BF=BD"
>>     XFilterEvent returns: False
>>=20
>> KeyPress event, serial 30, synthetic NO, window 0x1400001,
>>     root 0x3a, subw 0x0, time 3675302404, (149,171), root:(572,473),
>>     state 0x0, keycode 26 (keysym 0x65, e), same_screen YES,
>>     XLookupString gives 1 bytes: (65) "e"
>>     XFilterEvent returns: False
>>=20
>> KeyRelease event, serial 30, synthetic NO, window 0x1400001,
>>     root 0x3a, subw 0x0, time 3675302404, (149,171), root:(572,473),
>>     state 0x0, keycode 26 (keysym 0x65, e), same_screen YES,
>>     XLookupString gives 1 bytes: (65) "e"
>>     XFilterEvent returns: False
>
> This output means that XIM isn't enabled and hence you aren't getting
> any compose handling at the Xlib level.  That shouldn't matter in your
> case, though, because GTK does its own compose handling and XIM is
> basically just dead weight.

Any way for me to enable it?

> If you see nothing at all when you type "'e" then that would suggest
> that GTK is correctly interpreting the dead key and generating the right
> keycode internally, but that something is then going wrong after that.
> (If it didn't understand the dead acute at all then you would see a
> plain unadorned "e".)

Humm, confusing ...

> Unfortunately I don't think there is any convenient xev equivalent that
> will show you gtk's inner workings, so you might have to resort to the
> debugger to figure out what's going on here.  I do have a vague
> recollection from when I last worked on this stuff that gtk was quite
> sensitive to locale settings.  Presumably locale-base-pt-br is a UTF8
> locale, right?  Do you have "LANG=3Dpt_BR" set in your environment?

Yep .. I've used: LC_ALL=3Dpt_BR.

--=20
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."



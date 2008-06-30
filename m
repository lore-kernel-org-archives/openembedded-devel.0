Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KDRBk-0008Jk-WE
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 23:45:33 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id B1E7D8AA30A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 18:42:36 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 3868215B4B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 18:42:36 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 30 Jun 2008 18:42:36 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id AB757C1F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 15:42:30 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 91BFC61001E; Mon, 30 Jun 2008 18:42:24 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <877ic6srbf.fsf@neumann.lab.ossystems.com.br>
	<1214853946.21138.8.camel@lenovo.internal.reciva.com>
	<87zlp2elny.fsf@neumann.lab.ossystems.com.br>
	<1214858808.21138.20.camel@lenovo.internal.reciva.com>
	<87r6aeabjb.fsf@neumann.lab.ossystems.com.br>
	<1214861173.21138.24.camel@lenovo.internal.reciva.com>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 30 Jun 2008 18:42:24 -0300
In-Reply-To: <1214861173.21138.24.camel@lenovo.internal.reciva.com> (Phil
	Blundell's message of "Mon\, 30 Jun 2008 22\:26\:13 +0100")
Message-ID: <87od5i8urj.fsf@neumann.lab.ossystems.com.br>
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
X-List-Received-Date: Mon, 30 Jun 2008 21:45:33 -0000
Content-Type: text/plain; charset=us-ascii

Phil Blundell <pb@reciva.com> writes:

> On Mon, 2008-06-30 at 17:54 -0300, Otavio Salvador wrote:
>> Any way for me to enable it?
>
> What do you have listed for pt_BR in /usr/share/X11/locale/compose.dir?
> It should contain a reference to one of
> the /usr/share/X11/locale/XXX/Compose files; check that this is in place
> and readable.  Might be worth using "strace xev" to see if X is making
> any effort to open the right files.

I have pt_BR.UTF-8.

I've tryed it on both, a regular Debian system and it does load the
Compose file. At OE image, it does not.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."



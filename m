Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KDOGJ-0005ad-GU
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 20:38:04 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id A57261A5FA4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 15:35:07 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id B31218AA4ED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 15:35:06 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 30 Jun 2008 15:35:06 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id DC385C1F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 12:35:05 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id A63C461001E; Mon, 30 Jun 2008 15:36:36 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 30 Jun 2008 15:36:36 -0300
Message-ID: <877ic6srbf.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Problem with i18n (input)
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
X-List-Received-Date: Mon, 30 Jun 2008 18:38:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I've been in trouble to get proper support for input in OE. We're
having problem to support input of international charsets on X. We've
include locale packages and we have the system properly translated,
however the input of latin1 chars (e.g. =C3=A9=C3=A7=C3=B3=C3=A3...) doesn'=
t work.

Here goes the list of packages (locale related) that are installed on
the testing image, for reference:

glibc-binary-localedata-pt-br_2.6.1-r6_i586.ipk
glibc-charmap-iso-8859-1_2.6.1-r6_i586.ipk
glibc-gconv_2.6.1-r6_i586.ipk
glibc-gconv-iso8859-1_2.6.1-r6_i586.ipk
glibc-localedata-i18n_2.6.1-r6_i586.ipk
glibc-localedata-iso14651-t1_2.6.1-r6_i586.ipk
glibc-localedata-iso14651-t1-common_2.6.1-r6_i586.ipk
glibc-localedata-translit-circle_2.6.1-r6_i586.ipk
glibc-localedata-translit-cjk-compat_2.6.1-r6_i586.ipk
glibc-localedata-translit-compat_2.6.1-r6_i586.ipk
glibc-localedata-translit-font_2.6.1-r6_i586.ipk
glibc-localedata-translit-fraction_2.6.1-r6_i586.ipk
glibc-localedata-translit-narrow_2.6.1-r6_i586.ipk
glibc-localedata-translit-neutral_2.6.1-r6_i586.ipk
glibc-localedata-translit-small_2.6.1-r6_i586.ipk
glibc-localedata-translit-wide_2.6.1-r6_i586.ipk
libx11-locale_1:1.1.3-r3_i586.ipk
locale-base-pt-br_2.6.1-r6_i586.ipk
thunar-locale-pt-br_0.9.0-r0_i586.ipk
xfce-terminal-locale-pt-br_0.2.8-r0_i586.ipk
xfce4-panel-locale-pt-br_4.4.2-r0_i586.ipk
xfce4-session-locale-pt-br_4.4.2-r0_i586.ipk
xfdesktop-locale-pt-br_4.4.2-r0_i586.ipk
xfwm4-locale-pt-br_4.4.2-r0_i586.ipk

Any idea?

--=20
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."



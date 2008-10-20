Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1Krvev-0005vv-Iw
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 16:23:02 +0200
Received: from hostdime.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 19B7833549F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 12:22:40 -0200 (BRST)
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id 0496733549D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 12:22:38 -0200 (BRST)
Received: from mail.freedom.ind.br ([201.35.65.91] helo=mail.freedom.ind.br)
	by mail.freedom.ind.br; 20 Oct 2008 12:22:37 -0200
Received: from mail.freedom.ind.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 7D7088AD424
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 12:22:38 -0200 (BRST)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by mail.freedom.ind.br (Postfix) with ESMTP id 4F71837E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 12:22:38 -0200 (BRST)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 20 Oct 2008 12:22:38 -0200
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id A111DC2EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 12:24:30 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 689E7C48054; Mon, 20 Oct 2008 12:19:56 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 20 Oct 2008 12:19:56 -0200
Message-ID: <87y70jgxgz.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
X-Assp-Re-Red: remove
X-Assp-Re-Red: remove
Subject: Proposal to remove fam and python-fam recipes
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
X-List-Received-Date: Mon, 20 Oct 2008 14:23:02 -0000
Content-Type: text/plain; charset=us-ascii

Hello,

Today looking at a XFCE issue I come to use gamin or fam to provide
the file monitoring feature to xfdesktop; looking at the recipes I
found that both are provided in OE.

fam is completely broken on OE since it fail to build with current
toolset and is non maintained upstream. Checking the current package
at Debian I also noticed it has a bunch of patches on top of it to be
useful (dnotify support, gcc 4.3 compilation fixes and so on).

To satisfy fam dependencies gamin should be enough and I see no point
in leave fam still available since noone uses it as dependency for the
installed packages. So, I propose to remove it.

Do someone object?

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."



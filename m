Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LdcZj-0001Jw-5Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Mar 2009 04:42:47 +0100
Received: by qw-out-1920.google.com with SMTP id 5so1576938qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Feb 2009 19:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=PKrcX3fb53EZrhlymfg4EmquKJ/imuXs/icyGhriRiA=;
	b=f9hpWqZF/GXcO4WEqGR7/Vt4hqF5s0PaDp/5z0Yz4orbjn9q8RFNLaJCQTgIUs/6uF
	nxxSIeD5/a/TkMsBvAXF3GSFtAQkaQjAOyqKJ+89Ny6otQkiFqHZv3kgZT0FAOOOPsKd
	fOPIR+WzaZdazuW2Ags03gHuzMCKUe/R91pCc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	b=CtW+zqm0mrQUdyIp9vs0yKpU0YrnTzConozx834KjY0VRlioh9tGVudIZMT52FVH6u
	IP7vGZKGQmOUkyTzaZ4x1SQov6kkLyR8WMEz7TeqKE7g/y6jZuY+2z0D7I5UYoQoQCnF
	ZTFofaxZh5NJ49Mj5UL/YBxjJ7HK/GFgDGJVE=
Received: by 10.224.74.74 with SMTP id t10mr5868436qaj.333.1235878745336;
	Sat, 28 Feb 2009 19:39:05 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 7sm2558539qwb.31.2009.02.28.19.39.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Feb 2009 19:39:04 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id A3CC2610179; Sun,  1 Mar 2009 00:39:12 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <000801c99992$45c23440$d1469cc0$@com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Sun, 01 Mar 2009 00:39:12 -0300
In-Reply-To: <000801c99992$45c23440$d1469cc0$@com> ("Christian =?utf-8?Q?P?=
	=?utf-8?Q?=C3=B6ssinger=22's?=
	message of "Sat, 28 Feb 2009 11:49:45 +0100")
Message-ID: <87myc57vz3.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: [PATCH] Added new recipe for a newer version of the Asterisk Soft-PBX
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
X-List-Received-Date: Sun, 01 Mar 2009 03:42:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Christian P=C3=B6ssinger <christian@poessinger.com> writes:

> ---
>  packages/asterisk/asterisk-1.4.23.1/Makefile.patch |   21 +++
>  packages/asterisk/asterisk-1.4.23.1/init           |   79 ++++++++++
>  packages/asterisk/asterisk-1.4.23.1/logrotate      |   12 ++
>  .../asterisk/asterisk-1.4.23.1/sounds.xml.patch    |   19 +++
>  packages/asterisk/asterisk-1.4.23.1/volatiles      |    7 +
>  packages/asterisk/asterisk_1.4.23.1.bb             |  165 ++++++++++++++=
++++++

Please add the checksums.ini required changes ;-)

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br



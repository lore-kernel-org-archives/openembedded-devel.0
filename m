Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <luke.leighton@gmail.com>) id 1PK0Bd-0007If-0x
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 04:01:54 +0100
Received: by vws6 with SMTP id 6so721293vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 19:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=k2UFCpoyjKTOsXvBQ8ylsL1u2lIVjjSu27+swKDvm7c=;
	b=BHveXSraXPlVzw/aOX+bFeXtw+xP1dlIjzT1pwvFLSwiU4ZW2P+qeMRb1seVrriGYF
	w6zVyVKHJzaN7zK3iVlUv+NAjRuRgz1wF7RlG/AJ1EWvM6N3DmIDtI1/K0tG8UlT3+l7
	YAjdfhiStTBiz7bkOrEnhUzsDrcAEAIlFeMWU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ImTRZjmXVK9lLX4EwgubA0DzX5YRJma4OVRenE6DxIpUp99EEAieH+E+OhffavorQO
	/T767MXHwP1G+T3HkZEyMwr1MZ4xFlQFOH9sz4bpb5t8tYe2ag/GXD6On1cNXBTWC2Jv
	tSeEkxnEXXDTIZn1q+MjxItqLSysZKy37AkMg=
MIME-Version: 1.0
Received: by 10.220.179.205 with SMTP id br13mr1053722vcb.178.1290308441924;
	Sat, 20 Nov 2010 19:00:41 -0800 (PST)
Sender: luke.leighton@gmail.com
Received: by 10.220.112.210 with HTTP; Sat, 20 Nov 2010 19:00:41 -0800 (PST)
In-Reply-To: <mailman.168.1290299534.24873.openembedded-devel@lists.openembedded.org>
References: <mailman.168.1290299534.24873.openembedded-devel@lists.openembedded.org>
Date: Sun, 21 Nov 2010 03:00:41 +0000
X-Google-Sender-Auth: vdVmQkNtH79dmDBLrc7B--7hh4Y
Message-ID: <AANLkTi=Q6iGTksRU4nMpLPO3GZ-Zmdn_1dyo3LXGbMGw@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: luke.leighton@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: http://bugs.openembedded.org/show_bug.cgi?id=5485
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
X-List-Received-Date: Sun, 21 Nov 2010 03:01:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From:=C2=A0Luke Kenneth Casson Leighton <luke.leighton@gmail.com>
To:=C2=A0openembedded-devel@lists.openembedded.org
Date:=C2=A0Sat, 20 Nov 2010 22:09:50 +0000
Subject:=C2=A0http://bugs.openembedded.org/show_bug.cgi?id=3D5485
i'm preparing a bb recipe for google v8 (NOT as part of chromium) and
sadly v8 builds use scons. =C2=A0after a hit-and-miss bit of
experimentation, cut/pasting do_compile from various places i got a
compile working, but then when the install failed for exactly the same
reasons as the compile i figured "fuck it" and looked for ways to copy
what OECONF_EXTRA does. =C2=A0by modifying scons.bbclass to add optional
compile and optional install flags, the silly necessity to completely
replace do_compile and also do_install goes away.

the reason why do_compile had to be replaced is because the SConstruct
file for v8 does NOT import all environment variables: you have to add
an option "importenv =3D PATH,CC,CXX" etc. etc. which if you think about
it is a good way to do compilation as it means you no longer need to
do that SCONS_ENV_FIX trick, which doesn't work in this case _anyway_
because the google v8 developers decided in their infinite wisdom to
create a function def Build() rather than put env =3D
GetEnvironment(...) as a global variable.

ahh, the joys of having a build system in python, eh?

l.



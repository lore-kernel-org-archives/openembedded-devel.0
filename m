Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <notasas@gmail.com>) id 1QULV3-0004vD-TA
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 18:21:02 +0200
Received: by vws2 with SMTP id 2so541659vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2011 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=EbeufmaoTxRTj/IGNoPsiwDruUOK2uIuOgdn3driPQw=;
	b=tF94tcmXHRXhbUn42J/CThQpN/JWuENjoBIKkZwPXiyuL1DxrY2tu9QwCmyE0Pwh62
	jyvpB/2rgU/v8UOKKrsJEwZAdcLED+QZ22DvACAOdJ2zCw8jsf9L0y/CfArZCUum0FiJ
	UcFJvGA4Fs5wLAWuBxHjjbBLx3jfJE4l7tSuQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=QncH7IQFCUBkrVLGmwREuVC9yHPmjn/Npz3aZpryim+Ncev216GrwV0cONz207iQw0
	rv5jRTZMeFwakF4nrkWB6A8Gx3sDMBQCyD5U+MJdvsZdo7JDhQT4aJqxFLcEEHHkgXtF
	8ztyTHnUyPCEBxPpr3Nd5Y30B8YBScbNOx89E=
MIME-Version: 1.0
Received: by 10.52.98.39 with SMTP id ef7mr1780961vdb.88.1307549858703; Wed,
	08 Jun 2011 09:17:38 -0700 (PDT)
Received: by 10.52.169.74 with HTTP; Wed, 8 Jun 2011 09:17:38 -0700 (PDT)
Date: Wed, 8 Jun 2011 19:17:38 +0300
Message-ID: <BANLkTimU2b0Vx_S9EXwesDEz+V0M=UrewQ@mail.gmail.com>
From: Grazvydas Ignotas <notasas@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: sanity checker does not display messages and silently exits
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
X-List-Received-Date: Wed, 08 Jun 2011 16:21:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

After doing a fresh OE setup bitbake would just silently exit,
regardless of debug level. After some investigation it turned out that
messages originating from meta/classes/sanity.bbclass are not shown,
it looks like bb.fatal() function does not print any output. After
adding simple print statement just before bb.fatal() I could see my
messages (missing packages).

I guess it would be nice if someone more familiar with bitbake would
have a look, I'm seeing this on 2 different systems (Ubuntu 10.4 and
Debian 6.0.1).


Gra=C5=BEvydas



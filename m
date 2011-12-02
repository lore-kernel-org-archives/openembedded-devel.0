Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RWROA-0006L0-Kq
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 12:34:46 +0100
Received: by bkbzv15 with SMTP id zv15so2946756bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 03:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=A54L4WQEKy2LK6oXPwoOQTE5Wc6+lFLLApEQfMxvwow=;
	b=en45PKOT3vUNVzhhzWCiyCPePUjb/MaHomA+A4p27eHm3ORtbIQwBAP2wxMdCMCuyk
	DWHWhdCdbvTAMtRy1pqVjPcxGrlQRrhLtalXqBwd5csufvy86BqDEbhPiOtGL2nKmWro
	6rQBegQx4p8/mPKM0etyOJA7+hww21jU4F7FI=
MIME-Version: 1.0
Received: by 10.205.122.139 with SMTP id gg11mr10573219bkc.67.1322825284214;
	Fri, 02 Dec 2011 03:28:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.54.74 with HTTP; Fri, 2 Dec 2011 03:28:04 -0800 (PST)
In-Reply-To: <1322824856-15965-1-git-send-email-eric@eukrea.com>
References: <1322824856-15965-1-git-send-email-eric@eukrea.com>
Date: Fri, 2 Dec 2011 09:28:04 -0200
X-Google-Sender-Auth: CjTt5H6vWnLqmgiUTiwpmQiq4fo
Message-ID: <CAP9ODKq9VHPHHV57RakS8NB-xCWt3wxHhX3sr0AHdC=rahjM8A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe 1/3] pcsc-lite: handle initscript
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
X-List-Received-Date: Fri, 02 Dec 2011 11:34:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/12/2 Eric B=E9nard <eric@eukrea.com>

> else we get the following log at boot :
> Configuring pcsc-lite.
> update-rc.d: /etc/init.d/pcscd: file does not exist
>

It doesn't need the init script anymore as it has autoload support now.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


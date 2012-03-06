Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4tBU-0003zF-NY
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 13:08:04 +0100
Received: by vbbfr13 with SMTP id fr13so4516481vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 03:59:28 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.220.147.135 as permitted sender) client-ip=10.220.147.135; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.220.147.135 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.220.147.135])
	by 10.220.147.135 with SMTP id l7mr2001858vcv.28.1331035168706
	(num_hops = 1); Tue, 06 Mar 2012 03:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IJZOcxrOls/1VS3KlJZ2bfCoh6MXCZ/tqcxKCsOR2/A=;
	b=R1co0Xe5ErIJKGZR+l4dwXMIH8Thih396tLjlTtRWyNbge8llppNWnW5dZcfdbWLQe
	qq4BYxoqLEILP/Y0lKf8omswhIrfXFCFe05+pjnbpYsN6WdI81ZlYjkx5Ktt75HEyT16
	lqFfeal3DleZu1QQ/jPm6mRan1lAp2FavaepX95Cs2fSpMNcEK36sqGj5XkJWISQsDqT
	c0E0Ajxkx3QnMXSXlbgxGKo2Y6klScwvvUzCxBESHBN++gHyaRsEhppNImOk9SOq2xLt
	opfTVTr6NNrzI52Pj8NXCY0bQk+idYD0DKENUw5bZO9T2FfnyclOLvTF/ohEjribXR/i
	wFUQ==
MIME-Version: 1.0
Received: by 10.220.147.135 with SMTP id l7mr1690603vcv.28.1331035168444; Tue,
	06 Mar 2012 03:59:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Tue, 6 Mar 2012 03:59:28 -0800 (PST)
In-Reply-To: <CAP9ODKo+i3d31+xUt8RnOgFeDQbUw4hSkHeoR1LomZvxF5oa8A@mail.gmail.com>
References: <1331025741-26216-1-git-send-email-koen@dominion.thruhere.net>
	<1331025741-26216-2-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKo+i3d31+xUt8RnOgFeDQbUw4hSkHeoR1LomZvxF5oa8A@mail.gmail.com>
Date: Tue, 6 Mar 2012 08:59:28 -0300
X-Google-Sender-Auth: 4fFveM8ibdoH7CU6tXUZYC0isz4
Message-ID: <CAP9ODKovkJ_pHu+-__yUA=tshBiBvQwuJN7xN93P_6nrViZULw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 2/3] systemd: enable logging to disk instead of tmpfs
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
X-List-Received-Date: Tue, 06 Mar 2012 12:08:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2012 at 06:22, Koen Kooi <koen@dominion.thruhere.net> wrote:
> + =A0 =A0 =A0 # create dir for journal
> + =A0 =A0 =A0 install -d ${D}${localstatedir}/log/journal

I am not against it creating the path for storing the logs but the
default configuration ought to use a memory buffer IMO.

What people think?

--
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



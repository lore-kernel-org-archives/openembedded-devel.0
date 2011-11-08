Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RNl3W-0001Ie-1L
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 13:45:34 +0100
Received: by bkbzs2 with SMTP id zs2so313380bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2011 04:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7LDEsfMVFzEdr8MfY5uLxUt60LUDPBQ9LzxOn+TxbqE=;
	b=WWXId6g7D+JOjOfYNfc4v1IEU6EeWsAqbWPjC1ta9uHQGwdTBr0/KP7ALbUabOR9N+
	UOCT6koV94Ruog9jC7XRYb4BBIr7Eal+ihFWo+i+V1KkS/YW+FWK5/iNLncbSDODYMQU
	BqrNSeXenXF8oD5MSeZCq/mhU57goVNWmZ2zk=
MIME-Version: 1.0
Received: by 10.204.15.209 with SMTP id l17mr23290073bka.39.1320755958077;
	Tue, 08 Nov 2011 04:39:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Tue, 8 Nov 2011 04:39:18 -0800 (PST)
In-Reply-To: <1320754244-2752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1320754244-2752-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 8 Nov 2011 10:39:18 -0200
X-Google-Sender-Auth: DxuEDlVcByAGv61phfSSW_nSuTw
Message-ID: <CAP9ODKrf7nQ0cVOVdBSnTJ5WNnnSBpnxGndRV1ehM8KFVqQa=Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] connman: don't pull systemd to sysvinit images
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
X-List-Received-Date: Tue, 08 Nov 2011 12:45:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 8, 2011 at 10:10, Martin Jansa <martin.jansa@gmail.com> wrote:
> * systemd.bbclass assumes PN as default package to attach systemd RDEPEND=
S
> * grep SYSTEMDPN ../../classes/systemd.bbclass

The real fix is on the class; I will send a patch with it soon.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



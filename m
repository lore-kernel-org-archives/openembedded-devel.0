Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyKc-00054G-6P
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:12:54 +0100
Received: by vbbff1 with SMTP id ff1so1546723vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=zESygg2QPeLX791g6o/kAIWOe24x35LkXn1FgiENxr4=;
	b=XAGwUOnIpXpN2Qi3wKwHce7ACxCAbycUXZArJtTokT3fW1wk/kJ9gEEfWmpR7XOl0e
	WdZPfdYE3ZKSZb/aoi5es4SFY2WVzDEXB2jQufa+1i59yRqrDMwqXb1eBTuuBgNnIcb+
	noSg/6P+wHcGoOxg+m/LMHcSb3a+aqmOdY5wI=
MIME-Version: 1.0
Received: by 10.220.157.83 with SMTP id a19mr964698vcx.54.1329386681046; Thu,
	16 Feb 2012 02:04:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:04:41 -0800 (PST)
In-Reply-To: <1329357796-27398-7-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-7-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:04:41 -0200
X-Google-Sender-Auth: DY0FkUjhApa6ZVhgnMAeJKsfgCY
Message-ID: <CAP9ODKpUnCC1QkRA5bRzCyNEbE=kY=aYD+sXwz4BsvsRruPGww@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 06/22] systemd.bbclass: automatically extend FILES_* for systemd packages
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
X-List-Received-Date: Thu, 16 Feb 2012 10:12:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Add files found in SYSTEMD_SERVICE and add service files found at 'Also=
=3D'
> recursively. In case a file set in SYSTEMD_SERVICE build is aborted with =
an
> error message.
>

Your message is wrong; You should say that if the file doesn't exists you
abort with an error message.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


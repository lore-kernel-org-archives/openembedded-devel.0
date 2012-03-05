Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4cWT-0008PQ-GX
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 19:20:37 +0100
Received: by vbbfr13 with SMTP id fr13so3794379vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 10:12:02 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.99.231 as permitted sender) client-ip=10.52.99.231; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.99.231 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.99.231])
	by 10.52.99.231 with SMTP id et7mr36712442vdb.114.1330971122266
	(num_hops = 1); Mon, 05 Mar 2012 10:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WjAw1U9CxxWV3JxFyX1ovpI4vXY5dVrEY8iT//0hu+k=;
	b=oE0SPZwPuaKfkR8b/9DinJ9tY1yrrKqqagrTbN5hBdtR/vU8CKAjwEHa9HsciDwy0q
	bEJqvk7R5K8ji2jbz1ijYTmLtVSv7ho53mKQXZGev+CM55vyCXBgIRAXTsYnLkWOACyE
	ZeoK8fG2Qu6AxvbHzp4c7ggpmrzwC1cfQFQHf205OoQHAYj2iU7YelLMzMscxWyFmv4s
	W/INczlvO/RJtxweCp0oNQ0B2JWRjm8y71SyA67lji0uutBdT1+rZ9nxQjCmV07t4mVP
	z9yuLhLP/xq6qcX2qAWfI2e7FS8kDFuBhvm1ya/IBaiKI3pIl6OFkMP4bPqLLLZfNySQ
	em1g==
MIME-Version: 1.0
Received: by 10.52.99.231 with SMTP id et7mr31459167vdb.114.1330971122128;
	Mon, 05 Mar 2012 10:12:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Mon, 5 Mar 2012 10:12:02 -0800 (PST)
In-Reply-To: <1330969051-9867-3-git-send-email-koen@dominion.thruhere.net>
References: <1330969051-9867-1-git-send-email-koen@dominion.thruhere.net>
	<1330969051-9867-3-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 5 Mar 2012 15:12:02 -0300
X-Google-Sender-Auth: Y0RWRGTkuCihQ-43Ie_MUmlm7sM
Message-ID: <CAP9ODKoGobJnLbOHjWWRupWNDJAUNJ8o4ROBm6EDKN4uiWu=rQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 3/3] systemd: enable logging to disk instead of tmpfs
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
X-List-Received-Date: Mon, 05 Mar 2012 18:20:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 14:37, Koen Kooi <koen@dominion.thruhere.net> wrote:
> + =A0 =A0 =A0 # create dir for journal
> + =A0 =A0 =A0 install -d ${D}${localstatedir}/log/journal

I'd prefer if journal could default to use a buffer or something
similar instead of writting to disk as we ought to be careful about
space in embedded devices, in general.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



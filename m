Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4fyA-0007Ob-JV
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 23:01:26 +0100
Received: by vcbfl13 with SMTP id fl13so4049311vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 13:52:51 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.99.231 as permitted sender) client-ip=10.52.99.231; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.99.231 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.99.231])
	by 10.52.99.231 with SMTP id et7mr38139202vdb.114.1330984371449
	(num_hops = 1); Mon, 05 Mar 2012 13:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=T0/F2K08f7RV4Cu7vssBhnOjajq2mIlWK29lQHM3WPQ=;
	b=j7CE6F06qp3snl0tjd7hPRpglO1e/PSXXJ5ZAltPOYX1euRqFcPt/d0P0fSOOMsfIz
	QJpAsvzwKcJ9mZStq9x3WUjrSvX//umzZZB2TOXjB+89zicO6ZmaNBCuNXK0kXwe8tOh
	hDjBblZIq6uW9ysvt3aUhOIYaryZhFs9JlrejVXAOu1y8wF3J6RY894U5XBUEOJ5x5vm
	Wb8qHH/o2tNXhLqjz1dt869RF8ckKqrCnCicqaVlv2wzVHDa12GjjEl8yDBF1SN7spli
	huTTO+kihkFzhVMRnmfUYqmxCEqqo9uRLc/PSGAQ3hQiIdgohduCioMXQqBLA4Fb8U4L
	XyaQ==
MIME-Version: 1.0
Received: by 10.52.99.231 with SMTP id et7mr32702252vdb.114.1330984371314;
	Mon, 05 Mar 2012 13:52:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Mon, 5 Mar 2012 13:52:51 -0800 (PST)
In-Reply-To: <jj3beb$bru$1@dough.gmane.org>
References: <1330969051-9867-1-git-send-email-koen@dominion.thruhere.net>
	<1330969051-9867-3-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKoGobJnLbOHjWWRupWNDJAUNJ8o4ROBm6EDKN4uiWu=rQ@mail.gmail.com>
	<jj37mf$dsm$1@dough.gmane.org>
	<CAP9ODKrLhkyTHF8n3BVsKWG=-5bMieT7+Dua0+VF4sGFXcmD4g@mail.gmail.com>
	<jj3beb$bru$1@dough.gmane.org>
Date: Mon, 5 Mar 2012 18:52:51 -0300
X-Google-Sender-Auth: 3MYLwZuMdaLrl7mr4PnXGSgBUqQ
Message-ID: <CAP9ODKoCTEQ5=ry2JVm1Y2-Dx5ZXErsMueRJjuW+QYcPK0VtqA@mail.gmail.com>
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
X-List-Received-Date: Mon, 05 Mar 2012 22:01:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 18:32, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Right now it's logging to tmpfs, which takes up ram, which more scarce th=
an
> disk. You can easily remove /var/log/journal in ROOTFS_POSTPROCESS_CMD to
> make it log to tmpfs again.

In both cases it is doing the wrong thing IMO; a circular buffer would
be the right thing for a default.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



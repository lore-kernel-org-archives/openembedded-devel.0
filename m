Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S1ynd-0006ta-GR
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Feb 2012 12:31:25 +0100
Received: by vcbfl13 with SMTP id fl13so916375vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2012 03:22:57 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.220.156.208 as permitted sender) client-ip=10.220.156.208; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.220.156.208 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.220.156.208])
	by 10.220.156.208 with SMTP id y16mr7624640vcw.28.1330341777723
	(num_hops = 1); Mon, 27 Feb 2012 03:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kusvkeozDUbo28RiwTXrqJBqoAk2qOWD0Hjfe33bXTI=;
	b=i07ZCi1wFTrFE1A4NxjGvClBIAVui3SZ/jSCt+CCVfwXdMiyKST1476xrysZKse+vb
	FIwvK4uiAEkskrWxR7jVfWr601P4xRFRTtwEsNREjaCcU2o1cAaoxbcjKfrJTIDuXrAG
	kfC5NRbpjbbMUrwQbJqZZJemeNfZv4WdDJAus=
MIME-Version: 1.0
Received: by 10.220.156.208 with SMTP id y16mr6102932vcw.28.1330341777678;
	Mon, 27 Feb 2012 03:22:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Mon, 27 Feb 2012 03:22:57 -0800 (PST)
In-Reply-To: <CALbNGRTuwLVTJx=rjCZGuwGa_B0So8+EwpWbrmDxDQVcYS+etQ@mail.gmail.com>
References: <cover.1330116875.git.otavio@ossystems.com.br>
	<6dcaffb8068eb5a1d62c00c44f93e37a070c6065.1330116875.git.otavio@ossystems.com.br>
	<CAP9ODKrBwMjUg+WUY1b18k_PyKHDgjhEH7hXLjB+1wJ78-u2_g@mail.gmail.com>
	<CAP9ODKqyQAteyfXFWxX5akvq8u6eJ4RLg7qpsb9RrbTsKmrEzQ@mail.gmail.com>
	<CALbNGRTuwLVTJx=rjCZGuwGa_B0So8+EwpWbrmDxDQVcYS+etQ@mail.gmail.com>
Date: Mon, 27 Feb 2012 08:22:57 -0300
X-Google-Sender-Auth: qtYBS-I4NqL9xOP1P9VO3tHAlBM
Message-ID: <CAP9ODKomT-LcR=ED7GiiYvG9jrPc9Ryw7T814L27RRhfCHN0yA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-oe 2/2] systemd.bbclass: do not mangle PACKAGES variable in native, nativesdk and cross
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
X-List-Received-Date: Mon, 27 Feb 2012 11:31:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 26, 2012 at 09:06, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> I was about to send a revert - but it's too late now -because I
> haven't understood what the original patch is for. Could you please
> tell us what it fixes / enhances?

The parsing where being properly skipped in case of native, nativesdk
and cross however the packaging addition not; so it ended up trying to
build cross and native packages; in my case it broken an internal
package that is built using chicken and is cross.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



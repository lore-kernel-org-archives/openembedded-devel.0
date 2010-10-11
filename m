Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P5Hc5-0007G3-5O
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 14:36:34 +0200
Received: by vws3 with SMTP id 3so710808vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 05:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5o2H0yJ+7RPsL0h4KXSwD8jdS6xiyyORVt0z8bdHXlU=;
	b=Ex0YKCk7N5TPpns9HfVjfgZUYmiehSOeWOQYmERmPVhe4M9MGMjjM7tPpxKR4y3IYc
	KzCNt0S5X069tWJSJUQvrEtFdiFydbq2HDo+7bgYEUdadPqfNNDnMAiqlkEWWEecPing
	BfAceNqjnHUrUt12zSwX884ntRHEZvjxYfzJo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=F7H5wL5E/N2235POugTJSapynjunYv5EjRbba7ZiM2cCOS6MX0Jz0aJBRzmZYeyRLb
	1F+ZjOqjPaUIqu5dYGdiwbcSK+1eUs4W/k7XsVKozDqmNsQouE0kb3Ja/sFo1uJufSE3
	3mJeHYvSFd86EsIy0tDeIgPcdWtO90uR72hzs=
MIME-Version: 1.0
Received: by 10.220.188.67 with SMTP id cz3mr1918121vcb.114.1286800552344;
	Mon, 11 Oct 2010 05:35:52 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Mon, 11 Oct 2010 05:35:52 -0700 (PDT)
In-Reply-To: <201010111602.05916.khimov@altell.ru>
References: <AANLkTineQJGDAdjuuHpkKEsYPU1TuvmgE+7k+EoYqtTp@mail.gmail.com>
	<201010111602.05916.khimov@altell.ru>
Date: Mon, 11 Oct 2010 05:35:52 -0700
Message-ID: <AANLkTi=_aW1_xh4s=MTG60waODeY6VFKy6v_bXNgf=pu@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] unpackaged files
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
X-List-Received-Date: Mon, 11 Oct 2010 12:36:35 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2010 at 5:02 AM, Roman I Khimov <khimov@altell.ru> wrote:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
11 =CF=CB=D4=D1=C2=D2=D1 2010 15:51:05 =C1=D7=D4=CF=D2 Frans Meulenbroeks
> =CE=C1=D0=C9=D3=C1=CC:
>> =9A- a way to indicate that a file is installed but purposedly not
>> packaged (e.g. I have such a thing in mythtv with a README file)
>> This could be by creating a pseudo-package (like -unused or -ignore)
>> which can be used to add files that are explicitly not packaged
>
> Shouldn't such files be removed with do_install_append()?

my uneducated suggestion would be dont remove them and do something
like Frans suggests, reason being I am noticing packages that do not
build with files that you would expect especially ones with -dev tags.
or even some not being made like libgcc-dev. But like one off the top
of my head would be if you install libpcap and libcap-dev you still do
not get a pcap.h to use if you compile something on the machine your
built those packages into the image of.


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



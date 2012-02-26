Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S1czx-0003Wc-GT
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 13:14:41 +0100
Received: by lahc1 with SMTP id c1so4544359lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2012 04:06:16 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.147.1 as permitted sender)
	client-ip=10.152.147.1; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.147.1 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.147.1])
	by 10.152.147.1 with SMTP id tg1mr7902848lab.22.1330257976541 (num_hops
	= 1); Sun, 26 Feb 2012 04:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6CGhIhA2vEERdYfWWwX7f5bkzAt7rrr/vOxrH84tG/4=;
	b=ipKn6Rf+D05azv3QNKobKoUsJgQvbtKg1Z3cIZDbEUceJSqTduUEPe3AHmv8xcgfWV
	tLU30OAsOGQuHWwQr6Mh8+e5pCbjbX0vsgdRZ/qh99mZaFQBfb/D3et1jEnecCpTwDmN
	LnbR1CmPmfG6SnygOCxKcqmzIaHvEJK6qoRQ8=
MIME-Version: 1.0
Received: by 10.152.147.1 with SMTP id tg1mr6587284lab.22.1330257976465; Sun,
	26 Feb 2012 04:06:16 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Sun, 26 Feb 2012 04:06:16 -0800 (PST)
In-Reply-To: <CAP9ODKqyQAteyfXFWxX5akvq8u6eJ4RLg7qpsb9RrbTsKmrEzQ@mail.gmail.com>
References: <cover.1330116875.git.otavio@ossystems.com.br>
	<6dcaffb8068eb5a1d62c00c44f93e37a070c6065.1330116875.git.otavio@ossystems.com.br>
	<CAP9ODKrBwMjUg+WUY1b18k_PyKHDgjhEH7hXLjB+1wJ78-u2_g@mail.gmail.com>
	<CAP9ODKqyQAteyfXFWxX5akvq8u6eJ4RLg7qpsb9RrbTsKmrEzQ@mail.gmail.com>
Date: Sun, 26 Feb 2012 13:06:16 +0100
Message-ID: <CALbNGRTuwLVTJx=rjCZGuwGa_B0So8+EwpWbrmDxDQVcYS+etQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
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
X-List-Received-Date: Sun, 26 Feb 2012 12:14:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2012 at 3:33 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Feb 24, 2012 at 23:44, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>> On Fri, Feb 24, 2012 at 18:55, Otavio Salvador <otavio@ossystems.com.br>=
 wrote:
>>> =A0meta-oe/classes/systemd.bbclass | =A0 72 +++++++++++++++++++--------=
-----------
>>> =A01 files changed, 36 insertions(+), 36 deletions(-)
>>
>> This broke it; I am fixing it and will send a patch soon.
>
> I ended sending two patches to fix this. The second one is the right
> to be take since it fix the packaging and parsing. Sorry by this
> mistake.
>
I was about to send a revert - but it's too late now -because I
haven't understood what the original patch is for. Could you please
tell us what it fixes / enhances?

Andreas



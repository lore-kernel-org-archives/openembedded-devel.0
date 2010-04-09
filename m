Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1O0BtF-0004jW-Iw
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 12:56:46 +0200
Received: by wwb13 with SMTP id 13so811560wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Apr 2010 03:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HLQbGjidREuMtKPmZpdAqTLni7kzPIudaHagSIyIVKU=;
	b=lzV2nETULRGGML41nbIzCmYGGdbcPcSqUIiDYTNc98d1tEL0wsX6JPljCBGQnU4HGP
	SRK1E72iiYC68cMwtwPv0U/o+7yLwK2eMEoWAYKvg92oZW+AFxYP7zY9U/8mHd2VUwfB
	u+SsaWBxMwcvFIPJSf6qszVj6hcaCOESuKskA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=toiwUDnKyjKySfIrDLDus0Qi1AFEHQFqqHXhW9SIOdMf8FKER9jci8CtGoLIvHUFFh
	D8aBUrhO65C2KTFXlbS1r1QSTfZssHR4NojBH+wtP55SV+TvfHry56T7e3rUZgJQsXm5
	Lvyj1BzVlNgXLNm6Sh9pVlrhyhRmwgJoxQvDo=
MIME-Version: 1.0
Received: by 10.216.169.77 with HTTP; Fri, 9 Apr 2010 03:53:22 -0700 (PDT)
In-Reply-To: <201004091439.53806.khimov@altell.ru>
References: <r2u48239d391004090326qb2a80dd6ic11530d737c6edde@mail.gmail.com>
	<201004091439.53806.khimov@altell.ru>
Date: Fri, 9 Apr 2010 14:53:22 +0400
Received: by 10.216.170.147 with SMTP id p19mr768028wel.129.1270810402053; 
	Fri, 09 Apr 2010 03:53:22 -0700 (PDT)
Message-ID: <k2j48239d391004090353mcc7c01a0o4bc58d8c1efd5c27@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: postinst scripts and opkg configure
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
X-List-Received-Date: Fri, 09 Apr 2010 10:56:46 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 9, 2010 at 2:39 PM, Roman I Khimov <khimov@altell.ru> wrote:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=D1=D4=CE=C9=C3=C1 09 =C1=D0=D2=
=C5=CC=D1 2010 14:26:22 =C1=D7=D4=CF=D2 Sergey Lapin =CE=C1=D0=C9=D3=C1=CC:
>> So, with recent images I have to run all postinst scripts again on
>> device for services
>> like udev or dropbear to work. These packages get 'installed' status,
>> so postinst
>> scripts won't normally run during 'opkg configure', but /etc/rc*d
>> links are not created for them during
>> image build. Any ideas on fixing, or what is really being wrong here?
>
> Do "set -e" in the beginning of postinst if it can only do its job on tar=
get.
> I have some patches adding that in queue.
I can't understand why creation of links won't work on host,
because that will be a problem for filesystems like squashfs.



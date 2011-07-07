Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1Qecep-00023g-Iq
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 02:41:31 +0200
Received: by eye27 with SMTP id 27so158681eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 17:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=MeKYPJG5KQ2C6gcE+/0BPj4tSHGZs+o8J/MYE8GiSjI=;
	b=rSoof6dSPKV11FOpL02PwTcVIX5RSRK1hp4Z3MxuAxopUJ9SPlEWAwr3QDvlwnVCGn
	hqrdpPmNLV79zfDOZSDsUynu50lbj2MpfwVQB0KBhKyUb/68NJvsS8qZNZm4umVNJQmP
	Pnz1y1qIEWVmQJcEHTsxbvOZnbSCf41WXtBew=
MIME-Version: 1.0
Received: by 10.213.10.2 with SMTP id n2mr2124266ebn.45.1309999057497; Wed, 06
	Jul 2011 17:37:37 -0700 (PDT)
Received: by 10.213.31.141 with HTTP; Wed, 6 Jul 2011 17:37:37 -0700 (PDT)
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04A78E50@nzc-ap-xch-02.ap.trimblecorp.net>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04A78E50@nzc-ap-xch-02.ap.trimblecorp.net>
Date: Thu, 7 Jul 2011 12:37:37 +1200
Message-ID: <CAE21AQpLShYH+82swduxQLWtpTGtTawuywbt2WxXHUTB5+9zDQ@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Debugging u-boot
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
X-List-Received-Date: Thu, 07 Jul 2011 00:41:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Bernie

What toolchain are you building?

If you build meta-toolchain that should build all the stuff you can put int=
o
/usr/local/angstrom/arm/... which includes gdb.

That should then work with a JTAG debugger etc.

-- Charles


On Thu, Jul 7, 2011 at 11:25 AM, Bernard Mentink
<Bernard_Mentink@trimble.com> wrote:
> Hi All,
>
> Can some one please tell me how to debug u-boot =A0on my target. I have
> built u-boot for similar hardware and I want to debug with gdb, but
> cannot even find the cross-compile version of gdb,
> It does not exist in the directory
> "build/tmp/sysroots/i686-linux/usr/armv6/bin/" where the other
> cross-compile tools live ..
>
> I want to execute "${CROSS_COMPILE}gdb u-boot"
> =A0.. and breakpoint at some very early symbol ..... Some steps to
> achieving this would be much appreciated ..
>
> Many Thanks,
> Bernie
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



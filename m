Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OY4vB-0005wS-Jj
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 00:22:50 +0200
Received: by iwn34 with SMTP id 34so4103818iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 15:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ah8dxlfwbPDwJoLaoQ4sraF640K1Eps+T0Z7cK1cLNw=;
	b=d+LjxUGy3wILcA+x1pXIXWAtB5FyQLaYTUOQgSfp3pl5skU+nuSO9OG6QwOH3+rW7J
	d+0wza0TDgIIda+uwvGOY9g30XF2/KmUZpUMegB/KJQK5XezX6JIU+IzBZQoJR1ee/0g
	hgE7YVRrZpxho2C7QKNEjQjsrmkbRFY14GCVk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Zi9D2qtjsrDCxx+YuVCTFk0tBLx602FbI7WDGyrh2tGDr94jf5+C04EM8vdAR1NHXh
	JY1j/3ERAZqB9l8EkU6F7bXWxoos0yvj5ckwcpnZPrSy/3PQPxgch/jt2HYChlhkmexv
	HhkIzK1R1RdHHAxPjuZvTbv6OZ8plJOsJAOEM=
Received: by 10.231.183.200 with SMTP id ch8mr11348669ibb.124.1278886675142; 
	Sun, 11 Jul 2010 15:17:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.132 with HTTP; Sun, 11 Jul 2010 15:17:35 -0700 (PDT)
In-Reply-To: <1278867705.15825.94.camel@lenovo.internal.reciva.com>
References: <i1chst$tq5$1@dough.gmane.org>
	<1278867705.15825.94.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jul 2010 15:17:35 -0700
Message-ID: <AANLkTilUqapROvKeecH8McrUjMsQaEaI1LASvXztXi-a@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'LIBC' variable clashes with perl variable
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
X-List-Received-Date: Sun, 11 Jul 2010 22:22:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 11, 2010 at 10:01 AM, Phil Blundell <philb@gnu.org> wrote:
> On Sun, 2010-07-11 at 15:45 +0200, Koen Kooi wrote:
>> Perl (among others) uses the 'LIBC' variable to point its linker to
>> libc.so.6, which fails due to OE redefing LIBC.
>>
>> Any objections to renaming LIBC to TARGET_LIBC in OE?
>
> How is perl getting to see that variable? =A0I don't think it ought to be
> exported.
>
> I don't have any problem with renaming it, though I do wonder whether it
> would be better to just abolish it altogether in favour of inspecting
> ${HOST_OS}.

uclibc is ok but glibc and eglibc will have same HOST_OS so it will be
hard to differentiate which system C library to choose.


>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



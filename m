Received: from mail-yw0-f193.google.com ([209.85.211.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <spyzer.abhishek0@gmail.com>) id 1O9CCr-0002tX-6V
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 09:06:13 +0200
Received: by ywh31 with SMTP id 31so1392289ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 00:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=SWOO9/AptU8eguIEe5KvFcBfJCdlo1rc+CAW9MdTQ2A=;
	b=PtyxXoHQnlL5WJeJKeu6yv9vn1hC5ONBJJZoPt24rnWg4NwhQMg6lsL7oWB80PwXJQ
	muDH62psL+C5uEUaNzq/bIzErjRZ4fU75X0l1JIZA6T/yHSF5cm/2MfJ7bpv0dIQJQWB
	ehLSD3dfresWGzsuNyFq5aQpBfI++1cX+taKI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=n6la59fQuKQG+/suYndvts0MsoLb/6CFeRpysiSNs/gsENDJ46atN+nkb/5v/UGbj6
	lvu0RBEO9GL0NI5Z63KPK01EUlu8rKaYtm3GGkAc586f5BVXfY+UFJjQDNucDKlvLpGq
	rE3ZEoeojvyqChXnOZUD3M+M62/4FSNvZz6V4=
Received: by 10.150.31.14 with SMTP id e14mr11098390ybe.95.1272956545490; Tue, 
	04 May 2010 00:02:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.150.124.11 with HTTP; Tue, 4 May 2010 00:02:05 -0700 (PDT)
In-Reply-To: <4BD84B08.4000300@eukrea.com>
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com> 
	<v2hfc0861611004260046za2daa3a4ve91f93ab88e72d8e@mail.gmail.com> 
	<hr3im2$gf6$1@dough.gmane.org>
	<x2rfc0861611004261141u68a0ad71icfc12c12c3053c23@mail.gmail.com>
	<hr4t3j$tds$1@dough.gmane.org>
	<k2jfc0861611004280742x8a9ca2b7jc65a77230be17b42@mail.gmail.com>
	<4BD84B08.4000300@eukrea.com>
From: Abhishek Sharma <spyzer.abhishek0@gmail.com>
Date: Tue, 4 May 2010 12:32:05 +0530
Message-ID: <g2wfc0861611005040002v62c57e0ahf08f8337bbbe9c1d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.193
X-SA-Exim-Mail-From: spyzer.abhishek0@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Tue, 04 May 2010 07:06:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2010 at 8:19 PM, Eric B=E9nard <eric@eukrea.com> wrote:

> Hi,
>
> Le 28/04/2010 16:42, Abhishek Sharma a =E9crit :
>
>  It was silly of me to put INIT_SCRIPTS =3D "" without actually knowing a=
bout
>> them.
>> Now I have changed the image file and it looks like:
>> require base-image.bb
>> IMAGE_INSTALL =3D "qtehelloworld"
>>
>
> you need +=3D here, else you replace the content of IMAGE_INSTALL inherit=
ed
> from base-image by only your app !
>
> Eric
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


I am finished making the image which has a qtehelloworld program "installed=
"
in it. But the moment I run <qtehelloworld -qws> in the qemu machine i get
the error
QFontDatabase: Cannot find font directory /usr/lib/fonts.

I googled the error and in most of the cases it was shown that while
"configuring" qte the prefix variable was not properly set. What step shoul=
d
i take next?? Do i need to change any recipe of qt embedded or is this some
different problem.

Please Help.
--=20
Abhishek Sharma


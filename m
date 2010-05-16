Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ODh0z-000731-3D
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 18:48:36 +0200
Received: by gya1 with SMTP id 1so1685553gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ingQ6iO9DArYWUCLblpDg5eQbzFUg9KAm2S9heXbEmg=;
	b=mjjWFi6YbUDNSr2Xy50WlTh7WZhTLvLH5F3JoVjayVVxgmt05r9YgtotrYWRy4zI+f
	4vKDYZ/vEOZce+ftz0K3AAImvL35Bje1yVJqHZRc7xL63rOMP+DSTc/PaK0+hZ3fh2xN
	o0DkOGeJnM34YyiP68Y/gzSQSyqUw85vYIojA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sYIyaXSRJINrY3/eSE9cCwJY/vGyn2aC1wjIx/GfCVhcxe4Tokdw5Q/2IrKdul5NhL
	jK29JcnM7AA254DjRbhcUmAwQ7+Q+GaTnxAS7yMd1v1aZhOfwMa/EgbnSby33cyLjkAw
	i1Zzjp/s+ApGDktllKFQiPyGYbdJGe2g7BhVA=
MIME-Version: 1.0
Received: by 10.101.213.29 with SMTP id p29mr4587657anq.266.1274028274115; 
	Sun, 16 May 2010 09:44:34 -0700 (PDT)
Received: by 10.100.96.12 with HTTP; Sun, 16 May 2010 09:44:34 -0700 (PDT)
In-Reply-To: <hsk1gf$v4j$1@dough.gmane.org>
References: <hs35ae$l42$1@dough.gmane.org> <hsk1gf$v4j$1@dough.gmane.org>
Date: Sun, 16 May 2010 09:44:34 -0700
Message-ID: <AANLkTilxRS624wPR3D2zTT3GjyIE6owKY7OUC2DQ8O0f@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libstc++ libtool problem, cross lamanger broken
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
X-List-Received-Date: Sun, 16 May 2010 16:48:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 14, 2010 at 10:33 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Almost a week later, any fixes people can try[1]?

Koen

my sysroots/armv5te-oe-linux-gnueabi/usr/lib/libstdc++.la file has
dependency_libs=' -lm'
I am not able to reproduce the problem on my end
What am I missing ?

Thx
-Khem



>
> [1] apart from sed -i -e
> 's:-L/OE/angstrom-dev/sysroots/x86_64-linux/usr/lib::g'
> sysroots/*/usr/lib/*.la
>
>
> On 08-05-10 09:53, Koen Kooi wrote:
>> Hi,
>>
>> I've been getting failures when ARM apps try to link with x86_64
>> libxml2, and I started to do some digging:
>>
>> grep L/OE/angstrom-dev/sysroots/x86_64-linux/usr/lib
>> /OE/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/lib/*.la |
>> more | awk -F: '{print $1}' | sed
>> s:/OE/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/lib/::glibaspell.la
>> libatkmm-1.6.la
>> libcairomm-1.0.la
>> libetpan.la
>> libFLAC++.la
>> libgdkmm-2.4.la
>> libgiomm-2.4.la
>> libglibmm-2.4.la
>> libglibmm_generate_extra_defs-2.4.la
>> libgnutlsxx.la
>> libgtkmathview_custom_reader.la
>> libgtkmathview_libxml2.la
>> libgtkmathview_libxml2_reader.la
>> libgtkmm-2.4.la
>> libmathview_backend_gtk.la
>> libmathview_backend_ps.la
>> libmathview_backend_svg.la
>> libmathview_frontend_custom_reader.la
>> libmathview_frontend_libxml2.la
>> libmathview_frontend_libxml2_reader.la
>> libmathview.la
>> libpangomm-1.4.la
>> libpcrecpp.la
>> libpoppler-glib.la
>> libpoppler.la
>> libpspell.la
>> libschroedinger-1.0.la
>> libsidplay.la
>> libsigc-2.0.la
>> libstdc++.la
>> libsupc++.la
>> libtiffxx.la
>> libwebkit-1.0.la
>>
>> So pretty much anything with a c++ dep gets a bogus .la file, so lets
>> look at libstdc++.la:
>>
>> dependency_libs=' -L/OE/angstrom-dev/sysroots/x86_64-linux/usr/lib
>> /OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.la'
>>
>> So it looks like the cross.bbclass lamangler needs some more work.
>>
>> regards,
>>
>> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL7YlOMkyGM64RGpERAjBZAKCK/+SSGgnqz7J8KVL31hI7zC1qRgCgsJGX
> O/dkdGg7FraOdiQFEhxL8MQ=
> =FKfz
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


